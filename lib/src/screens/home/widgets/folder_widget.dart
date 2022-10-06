import 'package:flutter/material.dart';
import 'package:projectsbook/src/models/folder/folder.dart';
import 'package:projectsbook/src/models/folder_base/folder_base.dart';
import 'package:projectsbook/src/screens/home/widgets/story_type_widget.dart';

class FolderWidget extends StatelessWidget {
  final Folder folder;
  final Function(FolderBase) onTap;

  const FolderWidget({
    super.key,
    required this.folder,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      onExpansionChanged: (value) => value ? onTap(folder) : null,
      tilePadding: const EdgeInsets.all(0),
      title: Row(
        children: [
          SizedBox(
            child: Text(folder.name),
          ),
        ],
      ),
      children: folder.list
          .map<Widget>((item) => StoryTypeWidget(
                folderBase: item,
                onTap: onTap,
              ))
          .toList(),
    );
  }
}
