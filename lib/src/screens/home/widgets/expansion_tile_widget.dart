import 'package:flutter/material.dart';

class PZLExpansionListWidget extends StatefulWidget {
  final String? title;
  final Widget? titleWidget;
  final TextStyle? titleStyle;
  final String? subTitle;
  final TextStyle? subTitleStyle;
  final List<Widget> children;
  final Color? collapsedBackgroundColor;
  final bool? initiallyExpanded;
  final Color? dividerColor;
  final Decoration? decorationTile;
  final Color? colorIconDrop;
  final EdgeInsets? childrenPadding;
  final BoxDecoration? headerDecoration;

  const PZLExpansionListWidget({
    super.key,
    this.title = "",
    this.titleWidget,
    this.titleStyle,
    this.subTitle = "",
    this.subTitleStyle,
    required this.children,
    this.collapsedBackgroundColor,
    this.initiallyExpanded,
    this.dividerColor = Colors.transparent,
    this.decorationTile,
    this.colorIconDrop,
    this.childrenPadding,
    this.headerDecoration,
  });

  @override
  State<PZLExpansionListWidget> createState() => _PZLExpansionListWidgetState();
}

class _PZLExpansionListWidgetState extends State<PZLExpansionListWidget> {
  bool _isOpen = false;
  double _turns = 0.0;

  @override
  void initState() {
    super.initState();

    _isOpen = widget.initiallyExpanded ?? true;
  }

  changeTurns() {
    setState(() {
      _isOpen = !_isOpen;
      _isOpen ? _turns = 0.5 : _turns = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        dividerColor: widget.dividerColor,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: ExpansionTile(
          collapsedBackgroundColor: widget.collapsedBackgroundColor,
          collapsedIconColor: widget.colorIconDrop,
          iconColor: widget.colorIconDrop,
          initiallyExpanded: widget.initiallyExpanded ?? true,
          backgroundColor: Colors.transparent,
          childrenPadding: widget.childrenPadding ?? EdgeInsets.zero,
          trailing: const SizedBox(),
          onExpansionChanged: (value) => changeTurns(),
          title: widget.titleWidget != null
              ? Container(
                  decoration: widget.headerDecoration,
                  child: Row(
                    children: [
                      Expanded(
                        child: widget.titleWidget!,
                      ),
                      AnimatedRotation(
                        duration: const Duration(milliseconds: 400),
                        turns: _turns,
                        child: const Icon(Icons.arrow_downward),
                      ),
                    ],
                  ),
                )
              : Row(
                  children: [
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: widget.title,
                              style: widget.titleStyle ??
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                            TextSpan(
                              text: widget.subTitle,
                              style: widget.subTitleStyle ??
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ),
                    AnimatedRotation(
                      duration: const Duration(milliseconds: 400),
                      turns: _turns,
                      child: const Icon(Icons.arrow_downward),
                    ),
                  ],
                ),
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Wrap(
                direction: Axis.horizontal,
                runSpacing: 33.0,
                spacing: 24.0,
                children: widget.children,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
