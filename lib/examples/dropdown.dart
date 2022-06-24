import 'package:flutter/material.dart';

class DropDownUi extends StatefulWidget {
  const DropDownUi({Key? key}) : super(key: key);

  @override
  State<DropDownUi> createState() => _DropDownUiState();
}
class _DropDownUiState extends State<DropDownUi> {
  String dropdownValue = 'One';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(

        ),
        body: Column(
          children: [
            Center(
              child: DropdownButton<String>(
                value: dropdownValue,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: const TextStyle(color: Colors.deepOrange),
                underline: Container(
                  height: 2,
                  color: Colors.deepOrange,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                items: <String>['One', 'Two', 'Three', 'Four']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
