import 'dart:io';

import 'package:demo_internacionalizacao/util/consts.dart';
import 'package:demo_internacionalizacao/util/localizations.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:package_info/package_info.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatefulWidget {
  static const String routeName = "/about";

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final List<Map<String,String>> refs = const <Map<String,String>>[
    {
      'title': "Set of hand drawn icons by 0melapics - www.freepik.com",
      'url': "https://www.freepik.com/free-vector/set-hand-drawn-icons_979925.htm",
    },
    {
      'title': "Free Designs Illustrations - delesign.com",
      'url': "https://delesign.com/free-designs/graphics/",
    },
    {
      'title': 'Hand drawn sport accessories created by freepik - www.freepik.com',
      'url': "https://www.freepik.com/free-vector/hand-drawn-sport-accessories-pattern_879837.htm",
    },
  ];

  String _appName;
  String _packageName;
  String _version;
  String _buildNumber;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();

    await PackageInfo.fromPlatform().then((info) {
      _appName = info.appName;
      _packageName = info.packageName;
      // TODO acertar essa String
      _version = "1.1.5";
      _buildNumber = info.buildNumber;
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    TapGestureRecognizer _onTapLink;
    _onTapLink = TapGestureRecognizer();
    _onTapLink.onTap = () {

    };
    return Scaffold(
      // AppBar
      appBar: AppBar(
        // Title
        title: Text(toBeginningOfSentenceCase(AppLocalizations.of(context).about)),
        // App Bar background color
        backgroundColor: Colors.blue,
      ),
      // Body
      body: Container(
        // Center the content
        color: Theme.of(context).primaryColorLight,
        child: Container(
          margin: EdgeInsets.only(top:4),
          decoration: BoxDecoration(
            image: DecorationImage(
                alignment: Alignment(0.0, -1.0),
                image: AssetImage('assets/img/Sport.jpg'),
                colorFilter: ColorFilter.mode(Colors.blue[50], BlendMode.screen),
                fit: BoxFit.cover
            ),
          ),
          child: ListView.builder(
            itemCount: refs.length + 2,
            itemBuilder: (ctx,index) {
              final int i = index - 2;

              if (i == -2) {
                return ListTile(
                  leading: Text('Khel',
                    textAlign: TextAlign.center,
                    style: kAboutTitleTextStyle,
                  ),
                  title: Text(toBeginningOfSentenceCase(AppLocalizations.of(context).appVersion)),
                  subtitle: Text('$_version ($_buildNumber)'),
                );
              } else if (i == -1) {
                return ListTile(
                  title: Text(toBeginningOfSentenceCase(AppLocalizations
                      .of(context)
                      .credits),
                    style: kAboutTitleTextStyle,
                  ),
                );
              } else {
                return ListTile(
                  title: Text(
                      refs[i]['title']),
                  subtitle: RichText(
                    text: TextSpan(
                        text: refs[i]['url'],
                        style: TextStyle(
                          color: Theme
                              .of(context)
                              .primaryColor,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launch(
                                refs[i]['url']);
                          }
                    ),
                  ),
                );
              }
            }
          ),
        ),
      ),
    );
  }
}

