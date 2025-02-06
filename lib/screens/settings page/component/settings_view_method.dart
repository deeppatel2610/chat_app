import 'package:flutter/material.dart';

import '../../../controller/declare_controller.dart';
import '../../../utiitsl/my_color.dart';

Expanded settingsViewMethod() {
  return Expanded(
    child: ListView.builder(
      itemCount: settingsController.settingsTitleLiat.length,
      itemBuilder: (context, index) => Card(
        color: primaryColor,
        child: ListTile(
          leading: Icon(
            settingsController.settingsIconLiat[index],
            color: Colors.white70,
            size: 25,
          ),
          title: Text(
            settingsController.settingsTitleLiat[index],
            style: const TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.w500,
              letterSpacing: .5,
              fontSize: 18,
            ),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios_outlined,
            color: Colors.white70,
          ),
        ),
      ),
    ),
  );
}
