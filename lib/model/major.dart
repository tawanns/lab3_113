class Major {
  String? name;
  String? checked;


  Major(this.name, this.checked);

  static getMajor() {
    return [
      Major('คณะวิทยาศาตร์', 'SC'),
      Major('คณะศึกษาศาสตร์', 'ED'),
      Major('คณะนิติศาสตร์', 'LAW'),
      Major('คณะพยาบาลศาสตร์', 'NU'),
      Major('คณะวิศวกรรมศาสตร์', 'EN'),
      Major('คณะวิทยาการสุขภาพและการกีฬา', 'B.Sc'),
      Major('คณะเทคโนโลยีและการพัฒนาชุมชน', 'B.Sc'),
      
    ];
  }
}

