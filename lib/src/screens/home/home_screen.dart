import 'package:flutter/material.dart';
import 'package:projectsbook/src/models/folder/folder.dart';
import 'package:projectsbook/src/models/project/project.dart';
import 'package:projectsbook/src/models/story/story.dart';
import 'package:projectsbook/src/screens/home/widgets/projects_book.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ProjectsBook(
      projects: [
        Project(name: 'LiberChannel', folders: [
          Folder(name: 'Components', list: [
            Folder(name: 'Buttons', list: [
              Story(
                name: 'Basic Button',
                widget: Text('Testando'),
              ),
            ]),
          ])
        ])
      ],
    );
  }
}
