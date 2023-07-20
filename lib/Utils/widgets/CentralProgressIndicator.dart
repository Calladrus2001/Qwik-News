import 'package:flutter/material.dart';

import '../colors.dart';

Widget CentralProgressIndicator() {
  return Center(child: Column(
    children:  [
      const Expanded(child: SizedBox(height: 1)),
      CircularProgressIndicator(color: primaryAccent),
      const Expanded(child: SizedBox(height: 1)),
    ],
  ));
}