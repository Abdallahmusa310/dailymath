import 'package:flutter/material.dart';

class CoustmDropdown extends StatefulWidget {
  const CoustmDropdown(
      {super.key, this.grades, this.selctedvalue, this.onsave});
  final List<String>? grades;
  final String? selctedvalue;
  final void Function(String?)? onsave;

  @override
  State<CoustmDropdown> createState() => _CoustmDropdownState();
}

class _CoustmDropdownState extends State<CoustmDropdown> {
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.selctedvalue;
  }

  @override
  Widget build(BuildContext context) {
    List<String> grades = widget.grades ??
        [
          'grade 1',
          'grade 2',
          'grade 3',
          'grade 4',
          'grade 5',
          'grade 6',
        ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26),
      child: DropdownButtonFormField<String>(
        onSaved: widget.onsave,
        value: _selectedValue,
        decoration: const InputDecoration(
            labelText: 'grade',
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(255, 20, 75, 121)),
                borderRadius: BorderRadius.all(Radius.circular(12))),
            border: OutlineInputBorder(
              borderSide: BorderSide(),
            )),
        validator: (value) {
          if (value == null) {
            return 'this feild is requrid';
          }
          return null;
        },
        onChanged: (String? newValue) {
          setState(() {
            _selectedValue = newValue;
          });
        },
        items: grades.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
