import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:thenextlevel/splash.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


import 'dart:async';

import 'dart:io';



void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: SplashScreen());
  }
}

class MainScreen extends StatefulWidget {
  String lang;

   MainScreen(this.lang, {Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
{
  late String appName="";
  late  String mainPage ="";
  late  String aboutUs ="";
  late   String courses ="";
  late  String shop ="";
  late  String contact ="";

  late  String aboutUsUrl ="";
  late   String coursesUrl ="";
  late  String shopUrl ="";
  late  String contactUrl ="";







  String url="https://nextlevelkw.com";
  late WebViewController _webController;
  late final GlobalKey _menuKey = GlobalKey();


  Future<bool> _onWillPop() async {
    if (await _webController.canGoBack()) {
      await _webController.goBack();


    }
    return false;
  }
  late bool loadingApp=true;

  @override
  initState(){
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
    if(widget.lang=="ar")
      {
        appName="القائمة الرئيسية";
         url="https://nextlevelkw.com/index.php/home-mob?lang=ar";
          mainPage ="الصفحة الرئيسية ";
          aboutUs ="من نحن";

          courses ="الدورات التدريبية ";
          shop ="المتجر";
          contact ="اتصل بنا ";
       aboutUsUrl ="https://nextlevelkw.com/index.php/about/?lang=ar";
         coursesUrl ="https://nextlevelkw.com/index.php/courses-2/?lang=ar";
      shopUrl ="https://nextlevelkw.com/index.php/shop-3/?lang=ar";
        contactUrl ="https://nextlevelkw.com/index.php/contact/?lang=ar";

      }
    else if(widget.lang=="en")
      {
        url="https://nextlevelkw.com/index.php/home-mob/";
         appName="Main Menu";
        mainPage ="Home ";
        aboutUs ="About Us";
        courses ="Courses ";
        shop ="Shop";
        contact ="Contact Us";

        aboutUsUrl ="https://nextlevelkw.com/index.php/about";
        coursesUrl ="https://nextlevelkw.com/index.php/courses-2";
        shopUrl ="https://nextlevelkw.com/index.php/shop-3";
        contactUrl ="https://nextlevelkw.com/index.php/contact";
      }

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(


      title: "NextLevel",
      theme: ThemeData(
        brightness: Brightness.light,
        /* light theme settings */
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        /* dark theme settings */
      ),
      themeMode: ThemeMode.dark,
      /* ThemeMode.system to follow system theme,
         ThemeMode.light for light theme,
         ThemeMode.dark for dark theme
      */
      debugShowCheckedModeBanner: false,
      home: WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          appBar: AppBar(title: const Text("Next Level")
          ,backgroundColor: const Color(0xFF008E1E)),
          drawer: Drawer(
            backgroundColor:const Color(0xFF008E1E) ,

            // Add a ListView to the drawer. This ensures the user can scroll
            // through the options in the drawer if there isn't enough vertical
            // space to fit everything.
            child: ListView(

              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: [
                 DrawerHeader(

                  decoration: const BoxDecoration(
                    color: Color(0xFF008E1E),
                  ),
                  child: Text(appName),
                ),
                ListTile(
                  title:  Text(mainPage),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer

                    _webController.loadUrl(
                        url);

                  },
                ),
                ListTile(
                  title:  Text(aboutUs),
                  onTap: () {


                    // Update the state of the app
                    // ...
                    // Then close the drawer

                    _webController.loadUrl(
                        aboutUsUrl);


                  },
                ),
                ListTile(
                  title:  Text(courses),
                  onTap: () {


                    // Update the state of the app
                    // ...
                    // Then close the drawer

                    _webController.loadUrl(
                        coursesUrl);


                  },
                ),
                ListTile(
                  title:  Text(shop),
                  onTap: () {


                    // Update the state of the app
                    // ...
                    // Then close the drawer

                    _webController.loadUrl(
                        shopUrl);


                  },
                ),
                ListTile(
                  title:  Text(contact),
                  onTap: () {


                    // Update the state of the app
                    // ...
                    // Then close the drawer

                    _webController.loadUrl(
                        coursesUrl);


                  },
                ),

              ],
            ),
          ),
          body: Row(
            children: [
              Expanded(
                child: Stack(
                  children: [

                    WebView(
                      javascriptMode: JavascriptMode.unrestricted,
                      initialUrl: url,
                      gestureNavigationEnabled: true,

                      onWebViewCreated: (WebViewController webViewController) {
                        setState(() {
                          _webController = webViewController;


                        });
                      },
                      onPageStarted: (String url) async {},
                      onProgress: (int proc) async {
                        if (kDebugMode) {
                          print(proc);
                        }

                        if (proc < 100 && proc > 0 ){
                          setState(() {
                            loadingApp=true;

                          });

                        }else {
                          setState(() {
                            loadingApp=false;
                          });
                        }

                        if (proc > 0) {
                          await _webController.runJavascript(
                              "document.getElementsByClassName('elementor-location-footer')[0].style.display='none'");
                          await _webController.runJavascript(
                              "document.getElementsByClassName('mob-menu-header-holder')[0].style.display='none'");
                          await _webController.runJavascript(
                              "document.getElementsByClassName('footer')[0].style.display='none'");
                          await _webController.runJavascript(
                              "document.getElementsByClassName('subfooter')[0].style.display='none'");

                          await _webController.runJavascript(
                              "document.getElementsByClassName('hidemob')[0].style.display='none'");
                          await _webController.runJavascript(
                              "document.getElementsByClassName('hidemob')[1].style.display='none'");
                          await _webController.runJavascript(
                              "document.getElementsByClassName('hidemob')[2].style.display='none'");
                          await _webController.runJavascript(
                              "document.getElementsByClassName('hidemob2')[2].style.display='none'");
                          await _webController.runJavascript(
                              "document.getElementById('headerar').style.display='none'");
                          await _webController.runJavascript(
                              "document.getElementById('headeren').style.display='none'");
                          await _webController.runJavascript(
                              "document.getElementsByClassName('elementor-location-footer')[0].style.display='none'");
                          await _webController.runJavascript(
                              "document.getElementById('footerenup').style.display='none'");
                          await _webController.runJavascript(
                              "document.getElementById('footerensub').style.display='none'");

                        }
                      },
                    ),

                    Visibility(
                      visible: loadingApp,
                      child: Container(
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [  Color(0xFFD9D9D9), Color(0xffffffff)],transform: GradientRotation(35.0))
                        ),
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.all(40.0),
                          child: Column(
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.height-(80*(MediaQuery.of(context).size.height))/100,
                              ),
                              Center(child: Image.asset("images/logo.png")),
                        SpinKitFadingCircle(
                          itemBuilder: (BuildContext context, int index) {
                            return DecoratedBox(
                              decoration: BoxDecoration(
                                color: index.isEven ? Colors.green : Colors.green,
                              ),
                            );
                          },
                        )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

