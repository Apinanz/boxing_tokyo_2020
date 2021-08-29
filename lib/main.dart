import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Palette.myColor,
      ),
      home: BoxingTokyo(),
    );
  }
}

class BoxingTokyo extends StatefulWidget {
  const BoxingTokyo({Key? key}) : super(key: key);

  @override
  _BoxingTokyoState createState() => _BoxingTokyoState();
}

class _BoxingTokyoState extends State<BoxingTokyo> {
  bool fistPressRed = true;
  bool fistPressBlue = true;
  int scoreRed = 0;
  int scoreBlue = 0;
  int countRed = 0;
  int countBlue = 0;
  int round = 1;
  List<Widget> showScore = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('OLYMPIC BOXING SCORING'),
        ),
        body: Container(
          child: Column(
            children: [
              Image(
                image: const AssetImage("assets/images/logo.png"),
                fit: BoxFit.cover,
              ),
              Container(
                color: Colors.black,
                height: 30,
                child: Center(
                    child: Text(
                  "Women's Light (57-60kg) Semi-final",
                  style: TextStyle(color: Colors.white),
                )),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.person,
                        color: Color(0xFFA00000),
                        size: 100,
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Image(
                                image: const AssetImage(
                                    "assets/images/flag_ireland.png"),
                                height: 30,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("IRELAND"),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("HARRINTON Kellie Anne"),
                          ),
                        ],
                      ),countBlue < countRed && showScore.length == 4
                          ? Expanded(child: Icon(Icons.check))
                          : Text("")
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.person,
                        color: Color(0xFF0000A0),
                        size: 100,
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Image(
                                image: const AssetImage(
                                    "assets/images/flag_thailand.png"),
                                height: 30,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("THAILAND"),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("SEESONDEE Sudaporn"),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    child: Divider(
                      thickness: 8.0,
                      color: Color(0xFFA00000),
                    ),
                  )
                ],
              ),
              Expanded(child: Column(children: showScore)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: showScore.length < 3
                    ? [_buildButtonRed(), _buildButtonBlue()]
                    : [_buildNew()],
              )
            ],
          ),
        ));
  }

  Widget _buildNew() {
    return SizedBox(
      width: 300,
      height: 70,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.black),
          onPressed: (_handleClickNew),
          child: Icon(Icons.clear),
        ),
      ),
    );
  }

  _handleClickNew() {
    setState(() {
      scoreRed = 0;
      scoreBlue = 0;
      countRed = 0;
      countBlue = 0;
      fistPressRed = false;
      fistPressBlue = false;
      showScore.clear();
    });
  }

  Widget _buildButtonRed() {
    return SizedBox(
      width: 250,
      height: 70,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
          ),
          onPressed: (_handleClickRedButton),
          child: Icon(Icons.person),
        ),
      ),
    );
  }

  Widget _buildButtonBlue() {
    return SizedBox(
      width: 250,
      height: 70,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.blue,
          ),
          onPressed: (_handleClickBlueButton),
          child: Icon(Icons.person),
        ),
      ),
    );
  }

  Widget _showScore(int round) {
    return Container(
      child: Column(
        children: [
          Text("ROUND $round"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [Text("$scoreRed"), Text("$scoreBlue")],
          ),
          Divider(
            thickness: 5.0,
          )
        ],
      ),
    );
  }

  Widget _showSucessScore() {
    return Container(
      child: Column(
        children: [
          Text("Total"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [Text("$countRed"), Text("$countBlue")],
          ),
          Divider(
            thickness: 5.0,
          )
        ],
      ),
    );
  }

  _handleClickRedButton() {
    setState(() {
      scoreRed = 10;
      scoreBlue = 9;
      countRed += scoreRed;
      countBlue += scoreBlue;
    });
    showScore.add(_showScore(round++));
    if (showScore.length == 3) {
      showScore.add(_showSucessScore());
    }
  }

  _handleClickBlueButton() {
    setState(() {
      scoreRed = 9;
      scoreBlue = 10;
      countRed += scoreRed;
      countBlue += scoreBlue;
    });
    showScore.add(_showScore(round++));
    if (showScore.length == 3) {
      showScore.add(_showSucessScore());
    }
  }
}

class Palette {
  static const MaterialColor myColor = const MaterialColor(
    0xff8b2030,
    const <int, Color>{
      50: const Color(0xff7d1d2b), //10%
      100: const Color(0xff6f1a26), //20%
      200: const Color(0xff611622), //30%
      300: const Color(0xff53131d), //40%
      400: const Color(0xff461018), //50%
      500: const Color(0xff380d13), //60%
      600: const Color(0xff2a0a0e), //70%
      700: const Color(0xff1c060a), //80%
      800: const Color(0xff0e0305), //90%
      900: const Color(0xff000000), //100%
    },
  );
}
