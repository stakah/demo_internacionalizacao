import 'package:intl/intl.dart';

mixin HomeLocalizations {
  String get about => Intl.message('about', name: 'about');
  String get account => Intl.message('account', name: 'account');
  String get alphaWarningMessage => Intl.message('this is an alpha version and thus is subject to crashes and changes without notice',
      name: 'alphaWarningMessage', desc:'warning message displayed in the HomePage');
  String get appTitle => Intl.message('App', name: 'appTitle', desc: 'The App title');
  String get appVersion => Intl.message('version: ', name: 'appVersion', desc: 'The App version label');
  String get homePageTitle => Intl.message('home', name: 'homePageTitle', desc: 'The HomePage title');
  String get logout => Intl.message('logout', name: 'logout');
  String get toThe => Intl.message('to the', name: 'toThe');
  String get welcome => Intl.message('welcome', name: 'welcome');
  String get seeMore => Intl.message('see more', name: 'seeMore');
  String counterMessage(int count) => Intl.message('You have pushed the button ${count} times', args: [count], examples: const {'count':2}, name: 'counterMessage');
}