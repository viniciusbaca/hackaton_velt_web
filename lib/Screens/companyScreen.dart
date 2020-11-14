import 'package:flutter/material.dart';
import 'package:hackaton_velt_app/Models/GetAll.dart';
import 'homeScreen.dart';

class StockDescription extends StatelessWidget {
  const StockDescription({Key key, this.companyStock}) : super(key: key);
  final StockList companyStock;

  Widget logo() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Image(image: AssetImage(companyStock.image), height: 60),
    );
  }

  Widget stockCode() {
    return Column(
      children: [Text(companyStock.stock), Text("ESG: ${companyStock.esg.rating}")],
    );
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
  final StockList companyStock;

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
              Container(color: Colors.blueGrey,width: double.maxFinite, child: Image(image: AssetImage(image), height: 30)),
              image == "assets/glassdoor.png"?

              Column(
                children: [
                  infoValue("Overall", glassDoorInfo.overall),
                  infoValue("Cultura e valores", glassDoorInfo.culturaEValores),
                  infoValue("Diversidade inclusão", glassDoorInfo.diversidadeEInclusao),
                  infoValue("Qualidade de vida", glassDoorInfo.qualidadeDeVida),
                  infoValue("Alta liderança", glassDoorInfo.altaLideranca),
                  infoValue("Remuneração e benefícios", glassDoorInfo.remuneracaoEBeneficios),
                ],
              ):
              Column(
                children: [
                  infoValue("Rating", reclameAquiInfo.rating),
                  infoValue("Reclamações respondidas", reclameAquiInfo.reclamacoesRespondidas),
                  infoValue("Voltariam a fazer negócio", reclameAquiInfo.voltariamAFazerNegocio),
                  infoValue("Índice de solução", reclameAquiInfo.indiceDeSolucao),
                  infoValue("Nota do consumidor", reclameAquiInfo.notaDoConsumidor),
                ],
              )
            ]
          ),
        ),
      ),
    );
  }
}

class StockData extends StatelessWidget {
  const StockData({Key key, this.companyStock}) : super(key: key);
  final StockList companyStock;

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
                TableInfo(image: "assets/glassdoor.png", companyStock: companyStock,),
                TableInfo(image: "assets/reclameaqui.png", companyStock: companyStock,),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    width: double.maxFinite,
                    child: Card(
                      child: Text(
                        "oi"
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    width: double.maxFinite,
                    child: Card(
                      child: Text(
                        "oi"
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget similarValue(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(child: Text("Salve")),
      )
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
  final StockList companyStock;

  Widget topBar() {
    return Container(color: Colors.black);
  }

  Widget centerScreen(BuildContext context, StockList companyStock) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      color: Colors.green,
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
    return Container(color: Colors.black);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(flex: 1, child: topBar()),
          Expanded(flex: 10, child: centerScreen(context, companyStock)),
          Expanded(flex: 1, child: bottomBar()),
        ],
      ),
    );
  }
}
