class Kebabify {
  final RegExp UPPERCASE_RE = new RegExp(r"([A-Z])");

  String process(String string) {
    String result = string.replaceAllMapped(UPPERCASE_RE, (Match match) {
      return "-${match.group(0).toLowerCase()}";
    });
    return result;
  }
}
