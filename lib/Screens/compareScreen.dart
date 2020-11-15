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
                  color: Colors.blueGrey,
                  width: double.maxFinite,
                  child: Image(image: AssetImage(image), height: 30)),
              image == "assets/glassdoor.png"
                  ? Column(
                      children: [
                        infoValue("Overall", glassDoorInfo.overall),
                        infoValue("Cultura e valores", glassDoorInfo.culturaEValores),
                        infoValue("Diversidade inclusão", glassDoorInfo.diversidadeEInclusao),
                        infoValue("Qualidade de vida", glassDoorInfo.qualidadeDeVida),
                        infoValue("Alta liderança", glassDoorInfo.altaLideranca),
                        infoValue("Remuneração e benefícios", glassDoorInfo.remuneracaoEBeneficios),
                      ],
                    )
                  : Column(
                      children: [
                        infoValue("Rating", reclameAquiInfo.rating),
                        infoValue("Reclamações respondidas", reclameAquiInfo.reclamacoesRespondidas),
                        infoValue("Voltariam a fazer negócio", reclameAquiInfo.voltariamAFazerNegocio),
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
          TableInfo(
            image: "assets/glassdoor.png",
            companyStock: companyStock,
          ),   TableInfo(
            image: "assets/reclameaqui.png",
            companyStock: companyStock,
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    width: double.maxFinite,
                    child: Card(
                      child: Text("oi"),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    width: double.maxFinite,
                    child: Card(
                      child: Text("oi"),
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
        ));
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
      height: MediaQuery.of(context).size.height * 0.8,
      color: Colors.green,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 20, 20, 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            StockHeader(stock1: stock1, stock2: stock2,),
            StockData(companyStock: companyStock),
          ],
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
