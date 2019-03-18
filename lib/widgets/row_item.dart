import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

/// ROW ITEM WIDGET
/// Stretched widget to display information in a 'Card Page' widget.
/// Contains a title and a description widget, which can be an icon or a text.
class RowItem extends StatelessWidget {
  final String title;
  final Widget description;

  RowItem(this.title, this.description);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Text(
            title,
            style: Theme.of(context).textTheme.subhead,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        Expanded(
          flex: 6,
          child: Align(
            alignment: Alignment.centerRight,
            child: description,
          ),
        ),
      ],
    );
  }

  /// Builds a normal Text-to-Text row item
  factory RowItem.textRow(
    BuildContext context,
    String title,
    String description,
  ) {
    return RowItem(title, _getText(context, description));
  }

  /// Returns a text description
  static Widget _getText(BuildContext context, String description,
      [bool clickable = false]) {
    return Text(
      description,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      textAlign: TextAlign.end,
      style: Theme.of(context).textTheme.subhead.copyWith(
            color: Theme.of(context).textTheme.caption.color,
            decoration:
                clickable ? TextDecoration.underline : TextDecoration.none,
          ),
    );
  }
}
