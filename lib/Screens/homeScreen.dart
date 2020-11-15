import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackaton_velt_app/Models/GetAll.dart';
import 'package:hackaton_velt_app/Screens/companyScreen.dart';
import 'package:hackaton_velt_app/Screens/compareStocks.dart';
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
  Future<Map<String, List<Stock>>> futureMapStocks;
  final stockField1 = TextEditingController();
  final stockField2 = TextEditingController();
  bool inputError1 = false;
  bool inputError2 = false;

  @override
  void initState() {
    futureMapStocks = getMapStocks();
    super.initState();
  }

  Widget stockField(String text, TextEditingController controller, bool errorBool) {
    return Column(
      children: [
        Text("Empresa $text"),
        TextField(
            onTap: () {
              setState(() {
                inputError1 = false;
                inputError2 = false;
              });
            },
            controller: controller,
            decoration: errorBool == true
                ? InputDecoration(
                    errorStyle: TextStyle(color: Colors.red), errorText: 'Por favor digite um código válido')
                : InputDecoration())
      ],
    );
  }

  Widget compareStocks(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
      child: Column(
        children: [
          Container(
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Comparador", style: TextStyle(fontWeight: FontWeight.w900))),
          ),
          FutureBuilder(
              future: futureMapStocks,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  Map<String, List<Stock>> mapStocks = snapshot.data;
                  List<Stock> allStocks = mapStocks["allStocks"];

                  return Column(
                    children: [
                      Container(
                          height: MediaQuery.of(context).size.height * 0.2,
                          child: Column(
                            children: [
                              stockField("1", stockField1, inputError1),
                              stockField("2", stockField2, inputError2)
                            ],
                          )),
                      FlatButton(
                        onPressed: () {
                          Stock selectedStock1;
                          Stock selectedStock2;

                          for (Stock stock in allStocks) {
                            if (stock.stock == stockField1.text) {
                              inputError1 = false;
                              selectedStock1 = stock;
                              break;
                            } else {
                              inputError1 = true;
                            }
                          }
                          for (Stock stock in allStocks) {
                            if (stock.stock == stockField2.text) {
                              inputError2 = false;
                              selectedStock2 = stock;
                              break;
                            } else {
                              inputError2 = true;
                            }
                          }
                          if (inputError1 == false && inputError1 == false) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      CompareStocks(stock1: selectedStock1, stock2: selectedStock2)),
                            );
                            print("tey");
                          } else {
                            setState(() {
                              inputError1 = true;
                              inputError2 = true;
                            });
                          }
                        },
                        child: Container(color: Colors.cyan, child: Text("Comparar")),
                      )
                    ],
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }),
        ],
      ),
    );
  }

  Widget cardList(BuildContext context, String text, int length, int sum) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
      child: Column(
        children: [
          Container(
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(text, style: TextStyle(fontWeight: FontWeight.w900))),
          ),
          FutureBuilder(
              future: futureMapStocks,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  Map<String, List<Stock>> mapStocks = snapshot.data;
                  List<Stock> selectedStocks = mapStocks["selectedStocks"];
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: SingleChildScrollView(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: length,
                        itemBuilder: (context, index) {
                          return CompanyCard(
                            stock: selectedStocks[index + sum],
                            image: selectedStocks[index + sum].image,
                            value1: "${selectedStocks[index + sum].glassDoor.overall}", //TODO ESG
                            value2: selectedStocks[index + sum].glassDoor.overall,
                            value3: selectedStocks[index + sum].glassDoor.culturaEValores,
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
                MaterialPageRoute(builder: (context) => EveryStock()),
              );
            },
            child: Container(color: Colors.cyan, child: Text("Ver mais")),
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
                  cardList(context, "Confira os destaques de hoje", 2, 0),
                  cardList(context, "Confira os destaques de hoje", 2, 0),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  cardList(context, "Como andam seus favoritos", 3, 2),
                  compareStocks(context),
                ],
              ),
            ),
          ],
        ));
  }

  @override
  void dispose() {
    stockField1.dispose();
    stockField2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(flex: 1, child: Container(color: Colors.black)),
          Expanded(flex: 10, child: centerScreen(context)),
          Expanded(flex: 1, child: Container(color: Colors.black)),
        ],
      ),
    );
  }
}
