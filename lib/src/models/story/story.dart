import 'package:flutter/material.dart';
import 'package:projectsbook/src/models/folder_base/folder_base.dart';

class Story extends FolderBase {
  final Widget widget;
  Story({
    required super.name,
    required this.widget,
  });
}
