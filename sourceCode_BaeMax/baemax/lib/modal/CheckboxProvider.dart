import 'package:baemax/modal/CheckboxModel.dart';
import 'package:flutter/material.dart';

class CheckboxProvider extends ChangeNotifier {
  List<CheckBoxModel> checkboxes = [
    CheckBoxModel(isChecked: false),
    CheckBoxModel(isChecked: false),
    CheckBoxModel(isChecked: false),
    CheckBoxModel(isChecked: false),
    CheckBoxModel(isChecked: false),
    CheckBoxModel(isChecked: false),
    CheckBoxModel(isChecked: false),
    CheckBoxModel(isChecked: false),
    CheckBoxModel(isChecked: false),
    CheckBoxModel(isChecked: false),
    CheckBoxModel(isChecked: false),
    CheckBoxModel(isChecked: false),
    CheckBoxModel(isChecked: false),
    CheckBoxModel(isChecked: false),
    CheckBoxModel(isChecked: false),
    CheckBoxModel(isChecked: false),
    CheckBoxModel(isChecked: false),
  ];

  int get selectedCheckboxCount =>
      checkboxes.where((element) => element.isChecked).length;

  void updateCheckboxState(int index, bool isChecked) {
    checkboxes[index].isChecked = isChecked;
    notifyListeners();
  }

  void clearAllSelections() {
    for (var checkbox in checkboxes) {
      checkbox.isChecked = false;
    }
    notifyListeners();
  }
}
