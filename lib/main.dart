import 'package:covid19/Ocurrency.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'Global.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Global globalData;
  List<Ocurrency> ocurrencies = new List<Ocurrency>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ocurrencies.add(new Ocurrency("Brazil", 120, 2));
    ocurrencies.add(new Ocurrency("USA ", 1100, 200));
    ocurrencies.add(new Ocurrency("Canada", 12, 2));
    ocurrencies.add(new Ocurrency("Germany", 1500, 225));
    ocurrencies.add(new Ocurrency("Spain", 1620, 212));
  }

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    DateFormat formatter = DateFormat.yMMM().add_jm();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: Colors.black,
        ),
        actions: <Widget>[
          Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "COVID-19",
                style:
                    GoogleFonts.montserrat(fontSize: 12, color: Colors.black),
              ),
              Text(
                "Tracker",
                style: GoogleFonts.montserrat(fontSize: 8, color: Colors.black),
              ),
            ],
          ))
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: <Widget>[
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width - 20,
                  height: 75,
                  decoration: BoxDecoration(
                      color: Color(0xffDD208A),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Report your COVID-19 health status.",
                          textAlign: TextAlign.start,
                          style: GoogleFonts.montserrat(
                              fontSize: 12, color: Colors.white),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Take 1 minute every day, to report your health status and help us map the spread of coronavirus to prevail faster.  Share the app and not the virus!",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.montserrat(
                              fontSize: 10, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                buildCard(context, formatter, "Coronavirus Global", 1254464,
                    68184, 259544, DateTime.now()),
                SizedBox(
                  height: 10,
                ),
                buildCardCountry(context, formatter, "assets/flag.png", "USA",
                    584862, 23555, 36205, new DateTime.now()),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Latest Updates",
                      style: GoogleFonts.montserrat(fontSize: 16),
                    ),
                    Text(
                      "${formatter.format(new DateTime.now())}",
                      style: GoogleFonts.montserrat(fontSize: 10),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 120,
                  width: MediaQuery.of(context).size.width - 10,
                  child: ListView.builder(
                      itemExtent: 60,
                      scrollDirection: Axis.vertical,
                      itemCount: ocurrencies.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: <Widget>[
                            Container(
                              height: 50,
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              width: MediaQuery.of(context).size.width - 20,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "${ocurrencies[index].numberOfCases} new cases and ${ocurrencies[index].numberOfDeaths} deaths in ",
                                        style: GoogleFonts.montserrat(
                                            fontSize: 12),
                                      ),
                                      Text(
                                        "${ocurrencies[index].country}",
                                        style: GoogleFonts.montserrat(
                                            fontSize: 12, color: Colors.blue),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    ">",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 16, color: Colors.blue),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            )
                          ],
                        );
                      }),
                )
              ],
            ),
          ),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

Widget buildCard(BuildContext context, DateFormat format, String location,
    int totalCases, int deaths, int recovered, DateTime lastUpdate) {
  return Container(
    height: 135,
    padding: EdgeInsets.all(8),
    width: MediaQuery.of(context).size.width - 20,
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(15)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          location,
          textAlign: TextAlign.start,
          style: GoogleFonts.montserrat(fontSize: 14),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              height: 90,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Total cases",
                    style: GoogleFonts.montserrat(fontSize: 11),
                  ),
                  Text(
                    "$totalCases",
                    style: GoogleFonts.montserrat(
                        fontSize: 18, color: Color(0xff5A93FF)),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "New:",
                        style: GoogleFonts.montserrat(fontSize: 8),
                      ),
                      Text(
                        "+53.011",
                        style: GoogleFonts.montserrat(
                            fontSize: 10, color: Color(0xff5A93FF)),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              height: 90,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Deaths",
                    style: GoogleFonts.montserrat(
                      fontSize: 11,
                    ),
                  ),
                  Text(
                    "$deaths",
                    style: GoogleFonts.montserrat(
                        fontSize: 18, color: Color(0xffFF5A5A)),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "New:",
                        style: GoogleFonts.montserrat(fontSize: 8),
                      ),
                      Text(
                        "+3496",
                        style: GoogleFonts.montserrat(
                            fontSize: 10, color: Color(0xffFF5A5A)),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              height: 90,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Recovered",
                    style: GoogleFonts.montserrat(
                      fontSize: 11,
                    ),
                  ),
                  Text(
                    "$recovered",
                    style: GoogleFonts.montserrat(
                        fontSize: 18, color: Color(0xff42BE00)),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "New:",
                        style: GoogleFonts.montserrat(fontSize: 8),
                      ),
                      Text(
                        "+231",
                        style: GoogleFonts.montserrat(
                            fontSize: 10, color: Color(0xff42BE00)),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
        Text(
          "Last updated: ${format.format(new DateTime.now())}",
          style:
              GoogleFonts.montserrat(fontSize: 8, fontStyle: FontStyle.normal),
        )
      ],
    ),
  );
}

Widget buildCardCountry(
  BuildContext context,
  DateFormat formatter,
  String flag,
  String name,
  int totalCases,
  int deaths,
  int recovered,
  DateTime lastUpdate,
) {
  return Container(
    height: 145,
    padding: EdgeInsets.all(8),
    width: MediaQuery.of(context).size.width - 20,
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(15)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(12.5),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            flag,
                          ))),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  name,
                  textAlign: TextAlign.start,
                  style: GoogleFonts.montserrat(fontSize: 16),
                ),
              ],
            ),
            InkWell(
              onTap: () {},
              child: Text(
                "Change",
                textAlign: TextAlign.start,
                style: GoogleFonts.montserrat(
                    fontSize: 13, color: Color(0xff0066A5)),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              height: 90,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Total cases",
                    style: GoogleFonts.montserrat(fontSize: 11),
                  ),
                  Text(
                    "$totalCases",
                    style: GoogleFonts.montserrat(
                        fontSize: 18, color: Color(0xff5A93FF)),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "New:",
                        style: GoogleFonts.montserrat(fontSize: 8),
                      ),
                      Text(
                        "+6120",
                        style: GoogleFonts.montserrat(
                            fontSize: 10, color: Color(0xff5A93FF)),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              height: 90,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Deaths",
                    style: GoogleFonts.montserrat(
                      fontSize: 11,
                    ),
                  ),
                  Text(
                    "$deaths",
                    style: GoogleFonts.montserrat(
                        fontSize: 18, color: Color(0xffFF5A5A)),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "New:",
                        style: GoogleFonts.montserrat(fontSize: 8),
                      ),
                      Text(
                        "+521",
                        style: GoogleFonts.montserrat(
                            fontSize: 10, color: Color(0xffFF5A5A)),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              height: 90,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Recovered",
                    style: GoogleFonts.montserrat(
                      fontSize: 11,
                    ),
                  ),
                  Text(
                    "$recovered",
                    style: GoogleFonts.montserrat(
                        fontSize: 18, color: Color(0xff42BE00)),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "New:",
                        style: GoogleFonts.montserrat(fontSize: 8),
                      ),
                      Text(
                        "+231",
                        style: GoogleFonts.montserrat(
                            fontSize: 10, color: Color(0xff42BE00)),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
        Text(
          "Last updated: ${formatter.format(new DateTime.now())}",
          style:
              GoogleFonts.montserrat(fontSize: 8, fontStyle: FontStyle.normal),
        )
      ],
    ),
  );
}
