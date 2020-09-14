#!/bin/bash

flutter pub run intl_translation:generate_from_arb \
	--output-dir=lib/l10n --no-use-deferred-loading \
	lib/util/localizations.dart \
	lib/util/i18n/* \
	lib/l10n/intl_*.arb

