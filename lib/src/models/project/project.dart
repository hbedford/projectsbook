import 'package:projectsbook/src/models/folder_base/folder_base.dart';

class Project {
  final String name;
  final List<FolderBase> folders;
  Project({
    required this.name,
    required this.folders,
  });
}
