import 'package:intl/intl.dart';

class AppDateFormats {
  const AppDateFormats._();

  ///  17:35 CEST
  static String formatHmm(DateTime dateTime) => DateFormat('H:mm').format(dateTime);

  /// Minutes and seconds: 15:30
  static String formatMMS(DateTime dateTime) => DateFormat('mm:ss').format(dateTime);

  /// 15 June
  static String formatDM(DateTime dateTime) => DateFormat('dd, MMMM').format(dateTime);

  /// 15 Jun 2002
  /// DAY MONTH_ABBR YEAR
  static String formatDMY(DateTime dateTime) => DateFormat('d MMM yyyy').format(dateTime);
}
