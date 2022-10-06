import 'package:flutter/material.dart';
import 'package:projectsbook/src/models/project/project.dart';
import 'package:projectsbook/src/screens/home/widgets/projects_book.dart';

class BookView extends StatelessWidget {
  final List<Project> projects;
  const BookView({
    super.key,
    required this.projects,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (_, constraints) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'StoryBook',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    width: constraints.maxWidth * 0.15,
                    child: ProjectsBook(projects: projects),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
