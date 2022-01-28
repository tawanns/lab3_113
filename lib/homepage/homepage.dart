import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:register/model/class.dart';
import 'package:register/model/course.dart';
import 'package:register/model/favorite.dart';
import 'package:register/model/major.dart';

class Register extends StatefulWidget {
  const Register({ Key? key }) : super(key: key);

  @override
  _registerState createState() => _registerState();
}

class register extends StatefulWidget {
  const register({ Key? key }) : super(key: key);

  @override
  _registerState createState() => _registerState();
}

class _registerState extends State<register> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _firstname = TextEditingController();
  TextEditingController _lastname = TextEditingController();
  TextEditingController _id = TextEditingController();
  
  String? groupclass;
  List<Class>? classt;

  String? groupcourse;
  List<Course>? course;

  List checkfavorite = [];
  List<favorite>?like;

  String? groupmajor;
  List<Major>? majors;
  List<Major> types = Major.getMajor();
  late List<DropdownMenuItem<Major>> _dropdownMenuItem;
  late Major _selectedTypeItem;



  @override
  void initState() {
    super.initState();
    classt = Class.getClass();
    course = Course.getCourse();
    majors = Major.getMajor();
     _dropdownMenuItem = createDropdownMenuItem(types);
     _selectedTypeItem = _dropdownMenuItem[0].value!;
    like = favorite.getfavorite();

  }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Page'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: register(),
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text(
                  'ชั้นปี',
                  style: GoogleFonts.amiko(
                    fontSize: 18,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text(
                  'สาขา',
                  style: GoogleFonts.amiko(
                    fontSize: 18,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Column(
                  children: createRadioMajor(),
                ),
              ),
              Text('Major Selected: ${groupmajor}'),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text(
                  'คณะ',
                  style: GoogleFonts.amiko(
                    fontSize: 18,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: DropdownButton(
                  value: _selectedTypeItem,
                  items: _dropdownMenuItem,
                  onChanged: (Major? value) {
                    setState(() {
                      _selectedTypeItem = value!;
                    });
                  },
                ),
              ),
              Text('Faculty Selected: ${_selectedTypeItem.name}'),
              const SizedBox(
                height: 16,
              ),
              submitbutton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget register() {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _firstname,
              validator: (value) {
                if (value!.isEmpty) {
                  return "กรุณากรอกชื่อของท่าน";
                }
                return null;
              },
              decoration: InputDecoration(
                  labelText: 'ชื่อ',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _lastname,
              validator: (value) {
                if (value!.isEmpty) {
                  return "กรุณากรอกนามสกุลของท่าน";
                }
                return null;
              },
              decoration: InputDecoration(
                  labelText: 'นามสกุล',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _id,
              validator: (value) {
                if (value!.isEmpty) {
                  return "กรุณากรอกรหัสนิสิตของท่าน";
                }
                return null;
              },
              decoration: InputDecoration(
                  labelText: 'รหัสนิสิต',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)))),
            ),
          )
        ],
      ),
    );
  }

  Widget submitbutton() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          _showMyDialog();
        }
      },
      child: Text(
        'ยืนยัน',
        style: GoogleFonts.amiko(
          fontSize: 18,
          color: Colors.white,
        ),
      ),
    );
  }

  List<Widget> createRadioMajor() {
    List<Widget> listMajor = [];

    for (var major in majors!) {
      listMajor.add(
        RadioListTile<dynamic>(
          title: Text(major.name!),
          subtitle: Text(major.checked!),
          value: major.name,
          groupValue: groupmajor,
          onChanged: (value) {
            setState(() {
              groupmajor = value;
            });
          },
        ),
      );
    }
    return listMajor;
  }

  List<Widget> createRadiomajor() {
    List<Widget> listMajor = [];
    for (var major in majors!) {
      listMajor.add(
        RadioListTile<dynamic>(
          title: Text(major.name!),
          subtitle: Text(major.checked!),
          value: major.name,
          groupValue: groupmajor,
          onChanged: (value) {
            setState(() {
              groupmajor = value;
            });
          },
        ),
      );
    }
    return listMajor;
  }

  List<DropdownMenuItem<Major>> createDropdownMenuItem(
      List<Major> types) {
    List<DropdownMenuItem<Major>> items = [];

    for (var item in types) {
      items.add(DropdownMenuItem(
        child: Text(item.name!),
        value: item,
      ));
    }

    return items;
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('ข้อมูลของท่าน'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('ชื่อ : ${_firstname.text} ${_lastname.text}'),
                Text('รหัสนิสิต : ${_id.text}'),
                Text('คณะ : คณะ${_selectedTypeItem.name} สาขา${groupcourse}'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('ยืนยัน'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}