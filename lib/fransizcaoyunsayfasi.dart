import 'package:flutter/material.dart';
import 'package:hangman/hangman.dart';
import 'package:hangman/hangmanpageFRA.dart';
import 'package:hangman/Kelime1.dart';
import 'package:xml/xml.dart' as xml;

const List<String> wordList = const ["BONJOUR", "AVION", "BALLON", "SOLEIL", "TORTUE", "ORDINATEUR","GARCON","HOMME","BELLE","CHIEN", "SEMAINE","CALENDRIER","PENDULE","POUVOIR","PETIT","FACILE","JEUDI","JANVIER"];

Future<List<Kelime1>> getContactsFromXML(BuildContext context) async{
  String xmlString = await DefaultAssetBundle.of(context).loadString("assets/kelimeler/fransizca.xml");
  var raw = xml.parse(xmlString);
  var elements = raw.findAllElements("fransizca");

  return elements.map((element){
    return Kelime1(element.findElements("kelime").first.text);
  }).toList();
}

class FransizcaOyun extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return FransizcaOyunState();
  }

}

class FransizcaOyunState extends State<FransizcaOyun>{
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
      home: HangmanPageFRA(_engine),
        debugShowCheckedModeBanner: false,
    );
  }

}