import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackaton_velt_app/Models/GetAll.dart';
import 'package:hackaton_velt_app/Screens/companyScreen.dart';
import 'package:hackaton_velt_app/Screens/compareScreen.dart';
import 'package:hackaton_velt_app/Screens/everyStock.dart';

class FastSearch extends StatefulWidget {
  final Future futureMapStocks;
  final String text;
  final int length, sum;

  const FastSearch({Key key, this.futureMapStocks, this.text, this.length, this.sum})
      : super(key: key);

  @override
  _FastSearchState createState() => _FastSearchState(futureMapStocks);
}

class _FastSearchState extends State<FastSearch> {
  final Future futureMapStocks;
  _FastSearchState(this.futureMapStocks);

  final searchController = TextEditingController(text: 'ABEV3');
  bool inputError = false;
  Stock selectedStock;

  Widget searchField(TextEditingController controller, bool errorBool) {
    return TextField(
        onTap: () {
          setState(() {
            inputError = false;
          });
        },
        controller: controller,
        decoration: errorBool == true
            ? InputDecoration(
                errorStyle: TextStyle(color: Colors.red),
                errorText: 'Por favor digite um código válido')
            : InputDecoration());
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
      child: Column(
        children: [
          Container(
            child: Align(
                alignment: Alignment.centerLeft,
                child:
                    Text("Busca rápida", style: TextStyle(fontWeight: FontWeight.w900))),
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                  flex: 3,
                                  child: searchField(searchController, inputError)),
                              Expanded(
                                flex: 1,
                                child: FlatButton(
                                  color: Colors.cyan,
                                  onPressed: () {
                                    for (Stock stock in allStocks) {
                                      if (stock.stock == searchController.text) {
                                        setState(() {
                                          selectedStock = stock;
                                          inputError = false;
                                        });
                                        break;
                                      } else {
                                        inputError = true;
                                      }
                                    }
                                    setState(() {});
                                  },
                                  child: Text("Buscar"),
                                ),
                              )
                            ],
                          )),
                      selectedStock != null
                          ? CompanyCard(stock: selectedStock)
                          : Text("Digite uma empresa válida")
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
}

class CardList extends StatefulWidget {
  final Future futureMapStocks;
  final String text;
  final int length, sum;

  const CardList({Key key, this.futureMapStocks, this.text, this.length, this.sum})
      : super(key: key);

  @override
  _CardListState createState() => _CardListState(futureMapStocks, text, length, sum);
}

class _CardListState extends State<CardList> {
  final Future futureMapStocks;
  final String text;
  final int length, sum;

  _CardListState(this.futureMapStocks, this.text, this.length, this.sum);

  @override
  Widget build(BuildContext context) {
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
                          );
                        },
                      ),
                    ),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              })
        ],
      ),
    );
  }
}

class CompareStocks extends StatefulWidget {
  final Future futureMapStocks;

  const CompareStocks({Key key, this.futureMapStocks}) : super(key: key);
  @override
  _CompareStocksState createState() => _CompareStocksState(futureMapStocks);
}

class _CompareStocksState extends State<CompareStocks> {
  final Future futureMapStocks;
  _CompareStocksState(this.futureMapStocks);

  final stockField1 = TextEditingController(text: 'ABEV3');
  final stockField2 = TextEditingController(text: 'AZUL4');
  bool inputError1 = false;
  bool inputError2 = false;

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
                    errorStyle: TextStyle(color: Colors.red),
                    errorText: 'Por favor digite um código válido')
                : InputDecoration())
      ],
    );
  }

  @override
  void dispose() {
    stockField1.dispose();
    stockField2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                          if (inputError1 == false && inputError2 == false) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CompareScreen(
                                      stock1: selectedStock1, stock2: selectedStock2)),
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
}

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
  const CompanyCard({Key key, this.stock}) : super(key: key);

  final Stock stock;

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
                      child: stock.image != null
                          ? Image(image: AssetImage(stock.image))
                          : Text(stock.stock)),
                ),
                Expanded(
                    flex: 6,
                    child: ValueRow(
                        value1: stock.glassDoor.overall,
                        value2: stock.glassDoor.overall,
                        value3: stock.glassDoor.culturaEValores))
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

  @override
  void initState() {
    futureMapStocks = getMapStocks();
    super.initState();
  }

  Widget topBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      color: Color(0XFF1A237E),
      child: Row(

        children: [
          FlatButton(
            child: Text("Home", style: TextStyle(color: Colors.white)),
            onPressed: () {},
          ),
          FlatButton(
            child: Text("Empresas", style: TextStyle(color: Colors.white)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EveryStock()),
              );
            },
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
                  CardList(
                    futureMapStocks: futureMapStocks,
                    text: "Confira os destaques de hoje",
                    length: 2,
                    sum: 0,
                  ),
                  FastSearch(
                    futureMapStocks: futureMapStocks,
                    text: "Confira os destaques de hoje",
                    length: 2,
                    sum: 0,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  CardList(
                    futureMapStocks: futureMapStocks,
                    text: "Como andam seus favoritos",
                    length: 3,
                    sum: 2,
                  ),
                  CompareStocks(
                    futureMapStocks: futureMapStocks,
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(flex: 1, child: topBar(context)),
          Expanded(flex: 10, child: centerScreen(context)),
          Expanded(flex: 1, child: Container(color: Color(0XFF1A237E))),
        ],
      ),
    );
  }
}
