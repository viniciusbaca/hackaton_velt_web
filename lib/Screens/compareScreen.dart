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
  final int number;

  const StockGraph({Key key, this.number}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(10),
        width: double.maxFinite,
        child: Card(child: Column(
          children: [
            Text("Twitter"),
            number ==null?
            Image(
              image: AssetImage("assets/chart.jpeg")): Image(
                image: AssetImage("assets/chart$number.jpeg")

            )
          ],
        )),
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
          StockGraph(number: 2),
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

class CompareScreen extends StatelessWidget {
  const CompareScreen({Key key, this.stock1, this.stock2}) : super(key: key);
  final Stock stock1, stock2;

  Widget centerScreen(BuildContext context, Stock companyStock) {
    return Container(
      height: 2000,
      color: Colors.white60,
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
