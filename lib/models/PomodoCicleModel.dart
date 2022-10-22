// To parse this JSON data, do
//
//     final pomodoroCicleModel = pomodoroCicleModelFromJson(jsonString);

import 'dart:convert';

PomodoroCicleModel pomodoroCicleModelFromJson(String str) =>
    PomodoroCicleModel.fromJson(json.decode(str));

String pomodoroCicleModelToJson(PomodoroCicleModel data) =>
    json.encode(data.toJson());

class PomodoroCicleModel {
  PomodoroCicleModel({
    this.id,
    this.focusImage,
    this.relaxImage,
    this.cicleCompleted,
  });

  int? id;
  String? focusImage;
  String? relaxImage;
  bool? cicleCompleted;

  factory PomodoroCicleModel.fromJson(Map<String, dynamic> json) =>
      PomodoroCicleModel(
        id: json["id"],
        focusImage: json["focusImage"],
        relaxImage: json["relaxImage"],
        cicleCompleted: json["cicleCompleted"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "focusImage": focusImage,
        "relaxImage": relaxImage,
        "cicleCompleted": cicleCompleted,
      };
}
