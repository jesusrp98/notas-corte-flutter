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
        ),
        CardPage(
            title: 'INFORMATION',
            body: Column(
              children: <Widget>[
                RowItem.textRow(context, "Universidad", nota.university),
                RowItem.textRow(context, "Nota de Corte", nota.mark.toString()),
                RowItem.textRow(context, "", nota.getPublic),
                RowItem.textRow(context, "Precio por año", nota.price.toString()),
                RowItem.textRow(context, "Duracion", nota.duration.toString()),
                RowItem.textRow(context, "Localización", nota.location),
              ],
            )),
      ]),
    );
  }
}
