import 'package:intl/intl.dart';

mixin UtilLocalizations {
  String get ok => Intl.message("Ok");
  String get cancel => Intl.message("cancel");
  String get loading => Intl.message("loading");

}

// toBeginningOfSentenceCase(AppLocalizations.of(context).name)