import './index.dart';

ThemeData getAppTheme(Brightness brightness) {
  final colors = brightness == Brightness.light ? colorsLight : colorsDark;

  return ThemeData(
    brightness: brightness,
    fontFamily: AppFonts.roboto,
    scaffoldBackgroundColor: colors.background,
    appBarTheme: AppBarTheme(
      brightness: Brightness.light,
      color: colors.accent,
    ),
  );
}
