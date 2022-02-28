import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:thenextlevel/splash.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
    if(widget.lang=="ar")
      {
         url="https://nextlevelkw.com/?lang=ar";
      }
    else if(widget.lang=="en")
      {
        url="https://nextlevelkw.com";
      }

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Title',
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
          body: Row(
            children: [
              Expanded(
                child: Stack(
                  children: [

                    WebView(
                      javascriptMode: JavascriptMode.unrestricted,
                      initialUrl: url,
                      debuggingEnabled: true,
                      onWebViewCreated: (WebViewController webViewController) {
                        setState(() {
                          _webController = webViewController;
                          _webController.clearCache();
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
                    Positioned(
                      top: 50,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            const Text(
                              'Lang',
                              style: TextStyle(
                                fontSize: 15.0, // insert your font size here
                              ),
                            ),

                            PopupMenuButton(
                                key: _menuKey,
                                itemBuilder: (_) => <PopupMenuItem<String>>[
                                      const PopupMenuItem<String>(
                                          child: Text('ar'), value: 'ar'),
                                      const PopupMenuItem<String>(
                                          child: Text('en'), value: 'en'),
                                      const PopupMenuItem<String>(
                                          child: Text('ref'), value: 'ref'),
                                    ],
                                onSelected: (String val) {
                                  if (val == 'ar') {
                                    _webController.loadUrl(
                                        'https://nextlevelkw.com/?lang=ar');
                                  } else if (val == 'en') {
                                    _webController
                                        .loadUrl('https://nextlevelkw.com');
                                  } else if (val == 'ref') {
                                    _webController.reload();
                                  }
                                })
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: loadingApp,
                      child: Container(
                        color: Colors.white,
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: Center(child: Image.network("https://nextlevelkw.com/wp-content/uploads/2022/01/logo-01-01.png",scale: 0.3,)),
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
