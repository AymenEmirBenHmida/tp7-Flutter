import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class formation {
  int? id;
  String? nom;
  int? dure;
  String url = "http://172.16.60.207:8080/formations";
  formation(id, nom, dure) {
    this.id = id;
    this.nom = nom;
    this.dure = dure;
  }

  factory formation.fromJson(dynamic json) {
    print("id :" + json['id'].toString());

    return formation(json['id'], json['nom'], json['duree']);
  }

  delete(int id) async {
    var res = await http.delete(
      Uri.parse(url + '/' + id.toString()),
      headers: {
        'Content-Type': 'application/json',
      },
    );
  }

  update() async {
    var res = await http.put(Uri.parse(url + '/' + this.id.toString()),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String?, dynamic>{
          'nom': this.nom,
          'duree': this.dure,
        }));
  }

  add() async {
    var res = await http.post(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String?, dynamic>{
          'nom': this.nom,
          'duree': this.dure,
        }));
    print(res.body);
  }
}
