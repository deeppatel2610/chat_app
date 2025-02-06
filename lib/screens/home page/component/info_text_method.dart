import 'package:flutter/material.dart';

import '../../../model/chat_model.dart';

Text infoTextMethod({
  required int index,
  required String title,
  required String info,
}) {
  return Text(
    "$title : $info",
    style: const TextStyle(
      color: Colors.white70,
      fontSize: 15,
      fontWeight: FontWeight.w500,
      letterSpacing: .2,
    ),
  );
}
