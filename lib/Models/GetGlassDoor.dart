class GetGlassDoor {
  List<StockList> stockList;

  GetGlassDoor({this.stockList});

  GetGlassDoor.fromJson(Map<String, dynamic> json) {
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
  GlassDoor glassDoor;

  StockList({this.stock, this.glassDoor});

  StockList.fromJson(Map<String, dynamic> json) {
    stock = json['Stock'];
    glassDoor = json['GlassDoor'] != null
        ? new GlassDoor.fromJson(json['GlassDoor'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Stock'] = this.stock;
    if (this.glassDoor != null) {
      data['GlassDoor'] = this.glassDoor.toJson();
    }
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

String staticGlassDoor = """
{
  "StockList": [
    {
      "Stock": "ABEV3",
      "GlassDoor": {
        "Overall": "4.2",
        "Cultura_e_valores": "4.3",
        "Diversidade_e_inclusao": "4.0",
        "Qualidade_de_vida": "3.2",
        "Alta_lideranca": "3.9",
        "Remuneracao_e_beneficios": "3.7",
        "Oportunidades_de_carreira": "4.1"
      }
    },
    {
      "Stock": "B3SA3",
      "GlassDoor": {
        "Overall": "4.3",
        "Cultura_e_valores": "4.1",
        "Diversidade_e_inclusao": "4.7",
        "Qualidade_de_vida": "4.1",
        "Alta_lideranca": "3.7",
        "Remuneracao_e_beneficios": "4.4",
        "Oportunidades_de_carreira": "3.6"
      }
    },
    {
      "Stock": "BTOW3",
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
      "Stock": "SANB11",
      "GlassDoor": {
        "Overall": "3.8",
        "Cultura_e_valores": "3.5",
        "Diversidade_e_inclusao": "3.9",
        "Qualidade_de_vida": "3.3",
        "Alta_lideranca": "3.1",
        "Remuneracao_e_beneficios": "3.9",
        "Oportunidades_de_carreira": "3.5"
      }
    },
    {
      "Stock": "BRKM5",
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
      "Stock": "BRFS3",
      "GlassDoor": {
        "Overall": "3.9",
        "Cultura_e_valores": "3.7",
        "Diversidade_e_inclusao": "3.3",
        "Qualidade_de_vida": "3.3",
        "Alta_lideranca": "3.3",
        "Remuneracao_e_beneficios": "3.6",
        "Oportunidades_de_carreira": "3.6"
      }
    },
    {
      "Stock": "CRFB3",
      "GlassDoor": {
        "Overall": "3.7",
        "Cultura_e_valores": "3.4",
        "Diversidade_e_inclusao": "3.5",
        "Qualidade_de_vida": "3.2",
        "Alta_lideranca": "3.1",
        "Remuneracao_e_beneficios": "3.3",
        "Oportunidades_de_carreira": "3.1"
      }
    },
    {
      "Stock": "CCRO3",
      "GlassDoor": {
        "Overall": "3.9",
        "Cultura_e_valores": "3.4",
        "Diversidade_e_inclusao": "3.3",
        "Qualidade_de_vida": "3.3",
        "Alta_lideranca": "3.1",
        "Remuneracao_e_beneficios": "3.3",
        "Oportunidades_de_carreira": "2.7"
      }
    },
    {
      "Stock": "ELET3",
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
      "Stock": "CIEL3",
      "GlassDoor": {
        "Overall": "3.9",
        "Cultura_e_valores": "3.6",
        "Diversidade_e_inclusao": "3.8",
        "Qualidade_de_vida": "3.6",
        "Alta_lideranca": "3.3",
        "Remuneracao_e_beneficios": "3.8",
        "Oportunidades_de_carreira": "3.5"
      }
    },
    {
      "Stock": "COGN3",
      "GlassDoor": {
        "Overall": "3.6",
        "Cultura_e_valores": "3.3",
        "Diversidade_e_inclusao": "4.3",
        "Qualidade_de_vida": "3.1",
        "Alta_lideranca": "3.0",
        "Remuneracao_e_beneficios": "3.2",
        "Oportunidades_de_carreira": "3.1"
      }
    },
    {
      "Stock": "SBSP3",
      "GlassDoor": {
        "Overall": "4.2",
        "Cultura_e_valores": "3.9",
        "Diversidade_e_inclusao": "4.9",
        "Qualidade_de_vida": "4.3",
        "Alta_lideranca": "3.8",
        "Remuneracao_e_beneficios": "4.3",
        "Oportunidades_de_carreira": "3.2"
      }
    },
    {
      "Stock": "CMIG4",
      "GlassDoor": {
        "Overall": "4.1",
        "Cultura_e_valores": "3.7",
        "Diversidade_e_inclusao": "3.8",
        "Qualidade_de_vida": "4.1",
        "Alta_lideranca": "3.3",
        "Remuneracao_e_beneficios": "4.2",
        "Oportunidades_de_carreira": "2.9"
      }
    },
    {
      "Stock": "CSNA3",
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
      "Stock": "CSAN3",
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
      "Stock": "CPFE3",
      "GlassDoor": {
        "Overall": "4.0",
        "Cultura_e_valores": "3.7",
        "Diversidade_e_inclusao": "4.0",
        "Qualidade_de_vida": "4.0",
        "Alta_lideranca": "3.3",
        "Remuneracao_e_beneficios": "3.8",
        "Oportunidades_de_carreira": "3.5"
      }
    },
    {
      "Stock": "ENGI11",
      "GlassDoor": {
        "Overall": "4.0",
        "Cultura_e_valores": "3.8",
        "Diversidade_e_inclusao": "4.2",
        "Qualidade_de_vida": "3.8",
        "Alta_lideranca": "3.5",
        "Remuneracao_e_beneficios": "3.8",
        "Oportunidades_de_carreira": "3.4"
      }
    },
    {
      "Stock": "EGIE3",
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
      "Stock": "EQTL3",
      "GlassDoor": {
        "Overall": "4.2",
        "Cultura_e_valores": "3.9",
        "Diversidade_e_inclusao": "4.0",
        "Qualidade_de_vida": "3.4",
        "Alta_lideranca": "3.8",
        "Remuneracao_e_beneficios": "3.9",
        "Oportunidades_de_carreira": "3.6"
      }
    },
    {
      "Stock": "GGBR4",
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
      "Stock": "HAPV3",
      "GlassDoor": {
        "Overall": "3.6",
        "Cultura_e_valores": "3.3",
        "Diversidade_e_inclusao": "3.4",
        "Qualidade_de_vida": "3.1",
        "Alta_lideranca": "3.2",
        "Remuneracao_e_beneficios": "3.1",
        "Oportunidades_de_carreira": "3.3"
      }
    },
    {
      "Stock": "HYPE3",
      "GlassDoor": {
        "Overall": "3.7",
        "Cultura_e_valores": "3.3",
        "Diversidade_e_inclusao": "3.5",
        "Qualidade_de_vida": "3.3",
        "Alta_lideranca": "3.4",
        "Remuneracao_e_beneficios": "3.8",
        "Oportunidades_de_carreira": "3.3"
      }
    },
    {
      "Stock": "IRBR3",
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
      "GlassDoor": {
        "Overall": "4.3",
        "Cultura_e_valores": "4.1",
        "Diversidade_e_inclusao": "4.3",
        "Qualidade_de_vida": "3.7",
        "Alta_lideranca": "3.6",
        "Remuneracao_e_beneficios": "4.5",
        "Oportunidades_de_carreira": "3.9"
      }
    },
    {
      "Stock": "ITUB4",
      "GlassDoor": {
        "Overall": "4.3",
        "Cultura_e_valores": "4.1",
        "Diversidade_e_inclusao": "4.3",
        "Qualidade_de_vida": "3.7",
        "Alta_lideranca": "3.6",
        "Remuneracao_e_beneficios": "4.5",
        "Oportunidades_de_carreira": "3.9"
      }
    },
    {
      "Stock": "JBSS3",
      "GlassDoor": {
        "Overall": "3.4",
        "Cultura_e_valores": "3.3",
        "Diversidade_e_inclusao": "2.6",
        "Qualidade_de_vida": "2.8",
        "Alta_lideranca": "2.9",
        "Remuneracao_e_beneficios": "3.0",
        "Oportunidades_de_carreira": "3.3"
      }
    },
    {
      "Stock": "RENT3",
      "GlassDoor": {
        "Overall": "4.1",
        "Cultura_e_valores": "4.0",
        "Diversidade_e_inclusao": "3.8",
        "Qualidade_de_vida": "3.5",
        "Alta_lideranca": "3.7",
        "Remuneracao_e_beneficios": "3.9",
        "Oportunidades_de_carreira": "3.5"
      }
    },
    {
      "Stock": "LAME4",
      "GlassDoor": {
        "Overall": "3.6",
        "Cultura_e_valores": "3.5",
        "Diversidade_e_inclusao": "3.9",
        "Qualidade_de_vida": "2.7",
        "Alta_lideranca": "3.3",
        "Remuneracao_e_beneficios": "2.9",
        "Oportunidades_de_carreira": "3.7"
      }
    },
    {
      "Stock": "LREN3",
      "GlassDoor": {
        "Overall": "3.9",
        "Cultura_e_valores": "4.1",
        "Diversidade_e_inclusao": "3.0",
        "Qualidade_de_vida": "3.0",
        "Alta_lideranca": "3.5",
        "Remuneracao_e_beneficios": "3.3",
        "Oportunidades_de_carreira": "3.6"
      }
    },
    {
      "Stock": "MGLU3",
      "GlassDoor": {
        "Overall": "4.5",
        "Cultura_e_valores": "4.6",
        "Diversidade_e_inclusao": "4.8",
        "Qualidade_de_vida": "4.0",
        "Alta_lideranca": "4.2",
        "Remuneracao_e_beneficios": "4.1",
        "Oportunidades_de_carreira": "4.4"
      }
    },
    {
      "Stock": "NTCO3",
      "GlassDoor": {
        "Overall": "4.1",
        "Cultura_e_valores": "4.3",
        "Diversidade_e_inclusao": "4.6",
        "Qualidade_de_vida": "3.8",
        "Alta_lideranca": "3.3",
        "Remuneracao_e_beneficios": "4.0",
        "Oportunidades_de_carreira": "3.5"
      }
    },
    {
      "Stock": "GNDI3",
      "GlassDoor": {
        "Overall": "3.8",
        "Cultura_e_valores": "3.6",
        "Diversidade_e_inclusao": "4.5",
        "Qualidade_de_vida": "3.2",
        "Alta_lideranca": "3.4",
        "Remuneracao_e_beneficios": "3.5",
        "Oportunidades_de_carreira": "3.3"
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
      }
    },
    {
      "Stock": "PETR3",
      "GlassDoor": {
        "Overall": "4.2",
        "Cultura_e_valores": "3.7",
        "Diversidade_e_inclusao": "4.0",
        "Qualidade_de_vida": "4.1",
        "Alta_lideranca": "3.5",
        "Remuneracao_e_beneficios": "4.2",
        "Oportunidades_de_carreira": "3.5"
      }
    },
    {
      "Stock": "RADL3",
      "GlassDoor": {
        "Overall": "3.7",
        "Cultura_e_valores": "3.8",
        "Diversidade_e_inclusao": "4.1",
        "Qualidade_de_vida": "2.8",
        "Alta_lideranca": "3.5",
        "Remuneracao_e_beneficios": "3.2",
        "Oportunidades_de_carreira": "4.1"
      }
    },
    {
      "Stock": "RAIL3",
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
      "Stock": "SULA11",
      "GlassDoor": {
        "Overall": "4.6",
        "Cultura_e_valores": "4.3",
        "Diversidade_e_inclusao": "4.3",
        "Qualidade_de_vida": "4.4",
        "Alta_lideranca": "4.1",
        "Remuneracao_e_beneficios": "4.2",
        "Oportunidades_de_carreira": "4.0"
      }
    },
    {
      "Stock": "SUZB3",
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
      "Stock": "VIVT4",
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
      "Stock": "TIMS3",
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
      "Stock": "UGPA3",
      "GlassDoor": {
        "Overall": "3.6",
        "Cultura_e_valores": "3.3",
        "Diversidade_e_inclusao": "3.0",
        "Qualidade_de_vida": "3.4",
        "Alta_lideranca": "2.0",
        "Remuneracao_e_beneficios": "3.7",
        "Oportunidades_de_carreira": "2.8"
      }
    },
    {
      "Stock": "VVAR3",
      "GlassDoor": {
        "Overall": "3.7",
        "Cultura_e_valores": "3.5",
        "Diversidade_e_inclusao": "4.2",
        "Qualidade_de_vida": "3.2",
        "Alta_lideranca": "3.2",
        "Remuneracao_e_beneficios": "3.3",
        "Oportunidades_de_carreira": "3.3"
      }
    },
    {
      "Stock": "WEGE3",
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
      "Stock": "AZUL4",
      "GlassDoor": {
        "Overall": "4.2",
        "Cultura_e_valores": "4.2",
        "Diversidade_e_inclusao": "3.9",
        "Qualidade_de_vida": "3.7",
        "Alta_lideranca": "3.8",
        "Remuneracao_e_beneficios": "3.9",
        "Oportunidades_de_carreira": "3.6"
      }
    },
    {
      "Stock": "BBAS3",
      "GlassDoor": {
        "Overall": "4.1",
        "Cultura_e_valores": "3.7",
        "Diversidade_e_inclusao": "3.9",
        "Qualidade_de_vida": "3.6",
        "Alta_lideranca": "3.3",
        "Remuneracao_e_beneficios": "4.1",
        "Oportunidades_de_carreira": "3.5"
      }
    },
    {
      "Stock": "BBDC3",
      "GlassDoor": {
        "Overall": "4.0",
        "Cultura_e_valores": "3.7",
        "Diversidade_e_inclusao": "4.1",
        "Qualidade_de_vida": "3.4",
        "Alta_lideranca": "3.5",
        "Remuneracao_e_beneficios": "4.1",
        "Oportunidades_de_carreira": "3.7"
      }
    },
    {
      "Stock": "BBDC4",
      "GlassDoor": {
        "Overall": "4.0",
        "Cultura_e_valores": "3.7",
        "Diversidade_e_inclusao": "4.1",
        "Qualidade_de_vida": "3.4",
        "Alta_lideranca": "3.5",
        "Remuneracao_e_beneficios": "4.1",
        "Oportunidades_de_carreira": "3.7"
      }
    },
    {
      "Stock": "BBSE3",
      "GlassDoor": {
        "Overall": "3.4",
        "Cultura_e_valores": "3.2",
        "Diversidade_e_inclusao": "3.4",
        "Qualidade_de_vida": "3.8",
        "Alta_lideranca": "3.4",
        "Remuneracao_e_beneficios": "3.7",
        "Oportunidades_de_carreira": "3.2"
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
      }
    },
    {
      "Stock": "BPAC11",
      "GlassDoor": {
        "Overall": "4.0",
        "Cultura_e_valores": "3.8",
        "Diversidade_e_inclusao": "2.6",
        "Qualidade_de_vida": "2.7",
        "Alta_lideranca": "3.8",
        "Remuneracao_e_beneficios": "4.3",
        "Oportunidades_de_carreira": "4.2"
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
      "Stock": "CVCB3",
      "GlassDoor": {
        "Overall": "3.5",
        "Cultura_e_valores": "3.2",
        "Diversidade_e_inclusao": "4.0",
        "Qualidade_de_vida": "3.0",
        "Alta_lideranca": "2.8",
        "Remuneracao_e_beneficios": "3.3",
        "Oportunidades_de_carreira": "2.9"
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
      }
    },
    {
      "Stock": "ELET6",
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
      "GlassDoor": {
        "Overall": "3.9",
        "Cultura_e_valores": "4.0",
        "Diversidade_e_inclusao": "4.6",
        "Qualidade_de_vida": "3.9",
        "Alta_lideranca": "3.7",
        "Remuneracao_e_beneficios": "4.0",
        "Oportunidades_de_carreira": "3.3"
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
      }
    },
    {
      "Stock": "GOAU4",
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
      "Stock": "KLBN11",
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
      "Stock": "MRFG3",
      "GlassDoor": {
        "Overall": "3.7",
        "Cultura_e_valores": "3.3",
        "Diversidade_e_inclusao": "4.3",
        "Qualidade_de_vida": "3.1",
        "Alta_lideranca": "3.1",
        "Remuneracao_e_beneficios": "3.4",
        "Oportunidades_de_carreira": "3.4"
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
      }
    },
    {
      "Stock": "MULT3",
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
      "Stock": "PCAR3",
      "GlassDoor": {
        "Overall": "3.7",
        "Cultura_e_valores": "3.4",
        "Diversidade_e_inclusao": "3.5",
        "Qualidade_de_vida": "3.0",
        "Alta_lideranca": "3.1",
        "Remuneracao_e_beneficios": "3.3",
        "Oportunidades_de_carreira": "3.3"
      }
    },
    {
      "Stock": "PETR4",
      "GlassDoor": {
        "Overall": "4.2",
        "Cultura_e_valores": "3.7",
        "Diversidade_e_inclusao": "4.0",
        "Qualidade_de_vida": "4.1",
        "Alta_lideranca": "3.5",
        "Remuneracao_e_beneficios": "4.2",
        "Oportunidades_de_carreira": "3.5"
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
      "Stock": "TOTS3",
      "GlassDoor": {
        "Overall": "4.0",
        "Cultura_e_valores": "4.0",
        "Diversidade_e_inclusao": "4.4",
        "Qualidade_de_vida": "3.9",
        "Alta_lideranca": "3.6",
        "Remuneracao_e_beneficios": "3.5",
        "Oportunidades_de_carreira": "3.5"
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
      "GlassDoor": {
        "Overall": "4.2",
        "Cultura_e_valores": "3.8",
        "Diversidade_e_inclusao": "3.6",
        "Qualidade_de_vida": "3.7",
        "Alta_lideranca": "3.5",
        "Remuneracao_e_beneficios": "4.3",
        "Oportunidades_de_carreira": "3.6"
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
      }
    }
  ]
}
""";