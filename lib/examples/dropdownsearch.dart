import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:test1/examples/datalist.dart';

class DropDownSearchUi extends StatefulWidget {
  const DropDownSearchUi({Key? key}) : super(key: key);

  @override
  State<DropDownSearchUi> createState() => _DropDownSearchUiState();
}

class _DropDownSearchUiState extends State<DropDownSearchUi> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: DropdownSearch<String>(
                popupProps: PopupProps.menu(
                  showSearchBox: true,
                  showSelectedItems: true,
                  // disabledItemFn: (String s) => s.startsWith('I'),
                ),
                items: countryList,
                dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    labelText: "Menu mode",
                    hintText: "country in menu mode",
                  ),
                ),
                // dropdownSearchDecoration: InputDecoration(
                //   labelText: "Menu mode",
                //   hintText: "country in menu mode",
                // ),
                onChanged: print,
                selectedItem: "India",
              ),
            ),

            // DropdownSearch<String>.multiSelection(
            //   items: ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
            //   popupProps: PopupPropsMultiSelection.menu(
            //     showSearchBox: true,
            //     showSelectedItems: true,
            //     disabledItemFn: (String s) => s.startsWith('I'),
            //   ),
            //   onChanged: print,
            //   selectedItems: ["Brazil"],
            // )
          ],
        ),
      ),
    );
  }
}
