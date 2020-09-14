//import 'dart:ui';

import 'package:demo_internacionalizacao/l10n/messages_all.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'dart:async';

import 'consts.dart';
import 'i18n/about_localizations.dart';
import 'i18n/home_localizations.dart';
import 'i18n/login_localizations.dart';
import 'i18n/logout_localizations.dart';
import 'i18n/util_localizations.dart';


class AppLocalizations
    with HomeLocalizations,
         LoginLocalizations,
         LogoutLocalizations,
         UtilLocalizations,
         AboutLocalizations
{

  static Future<AppLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode == null ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    print('[AppLocalizations] load: name=$name localeName=$localeName');

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return new AppLocalizations();
    });
  }

  static AppLocalizationsDelegate get delegate => AppLocalizationsDelegate();

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    print('locale.languageCode=${locale.languageCode}');
    bool ret = kSupportedLocalizations
        .map((l) => l.languageCode)
        .contains(locale.languageCode);
    print('[isSupported] ret=$ret');
    return ret;
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    return AppLocalizations.load(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) {
    return false;
  }
}
