const double spacingBase = 16.0;

double spacing(double? multiplier) {
  return spacingBase * (multiplier ?? 1);
}
