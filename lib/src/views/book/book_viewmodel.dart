import 'package:flutter/cupertino.dart';
import 'package:projectsbook/src/models/folder_base/folder_base.dart';
import 'package:projectsbook/src/models/project/project.dart';

class BookViewModel with ChangeNotifier {
  bool _disposed = false;

  FolderBase? _currentItem;
  FolderBase? get currentItem => _currentItem;

  List<Project> _projects = [];
  List<Project> get projects => _projects;

  BookViewModel(List<Project> projects) {
    changeProjects(projects);
  }
  changeProjects(List<Project> value) {
    _projects = value;
    notifyListeners();
  }

  changeSelected(FolderBase value) {
    _currentItem = value;
    notifyListeners();
  }
}
