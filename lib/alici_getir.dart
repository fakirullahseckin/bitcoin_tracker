import 'package:flutter/material.dart';
import 'coin_veri.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

class GetPicker extends StatefulWidget {
  const GetPicker({key}) : super(key: key);

  @override
  _GetPickerState createState() => _GetPickerState();
}

class _GetPickerState extends State<GetPicker> {
  String selectedCrypto = "BTC";
  String selectedValue = "USD";
  Widget getDropdown() {
    List<DropdownMenuItem> dropDownWidget() {
      List<DropdownMenuItem<String>> dropDownListe = [];
      for (String i in currenciesList) {
        dropDownListe.add(
          DropdownMenuItem(child: Text(i), value: i),
        );
      }
      return dropDownListe;
    }

    return DropdownButton<String>(
      value: selectedValue,
      items: dropDownWidget(),
      onChanged: (value) {
        setState(() {
          selectedValue = value;
        });
        print(value);
      },
    );
  }

  Widget getCupertino() {
    List<Text> cupertinoSelected() {
      List<Text> cupertinoSelectedList = [];
      for (String i in currenciesList) {
        cupertinoSelectedList.add(
          Text(i),
        );
      }
      return cupertinoSelectedList;
    }

    return CupertinoPicker(
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        setState(() {
          selectedValue = selectedIndex.toString();
        });
      },
      children: cupertinoSelected(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? getCupertino : getDropdown();
  }
}
