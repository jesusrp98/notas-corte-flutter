import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:notas_corte_flutter/Url.dart';
import 'query.dart';

class NotasModel extends QueryModel {
  @override
  Future loadData() async {
    response = await http.get(Url.notas);
    snapshot = json.decode(response.body);

    // For demo purposes
    print(snapshot);

    items.addAll(
      snapshot.map((nota) => Nota.fromJson(nota)).toList(),
    );

    setLoading(false);
  }
}

class Nota {
  final String grade, university, location, web;
  final bool public;
  final double mark, price;
  final int duration;


  Nota({
    this.grade, this.university, this.location, this.web, this.public, this.mark, this.price, this.duration,
  });

  factory Nota.fromJson(Map<String, dynamic> json) {
    return Nota(
      grade: json['grade'],
      university: json['university'],
      location: json['location'],
      web: json['web'],
      public: json['public'],
      mark: json['mark'],
      price: json['price'],
      duration: json['duration'],
    );
  }
}