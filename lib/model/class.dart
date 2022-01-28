class Class {
  String? enname;
  String? checked;


  Class(this.enname, this.checked);

  static getClass() {
    return [
      Class('กำลังศึกษาชั้นปีที่ 1', 'ชั้นปีที่1'),
      Class('กำลังศึกษาชั้นปีที่ 2', 'ชั้นปีที่2'),
      Class('กำลังศึกษาชั้นปีที่ 3', 'ชั้นปีที่3'),
      Class('กำลังศึกษาชั้นปีที่ 4', 'ชั้นปีที่4'),
    ];
  }
}