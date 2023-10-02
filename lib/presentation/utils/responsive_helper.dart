class ResponsiveHelper {
  static double resize({
    bool isiPad = false,
    required double mainValue,
    required double ratio,
  }) {
    if (isiPad) {
      return mainValue * ratio;
    } else {
      return mainValue;
    }
  }
}
