import 'package:flutter/material.dart';
import 'package:notas_corte_flutter/widgets/card_page.dart';
import 'package:notas_corte_flutter/widgets/row_item.dart';

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
            child: Text(nota.location[0]),
          ),
          title: nota.grade,
          subtitle1: Text(nota.university),
          subtitle2: Text(nota.mark.toString()),
          subtitle3: Text(nota.getPublic),
          subtitle4: Text(nota.price.toString()),
          subtitle5: Text(nota.duration.toString()),
          subtitle6: Text(nota.location),
        ),
        CardPage(
            title: 'INFORMATION',
            body: Column(
              children: <Widget>[
                RowItem.textRow(context, title, description),
              ],
            )),
      ]),
    );
  }
}
