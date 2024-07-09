extension StringExtendions on String {
  String args(List<String> args) {
    String value = this;
    for (int i = 0; i < args.length; i++) {
      value = value.replaceAll('{$i}', args[i]);
    }
    return value;
  }
}
