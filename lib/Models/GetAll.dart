import 'dart:convert';

class GetAll {
  List<Stock> stockList;

  GetAll({this.stockList});

  GetAll.fromJson(Map<String, dynamic> json) {
    if (json['StockList'] != null) {
      stockList = new List<Stock>();
      json['StockList'].forEach((v) {
        stockList.add(new Stock.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.stockList != null) {
      data['StockList'] = this.stockList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Stock {
  String stock;
  String image;
  Esg esg;
  GlassDoor glassDoor;
  RA rA;

  Stock({this.stock, this.esg, this.glassDoor, this.rA});

  Stock.fromJson(Map<String, dynamic> json) {
    stock = json['Stock'];
    esg = json['Esg'] != null ? new Esg.fromJson(json['Esg']) : null;
    glassDoor =
        json['GlassDoor'] != null ? new GlassDoor.fromJson(json['GlassDoor']) : null;
    rA = json['RA'] != null ? new RA.fromJson(json['RA']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Stock'] = this.stock;
    if (this.esg != null) {
      data['Esg'] = this.esg.toJson();
    }
    if (this.glassDoor != null) {
      data['GlassDoor'] = this.glassDoor.toJson();
    }
    if (this.rA != null) {
      data['RA'] = this.rA.toJson();
    }
    return data;
  }
}

class Esg {
  int rating;

  Esg({this.rating});

  Esg.fromJson(Map<String, dynamic> json) {
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rating'] = this.rating;
    return data;
  }
}

class GlassDoor {
  String overall;
  String culturaEValores;
  String diversidadeEInclusao;
  String qualidadeDeVida;
  String altaLideranca;
  String remuneracaoEBeneficios;
  String oportunidadesDeCarreira;

  GlassDoor(
      {this.overall,
      this.culturaEValores,
      this.diversidadeEInclusao,
      this.qualidadeDeVida,
      this.altaLideranca,
      this.remuneracaoEBeneficios,
      this.oportunidadesDeCarreira});

  GlassDoor.fromJson(Map<String, dynamic> json) {
    overall = json['Overall'];
    culturaEValores = json['Cultura_e_valores'];
    diversidadeEInclusao = json['Diversidade_e_inclusao'];
    qualidadeDeVida = json['Qualidade_de_vida'];
    altaLideranca = json['Alta_lideranca'];
    remuneracaoEBeneficios = json['Remuneracao_e_beneficios'];
    oportunidadesDeCarreira = json['Oportunidades_de_carreira'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Overall'] = this.overall;
    data['Cultura_e_valores'] = this.culturaEValores;
    data['Diversidade_e_inclusao'] = this.diversidadeEInclusao;
    data['Qualidade_de_vida'] = this.qualidadeDeVida;
    data['Alta_lideranca'] = this.altaLideranca;
    data['Remuneracao_e_beneficios'] = this.remuneracaoEBeneficios;
    data['Oportunidades_de_carreira'] = this.oportunidadesDeCarreira;
    return data;
  }
}

class RA {
  String rating;
  String reclamacoesRespondidas;
  String voltariamAFazerNegocio;
  String indiceDeSolucao;
  String notaDoConsumidor;

  RA(
      {this.rating,
      this.reclamacoesRespondidas,
      this.voltariamAFazerNegocio,
      this.indiceDeSolucao,
      this.notaDoConsumidor});

  RA.fromJson(Map<String, dynamic> json) {
    rating = json['rating'];
    reclamacoesRespondidas = json['Reclamacoes_respondidas'];
    voltariamAFazerNegocio = json['Voltariam_a_fazer_negocio'];
    indiceDeSolucao = json['Indice_de_solucao'];
    notaDoConsumidor = json['Nota_do_consumidor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rating'] = this.rating;
    data['Reclamacoes_respondidas'] = this.reclamacoesRespondidas;
    data['Voltariam_a_fazer_negocio'] = this.voltariamAFazerNegocio;
    data['Indice_de_solucao'] = this.indiceDeSolucao;
    data['Nota_do_consumidor'] = this.notaDoConsumidor;
    return data;
  }
}

Future<Map<String, List<Stock>>> getMapStocks() async {
  String staticJson = await Future.delayed(Duration(milliseconds: 1000), () {
    return staticAll;
  });

  Map _responseMap = jsonDecode(staticJson);
  GetAll all = GetAll.fromJson(_responseMap);
  List<Stock> allStocks = all.stockList;

  List<Stock> selectedStocks = [];

  for (Stock stock in allStocks) {
    if (stock.stock == "EGIE3") {
      stock.image = "assets/engie.png";
      selectedStocks.add(stock);
    }
    if (stock.stock == "ABEV3") {
      stock.image = "assets/ambev.png";
      selectedStocks.add(stock);
    }
    if (stock.stock == "AZUL4 ") {
      stock.image = "assets/azul.png";
      selectedStocks.add(stock);
    }
    if (stock.stock == "CIEL3") {
      stock.image = "assets/cielo.png";
      selectedStocks.add(stock);
    }
    if (stock.stock == "MGLU3") {
      stock.image = "assets/magalu.png";
      selectedStocks.add(stock);
    }
    if (stock.stock == "CPFE3") {
      stock.image = "assets/cpfl.png";
      selectedStocks.add(stock);
    }
  }

  Map<String, List<Stock>> stocksMap = {
    "allStocks": allStocks,
    "selectedStocks": selectedStocks
  };

  return stocksMap;
}

Future<List<Stock>> getStaticAll() async {
  String staticJson = await Future.delayed(Duration(milliseconds: 1500), () {
    return staticAll;
  });

  Map _responseMap = jsonDecode(staticJson);
  GetAll all = GetAll.fromJson(_responseMap);
  List<Stock> stockList = all.stockList;

  return stockList;
}

String staticAll = """
{
    "StockList": [
        {
            "Stock": "ABEV3",
            "Esg": {
                "rating": 2
            },
            "GlassDoor": {
                "Overall": "4.2",
                "Cultura_e_valores": "4.3",
                "Diversidade_e_inclusao": "4.0",
                "Qualidade_de_vida": "3.2",
                "Alta_lideranca": "3.9",
                "Remuneracao_e_beneficios": "3.7",
                "Oportunidades_de_carreira": "4.1"
            },
            "RA": {
                "rating": "8.0",
                "Reclamacoes_respondidas": "95.6",
                "Voltariam_a_fazer_negocio": "82.7",
                "Indice_de_solucao": "79.8",
                "Nota_do_consumidor": "6.87"
            }
        },
        {
            "Stock": "AZUL4",
            "GlassDoor": {
                "Overall": "4.2",
                "Cultura_e_valores": "4.2",
                "Diversidade_e_inclusao": "3.9",
                "Qualidade_de_vida": "3.7",
                "Alta_lideranca": "3.8",
                "Remuneracao_e_beneficios": "3.9",
                "Oportunidades_de_carreira": "3.6"
            },
            "RA": {
                "rating": "9.0",
                "Reclamacoes_respondidas": "99",
                "Voltariam_a_fazer_negocio": "88.2",
                "Indice_de_solucao": "91",
                "Nota_do_consumidor": "8.36"
            }
        },
        {
            "Stock": "B3SA3",
            "Esg": {
                "rating": 2
            },
            "GlassDoor": {
                "Overall": "4.3",
                "Cultura_e_valores": "4.1",
                "Diversidade_e_inclusao": "4.7",
                "Qualidade_de_vida": "4.1",
                "Alta_lideranca": "3.7",
                "Remuneracao_e_beneficios": "4.4",
                "Oportunidades_de_carreira": "3.6"
            },
            "RA": {
                "rating": "9.2",
                "Reclamacoes_respondidas": "95",
                "Voltariam_a_fazer_negocio": "90.4",
                "Indice_de_solucao": "95.2",
                "Nota_do_consumidor": "8.65"
            }
        },
        {
            "Stock": "BBAS3",
            "Esg": {
                "rating": 2
            },
            "GlassDoor": {
                "Overall": "4.1",
                "Cultura_e_valores": "3.7",
                "Diversidade_e_inclusao": "3.9",
                "Qualidade_de_vida": "3.6",
                "Alta_lideranca": "3.3",
                "Remuneracao_e_beneficios": "4.1",
                "Oportunidades_de_carreira": "3.5"
            },
            "RA": {
                "rating": "6.6",
                "Reclamacoes_respondidas": "99.8",
                "Voltariam_a_fazer_negocio": "55.8",
                "Indice_de_solucao": "61.9",
                "Nota_do_consumidor": "5.29"
            }
        },
        {
            "Stock": "BBDC3",
            "Esg": {
                "rating": 2
            },
            "GlassDoor": {
                "Overall": "4.0",
                "Cultura_e_valores": "3.7",
                "Diversidade_e_inclusao": "4.1",
                "Qualidade_de_vida": "3.4",
                "Alta_lideranca": "3.5",
                "Remuneracao_e_beneficios": "4.1",
                "Oportunidades_de_carreira": "3.7"
            },
            "RA": {
                "rating": "7.8",
                "Reclamacoes_respondidas": "98.9",
                "Voltariam_a_fazer_negocio": "69.2",
                "Indice_de_solucao": "80.8",
                "Nota_do_consumidor": "6.87"
            }
        },
        {
            "Stock": "BBDC4",
            "Esg": {
                "rating": 2
            },
            "GlassDoor": {
                "Overall": "4.0",
                "Cultura_e_valores": "3.7",
                "Diversidade_e_inclusao": "4.1",
                "Qualidade_de_vida": "3.4",
                "Alta_lideranca": "3.5",
                "Remuneracao_e_beneficios": "4.1",
                "Oportunidades_de_carreira": "3.7"
            },
            "RA": {
                "rating": "7.8",
                "Reclamacoes_respondidas": "98.9",
                "Voltariam_a_fazer_negocio": "69.2",
                "Indice_de_solucao": "80.8",
                "Nota_do_consumidor": "6.87"
            }
        },
        {
            "Stock": "BBSE3",
            "Esg": {
                "rating": 5
            },
            "GlassDoor": {
                "Overall": "3.4",
                "Cultura_e_valores": "3.2",
                "Diversidade_e_inclusao": "3.4",
                "Qualidade_de_vida": "3.8",
                "Alta_lideranca": "3.4",
                "Remuneracao_e_beneficios": "3.7",
                "Oportunidades_de_carreira": "3.2"
            },
            "RA": {
                "rating": "7.9",
                "Reclamacoes_respondidas": "96",
                "Voltariam_a_fazer_negocio": "71.6",
                "Indice_de_solucao": "80.8",
                "Nota_do_consumidor": "7.14"
            }
        },
        {
            "Stock": "BEEF3",
            "GlassDoor": {
                "Overall": "4.0",
                "Cultura_e_valores": "3.6",
                "Diversidade_e_inclusao": "5.0",
                "Qualidade_de_vida": "3.3",
                "Alta_lideranca": "3.1",
                "Remuneracao_e_beneficios": "3.4",
                "Oportunidades_de_carreira": "3.4"
            },
            "RA": {
                "rating": "8.6",
                "Reclamacoes_respondidas": "100",
                "Voltariam_a_fazer_negocio": "87.8",
                "Indice_de_solucao": "85.4",
                "Nota_do_consumidor": "7.46"
            }
        },
        {
            "Stock": "BPAC11",
            "Esg": {
                "rating": 5
            },
            "GlassDoor": {
                "Overall": "4.0",
                "Cultura_e_valores": "3.8",
                "Diversidade_e_inclusao": "2.6",
                "Qualidade_de_vida": "2.7",
                "Alta_lideranca": "3.8",
                "Remuneracao_e_beneficios": "4.3",
                "Oportunidades_de_carreira": "4.2"
            },
            "RA": {
                "rating": "8.9",
                "Reclamacoes_respondidas": "99.1",
                "Voltariam_a_fazer_negocio": "83.3",
                "Indice_de_solucao": "91.2",
                "Nota_do_consumidor": "8.3"
            }
        },
        {
            "Stock": "BRDT3",
            "GlassDoor": {
                "Overall": "4.2",
                "Cultura_e_valores": "3.7",
                "Diversidade_e_inclusao": "4.2",
                "Qualidade_de_vida": "3.9",
                "Alta_lideranca": "3.1",
                "Remuneracao_e_beneficios": "4.3",
                "Oportunidades_de_carreira": "3.5"
            },
            "RA": {
                "rating": "0",
                "Reclamacoes_respondidas": "0",
                "Voltariam_a_fazer_negocio": "0",
                "Indice_de_solucao": "0",
                "Nota_do_consumidor": "0"
            }
        },
        {
            "Stock": "BRFS3",
            "Esg": {
                "rating": 6
            },
            "GlassDoor": {
                "Overall": "3.9",
                "Cultura_e_valores": "3.7",
                "Diversidade_e_inclusao": "3.3",
                "Qualidade_de_vida": "3.3",
                "Alta_lideranca": "3.3",
                "Remuneracao_e_beneficios": "3.6",
                "Oportunidades_de_carreira": "3.6"
            },
            "RA": {
                "rating": "8.8",
                "Reclamacoes_respondidas": "100",
                "Voltariam_a_fazer_negocio": "83.3",
                "Indice_de_solucao": "94.4",
                "Nota_do_consumidor": "7.78"
            }
        },
        {
            "Stock": "BRKM5",
            "Esg": {
                "rating": 5
            },
            "GlassDoor": {
                "Overall": "4.4",
                "Cultura_e_valores": "4.1",
                "Diversidade_e_inclusao": "4.2",
                "Qualidade_de_vida": "3.7",
                "Alta_lideranca": "3.7",
                "Remuneracao_e_beneficios": "4.4",
                "Oportunidades_de_carreira": "3.7"
            }
        },
        {
            "Stock": "BRML3",
            "GlassDoor": {
                "Overall": "4.1",
                "Cultura_e_valores": "4.2",
                "Diversidade_e_inclusao": "2.8",
                "Qualidade_de_vida": "3.3",
                "Alta_lideranca": "3.7",
                "Remuneracao_e_beneficios": "3.6",
                "Oportunidades_de_carreira": "3.8"
            }
        },
        {
            "Stock": "BTOW3",
            "Esg": {
                "rating": 4
            },
            "GlassDoor": {
                "Overall": "3.6",
                "Cultura_e_valores": "3.4",
                "Diversidade_e_inclusao": "4.2",
                "Qualidade_de_vida": "3.1",
                "Alta_lideranca": "3.3",
                "Remuneracao_e_beneficios": "2.8",
                "Oportunidades_de_carreira": "3.5"
            }
        },
        {
            "Stock": "CCRO3",
            "Esg": {
                "rating": 5
            },
            "GlassDoor": {
                "Overall": "3.9",
                "Cultura_e_valores": "3.4",
                "Diversidade_e_inclusao": "3.3",
                "Qualidade_de_vida": "3.3",
                "Alta_lideranca": "3.1",
                "Remuneracao_e_beneficios": "3.3",
                "Oportunidades_de_carreira": "2.7"
            },
            "RA": {
                "rating": "6.9",
                "Reclamacoes_respondidas": "98.7",
                "Voltariam_a_fazer_negocio": "63.6",
                "Indice_de_solucao": "63.6",
                "Nota_do_consumidor": "5.73"
            }
        },
        {
            "Stock": "CIEL3",
            "Esg": {
                "rating": 4
            },
            "GlassDoor": {
                "Overall": "3.9",
                "Cultura_e_valores": "3.6",
                "Diversidade_e_inclusao": "3.8",
                "Qualidade_de_vida": "3.6",
                "Alta_lideranca": "3.3",
                "Remuneracao_e_beneficios": "3.8",
                "Oportunidades_de_carreira": "3.5"
            },
            "RA": {
                "rating": "8.8",
                "Reclamacoes_respondidas": "98.2",
                "Voltariam_a_fazer_negocio": "81.1",
                "Indice_de_solucao": "93.1",
                "Nota_do_consumidor": "8.02"
            }
        },
        {
            "Stock": "CMIG4",
            "Esg": {
                "rating": 2
            },
            "GlassDoor": {
                "Overall": "4.1",
                "Cultura_e_valores": "3.7",
                "Diversidade_e_inclusao": "3.8",
                "Qualidade_de_vida": "4.1",
                "Alta_lideranca": "3.3",
                "Remuneracao_e_beneficios": "4.2",
                "Oportunidades_de_carreira": "2.9"
            },
            "RA": {
                "rating": "6.9",
                "Reclamacoes_respondidas": "99.8",
                "Voltariam_a_fazer_negocio": "62.1",
                "Indice_de_solucao": "69.8",
                "Nota_do_consumidor": "5.29"
            }
        },
        {
            "Stock": "COGN3",
            "Esg": {
                "rating": 4
            },
            "GlassDoor": {
                "Overall": "3.6",
                "Cultura_e_valores": "3.3",
                "Diversidade_e_inclusao": "4.3",
                "Qualidade_de_vida": "3.1",
                "Alta_lideranca": "3.0",
                "Remuneracao_e_beneficios": "3.2",
                "Oportunidades_de_carreira": "3.1"
            },
            "RA": {
                "rating": "6.9",
                "Reclamacoes_respondidas": "99.6",
                "Voltariam_a_fazer_negocio": "43.7",
                "Indice_de_solucao": "74.9",
                "Nota_do_consumidor": "5.91"
            }
        },
        {
            "Stock": "CPFE3",
            "Esg": {
                "rating": 3
            },
            "GlassDoor": {
                "Overall": "4.0",
                "Cultura_e_valores": "3.7",
                "Diversidade_e_inclusao": "4.0",
                "Qualidade_de_vida": "4.0",
                "Alta_lideranca": "3.3",
                "Remuneracao_e_beneficios": "3.8",
                "Oportunidades_de_carreira": "3.5"
            },
            "RA": {
                "rating": "6.7",
                "Reclamacoes_respondidas": "99.7",
                "Voltariam_a_fazer_negocio": "58.6",
                "Indice_de_solucao": "67.1",
                "Nota_do_consumidor": "4.97"
            }
        },
        {
            "Stock": "CRFB3",
            "Esg": {
                "rating": 2
            },
            "GlassDoor": {
                "Overall": "3.7",
                "Cultura_e_valores": "3.4",
                "Diversidade_e_inclusao": "3.5",
                "Qualidade_de_vida": "3.2",
                "Alta_lideranca": "3.1",
                "Remuneracao_e_beneficios": "3.3",
                "Oportunidades_de_carreira": "3.1"
            },
            "RA": {
                "rating": "7.8",
                "Reclamacoes_respondidas": "99.8",
                "Voltariam_a_fazer_negocio": "72.7",
                "Indice_de_solucao": "78.4",
                "Nota_do_consumidor": "6.71"
            }
        },
        {
            "Stock": "CSAN3",
            "Esg": {
                "rating": 3
            },
            "GlassDoor": {
                "Overall": "4.1",
                "Cultura_e_valores": "3.6",
                "Diversidade_e_inclusao": "4.1",
                "Qualidade_de_vida": "3.2",
                "Alta_lideranca": "3.3",
                "Remuneracao_e_beneficios": "4.1",
                "Oportunidades_de_carreira": "3.5"
            }
        },
        {
            "Stock": "CSNA3",
            "Esg": {
                "rating": 7
            },
            "GlassDoor": {
                "Overall": "3.5",
                "Cultura_e_valores": "3.1",
                "Diversidade_e_inclusao": "4.0",
                "Qualidade_de_vida": "3.1",
                "Alta_lideranca": "2.9",
                "Remuneracao_e_beneficios": "3.1",
                "Oportunidades_de_carreira": "3.1"
            }
        },
        {
            "Stock": "CVCB3",
            "GlassDoor": {
                "Overall": "3.5",
                "Cultura_e_valores": "3.2",
                "Diversidade_e_inclusao": "4.0",
                "Qualidade_de_vida": "3.0",
                "Alta_lideranca": "2.8",
                "Remuneracao_e_beneficios": "3.3",
                "Oportunidades_de_carreira": "2.9"
            },
            "RA": {
                "rating": "4.4",
                "Reclamacoes_respondidas": "66",
                "Voltariam_a_fazer_negocio": "32.3",
                "Indice_de_solucao": "48.2",
                "Nota_do_consumidor": "3.22"
            }
        },
        {
            "Stock": "CYRE3",
            "GlassDoor": {
                "Overall": "4.3",
                "Cultura_e_valores": "4.2",
                "Diversidade_e_inclusao": "3.8",
                "Qualidade_de_vida": "3.9",
                "Alta_lideranca": "3.9",
                "Remuneracao_e_beneficios": "3.5",
                "Oportunidades_de_carreira": "3.5"
            },
            "RA": {
                "rating": "7.1",
                "Reclamacoes_respondidas": "98",
                "Voltariam_a_fazer_negocio": "55.6",
                "Indice_de_solucao": "75",
                "Nota_do_consumidor": "6.0"
            }
        },
        {
            "Stock": "ECOR3",
            "GlassDoor": {
                "Overall": "3.8",
                "Cultura_e_valores": "3.5",
                "Diversidade_e_inclusao": "5.0",
                "Qualidade_de_vida": "3.4",
                "Alta_lideranca": "3.2",
                "Remuneracao_e_beneficios": "3.6",
                "Oportunidades_de_carreira": "2.7"
            },
            "RA": {
                "rating": "4.1",
                "Reclamacoes_respondidas": "96.4",
                "Voltariam_a_fazer_negocio": "27.8",
                "Indice_de_solucao": "27.8",
                "Nota_do_consumidor": "2.72"
            }
        },
        {
            "Stock": "EGIE3",
            "Esg": {
                "rating": 3
            },
            "GlassDoor": {
                "Overall": "3.6",
                "Cultura_e_valores": "3.5",
                "Diversidade_e_inclusao": "3.3",
                "Qualidade_de_vida": "3.5",
                "Alta_lideranca": "3.1",
                "Remuneracao_e_beneficios": "3.4",
                "Oportunidades_de_carreira": "3.3"
            }
        },
        {
            "Stock": "ELET3",
            "Esg": {
                "rating": 5
            },
            "GlassDoor": {
                "Overall": "4.4",
                "Cultura_e_valores": "3.7",
                "Diversidade_e_inclusao": "4.4",
                "Qualidade_de_vida": "4.3",
                "Alta_lideranca": "3.5",
                "Remuneracao_e_beneficios": "4.1",
                "Oportunidades_de_carreira": "2.9"
            }
        },
        {
            "Stock": "ELET6",
            "Esg": {
                "rating": 5
            },
            "GlassDoor": {
                "Overall": "4.4",
                "Cultura_e_valores": "3.7",
                "Diversidade_e_inclusao": "4.4",
                "Qualidade_de_vida": "4.3",
                "Alta_lideranca": "3.5",
                "Remuneracao_e_beneficios": "4.1",
                "Oportunidades_de_carreira": "2.9"
            }
        },
        {
            "Stock": "EMBR3",
            "Esg": {
                "rating": 5
            },
            "GlassDoor": {
                "Overall": "4.0",
                "Cultura_e_valores": "3.7",
                "Diversidade_e_inclusao": "3.7",
                "Qualidade_de_vida": "3.6",
                "Alta_lideranca": "3.3",
                "Remuneracao_e_beneficios": "3.8",
                "Oportunidades_de_carreira": "3.4"
            }
        },
        {
            "Stock": "ENBR3",
            "Esg": {
                "rating": 1
            },
            "GlassDoor": {
                "Overall": "3.9",
                "Cultura_e_valores": "4.0",
                "Diversidade_e_inclusao": "4.6",
                "Qualidade_de_vida": "3.9",
                "Alta_lideranca": "3.7",
                "Remuneracao_e_beneficios": "4.0",
                "Oportunidades_de_carreira": "3.3"
            },
            "RA": {
                "rating": "7.3",
                "Reclamacoes_respondidas": "100",
                "Voltariam_a_fazer_negocio": "65.2",
                "Indice_de_solucao": "74.6",
                "Nota_do_consumidor": "5.79"
            }
        },
        {
            "Stock": "ENGI11",
            "Esg": {
                "rating": 3
            },
            "GlassDoor": {
                "Overall": "4.0",
                "Cultura_e_valores": "3.8",
                "Diversidade_e_inclusao": "4.2",
                "Qualidade_de_vida": "3.8",
                "Alta_lideranca": "3.5",
                "Remuneracao_e_beneficios": "3.8",
                "Oportunidades_de_carreira": "3.4"
            },
            "RA": {
                "rating": "6.0",
                "Reclamacoes_respondidas": "99.9",
                "Voltariam_a_fazer_negocio": "49",
                "Indice_de_solucao": "61.6",
                "Nota_do_consumidor": "4.0"
            }
        },
        {
            "Stock": "EQTL3",
            "Esg": {
                "rating": 4
            },
            "GlassDoor": {
                "Overall": "4.2",
                "Cultura_e_valores": "3.9",
                "Diversidade_e_inclusao": "4.0",
                "Qualidade_de_vida": "3.4",
                "Alta_lideranca": "3.8",
                "Remuneracao_e_beneficios": "3.9",
                "Oportunidades_de_carreira": "3.6"
            },
            "RA": {
                "rating": "6.4",
                "Reclamacoes_respondidas": "98.6",
                "Voltariam_a_fazer_negocio": "52.6",
                "Indice_de_solucao": "65.8",
                "Nota_do_consumidor": "4.71"
            }
        },
        {
            "Stock": "EZTC3",
            "GlassDoor": {
                "Overall": "3.2",
                "Cultura_e_valores": "3.1",
                "Diversidade_e_inclusao": "3.2",
                "Qualidade_de_vida": "3.3",
                "Alta_lideranca": "2.4",
                "Remuneracao_e_beneficios": "3.0",
                "Oportunidades_de_carreira": "2.4"
            },
            "RA": {
                "rating": "9.3",
                "Reclamacoes_respondidas": "100",
                "Voltariam_a_fazer_negocio": "90.6",
                "Indice_de_solucao": "93.8",
                "Nota_do_consumidor": "8.81"
            }
        },
        {
            "Stock": "FLRY3",
            "GlassDoor": {
                "Overall": "4.1",
                "Cultura_e_valores": "4.2",
                "Diversidade_e_inclusao": "4.4",
                "Qualidade_de_vida": "3.6",
                "Alta_lideranca": "3.6",
                "Remuneracao_e_beneficios": "3.7",
                "Oportunidades_de_carreira": "3.8"
            },
            "RA": {
                "rating": "8.1",
                "Reclamacoes_respondidas": "99.5",
                "Voltariam_a_fazer_negocio": "77.2",
                "Indice_de_solucao": "82.6",
                "Nota_do_consumidor": "7.05"
            }
        },
        {
            "Stock": "GGBR4",
            "Esg": {
                "rating": 6
            },
            "GlassDoor": {
                "Overall": "4.0",
                "Cultura_e_valores": "4.1",
                "Diversidade_e_inclusao": "3.8",
                "Qualidade_de_vida": "3.3",
                "Alta_lideranca": "3.6",
                "Remuneracao_e_beneficios": "3.4",
                "Oportunidades_de_carreira": "3.5"
            }
        },
        {
            "Stock": "GNDI3",
            "Esg": {
                "rating": 4
            },
            "GlassDoor": {
                "Overall": "3.8",
                "Cultura_e_valores": "3.6",
                "Diversidade_e_inclusao": "4.5",
                "Qualidade_de_vida": "3.2",
                "Alta_lideranca": "3.4",
                "Remuneracao_e_beneficios": "3.5",
                "Oportunidades_de_carreira": "3.3"
            },
            "RA": {
                "rating": "8.1",
                "Reclamacoes_respondidas": "83.2",
                "Voltariam_a_fazer_negocio": "79",
                "Indice_de_solucao": "88",
                "Nota_do_consumidor": "7.33"
            }
        },
        {
            "Stock": "GOAU4",
            "Esg": {
                "rating": 6
            },
            "GlassDoor": {
                "Overall": "4.0",
                "Cultura_e_valores": "4.1",
                "Diversidade_e_inclusao": "3.8",
                "Qualidade_de_vida": "3.3",
                "Alta_lideranca": "3.6",
                "Remuneracao_e_beneficios": "3.4",
                "Oportunidades_de_carreira": "3.5"
            }
        },
        {
            "Stock": "GOLL4",
            "GlassDoor": {
                "Overall": "4.1",
                "Cultura_e_valores": "4.2",
                "Diversidade_e_inclusao": "4.2",
                "Qualidade_de_vida": "3.7",
                "Alta_lideranca": "3.7",
                "Remuneracao_e_beneficios": "3.9",
                "Oportunidades_de_carreira": "3.8"
            },
            "RA": {
                "rating": "7.1",
                "Reclamacoes_respondidas": "68.9",
                "Voltariam_a_fazer_negocio": "73.3",
                "Indice_de_solucao": "77.4",
                "Nota_do_consumidor": "6.36"
            }
        },
        {
            "Stock": "HAPV3",
            "Esg": {
                "rating": 6
            },
            "GlassDoor": {
                "Overall": "3.6",
                "Cultura_e_valores": "3.3",
                "Diversidade_e_inclusao": "3.4",
                "Qualidade_de_vida": "3.1",
                "Alta_lideranca": "3.2",
                "Remuneracao_e_beneficios": "3.1",
                "Oportunidades_de_carreira": "3.3"
            },
            "RA": {
                "rating": "6.9",
                "Reclamacoes_respondidas": "61.1",
                "Voltariam_a_fazer_negocio": "70.6",
                "Indice_de_solucao": "78",
                "Nota_do_consumidor": "6.29"
            }
        },
        {
            "Stock": "HGTX3",
            "GlassDoor": {
                "Overall": "3.8",
                "Cultura_e_valores": "3.5",
                "Diversidade_e_inclusao": "3.3",
                "Qualidade_de_vida": "3.1",
                "Alta_lideranca": "3.1",
                "Remuneracao_e_beneficios": "3.1",
                "Oportunidades_de_carreira": "3.0"
            },
            "RA": {
                "rating": "6.5",
                "Reclamacoes_respondidas": "99.2",
                "Voltariam_a_fazer_negocio": "48.8",
                "Indice_de_solucao": "73.6",
                "Nota_do_consumidor": "4.35"
            }
        },
        {
            "Stock": "HYPE3",
            "Esg": {
                "rating": 6
            },
            "GlassDoor": {
                "Overall": "3.7",
                "Cultura_e_valores": "3.3",
                "Diversidade_e_inclusao": "3.5",
                "Qualidade_de_vida": "3.3",
                "Alta_lideranca": "3.4",
                "Remuneracao_e_beneficios": "3.8",
                "Oportunidades_de_carreira": "3.3"
            },
            "RA": {
                "rating": "5.8",
                "Reclamacoes_respondidas": "97.8",
                "Voltariam_a_fazer_negocio": "46.2",
                "Indice_de_solucao": "53.8",
                "Nota_do_consumidor": "4.38"
            }
        },
        {
            "Stock": "IGTA3",
            "GlassDoor": {
                "Overall": "3.8",
                "Cultura_e_valores": "3.6",
                "Diversidade_e_inclusao": "5.0",
                "Qualidade_de_vida": "3.5",
                "Alta_lideranca": "3.3",
                "Remuneracao_e_beneficios": "3.6",
                "Oportunidades_de_carreira": "3.3"
            }
        },
        {
            "Stock": "IRBR3",
            "Esg": {
                "rating": 6
            },
            "GlassDoor": {
                "Overall": "3.4",
                "Cultura_e_valores": "2.7",
                "Diversidade_e_inclusao": "3.4",
                "Qualidade_de_vida": "3.4",
                "Alta_lideranca": "2.7",
                "Remuneracao_e_beneficios": "3.7",
                "Oportunidades_de_carreira": "3.1"
            }
        },
        {
            "Stock": "ITSA4",
            "Esg": {
                "rating": 4
            },
            "GlassDoor": {
                "Overall": "4.3",
                "Cultura_e_valores": "4.1",
                "Diversidade_e_inclusao": "4.3",
                "Qualidade_de_vida": "3.7",
                "Alta_lideranca": "3.6",
                "Remuneracao_e_beneficios": "4.5",
                "Oportunidades_de_carreira": "3.9"
            },
            "RA": {
                "rating": "7.3",
                "Reclamacoes_respondidas": "99.7",
                "Voltariam_a_fazer_negocio": "64.1",
                "Indice_de_solucao": "74.1",
                "Nota_do_consumidor": "6.01"
            }
        },
        {
            "Stock": "ITUB4",
            "Esg": {
                "rating": 4
            },
            "GlassDoor": {
                "Overall": "4.3",
                "Cultura_e_valores": "4.1",
                "Diversidade_e_inclusao": "4.3",
                "Qualidade_de_vida": "3.7",
                "Alta_lideranca": "3.6",
                "Remuneracao_e_beneficios": "4.5",
                "Oportunidades_de_carreira": "3.9"
            },
            "RA": {
                "rating": "7.3",
                "Reclamacoes_respondidas": "99.7",
                "Voltariam_a_fazer_negocio": "64.1",
                "Indice_de_solucao": "74.1",
                "Nota_do_consumidor": "6.01"
            }
        },
        {
            "Stock": "JBSS3",
            "Esg": {
                "rating": 7
            },
            "GlassDoor": {
                "Overall": "3.4",
                "Cultura_e_valores": "3.3",
                "Diversidade_e_inclusao": "2.6",
                "Qualidade_de_vida": "2.8",
                "Alta_lideranca": "2.9",
                "Remuneracao_e_beneficios": "3.0",
                "Oportunidades_de_carreira": "3.3"
            },
            "RA": {
                "rating": "9.2",
                "Reclamacoes_respondidas": "99.6",
                "Voltariam_a_fazer_negocio": "88.5",
                "Indice_de_solucao": "94.3",
                "Nota_do_consumidor": "8.73"
            }
        },
        {
            "Stock": "KLBN11",
            "Esg": {
                "rating": 4
            },
            "GlassDoor": {
                "Overall": "4.2",
                "Cultura_e_valores": "4.1",
                "Diversidade_e_inclusao": "4.2",
                "Qualidade_de_vida": "3.8",
                "Alta_lideranca": "3.5",
                "Remuneracao_e_beneficios": "3.9",
                "Oportunidades_de_carreira": "3.6"
            }
        },
        {
            "Stock": "LAME4",
            "Esg": {
                "rating": 6
            },
            "GlassDoor": {
                "Overall": "3.6",
                "Cultura_e_valores": "3.5",
                "Diversidade_e_inclusao": "3.9",
                "Qualidade_de_vida": "2.7",
                "Alta_lideranca": "3.3",
                "Remuneracao_e_beneficios": "2.9",
                "Oportunidades_de_carreira": "3.7"
            },
            "RA": {
                "rating": "8.8",
                "Reclamacoes_respondidas": "100",
                "Voltariam_a_fazer_negocio": "83.3",
                "Indice_de_solucao": "92",
                "Nota_do_consumidor": "7.98"
            }
        },
        {
            "Stock": "LREN3",
            "Esg": {
                "rating": 3
            },
            "GlassDoor": {
                "Overall": "3.9",
                "Cultura_e_valores": "4.1",
                "Diversidade_e_inclusao": "3.0",
                "Qualidade_de_vida": "3.0",
                "Alta_lideranca": "3.5",
                "Remuneracao_e_beneficios": "3.3",
                "Oportunidades_de_carreira": "3.6"
            },
            "RA": {
                "rating": "7.5",
                "Reclamacoes_respondidas": "94.9",
                "Voltariam_a_fazer_negocio": "66.6",
                "Indice_de_solucao": "82",
                "Nota_do_consumidor": "6.02"
            }
        },
        {
            "Stock": "MGLU3",
            "Esg": {
                "rating": 6
            },
            "GlassDoor": {
                "Overall": "4.5",
                "Cultura_e_valores": "4.6",
                "Diversidade_e_inclusao": "4.8",
                "Qualidade_de_vida": "4.0",
                "Alta_lideranca": "4.2",
                "Remuneracao_e_beneficios": "4.1",
                "Oportunidades_de_carreira": "4.4"
            },
            "RA": {
                "rating": "8.3",
                "Reclamacoes_respondidas": "97.8",
                "Voltariam_a_fazer_negocio": "75.6",
                "Indice_de_solucao": "90.5",
                "Nota_do_consumidor": "7.14"
            }
        },
        {
            "Stock": "MRFG3",
            "GlassDoor": {
                "Overall": "3.7",
                "Cultura_e_valores": "3.3",
                "Diversidade_e_inclusao": "4.3",
                "Qualidade_de_vida": "3.1",
                "Alta_lideranca": "3.1",
                "Remuneracao_e_beneficios": "3.4",
                "Oportunidades_de_carreira": "3.4"
            },
            "RA": {
                "rating": "6.9",
                "Reclamacoes_respondidas": "100",
                "Voltariam_a_fazer_negocio": "54.5",
                "Indice_de_solucao": "66.7",
                "Nota_do_consumidor": "6.18"
            }
        },
        {
            "Stock": "MRVE3",
            "GlassDoor": {
                "Overall": "3.9",
                "Cultura_e_valores": "3.8",
                "Diversidade_e_inclusao": "4.2",
                "Qualidade_de_vida": "3.3",
                "Alta_lideranca": "3.5",
                "Remuneracao_e_beneficios": "3.2",
                "Oportunidades_de_carreira": "3.4"
            },
            "RA": {
                "rating": "6.6",
                "Reclamacoes_respondidas": "91.8",
                "Voltariam_a_fazer_negocio": "49.4",
                "Indice_de_solucao": "72.1",
                "Nota_do_consumidor": "5.47"
            }
        },
        {
            "Stock": "MULT3",
            "Esg": {
                "rating": 6
            },
            "GlassDoor": {
                "Overall": "4.2",
                "Cultura_e_valores": "3.7",
                "Diversidade_e_inclusao": "3.5",
                "Qualidade_de_vida": "3.9",
                "Alta_lideranca": "3.8",
                "Remuneracao_e_beneficios": "4.2",
                "Oportunidades_de_carreira": "2.9"
            }
        },
        {
            "Stock": "NTCO3",
            "Esg": {
                "rating": 1
            },
            "GlassDoor": {
                "Overall": "4.1",
                "Cultura_e_valores": "4.3",
                "Diversidade_e_inclusao": "4.6",
                "Qualidade_de_vida": "3.8",
                "Alta_lideranca": "3.3",
                "Remuneracao_e_beneficios": "4.0",
                "Oportunidades_de_carreira": "3.5"
            },
            "RA": {
                "rating": "8.8",
                "Reclamacoes_respondidas": "99.8",
                "Voltariam_a_fazer_negocio": "84.5",
                "Indice_de_solucao": "91.6",
                "Nota_do_consumidor": "7.98"
            }
        },
        {
            "Stock": "PCAR3",
            "Esg": {
                "rating": 3
            },
            "GlassDoor": {
                "Overall": "3.7",
                "Cultura_e_valores": "3.4",
                "Diversidade_e_inclusao": "3.5",
                "Qualidade_de_vida": "3.0",
                "Alta_lideranca": "3.1",
                "Remuneracao_e_beneficios": "3.3",
                "Oportunidades_de_carreira": "3.3"
            },
            "RA": {
                "rating": "7.4",
                "Reclamacoes_respondidas": "89.8",
                "Voltariam_a_fazer_negocio": "72.9",
                "Indice_de_solucao": "74.4",
                "Nota_do_consumidor": "6.48"
            }
        },
        {
            "Stock": "PETR3",
            "Esg": {
                "rating": 5
            },
            "GlassDoor": {
                "Overall": "4.2",
                "Cultura_e_valores": "3.7",
                "Diversidade_e_inclusao": "4.0",
                "Qualidade_de_vida": "4.1",
                "Alta_lideranca": "3.5",
                "Remuneracao_e_beneficios": "4.2",
                "Oportunidades_de_carreira": "3.5"
            },
            "RA": {
                "rating": "0",
                "Reclamacoes_respondidas": "0",
                "Voltariam_a_fazer_negocio": "0",
                "Indice_de_solucao": "0",
                "Nota_do_consumidor": "0"
            }
        },
        {
            "Stock": "PETR4",
            "Esg": {
                "rating": 5
            },
            "GlassDoor": {
                "Overall": "4.2",
                "Cultura_e_valores": "3.7",
                "Diversidade_e_inclusao": "4.0",
                "Qualidade_de_vida": "4.1",
                "Alta_lideranca": "3.5",
                "Remuneracao_e_beneficios": "4.2",
                "Oportunidades_de_carreira": "3.5"
            },
            "RA": {
                "rating": "0",
                "Reclamacoes_respondidas": "0",
                "Voltariam_a_fazer_negocio": "0",
                "Indice_de_solucao": "0",
                "Nota_do_consumidor": "0"
            }
        },
        {
            "Stock": "PRIO3",
            "GlassDoor": {
                "Overall": "4.0",
                "Cultura_e_valores": "3.5",
                "Diversidade_e_inclusao": "4.0",
                "Qualidade_de_vida": "3.8",
                "Alta_lideranca": "3.3",
                "Remuneracao_e_beneficios": "4.2",
                "Oportunidades_de_carreira": "3.0"
            }
        },
        {
            "Stock": "QUAL3",
            "GlassDoor": {
                "Overall": "3.7",
                "Cultura_e_valores": "3.4",
                "Diversidade_e_inclusao": "3.2",
                "Qualidade_de_vida": "3.5",
                "Alta_lideranca": "3.2",
                "Remuneracao_e_beneficios": "3.6",
                "Oportunidades_de_carreira": "2.9"
            },
            "RA": {
                "rating": "7.5",
                "Reclamacoes_respondidas": "99.8",
                "Voltariam_a_fazer_negocio": "62.3",
                "Indice_de_solucao": "81.8",
                "Nota_do_consumidor": "6.18"
            }
        },
        {
            "Stock": "RADL3",
            "Esg": {
                "rating": 6
            },
            "GlassDoor": {
                "Overall": "3.7",
                "Cultura_e_valores": "3.8",
                "Diversidade_e_inclusao": "4.1",
                "Qualidade_de_vida": "2.8",
                "Alta_lideranca": "3.5",
                "Remuneracao_e_beneficios": "3.2",
                "Oportunidades_de_carreira": "4.1"
            },
            "RA": {
                "rating": "7.0",
                "Reclamacoes_respondidas": "95.8",
                "Voltariam_a_fazer_negocio": "54.3",
                "Indice_de_solucao": "76.7",
                "Nota_do_consumidor": "5.63"
            }
        },
        {
            "Stock": "RAIL3",
            "Esg": {
                "rating": 5
            },
            "GlassDoor": {
                "Overall": "4.0",
                "Cultura_e_valores": "3.7",
                "Diversidade_e_inclusao": "4.6",
                "Qualidade_de_vida": "3.2",
                "Alta_lideranca": "3.6",
                "Remuneracao_e_beneficios": "3.5",
                "Oportunidades_de_carreira": "3.5"
            }
        },
        {
            "Stock": "RENT3",
            "Esg": {
                "rating": 2
            },
            "GlassDoor": {
                "Overall": "4.1",
                "Cultura_e_valores": "4.0",
                "Diversidade_e_inclusao": "3.8",
                "Qualidade_de_vida": "3.5",
                "Alta_lideranca": "3.7",
                "Remuneracao_e_beneficios": "3.9",
                "Oportunidades_de_carreira": "3.5"
            },
            "RA": {
                "rating": "8.6",
                "Reclamacoes_respondidas": "90.9",
                "Voltariam_a_fazer_negocio": "84.5",
                "Indice_de_solucao": "90.7",
                "Nota_do_consumidor": "8.04"
            }
        },
        {
            "Stock": "SANB11",
            "Esg": {
                "rating": 2
            },
            "GlassDoor": {
                "Overall": "3.8",
                "Cultura_e_valores": "3.5",
                "Diversidade_e_inclusao": "3.9",
                "Qualidade_de_vida": "3.3",
                "Alta_lideranca": "3.1",
                "Remuneracao_e_beneficios": "3.9",
                "Oportunidades_de_carreira": "3.5"
            },
            "RA": {
                "rating": "7.0",
                "Reclamacoes_respondidas": "99.9",
                "Voltariam_a_fazer_negocio": "60.6",
                "Indice_de_solucao": "69.3",
                "Nota_do_consumidor": "5.87"
            }
        },
        {
            "Stock": "SBSP3",
            "Esg": {
                "rating": 6
            },
            "GlassDoor": {
                "Overall": "4.2",
                "Cultura_e_valores": "3.9",
                "Diversidade_e_inclusao": "4.9",
                "Qualidade_de_vida": "4.3",
                "Alta_lideranca": "3.8",
                "Remuneracao_e_beneficios": "4.3",
                "Oportunidades_de_carreira": "3.2"
            },
            "RA": {
                "rating": "0",
                "Reclamacoes_respondidas": "1.7",
                "Voltariam_a_fazer_negocio": "0",
                "Indice_de_solucao": "0",
                "Nota_do_consumidor": "0"
            }
        },
        {
            "Stock": "SULA11",
            "Esg": {
                "rating": 5
            },
            "GlassDoor": {
                "Overall": "4.6",
                "Cultura_e_valores": "4.3",
                "Diversidade_e_inclusao": "4.3",
                "Qualidade_de_vida": "4.4",
                "Alta_lideranca": "4.1",
                "Remuneracao_e_beneficios": "4.2",
                "Oportunidades_de_carreira": "4.0"
            },
            "RA": {
                "rating": "8.5",
                "Reclamacoes_respondidas": "99.5",
                "Voltariam_a_fazer_negocio": "80.6",
                "Indice_de_solucao": "87.1",
                "Nota_do_consumidor": "7.73"
            }
        },
        {
            "Stock": "SUZB3",
            "Esg": {
                "rating": 6
            },
            "GlassDoor": {
                "Overall": "4.2",
                "Cultura_e_valores": "4.1",
                "Diversidade_e_inclusao": "4.4",
                "Qualidade_de_vida": "3.7",
                "Alta_lideranca": "3.7",
                "Remuneracao_e_beneficios": "4.1",
                "Oportunidades_de_carreira": "3.8"
            }
        },
        {
            "Stock": "TAEE11",
            "GlassDoor": {
                "Overall": "4.5",
                "Cultura_e_valores": "4.1",
                "Diversidade_e_inclusao": "5.0",
                "Qualidade_de_vida": "4.4",
                "Alta_lideranca": "4.3",
                "Remuneracao_e_beneficios": "4.3",
                "Oportunidades_de_carreira": "3.8"
            }
        },
        {
            "Stock": "TIMS3",
            "Esg": {
                "rating": 4
            },
            "GlassDoor": {
                "Overall": "4.0",
                "Cultura_e_valores": "3.7",
                "Diversidade_e_inclusao": "4.5",
                "Qualidade_de_vida": "3.4",
                "Alta_lideranca": "3.4",
                "Remuneracao_e_beneficios": "4.0",
                "Oportunidades_de_carreira": "3.5"
            }
        },
        {
            "Stock": "TOTS3",
            "GlassDoor": {
                "Overall": "4.0",
                "Cultura_e_valores": "4.0",
                "Diversidade_e_inclusao": "4.4",
                "Qualidade_de_vida": "3.9",
                "Alta_lideranca": "3.6",
                "Remuneracao_e_beneficios": "3.5",
                "Oportunidades_de_carreira": "3.5"
            },
            "RA": {
                "rating": "8.7",
                "Reclamacoes_respondidas": "91.8",
                "Voltariam_a_fazer_negocio": "79",
                "Indice_de_solucao": "93.5",
                "Nota_do_consumidor": "8.13"
            }
        },
        {
            "Stock": "UGPA3",
            "Esg": {
                "rating": 2
            },
            "GlassDoor": {
                "Overall": "3.6",
                "Cultura_e_valores": "3.3",
                "Diversidade_e_inclusao": "3.0",
                "Qualidade_de_vida": "3.4",
                "Alta_lideranca": "2.0",
                "Remuneracao_e_beneficios": "3.7",
                "Oportunidades_de_carreira": "2.8"
            },
            "RA": {
                "rating": "7.7",
                "Reclamacoes_respondidas": "92.7",
                "Voltariam_a_fazer_negocio": "73",
                "Indice_de_solucao": "77",
                "Nota_do_consumidor": "6.92"
            }
        },
        {
            "Stock": "USIM5",
            "GlassDoor": {
                "Overall": "3.8",
                "Cultura_e_valores": "3.7",
                "Diversidade_e_inclusao": "2.9",
                "Qualidade_de_vida": "3.3",
                "Alta_lideranca": "3.1",
                "Remuneracao_e_beneficios": "3.3",
                "Oportunidades_de_carreira": "3.0"
            }
        },
        {
            "Stock": "VALE3",
            "Esg": {
                "rating": 7
            },
            "GlassDoor": {
                "Overall": "4.2",
                "Cultura_e_valores": "3.8",
                "Diversidade_e_inclusao": "3.6",
                "Qualidade_de_vida": "3.7",
                "Alta_lideranca": "3.5",
                "Remuneracao_e_beneficios": "4.3",
                "Oportunidades_de_carreira": "3.6"
            },
            "RA": {
                "rating": "4.9",
                "Reclamacoes_respondidas": "93.7",
                "Voltariam_a_fazer_negocio": "37.9",
                "Indice_de_solucao": "44.8",
                "Nota_do_consumidor": "3.1"
            }
        },
        {
            "Stock": "VIVT4",
            "Esg": {
                "rating": 3
            },
            "GlassDoor": {
                "Overall": "4.2",
                "Cultura_e_valores": "4.0",
                "Diversidade_e_inclusao": "4.5",
                "Qualidade_de_vida": "3.6",
                "Alta_lideranca": "3.5",
                "Remuneracao_e_beneficios": "4.3",
                "Oportunidades_de_carreira": "3.7"
            }
        },
        {
            "Stock": "VVAR3",
            "Esg": {
                "rating": 4
            },
            "GlassDoor": {
                "Overall": "3.7",
                "Cultura_e_valores": "3.5",
                "Diversidade_e_inclusao": "4.2",
                "Qualidade_de_vida": "3.2",
                "Alta_lideranca": "3.2",
                "Remuneracao_e_beneficios": "3.3",
                "Oportunidades_de_carreira": "3.3"
            },
            "RA": {
                "rating": "7.3",
                "Reclamacoes_respondidas": "97.4",
                "Voltariam_a_fazer_negocio": "58.2",
                "Indice_de_solucao": "80.5",
                "Nota_do_consumidor": "5.98"
            }
        },
        {
            "Stock": "WEGE3",
            "Esg": {
                "rating": 4
            },
            "GlassDoor": {
                "Overall": "4.3",
                "Cultura_e_valores": "4.0",
                "Diversidade_e_inclusao": "4.1",
                "Qualidade_de_vida": "3.9",
                "Alta_lideranca": "3.7",
                "Remuneracao_e_beneficios": "3.9",
                "Oportunidades_de_carreira": "3.9"
            }
        },
        {
            "Stock": "YDUQ3",
            "GlassDoor": {
                "Overall": "3.3",
                "Cultura_e_valores": "2.9",
                "Diversidade_e_inclusao": "3.0",
                "Qualidade_de_vida": "2.3",
                "Alta_lideranca": "3.3",
                "Remuneracao_e_beneficios": "3.1",
                "Oportunidades_de_carreira": "3.2"
            },
            "RA": {
                "rating": "5.3",
                "Reclamacoes_respondidas": "97.2",
                "Voltariam_a_fazer_negocio": "35.4",
                "Indice_de_solucao": "52",
                "Nota_do_consumidor": "3.75"
            }
        }
    ]
}
""";
