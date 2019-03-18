import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'notasModel.dart';
import 'page_nota.dart';
import 'widgets/list_cell.dart';
import 'widgets/loading_indicator.dart';
import 'widgets/separator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notas de corte',
      theme: ThemeData(primaryColor: Colors.purple),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NotasModel model =NotasModel();

  @override
  initState() {
    super.initState();
    model.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: model,
      child: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<NotasModel>(
      builder: (context, child, model) => Scaffold(
            appBar: AppBar(
              title: Text('Notas de corte'),
            ),
            body: model.isLoading
                ? LoadingIndicator()
                : ListView.separated(
                    itemCount: model.getItemCount,
                    itemBuilder: (context, index) {
                      final Nota nota = model.getItem(index);
                      return ListCell(
                        title: nota.grade,
                        subtitle: nota.university,
                        trailing: CircleAvatar(
                          child: Text(nota.mark.toString()),
                        ),
                        onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => NotaPage(nota)),
                            ),
                      );
                    },
                    separatorBuilder: (context, index) => Separator.divider(),
                  ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => model.loadData(),
              tooltip: 'Fetch data',
              child: Icon(Icons.search),
            ),
          ),
    );
  }
}
