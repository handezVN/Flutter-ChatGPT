import 'package:flutter/material.dart';

class Models {
  final String id;
  final int created;
  final String root;

  Models({
    required this.id,
    required this.created,
    required this.root,
  });

  factory Models.fromJson(Map<String, dynamic> json) =>
      Models(id: json["id"], root: json["root"], created: json["created"]);

  static List<Models> modelsFromSnapshot(List modelSnapShot) {
    return modelSnapShot.map((data) => Models.fromJson(data)).toList();
  }
}
