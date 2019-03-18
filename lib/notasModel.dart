import 'dart:convert';

import 'package:http/http.dart' as http;

import 'query.dart';

class NotasModel extends QueryModel {
  Map<String, int> cityJson;
  bool hasData = false;
  String city;

  @override
  Future loadData() async {
    response = await http.get(
      'https://jsonblob.com/api/3580858c-4974-11e9-9547-4f3ea8b3b7f4',
    );
    cityJson = json.decode(response.body);

    setLoading(false);
    hasData = true;
  }

  void fetchQuery(String grade) async {
    setLoading(true);

    response = await http.get('localhost');
    snapshot = json.decode(response.body);

    items.addAll(snapshot.map((nota) => Nota.fromJson(nota)).toList());

    setLoading(false);
  }
}

class Nota {
  final String grade, university, location, web;
  final bool public;
  final double mark, price;
  final int duration;

  Nota({
    this.grade,
    this.university,
    this.location,
    this.web,
    this.public,
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
      public: json['public'],
      mark: json['mark'],
      price: json['price'],
      duration: json['duration'],
    );
  }

  String get getPublic  {
    if (public){
      return "Presencial";
    }else{
      return "No presencial";
    }
  }
}
