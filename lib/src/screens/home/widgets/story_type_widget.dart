import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projectsbook/src/models/folder/folder.dart';
import 'package:projectsbook/src/models/folder_base/folder_base.dart';
import 'package:projectsbook/src/models/story/story.dart';
import 'package:projectsbook/src/screens/home/widgets/folder_widget.dart';
import 'package:projectsbook/src/screens/home/widgets/story_widget.dart';

class StoryTypeWidget extends StatelessWidget {
  final FolderBase folderBase;
  final Function(FolderBase) onTap;
  const StoryTypeWidget({
    super.key,
    required this.folderBase,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    if (folderBase is Folder) {
      return FolderWidget(folder: folderBase as Folder, onTap: onTap);
    }
    return StoryWidget(story: folderBase as Story, onTap: onTap);
  }
}
