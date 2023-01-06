import 'package:files_tracking/widgets/text_widget.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget AppbarWidget(
  String title,
) {
  return AppBar(
    elevation: 0,
    foregroundColor: Colors.white,
    backgroundColor: Colors.teal,
    title: TextRegular(text: title, fontSize: 18, color: Colors.white),
    centerTitle: true,
  );
}
