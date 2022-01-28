class Course {
  String? name;
  String? checked;


  Course(this.name, this.checked);

  static getCourse() {
    return [
      Course('สาขาวิทยาการคอมพิวเตอร์', 'CS'),
      Course('ส่าขาเทคโนโลยีสารสนเทศ', 'IT'),
    ];
  }
}