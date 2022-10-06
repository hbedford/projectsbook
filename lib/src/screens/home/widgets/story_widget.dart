import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projectsbook/src/models/story/story.dart';

class StoryWidget extends StatelessWidget {
  final Story story;
  final Function(Story) onTap;
  const StoryWidget({
    super.key,
    required this.story,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(story),
      child: Text(story.name),
    );
  }
}
