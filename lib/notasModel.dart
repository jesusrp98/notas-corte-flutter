import 'dart:convert';

import 'package:http/http.dart' as http;

import 'query.dart';

class NotasModel extends QueryModel {
  Map<String, dynamic> cityJson;

  @override
  Future loadData() async {
    setLoading(true);

    response = await http.get('https://jsonblob.com/api/32ad6e11-49ac-11e9-9547-0d0471440222');

    snapshot = json.decode(response.body)['output'];

    items.addAll(snapshot.map((nota) => Nota.fromJson(nota)).toList());

    response = await http.get(
      'https://jsonblob.com/api/3580858c-4974-11e9-9547-4f3ea8b3b7f4',
    );
    cityJson = json.decode(response.body);

    setLoading(false);
  }
}

class Nota {
  final String grade, university, location, web;
  final String mark, price;
  final String duration;

  Nota({
    this.grade,
    this.university,
    this.location,
    this.web,
    this.mark,
    this.price,
    this.duration,
  });

  factory Nota.fromJson(Map<String, dynamic> json) {
    return Nota(
      grade: json['grade'],
      university: json['university'],
      location: json['location'],
      web: json['web'],
      mark: json['mark'],
      price: json['price'],
      duration: json['duration'],
    );
  }
}
