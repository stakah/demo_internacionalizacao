#!/bin/bash

INT_DIR=lib/l10n
MESSAGES_FILE=$INT_DIR/intl_messages.arb
EN_FILE=$INT_DIR/intl_en.arb
PT_BR_FILE=$INT_DIR/intl_pt_BR.arb

flutter pub run intl_translation:extract_to_arb \
	--output-dir=$INT_DIR \
	lib/util/localizations.dart \
	lib/util/i18n/*

cp -f $MESSAGES_FILE $EN_FILE

cp -f $PT_BR_FILE $PT_BR_FILE.bak

# criar o arquivo intl_pt_BR.arb ou acrescenta as novas linhas do arquivo intl_messages.arb
python update_intl.py --in $MESSAGES_FILE --out $PT_BR_FILE
