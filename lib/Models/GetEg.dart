class GetEg {
  List<StockList> stockList;

  GetEg({this.stockList});

  GetEg.fromJson(Map<String, dynamic> json) {
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
  Esg esg;

  StockList({this.stock, this.esg});

  StockList.fromJson(Map<String, dynamic> json) {
    stock = json['Stock'];
    esg = json['Esg'] != null ? new Esg.fromJson(json['Esg']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Stock'] = this.stock;
    if (this.esg != null) {
      data['Esg'] = this.esg.toJson();
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

String staticEg = """
{
  "StockList": [
    {
      "Stock": "ABEV3",
      "Esg": {
        "rating": 2
      }
    },
    {
      "Stock": "B3SA3",
      "Esg": {
        "rating": 2
      }
    },
    {
      "Stock": "BTOW3",
      "Esg": {
        "rating": 4
      }
    },
    {
      "Stock": "SANB11",
      "Esg": {
        "rating": 2
      }
    },
    {
      "Stock": "BRKM5",
      "Esg": {
        "rating": 5
      }
    },
    {
      "Stock": "BRFS3",
      "Esg": {
        "rating": 6
      }
    },
    {
      "Stock": "CRFB3",
      "Esg": {
        "rating": 2
      }
    },
    {
      "Stock": "CCRO3",
      "Esg": {
        "rating": 5
      }
    },
    {
      "Stock": "ELET3",
      "Esg": {
        "rating": 5
      }
    },
    {
      "Stock": "CIEL3",
      "Esg": {
        "rating": 4
      }
    },
    {
      "Stock": "COGN3",
      "Esg": {
        "rating": 4
      }
    },
    {
      "Stock": "SBSP3",
      "Esg": {
        "rating": 6
      }
    },
    {
      "Stock": "CMIG4",
      "Esg": {
        "rating": 2
      }
    },
    {
      "Stock": "CSNA3",
      "Esg": {
        "rating": 7
      }
    },
    {
      "Stock": "CSAN3",
      "Esg": {
        "rating": 3
      }
    },
    {
      "Stock": "CPFE3",
      "Esg": {
        "rating": 3
      }
    },
    {
      "Stock": "ENGI11",
      "Esg": {
        "rating": 3
      }
    },
    {
      "Stock": "EGIE3",
      "Esg": {
        "rating": 3
      }
    },
    {
      "Stock": "EQTL3",
      "Esg": {
        "rating": 4
      }
    },
    {
      "Stock": "GGBR4",
      "Esg": {
        "rating": 6
      }
    },
    {
      "Stock": "HAPV3",
      "Esg": {
        "rating": 6
      }
    },
    {
      "Stock": "HYPE3",
      "Esg": {
        "rating": 6
      }
    },
    {
      "Stock": "IRBR3",
      "Esg": {
        "rating": 6
      }
    },
    {
      "Stock": "ITSA4",
      "Esg": {
        "rating": 4
      }
    },
    {
      "Stock": "ITUB4",
      "Esg": {
        "rating": 4
      }
    },
    {
      "Stock": "JBSS3",
      "Esg": {
        "rating": 7
      }
    },
    {
      "Stock": "RENT3",
      "Esg": {
        "rating": 2
      }
    },
    {
      "Stock": "LAME4",
      "Esg": {
        "rating": 6
      }
    },
    {
      "Stock": "LREN3",
      "Esg": {
        "rating": 3
      }
    },
    {
      "Stock": "MGLU3",
      "Esg": {
        "rating": 6
      }
    },
    {
      "Stock": "NTCO3",
      "Esg": {
        "rating": 1
      }
    },
    {
      "Stock": "GNDI3",
      "Esg": {
        "rating": 4
      }
    },
    {
      "Stock": "PETR3",
      "Esg": {
        "rating": 5
      }
    },
    {
      "Stock": "RADL3",
      "Esg": {
        "rating": 6
      }
    },
    {
      "Stock": "RAIL3",
      "Esg": {
        "rating": 5
      }
    },
    {
      "Stock": "SULA11",
      "Esg": {
        "rating": 5
      }
    },
    {
      "Stock": "SUZB3",
      "Esg": {
        "rating": 6
      }
    },
    {
      "Stock": "VIVT4",
      "Esg": {
        "rating": 3
      }
    },
    {
      "Stock": "TIMS3",
      "Esg": {
        "rating": 4
      }
    },
    {
      "Stock": "UGPA3",
      "Esg": {
        "rating": 2
      }
    },
    {
      "Stock": "VVAR3",
      "Esg": {
        "rating": 4
      }
    },
    {
      "Stock": "WEGE3",
      "Esg": {
        "rating": 4
      }
    },
    {
      "Stock": "BBAS3",
      "Esg": {
        "rating": 2
      }
    },
    {
      "Stock": "BBDC3",
      "Esg": {
        "rating": 2
      }
    },
    {
      "Stock": "BBDC4",
      "Esg": {
        "rating": 2
      }
    },
    {
      "Stock": "BBSE3",
      "Esg": {
        "rating": 5
      }
    },
    {
      "Stock": "BPAC11",
      "Esg": {
        "rating": 5
      }
    },
    {
      "Stock": "ELET6",
      "Esg": {
        "rating": 5
      }
    },
    {
      "Stock": "EMBR3",
      "Esg": {
        "rating": 5
      }
    },
    {
      "Stock": "ENBR3",
      "Esg": {
        "rating": 1
      }
    },
    {
      "Stock": "GOAU4",
      "Esg": {
        "rating": 6
      }
    },
    {
      "Stock": "KLBN11",
      "Esg": {
        "rating": 4
      }
    },
    {
      "Stock": "MULT3",
      "Esg": {
        "rating": 6
      }
    },
    {
      "Stock": "PCAR3",
      "Esg": {
        "rating": 3
      }
    },
    {
      "Stock": "PETR4",
      "Esg": {
        "rating": 5
      }
    },
    {
      "Stock": "VALE3",
      "Esg": {
        "rating": 7
      }
    }
  ]
}

""";