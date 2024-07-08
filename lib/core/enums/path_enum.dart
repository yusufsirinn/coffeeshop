enum Path {
  coffee('coffee');

  const Path(this.path);

  final String path;

  String value() {
    return '/$path';
  }
}
