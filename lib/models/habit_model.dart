// import 'dart:convert';

// class HabitModel {
//   final String title;
//   final String unit;

//   HabitModel({required this.title, required this.unit});

//   // Mengubah Objek ke Map
//   Map<String, dynamic> toMap() {
//     return {
//       'title': title,
//       'unit': unit,
//     };
//   }

//   // Membuat Objek dari Map
//   factory HabitModel.fromMap(Map<String, dynamic> map) {
//     return HabitModel(
//       title: map['title'] ?? '',
//       unit: map['unit'] ?? '',
//     );
//   }

//   // Mengubah Objek ke String JSON
//   String toJson() => json.encode(toMap());

//   // Membuat Objek dari String JSON
//   factory HabitModel.fromJson(String source) =>
//       HabitModel.fromMap(json.decode(source));
// }
