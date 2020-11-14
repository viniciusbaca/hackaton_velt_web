class GetReclameAqui {
  List<StockList> stockList;

  GetReclameAqui({this.stockList});

  GetReclameAqui.fromJson(Map<String, dynamic> json) {
    if (json['StockList'] != null) {
      stockList = new List<StockList>();
      json['StockList'].forEach((v) {
        stockList.add(new StockList.fromJson(v));
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

class StockList {
  String stock;
  RA rA;

  StockList({this.stock, this.rA});

  StockList.fromJson(Map<String, dynamic> json) {
    stock = json['Stock'];
    rA = json['RA'] != null ? new RA.fromJson(json['RA']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Stock'] = this.stock;
    if (this.rA != null) {
      data['RA'] = this.rA.toJson();
    }
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

String staticReclameAqui = """
{
  "StockList": [
    {
      "Stock": "ABEV3",
      "RA": {
        "rating": "8.0",
        "Reclamacoes_respondidas": "95.6",
        "Voltariam_a_fazer_negocio": "82.7",
        "Indice_de_solucao": "79.8",
        "Nota_do_consumidor": "6.87"
      }
    },
    {
      "Stock": "B3SA3",
      "RA": {
        "rating": "9.2",
        "Reclamacoes_respondidas": "95",
        "Voltariam_a_fazer_negocio": "90.4",
        "Indice_de_solucao": "95.2",
        "Nota_do_consumidor": "8.65"
      }
    },
    {
      "Stock": "SANB11",
      "RA": {
        "rating": "7.0",
        "Reclamacoes_respondidas": "99.9",
        "Voltariam_a_fazer_negocio": "60.6",
        "Indice_de_solucao": "69.3",
        "Nota_do_consumidor": "5.87"
      }
    },
    {
      "Stock": "BRFS3",
      "RA": {
        "rating": "8.8",
        "Reclamacoes_respondidas": "100",
        "Voltariam_a_fazer_negocio": "83.3",
        "Indice_de_solucao": "94.4",
        "Nota_do_consumidor": "7.78"
      }
    },
    {
      "Stock": "CRFB3",
      "RA": {
        "rating": "7.8",
        "Reclamacoes_respondidas": "99.8",
        "Voltariam_a_fazer_negocio": "72.7",
        "Indice_de_solucao": "78.4",
        "Nota_do_consumidor": "6.71"
      }
    },
    {
      "Stock": "CCRO3",
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
      "RA": {
        "rating": "8.8",
        "Reclamacoes_respondidas": "98.2",
        "Voltariam_a_fazer_negocio": "81.1",
        "Indice_de_solucao": "93.1",
        "Nota_do_consumidor": "8.02"
      }
    },
    {
      "Stock": "COGN3",
      "RA": {
        "rating": "6.9",
        "Reclamacoes_respondidas": "99.6",
        "Voltariam_a_fazer_negocio": "43.7",
        "Indice_de_solucao": "74.9",
        "Nota_do_consumidor": "5.91"
      }
    },
    {
      "Stock": "SBSP3",
      "RA": {
        "rating": "0",
        "Reclamacoes_respondidas": "1.7",
        "Voltariam_a_fazer_negocio": "0",
        "Indice_de_solucao": "0",
        "Nota_do_consumidor": "0"
      }
    },
    {
      "Stock": "CMIG4",
      "RA": {
        "rating": "6.9",
        "Reclamacoes_respondidas": "99.8",
        "Voltariam_a_fazer_negocio": "62.1",
        "Indice_de_solucao": "69.8",
        "Nota_do_consumidor": "5.29"
      }
    },
    {
      "Stock": "CPFE3",
      "RA": {
        "rating": "6.7",
        "Reclamacoes_respondidas": "99.7",
        "Voltariam_a_fazer_negocio": "58.6",
        "Indice_de_solucao": "67.1",
        "Nota_do_consumidor": "4.97"
      }
    },
    {
      "Stock": "ENGI11",
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
      "RA": {
        "rating": "6.4",
        "Reclamacoes_respondidas": "98.6",
        "Voltariam_a_fazer_negocio": "52.6",
        "Indice_de_solucao": "65.8",
        "Nota_do_consumidor": "4.71"
      }
    },
    {
      "Stock": "HAPV3",
      "RA": {
        "rating": "6.9",
        "Reclamacoes_respondidas": "61.1",
        "Voltariam_a_fazer_negocio": "70.6",
        "Indice_de_solucao": "78",
        "Nota_do_consumidor": "6.29"
      }
    },
    {
      "Stock": "HYPE3",
      "RA": {
        "rating": "5.8",
        "Reclamacoes_respondidas": "97.8",
        "Voltariam_a_fazer_negocio": "46.2",
        "Indice_de_solucao": "53.8",
        "Nota_do_consumidor": "4.38"
      }
    },
    {
      "Stock": "ITSA4",
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
      "RA": {
        "rating": "9.2",
        "Reclamacoes_respondidas": "99.6",
        "Voltariam_a_fazer_negocio": "88.5",
        "Indice_de_solucao": "94.3",
        "Nota_do_consumidor": "8.73"
      }
    },
    {
      "Stock": "RENT3",
      "RA": {
        "rating": "8.6",
        "Reclamacoes_respondidas": "90.9",
        "Voltariam_a_fazer_negocio": "84.5",
        "Indice_de_solucao": "90.7",
        "Nota_do_consumidor": "8.04"
      }
    },
    {
      "Stock": "LAME4",
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
      "RA": {
        "rating": "8.3",
        "Reclamacoes_respondidas": "97.8",
        "Voltariam_a_fazer_negocio": "75.6",
        "Indice_de_solucao": "90.5",
        "Nota_do_consumidor": "7.14"
      }
    },
    {
      "Stock": "NTCO3",
      "RA": {
        "rating": "8.8",
        "Reclamacoes_respondidas": "99.8",
        "Voltariam_a_fazer_negocio": "84.5",
        "Indice_de_solucao": "91.6",
        "Nota_do_consumidor": "7.98"
      }
    },
    {
      "Stock": "GNDI3",
      "RA": {
        "rating": "8.1",
        "Reclamacoes_respondidas": "83.2",
        "Voltariam_a_fazer_negocio": "79",
        "Indice_de_solucao": "88",
        "Nota_do_consumidor": "7.33"
      }
    },
    {
      "Stock": "BRDT3",
      "RA": {
        "rating": "0",
        "Reclamacoes_respondidas": "0",
        "Voltariam_a_fazer_negocio": "0",
        "Indice_de_solucao": "0",
        "Nota_do_consumidor": "0"
      }
    },
    {
      "Stock": "PETR3",
      "RA": {
        "rating": "0",
        "Reclamacoes_respondidas": "0",
        "Voltariam_a_fazer_negocio": "0",
        "Indice_de_solucao": "0",
        "Nota_do_consumidor": "0"
      }
    },
    {
      "Stock": "RADL3",
      "RA": {
        "rating": "7.0",
        "Reclamacoes_respondidas": "95.8",
        "Voltariam_a_fazer_negocio": "54.3",
        "Indice_de_solucao": "76.7",
        "Nota_do_consumidor": "5.63"
      }
    },
    {
      "Stock": "SULA11",
      "RA": {
        "rating": "8.5",
        "Reclamacoes_respondidas": "99.5",
        "Voltariam_a_fazer_negocio": "80.6",
        "Indice_de_solucao": "87.1",
        "Nota_do_consumidor": "7.73"
      }
    },
    {
      "Stock": "UGPA3",
      "RA": {
        "rating": "7.7",
        "Reclamacoes_respondidas": "92.7",
        "Voltariam_a_fazer_negocio": "73",
        "Indice_de_solucao": "77",
        "Nota_do_consumidor": "6.92"
      }
    },
    {
      "Stock": "VVAR3",
      "RA": {
        "rating": "7.3",
        "Reclamacoes_respondidas": "97.4",
        "Voltariam_a_fazer_negocio": "58.2",
        "Indice_de_solucao": "80.5",
        "Nota_do_consumidor": "5.98"
      }
    },
    {
      "Stock": "AZUL4",
      "RA": {
        "rating": "9.0",
        "Reclamacoes_respondidas": "99",
        "Voltariam_a_fazer_negocio": "88.2",
        "Indice_de_solucao": "91",
        "Nota_do_consumidor": "8.36"
      }
    },
    {
      "Stock": "BBAS3",
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
      "RA": {
        "rating": "8.9",
        "Reclamacoes_respondidas": "99.1",
        "Voltariam_a_fazer_negocio": "83.3",
        "Indice_de_solucao": "91.2",
        "Nota_do_consumidor": "8.3"
      }
    },
    {
      "Stock": "CVCB3",
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
      "RA": {
        "rating": "4.1",
        "Reclamacoes_respondidas": "96.4",
        "Voltariam_a_fazer_negocio": "27.8",
        "Indice_de_solucao": "27.8",
        "Nota_do_consumidor": "2.72"
      }
    },
    {
      "Stock": "ENBR3",
      "RA": {
        "rating": "7.3",
        "Reclamacoes_respondidas": "100",
        "Voltariam_a_fazer_negocio": "65.2",
        "Indice_de_solucao": "74.6",
        "Nota_do_consumidor": "5.79"
      }
    },
    {
      "Stock": "EZTC3",
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
      "RA": {
        "rating": "8.1",
        "Reclamacoes_respondidas": "99.5",
        "Voltariam_a_fazer_negocio": "77.2",
        "Indice_de_solucao": "82.6",
        "Nota_do_consumidor": "7.05"
      }
    },
    {
      "Stock": "GOLL4",
      "RA": {
        "rating": "7.1",
        "Reclamacoes_respondidas": "68.9",
        "Voltariam_a_fazer_negocio": "73.3",
        "Indice_de_solucao": "77.4",
        "Nota_do_consumidor": "6.36"
      }
    },
    {
      "Stock": "HGTX3",
      "RA": {
        "rating": "6.5",
        "Reclamacoes_respondidas": "99.2",
        "Voltariam_a_fazer_negocio": "48.8",
        "Indice_de_solucao": "73.6",
        "Nota_do_consumidor": "4.35"
      }
    },
    {
      "Stock": "MRFG3",
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
      "RA": {
        "rating": "6.6",
        "Reclamacoes_respondidas": "91.8",
        "Voltariam_a_fazer_negocio": "49.4",
        "Indice_de_solucao": "72.1",
        "Nota_do_consumidor": "5.47"
      }
    },
    {
      "Stock": "PCAR3",
      "RA": {
        "rating": "7.4",
        "Reclamacoes_respondidas": "89.8",
        "Voltariam_a_fazer_negocio": "72.9",
        "Indice_de_solucao": "74.4",
        "Nota_do_consumidor": "6.48"
      }
    },
    {
      "Stock": "PETR4",
      "RA": {
        "rating": "0",
        "Reclamacoes_respondidas": "0",
        "Voltariam_a_fazer_negocio": "0",
        "Indice_de_solucao": "0",
        "Nota_do_consumidor": "0"
      }
    },
    {
      "Stock": "QUAL3",
      "RA": {
        "rating": "7.5",
        "Reclamacoes_respondidas": "99.8",
        "Voltariam_a_fazer_negocio": "62.3",
        "Indice_de_solucao": "81.8",
        "Nota_do_consumidor": "6.18"
      }
    },
    {
      "Stock": "TOTS3",
      "RA": {
        "rating": "8.7",
        "Reclamacoes_respondidas": "91.8",
        "Voltariam_a_fazer_negocio": "79",
        "Indice_de_solucao": "93.5",
        "Nota_do_consumidor": "8.13"
      }
    },
    {
      "Stock": "VALE3",
      "RA": {
        "rating": "4.9",
        "Reclamacoes_respondidas": "93.7",
        "Voltariam_a_fazer_negocio": "37.9",
        "Indice_de_solucao": "44.8",
        "Nota_do_consumidor": "3.1"
      }
    },
    {
      "Stock": "YDUQ3",
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