const double spacingBase = 16.0;

double spacing(double? multiplier) {
  return spacingBase * (multiplier ?? 1);
}

final class Spacings {
  static const double normal = spacingBase;
  static double sm = spacing(0.5);
  static double md = spacing(1.5);
  static double lg = spacing(2);
  static double xl = spacing(2.5);
  static double xxl = spacing(3);
}
