import 'package:flutter/material.dart';
import 'package:hangman/hangman.dart';
import 'package:hangman/hangman_page.dart';
import 'package:hangman/Kelime1.dart';
import 'package:xml/xml.dart' as xml;

const List<String> wordList = const ["PLENTY","ACHIEVE","CLASS","STARE","AFFECT","THICK","CARRIER","BILL","SAY","ARGUE","OFTEN","GROW","VOTING","SHUT","PUSH","FANTASY","PLAN","LAST","ATTACK","COIN","ONE","STEM","SCAN","ENHANCE","PILL","OPPOSED","FLAG","RACE","SPEED","BIAS","HERSELF","DOUGH","RELEASE","SUBJECT","BRICK","SURVIVE","LEADING","STAKE","NERVE","INTENSE","SUSPECT","WHEN","LIE","PLUNGE","HOLD","TONGUE","ROLLING","STAY","RESPECT","SAFELY"];

Future<List<Kelime1>> getContactsFromXML(BuildContext context) async{
  String xmlString = await DefaultAssetBundle.of(context).loadString("assets/kelimeler/ingilizce.xml");
  var raw = xml.parse(xmlString);
  var elements = raw.findAllElements("ingilizce");

  return elements.map((element){
    return Kelime1(element.findElements("kelime").first.text);
  }).toList();
}

class IngilizceOyun extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return IngilizceOyunState();
  }

}

class IngilizceOyunState extends State<IngilizceOyun>{
  HangmanGame _engine;
  void initState() {
    super.initState();

    _engine = HangmanGame(wordList);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hangman',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HangmanPage(_engine),
        debugShowCheckedModeBanner: false
    );
  }
}