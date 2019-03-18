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
      theme: ThemeData(
        primaryColor: Colors.purple,
        accentColor: Colors.purpleAccent,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NotasModel model = NotasModel();

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
            body: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    TextField(
                      autofocus: false,
                      onSubmitted: (string) =>
                          string.isNotEmpty ? model.fetchQuery(string) : null,
                      decoration: InputDecoration(
                        hintText: 'Search recipes or cocktails',
                        labelStyle: TextStyle(
                          color: Theme.of(context).textTheme.subhead.color,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 16,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).textTheme.caption.color,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).accentColor,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    model.hasData
                        ? DropdownButton<String>(
                            items: model.cityJson.keys
                                .map((value) => DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    ))
                                .toList(),
                            onChanged: (value) => model.city = value,
                          )
                        : Separator.none(),
                  ],
                ),
                model.isLoading
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
                                  MaterialPageRoute(
                                      builder: (_) => NotaPage(nota)),
                                ),
                          );
                        },
                        separatorBuilder: (context, index) =>
                            Separator.divider(),
                      ),
              ],
            ),
          ),
    );
  }
}
