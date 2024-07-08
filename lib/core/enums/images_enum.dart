enum Images {
  coffeeSoGood('coffee_so_good'),
  promoCoffee('promo_coffee'),
  coffee('coffee'),
  personal('personal'),
  bike('bike'),
  milk('milk'),
  bean('bean'),
  profilePhoto('profile_photo');

  const Images(this._name);

  final String _name;

  final String _path = 'assets/images/';

  String get png => '$_path$_name.png';
}
