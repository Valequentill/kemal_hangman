import 'package:flutter/material.dart';
import 'package:hangman/turkceoyunsayfasi.dart';
import 'almancaoyunsayfasi.dart';
import 'fransizcaoyunsayfasi.dart';
import 'ingilizceoyunsayfasi.dart';


void main()=> runApp(MaterialApp(title: "Adam Asmaca",
home: HomePage(),
debugShowCheckedModeBanner: false,));

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }

}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Adam Asmaca")),
        backgroundColor: Colors.green,
      ),
    body: Container(
      child: Column(
        children: <Widget>[
          Center(child: Padding(
            padding:  EdgeInsets.all(20.0),
            child: Text('Dili Seciniz'),
          )),
          Row(children: <Widget>[Padding(
            padding:  EdgeInsets.symmetric(vertical: 25,horizontal: 80),
            child: Container(width: 60,height: 40,child: Image(fit: BoxFit.contain,alignment: Alignment.topRight,image: AssetImage('assets/turkiye.png'),),),
          ),RaisedButton(child: Text('Türkçe'),onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>TurkceOyun()));})],),
          Row(children: <Widget>[Padding(
            padding: const EdgeInsets.symmetric(vertical: 25,horizontal: 80),
            child: Container(width: 70,height: 40,child: Image(fit: BoxFit.contain,alignment: Alignment.topRight,image: AssetImage('assets/ingiltere.jpg'),),),
          ),RaisedButton(child: Text('İngilizce'),onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>IngilizceOyun()));})],),
          Row(children: <Widget>[Padding(
            padding: const EdgeInsets.symmetric(vertical: 25,horizontal: 80),
            child: Container(width: 70,height: 40,child: Image(fit: BoxFit.contain,alignment: Alignment.topRight,image: AssetImage('assets/almanya.png'),),),
          ),RaisedButton(child: Text('Almanca'),onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>AlmancaOyun()));})],),
          Row(children: <Widget>[Padding(
            padding: const EdgeInsets.symmetric(vertical: 25,horizontal: 80),
            child: Container(width: 70,height: 40,child: Image(fit: BoxFit.contain,alignment: Alignment.topRight,image: AssetImage('assets/fransa.png'),),),
          ),RaisedButton(child: Text('Fransizca'),onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>FransizcaOyun()));})],),

        ],
      ),
    ),backgroundColor: Colors.cyan,
    );
  }
}
