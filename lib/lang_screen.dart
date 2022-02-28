import 'dart:io';

import 'package:flutter/material.dart';
import 'package:thenextlevel/main.dart';

class LangView extends StatefulWidget {
  const LangView({Key? key}) : super(key: key);

  @override
  _LangViewState createState() => _LangViewState();
}

class _LangViewState extends State<LangView> {
  String lang ="";
  @override
  Widget build(BuildContext context) {
    return  Scaffold(


      body:Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/logo.png"),

          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height-(30*(MediaQuery.of(context).size.height))/100,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(

                    onTap: () async {
                      try {
                        final result = await InternetAddress.lookup('google.com');
                        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
                          print('connected');
                        }
                      } on SocketException catch (_) {
                        print('not connected');
                      }
                      lang="en";
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) =>  MainScreen(lang)));
                    }, child: Container(
                    width:300 ,
                    height: 51,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10) ,
                      boxShadow: const [
                        BoxShadow(color:  Color(0xFF76b8bd), spreadRadius: 1),
                      ],
                    ),
                    child: const Center(child: Text("English",style:TextStyle(color: Colors.white) ,)))),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(

                    onTap: () async {
                      try {
                        final result = await InternetAddress.lookup('google.com');
                        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
                          print('connected');
                        }
                      } on SocketException catch (_) {
                        print('not connected');
                      }
                      lang="ar";
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => MainScreen(lang)));
                    }, child: Container(
                    width:300 ,
                    height: 51,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10) ,
                      boxShadow: const [
                        BoxShadow(color:  Color(0xFF76b8bd), spreadRadius: 1),
                      ],

                    ),
                    child: const Center(child: Text("العربية",style:TextStyle(color: Colors.white) ,)))),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(

                    onTap: () async {
                      try {
                        final result = await InternetAddress.lookup('google.com');
                        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
                          print('connected');
                        }
                      } on SocketException catch (_) {
                        print('not connected');
                      }

                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => MainScreen(lang)));

                    }, child: Container(
                    width:300 ,
                    height: 51,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10) ,
                      boxShadow: const [
                        BoxShadow(color:  Color(0xFF76b8bd), spreadRadius: 1),
                      ],

                    ),
                    child: const Center(child: Text("Türkçe",style:TextStyle(color: Colors.white) ,)))),
              ),
            ],
          )),
        ) /* add child content here */,
      ),);
  }
}