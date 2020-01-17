import 'package:flutter/material.dart';
import 'package:hangman/hangman.dart';
import 'package:hangman/hangmanpageALM.dart';
import 'package:hangman/Kelime1.dart';
import 'package:xml/xml.dart' as xml;

const List<String> wordList = const["WOCHE", "JAHR", "HEUTE", "NACHMITTAG", "SEKUNDE","RICHTIG","BESONDERE","ZENTRUM","KUGEL","WÖRTERBUCH","GESCHWİNDİGKEİT","SPRINGEN","KATZE","ARZT","MENSCH","FLÜGEL","BERÜHMT"];

Future<List<Kelime1>> getContactsFromXML(BuildContext context) async{
  String xmlString = await DefaultAssetBundle.of(context).loadString("assets/kelimeler/almanca.xml");
  var raw = xml.parse(xmlString);
  var elements = raw.findAllElements("almanca");

  return elements.map((element){
    return Kelime1(element.findElements("kelime").first.text);
  }).toList();
}

class AlmancaOyun extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return AlmancaOyunState();
  }

}

class AlmancaOyunState extends State<AlmancaOyun>{
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
      home: HangmanPageALM(_engine),
        debugShowCheckedModeBanner: false,
    );
  }

}