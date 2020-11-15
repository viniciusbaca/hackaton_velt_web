import 'package:flutter/material.dart';
import 'package:hackaton_velt_app/Models/GetAll.dart';

class StockHeader extends StatelessWidget {
  const StockHeader({Key key, this.stock1, this.stock2}) : super(key: key);
  final Stock stock1, stock2;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text("Comparando"),
            Row(
              children: [Text(stock1.stock), Text("   X   "), Text(stock2.stock)],
            )
          ],
        ));
  }
}

class CompareTable extends StatelessWidget {
  const CompareTable({Key key, this.image, this.stock1, this.stock2}) : super(key: key);
  final String image;
  final Stock stock1, stock2;

  Widget infoValue(String info, String value) {
    return Column(
      children: [
        Text(info),
        Text(value),
      ],
    );
  }

  Widget glassDoorInfo(GlassDoor glassDoor) {
    return Column(
      children: [
        infoValue("Overall", glassDoor.overall),
        infoValue("Cultura e valores", glassDoor.culturaEValores),
        infoValue("Diversidade inclusão", glassDoor.diversidadeEInclusao),
        infoValue("Qualidade de vida", glassDoor.qualidadeDeVida),
        infoValue("Alta liderança", glassDoor.altaLideranca),
        infoValue("Remuneração e benefícios", glassDoor.remuneracaoEBeneficios),
      ],
    );
  }

  Widget reclameAquiInfo(RA reclameAqui) {
    return Column(
      children: [
        infoValue("Rating", reclameAqui.rating),
        infoValue("Reclamações respondidas", reclameAqui.reclamacoesRespondidas),
        infoValue("Voltariam a fazer negócio", reclameAqui.voltariamAFazerNegocio),
        infoValue("Índice de solução", reclameAqui.indiceDeSolucao),
        infoValue("Nota do consumidor", reclameAqui.notaDoConsumidor),
        infoValue("Nota do consumidor", reclameAqui.notaDoConsumidor)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                  color: Colors.blueGrey,
                  width: double.maxFinite,
                  child: Image(image: AssetImage(image), height: 30)),
              image == "assets/glassdoor.png"
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        glassDoorInfo(stock1.glassDoor),
                        glassDoorInfo(stock2.glassDoor),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        reclameAquiInfo(stock1.rA),
                        reclameAquiInfo(stock2.rA),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class StockGraph extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(10),
        width: double.maxFinite,
        child: Card(child: Text("oi")),
      ),
    );
  }
}


class StockData extends StatelessWidget {
  const StockData({Key key, this.stock1, this.stock2}) : super(key: key);
  final Stock stock1, stock2;

  Widget tables(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 1.5,
        minHeight: 100,
      ),
      child: Column(
        children: [
          CompareTable(image: "assets/glassdoor.png", stock1: stock1, stock2: stock2),
          CompareTable(image: "assets/reclameaqui.png", stock1: stock1, stock2: stock2),
          StockGraph(),
          StockGraph(),
        ],
      ),
    );
  }

  Widget similarValue(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          child: Text("Salve"),
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

class CompareScreen extends StatelessWidget {
  const CompareScreen({Key key, this.stock1, this.stock2}) : super(key: key);
  final Stock stock1, stock2;

  Widget centerScreen(BuildContext context, Stock companyStock) {
    return Container(
      height: 2000,
      color: Colors.green,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 20, 20, 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              StockHeader(stock1: stock1, stock2: stock2),
              StockData(stock1: stock1, stock2: stock2),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(flex: 1, child: Container(color: Colors.black)),
          Expanded(flex: 10, child: centerScreen(context, stock1)),
          Expanded(flex: 1, child: Container(color: Colors.black)),
        ],
      ),
    );
  }
}
