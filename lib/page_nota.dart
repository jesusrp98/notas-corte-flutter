import 'package:flutter/material.dart';

import 'notasModel.dart';
import 'widgets/head_card_page.dart';

class NotaPage extends StatelessWidget {
  final Nota nota;

  NotaPage(this.nota);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(nota.grade), centerTitle: true),
      body: Column(children: <Widget>[
        HeadCardPage(
          image: CircleAvatar(
            child: Text("asd"),
          ),
          title: nota.grade,
          subtitle1: Text(nota.location),
          subtitle2: Text(nota.location),
          details: "Holo",
        ),
      ]),
    );
  }
}
