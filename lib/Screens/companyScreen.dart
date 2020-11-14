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

class SourceInfo extends StatelessWidget {
  const SourceInfo({Key key, this.image}) : super(key: key);
  final String image;


  Widget infoValue(String info, String value) {
    return Container(
      margin: EdgeInsets.all(5),
      child: Column(
        children: [
          Text(info),
          Text(value),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: Column(
          children: [
            Container(color: Colors.blueGrey, child: Image(image: AssetImage(image), height: 30, width: 120)),
            infoValue("Geral", "4.3"),
            infoValue("Geral", "4.3"),
            infoValue("Geral", "4.3"),
            infoValue("Geral", "4.3"),
            infoValue("Geral", "4.3"),
          ],
        ),
      ),
    );
  }
}

class StockData extends StatelessWidget {
  const StockData({Key key, this.companyStock}) : super(key: key);
  final StockList companyStock;

  Widget firstColumn() {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              SourceInfo(image: "assets/glassdoor.png"),
              SourceInfo(image: "assets/reclameaqui.png"),
            ],
          ),
          Container(
            height: 40,
            width: 200,
            color: Colors.red,
          ),
          Container(
            height: 40,
            width: 200,
            color: Colors.green,
          ),
        ],
      ),
    );
  }

  Widget similarValue() {
    return Card(
      child: Container(
        color: Colors.blueGrey,
        width: 120,
        child: Column(
          children: [
            Text("Empresas com índice ESG próximo ao de Magalu", textAlign: TextAlign.center),
            CompanyCard(image: "assets/morganstanley.png", value1: "3.23", value2: "-1.92", value3: "-3.4"),
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
        Expanded(flex: 8, child: firstColumn()),
        Expanded(flex: 2, child: similarValue()),
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

  Widget centerScreen(StockList companyStock) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 20, 20, 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          StockDescription(companyStock: companyStock),
          StockData(companyStock: companyStock),
        ],
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
          Expanded(flex: 10, child: centerScreen(companyStock)),
          Expanded(flex: 1, child: bottomBar()),
        ],
      ),
    );
  }
}
