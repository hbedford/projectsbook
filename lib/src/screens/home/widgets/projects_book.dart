import 'package:flutter/material.dart';
import 'package:projectsbook/src/models/project/project.dart';
import 'package:projectsbook/src/screens/home/widgets/story_type_widget.dart';
import 'package:projectsbook/src/views/book/book_viewmodel.dart';
import 'package:provider/provider.dart';

class ProjectsBook extends StatelessWidget {
  final List<Project> projects;
  const ProjectsBook({
    super.key,
    required this.projects,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
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
                ChangeNotifierProvider<BookViewModel>(
                  create: (_) => BookViewModel(projects),
                  child: Consumer<BookViewModel>(
                    builder: (_, provider, __) => Row(
                      children: [
                        SizedBox(
                          width: constraints.maxWidth * 0.15,
                          child: SingleChildScrollView(
                            child: Column(
                              children: provider.projects
                                  .map<Widget>(
                                    (project) => ExpansionTile(
                                      tilePadding: const EdgeInsets.all(0),
                                      title: SizedBox(
                                        width: double.infinity,
                                        height: 50,
                                        child:
                                            Center(child: Text(project.name)),
                                      ),
                                      children: project.folders
                                          .map<Widget>(
                                            (item) => StoryTypeWidget(
                                                onTap: provider.changeSelected,
                                                folderBase: item),
                                          )
                                          .toList(),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ),
                        Expanded(child: provider.currentItem)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
