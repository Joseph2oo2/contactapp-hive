import 'package:flutter/material.dart';

class BuildListTileWidget extends StatefulWidget {
  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final Widget? trailing;
  const BuildListTileWidget({super.key, this.leading, this.title, this.subtitle, this.trailing,});

  @override
  State<BuildListTileWidget> createState() => _BuildListTileWidgetState();
}

class _BuildListTileWidgetState extends State<BuildListTileWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: widget.leading,
      title: widget.title,
      subtitle: widget.subtitle,
      trailing: widget.trailing,

    );
  }
}
