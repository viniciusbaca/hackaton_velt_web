import 'package:flutter/material.dart';
import 'package:hackaton_velt_app/Models/GetAll.dart';
import 'package:hackaton_velt_app/Screens/companyScreen.dart';

class IndicatorRow extends StatelessWidget {
  const IndicatorRow({Key key, this.value, this.image}) : super(key: key);
  final String value, image;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Icon(Icons.arrow_upward),
          Text("$value%"),
          SizedBox(height: 20, child: Image(image: AssetImage(image))),
        ],
      ),
    );
  }
}

class ValueRow extends StatelessWidget {
  const ValueRow({Key key, this.value1, this.value2, this.value3}) : super(key: key);
  final String value1, value2, value3;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 2,
            child: value1 != null
                ? IndicatorRow(value: value1, image: "assets/twitter.png")
                : IndicatorRow(value: "nulo", image: "assets/twitter.png")),
        Expanded(
            flex: 2,
            child: value2 != null
                ? IndicatorRow(value: value2, image: "assets/google.png")
                : IndicatorRow(value: "nulo", image: "assets/google.png")),
        Expanded(
            flex: 2,
            child: value3 != null
                ? IndicatorRow(value: value3, image: "assets/reclameaqui.png")
                : IndicatorRow(value: "nulo", image: "assets/reclameaqui.png")),
      ],
    );
  }
}

class CompanyCard extends StatelessWidget {
  const CompanyCard({Key key, this.stock, this.value1, this.value2, this.value3})
      : super(key: key);

  final Stock stock;
  final String value1, value2, value3;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        child: FlatButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CompanyScreen(
                        companyStock: stock,
                      )),
            );
          },
          child: Container(
            height: 50,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Text(stock.stock),
                  ),
                ),
                Expanded(
                    flex: 6,
                    child: ValueRow(value1: value1, value2: value2, value3: value3))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AllStocksList extends StatefulWidget {
  final Future futureAllStocks;

  const AllStocksList({Key key, this.futureAllStocks}) : super(key: key);
  @override
  _AllStocksListState createState() => _AllStocksListState(futureAllStocks);
}

class _AllStocksListState extends State<AllStocksList> {
  _AllStocksListState(this.futureAllStocks);
  final Future futureAllStocks;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
      child: Column(
        children: [
          Container(
            child: Align(alignment: Alignment.centerLeft, child: Text("Todas ações")),
          ),
          FutureBuilder(
              future: futureAllStocks,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  List<Stock> allStocks = snapshot.data;
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: SingleChildScrollView(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: allStocks.length,
                        itemBuilder: (context, index) {
                          return CompanyCard(
                            stock: allStocks[index],
                            value1: allStocks[index].glassDoor.overall,
                            value2: allStocks[index].glassDoor.overall,
                            value3: allStocks[index].glassDoor.diversidadeEInclusao,
                          );
                        },
                      ),
                    ),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }),
          Text("Ver mais")
        ],
      ),
    );
  }
}


class EveryStock extends StatefulWidget {
  @override
  _EveryStockState createState() => _EveryStockState();
}

class _EveryStockState extends State<EveryStock> {
  Future<List<Stock>> futureAllStocks;

  @override
  void initState() {
    futureAllStocks = getStaticAll();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(flex: 1, child: Container(color: Color(0XFF1A237E))),
          Expanded(flex: 10, child: AllStocksList(futureAllStocks: futureAllStocks,)),
          Expanded(flex: 1, child: Container(color: Color(0XFF1A237E))),
        ],
      ),
    );
  }
}
