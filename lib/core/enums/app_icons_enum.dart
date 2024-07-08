enum AppIcons {
  googleLogo('google_logo'),
  bag('bag'),
  filter('filter'),
  heart('heart'),
  home('home'),
  notification('notification'),
  plus('plus'),
  searchNormal('search_normal'),
  star('star'),
  milk('milk'),
  bean('bean'),
  arrowLeft('arrow_left'),
  lightHeart('light_heart'),
  add('add'),
  arrowRight('arrow_right'),
  discount('discount'),
  dots('dots'),
  edit('edit'),
  minus('minus'),
  moneys('moneys'),
  note('note'),
  bike('bike'),
  gps('gps'),
  pin('pin'),
  telephone('telephone'),
  arrowDown('arrow_down');

  const AppIcons(this._name);

  final String _name;

  final String _path = 'assets/icons/';

  String get svg => '$_path$_name.svg';
}
