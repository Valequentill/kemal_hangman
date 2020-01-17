import 'package:flutter/material.dart';
import 'package:hangman/hangman.dart';
import 'package:hangman/hangmanpageTR.dart';
import 'package:xml/xml.dart' as xml;
import 'package:hangman/Kelime1.dart';

List<String> wordList = const ["DURU", "YAKAMOZ", "TOPRAK", "ÇİSELEMEK", "BİRLİK", "ÜSTAD", "IŞIK", "DANDİK", "BAŞAK", "HAYAT", "GÖKYÜZÜ","DENİZ","ŞOFÖR","SEVİMLİ","PORTAKAL","AĞAÇ","TEBESSÜM","MÜTEVAZI"];


Future<List<Kelime1>> getContactsFromXML(BuildContext context) async{
  String xmlString = await DefaultAssetBundle.of(context).loadString("assets/kelimeler/turkce.xml");
  var raw = xml.parse(xmlString);
  var elements = raw.findAllElements("turkce");

  return elements.map((element){
    return Kelime1(element.findElements("kelime").first.text);
  }).toList();
}


class TurkceOyun extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return TurkceOyunState();
  }

}

class TurkceOyunState extends State<TurkceOyun>{
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
      home: HangmanPageTR(_engine),
        debugShowCheckedModeBanner: false
    );
  }

}