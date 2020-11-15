import 'package:flutter/material.dart';
import 'package:hackaton_velt_app/Models/GetAll.dart';
import 'package:hackaton_velt_app/Screens/companyScreen.dart';
import 'package:hackaton_velt_app/Screens/everyStock.dart';

class IndicatorRow extends StatelessWidget {
  const IndicatorRow({Key key, this.value, this.image}) : super(key: key);
  final String value, image;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          double.parse(value) > 0 ? Icon(Icons.arrow_upward) : Icon(Icons.arrow_downward),
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
          child: IndicatorRow(value: value1, image: "assets/twitter.png"),
        ),
        Expanded(
          flex: 2,
          child: IndicatorRow(value: value2, image: "assets/google.png"),
        ),
        Expanded(
          flex: 2,
          child: IndicatorRow(value: value3, image: "assets/reclameaqui.png"),
        )
      ],
    );
  }
}

class CompanyCard extends StatelessWidget {
  const CompanyCard({Key key, this.stock, this.image, this.value1, this.value2, this.value3})
      : super(key: key);

  final Stock stock;
  final String image;
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
                    child: Image(image: AssetImage(image)),
                  ),
                ),
                Expanded(flex: 6, child: ValueRow(value1: value1, value2: value2, value3: value3))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<Stock>> futureSelectedStocks;

  @override
  void initState() {
    futureSelectedStocks = getStaticSelected();
    super.initState();
  }

  Widget topBar() {
    return Container(
      color: Colors.black,
    );
  }

  Widget cardList(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
      child: Column(
        children: [
          Container(
            child: Align(alignment: Alignment.centerLeft,child: Text(text)),
          ),
          FutureBuilder(
              future: futureSelectedStocks,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  List<Stock> selectedStocks = snapshot.data;
                  return Container(
                    height: MediaQuery.of(context).size.height*0.3,
                    child: SingleChildScrollView(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: selectedStocks.length,
                        itemBuilder: (context, index) {
                          return CompanyCard(
                            stock: selectedStocks[index],
                            image: selectedStocks[index].image,
                            value1: "${selectedStocks[index].esg.rating}",
                            value2: selectedStocks[index].glassDoor.overall,
                            value3: selectedStocks[index].glassDoor.culturaEValores,
                          );
                        },
                      ),
                    ),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }),
          FlatButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EveryStock(
                    )),
              );
            },
            child: Text("Ver mais"),
          )
        ],
      ),
    );
  }

  Widget centerScreen(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  cardList(context, "Confira os destaques de hoje"),
                  cardList(context, "Confira os destaques de hoje"),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  cardList(context, "Como andam seus favoritos"),
                  cardList(context, "Como andam seus favoritos"),
                ],
              ),
            ),
          ],
        ));
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
          Expanded(flex: 10, child: centerScreen(context)),
          Expanded(flex: 1, child: bottomBar()),
        ],
      ),
    );
  }
}
