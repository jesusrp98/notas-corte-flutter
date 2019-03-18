import 'package:flutter/material.dart';
import 'package:notas_corte_flutter/widgets/head_card_page.dart';

class NotaPage extends StatelessWidget {
  final Nota nota;

  NotaPage(this.nota);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: nota.name, centerTitle: true),
      body: Column(children: <Widget>[
        HeadCardPage(
          image: CircleAvatar(
            child: Text("asd"),
          ),
          title: nota.name,
          subtitle1: nota.university,
        ),
      ]),
    );
  }
}
