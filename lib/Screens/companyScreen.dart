import 'package:flutter/material.dart';
import 'package:hackaton_velt_app/Models/GetAll.dart';

class StockDescription extends StatelessWidget {
  const StockDescription({Key key, this.companyStock}) : super(key: key);
  final Stock companyStock;

  Widget logo() {
    return Padding(
        padding: const EdgeInsets.all(15.0),
        child: companyStock.image != null
            ? Image(image: AssetImage(companyStock.image), height: 60)
            : Text(companyStock.stock));
  }

  Widget stockCode() {
    return Row(children: [
      Text(companyStock.stock),
      companyStock.esg != null
          ? Text("ESG: ${companyStock.esg.rating}")
          : Text("ESG: Null")
    ]);
  }

  Widget compareStock() {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(width: 100, child: TextFormField()),
            FlatButton(onPressed: () {}, child: Text("Comparar"))
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        logo(),
        stockCode(),
        compareStock(),
      ],
    );
  }
}

class TableInfo extends StatelessWidget {
  const TableInfo({Key key, this.image, this.companyStock}) : super(key: key);
  final String image;
  final Stock companyStock;

  Widget infoValue(String info, String value) {
    return Column(
      children: [
        Text(info),
        Text(value),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    GlassDoor glassDoorInfo = companyStock.glassDoor;
    RA reclameAquiInfo = companyStock.rA;
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                  color: Colors.cyan,
                  width: double.maxFinite,
                  child: Image(image: AssetImage(image), height: 30)),
              image == "assets/glassdoor.png"
                  ? Column(
                      children: [
                        infoValue("Overall", glassDoorInfo.overall),
                        infoValue("Cultura e valores", glassDoorInfo.culturaEValores),
                        infoValue(
                            "Diversidade inclusão", glassDoorInfo.diversidadeEInclusao),
                        infoValue("Qualidade de vida", glassDoorInfo.qualidadeDeVida),
                        infoValue("Alta liderança", glassDoorInfo.altaLideranca),
                        infoValue("Remuneração e benefícios",
                            glassDoorInfo.remuneracaoEBeneficios),
                      ],
                    )
                  : Column(
                      children: [
                        reclameAquiInfo.rating != null
                            ? infoValue("Rating", reclameAquiInfo.rating)
                            : infoValue("Rating", "Null"),
                        infoValue("Reclamações respondidas",
                            reclameAquiInfo.reclamacoesRespondidas),
                        infoValue("Voltariam a fazer negócio",
                            reclameAquiInfo.voltariamAFazerNegocio),
                        infoValue("Índice de solução", reclameAquiInfo.indiceDeSolucao),
                        infoValue("Nota do consumidor", reclameAquiInfo.notaDoConsumidor),
                        infoValue("Nota do consumidor", reclameAquiInfo.notaDoConsumidor)
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class StockData extends StatelessWidget {
  const StockData({Key key, this.companyStock}) : super(key: key);
  final Stock companyStock;

  Widget tables(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.6,
        minHeight: 100,
      ),
      child: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TableInfo(
                  image: "assets/glassdoor.png",
                  companyStock: companyStock,
                ),
                TableInfo(
                  image: "assets/reclameaqui.png",
                  companyStock: companyStock,
                ),
              ],
            ),
          ),/*
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    width: double.maxFinite,
                    child: Card(
                      child: Column(
                        children: [
                          Container(
                            height: 30,
                            child: Text("Chama"),
                          ),
                          Center(child: Image(image: AssetImage("assets/chart.jpeg")))
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    width: double.maxFinite,
                    child: Card(
                      child: Column(
                        children: [
                          Container(
                            height: 30,
                            child: Text("chama"),
                          ),
                          Center(child: Image(image: AssetImage("assets/chart2.jpeg")))
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )*/
        ],
      ),
    );
  }

  Widget similarValue(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
                color: Colors.white60,
                width: double.maxFinite,
                child: Text("Empresas similares a essa", textAlign: TextAlign.center)),
            Container(
                color: Colors.black.withOpacity(0.6),
                width: double.maxFinite,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Image(image: AssetImage("reclameaqui.png"), height: 30),
                      ),
                      Container(
                        color: Colors.white,
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image(image: AssetImage("magalu.png"), width: 50),
                            Image(image: AssetImage("cpfl.png"), width: 50)
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Image(image: AssetImage("glassdoor.png"), height: 30),
                          ),
                          Container(
                            color: Colors.white,
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image(image: AssetImage("magalu.png"), width: 50),
                                Image(image: AssetImage("cpfl.png"), width: 50)
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 8, child: tables(context)),
        Expanded(flex: 2, child: similarValue(context)),
      ],
    );
  }
}

class CompanyScreen extends StatelessWidget {
  const CompanyScreen({Key key, this.companyStock}) : super(key: key);
  final Stock companyStock;

  Widget topBar() {
    return Container(color: Color(0XFF1A237E));
  }

  Widget centerScreen(BuildContext context, Stock companyStock) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      color: Colors.white60,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 20, 20, 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            StockDescription(companyStock: companyStock),
            StockData(companyStock: companyStock),
          ],
        ),
      ),
    );
  }

  Widget bottomBar() {
    return Container(color: Color(0XFF1A237E));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(flex: 1, child: Container(color: Color(0XFF1A237E))),
          Expanded(flex: 10, child: centerScreen(context, companyStock)),
          Expanded(flex: 1, child: Container(color: Color(0XFF1A237E))),
        ],
      ),
    );
  }
}
