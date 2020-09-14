import 'dart:ui';

import 'package:flutter/material.dart';

// https://flutter.dev/docs/development/accessibility-and-localization/internationalization
// Internation­alizing Flutter apps
const Iterable<Locale> kSupportedLocalizations = [
  const Locale('en'), // English
  const Locale.fromSubtags(languageCode: 'pt', countryCode: 'BR'), // brazilian portuguese
];


final ThemeData kAppThemeData = ThemeData(
  // This is the theme of your application.
  //
  // Try running your application with "flutter run". You'll see the
  // application has a blue toolbar. Then, without quitting the app, try
  // changing the primarySwatch below to Colors.green and then invoke
  // "hot reload" (press "r" in the console where you ran "flutter run",
  // or simply save your changes to "hot reload" in a Flutter IDE).
  // Notice that the counter didn't reset back to zero; the application
  // is not restarted.
  primarySwatch: Colors.blue,
  primaryColor: Colors.blue,
  primaryColorLight: Colors.yellow[600],
  primaryColorDark: Colors.grey[800],
  errorColor: Colors.red[700],
  highlightColor: Colors.white,
  backgroundColor: Color.fromARGB(255, 3, 169, 244),
  accentColor: Colors.yellow[700],
  bottomAppBarColor: Colors.black54,
  buttonColor: Colors.brown,
  cardColor: Colors.white,
  canvasColor: Colors.blueGrey[50],
  cursorColor: Colors.green[700],
  disabledColor: Colors.blueGrey[200],
  dialogBackgroundColor: Colors.blue[50],
  dividerColor: Colors.blueGrey,
  focusColor: Colors.orange,
  hintColor: Colors.brown,
  hoverColor: Colors.orange[400],
  indicatorColor: Colors.teal,
  accentColorBrightness: Brightness.light,
);

final double kBottomNavigationBarIconSize = 32.0;
final IconThemeData kBottomNavigationBarSelectedIconTheme = IconThemeData(
  color: kAppThemeData.primaryColorLight,
  size: kBottomNavigationBarIconSize,
);

// my_messages.dart
final Color kMyMessagesGroupNameColor = kAppThemeData.highlightColor;

// my_groups.dart, my_messages.dart
final BoxDecoration kBoxDecorationPattern = BoxDecoration(
  image: DecorationImage(
    colorFilter: ColorFilter.mode(
        Colors.blue[50],
        BlendMode.screen),
    image: AssetImage('assets/img/609.jpg')
    ,
    alignment: Alignment.center,
    repeat: ImageRepeat.repeat,
    matchTextDirection: true,
    fit: BoxFit.cover,
  ),
);

// home.dart
final BoxDecoration kBoxDecorationGradient = BoxDecoration(
  gradient: LinearGradient(
    colors: [
      Color.fromARGB(255, 0xE2, 0x7C, 0x39),
      Color.fromARGB(255, 0xE3, 0xFF, 0x73),
    ],
    begin: FractionalOffset(0.3, 0.2),
    end: FractionalOffset(1.0, 1.0),
  ),
);

// my_message.dart
final TextStyle kMyMessageHeaderStyle = TextStyle(
  color: kAppThemeData.primaryColor,
  fontSize: 16.0,
  fontWeight: FontWeight.bold,
);
final TextStyle kMyMessageHeaderDateStyle = TextStyle(
  color: kAppThemeData.primaryColorDark,
  fontSize: 15.0,
  fontWeight: FontWeight.w100,
  fontStyle: FontStyle.italic,
);
final TextStyle kMyMessageBodyStyle = TextStyle(
  color: kAppThemeData.primaryColorDark,
  fontSize: 16.0,
  fontWeight: FontWeight.normal,
);

final TextStyle kAboutTitleTextStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.bold,
  color: kAppThemeData.primaryColor,
);