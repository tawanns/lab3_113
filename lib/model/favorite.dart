class favorite {
  String? thname;
  String? enname;
  int? price;

  favorite(this.thname, this.enname, this.price);

  static getfavorite() {
    return [
      favorite('หมูกระทะ','pork',189),
      favorite('ชาบู', 'Chabu',199),
      favorite('ชาไทย', 'thai tea',29),
    ];
  }
}