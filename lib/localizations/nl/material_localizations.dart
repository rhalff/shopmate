import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/date_symbol_data_local.dart' as intl;
import 'package:intl/intl.dart' as intl;

class _NlMaterialLocalizationsDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const _NlMaterialLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'be';

  @override
  Future<MaterialLocalizations> load(Locale locale) async {
    final String localeName = intl.Intl.canonicalizedLocale(locale.toString());
    await intl.initializeDateFormatting(localeName, null);
    return SynchronousFuture<MaterialLocalizations>(
      NlMaterialLocalizations(
        localeName: localeName,
        fullYearFormat: intl.DateFormat('y', localeName),
        mediumDateFormat: intl.DateFormat('EEE, MMM d', localeName),
        longDateFormat: intl.DateFormat('EEEE, MMMM d, y', localeName),
        yearMonthFormat: intl.DateFormat('MMMM y', localeName),
        decimalFormat: intl.NumberFormat('#,##0.###', localeName),
        twoDigitZeroPaddedFormat: intl.NumberFormat('00', localeName),
      ),
    );
  }

  @override
  bool shouldReload(_NlMaterialLocalizationsDelegate old) => false;
}

class NlMaterialLocalizations extends GlobalMaterialLocalizations {
  const NlMaterialLocalizations({
    String localeName = 'nl',
    @required intl.DateFormat fullYearFormat,
    @required intl.DateFormat mediumDateFormat,
    @required intl.DateFormat longDateFormat,
    @required intl.DateFormat yearMonthFormat,
    @required intl.NumberFormat decimalFormat,
    @required intl.NumberFormat twoDigitZeroPaddedFormat,
  }) : super(
          localeName: localeName,
          fullYearFormat: fullYearFormat,
          mediumDateFormat: mediumDateFormat,
          longDateFormat: longDateFormat,
          yearMonthFormat: yearMonthFormat,
          decimalFormat: decimalFormat,
          twoDigitZeroPaddedFormat: twoDigitZeroPaddedFormat,
        );

  @override
  String get aboutListTileTitleRaw => r'Over $applicationName';

  @override
  String get alertDialogLabel => r'Waarschuwing';

  @override
  String get anteMeridiemAbbreviation => r'AM';

  @override
  String get backButtonTooltip => r'Terug';

  @override
  String get cancelButtonLabel => r'Annuleren';

  @override
  String get closeButtonLabel => r'Sluiten';

  @override
  String get closeButtonTooltip => r'Sluiten';

  @override
  String get collapsedIconTapHint => r'Openklappen';

  @override
  String get continueButtonLabel => r'Doorgaan';

  @override
  String get copyButtonLabel => r'Kopiëren';

  @override
  String get cutButtonLabel => r'Knippen';

  @override
  String get deleteButtonTooltip => r'Verwijderen';

  @override
  String get dialogLabel => r'Dialog';

  @override
  String get drawerLabel => r'Navigatie menu';

  @override
  String get expandedIconTapHint => r'Inklappen';

  @override
  String get hideAccountsLabel => r'Hide accounts';

  @override
  String get licensesPageTitle => r'Licenties';

  @override
  String get modalBarrierDismissLabel => r'Dismiss';

  @override
  String get nextMonthTooltip => r'Volgende maand';

  @override
  String get nextPageTooltip => r'Volgend pagina';

  @override
  String get okButtonLabel => r'OK';

  @override
  String get openAppDrawerTooltip => r'Open navigatie menu';

  @override
  String get pageRowsInfoTitleRaw => r'$firstRow–$lastRow van $rowCount';

  @override
  String get pageRowsInfoTitleApproximateRaw =>
      r'$firstRow–$lastRow van ongeveer $rowCount';

  @override
  String get pasteButtonLabel => r'Plakken';

  @override
  String get popupMenuLabel => r'Popup menu';

  @override
  String get postMeridiemAbbreviation => r'PM';

  @override
  String get previousMonthTooltip => r'Vorige maand';

  @override
  String get previousPageTooltip => r'Vorige pagina';

  @override
  String get refreshIndicatorSemanticLabel => r'Verversen';

  @override
  String get remainingTextFieldCharacterCountFew => null;

  @override
  String get remainingTextFieldCharacterCountMany => null;

  @override
  String get remainingTextFieldCharacterCountOne => r'1 teken over';

  @override
  String get remainingTextFieldCharacterCountOther =>
      r'$remainingCount tekens over';

  @override
  String get remainingTextFieldCharacterCountTwo => null;

  @override
  String get remainingTextFieldCharacterCountZero => r'Geen tekens over';

  @override
  String get reorderItemDown => r'Verplaats naar beneden';

  @override
  String get reorderItemLeft => r'Verplaats naar links';

  @override
  String get reorderItemRight => r'Verplaats naar rechts';

  @override
  String get reorderItemToEnd => r'Verplaats naar het einde';

  @override
  String get reorderItemToStart => r'Verplaats naar het begin';

  @override
  String get reorderItemUp => r'Verplaats omhoog';

  @override
  String get rowsPerPageTitle => r'Rijen per pagina:';

  @override
  ScriptCategory get scriptCategory => ScriptCategory.englishLike;

  @override
  String get searchFieldLabel => r'Zoken';

  @override
  String get selectAllButtonLabel => r'Alles selecteren';

  @override
  String get selectedRowCountTitleFew => null;

  @override
  String get selectedRowCountTitleMany => null;

  @override
  String get selectedRowCountTitleOne => r'1 item geselecteerd';

  @override
  String get selectedRowCountTitleOther =>
      r'$selectedRowCount items geselecteerd';

  @override
  String get selectedRowCountTitleTwo => null;

  @override
  String get selectedRowCountTitleZero => r'Geen items geselecteerd';

  @override
  String get showAccountsLabel => r'Accounts tonen';

  @override
  String get showMenuTooltip => r'Toon menu';

  @override
  String get signedInLabel => r'Ingelogd';

  @override
  String get tabLabelRaw => r'Tab $tabIndex van $tabCount';

  @override
  TimeOfDayFormat get timeOfDayFormatRaw => TimeOfDayFormat.h_colon_mm_space_a;

  @override
  String get timePickerHourModeAnnouncement => r'Selecteer uren';

  @override
  String get timePickerMinuteModeAnnouncement => r'Selecteer minuten';

  @override
  String get viewLicensesButtonLabel => r'Bekijk licenties';

  @override
  List<String> get narrowWeekdays =>
      const <String>['Zo', 'Ma', 'Di', 'Wo', 'Do', 'Vr', 'Za'];

  @override
  int get firstDayOfWeekIndex => 0;

  static const LocalizationsDelegate<MaterialLocalizations> delegate =
      _NlMaterialLocalizationsDelegate();
}
