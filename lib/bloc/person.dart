import 'dart:convert';

import 'package:flutter/foundation.dart' show immutable;

@immutable
class Person {
  final String name;
  final int age;
  const Person({
    required this.name,
    required this.age,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'age': age,
    };
  }

  factory Person.fromMap(Map<String, dynamic> map) {
    return Person(
      name: map['name'] as String,
      age: map['age'] as int,
    );
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'name - $name, age - $age';
  }

  String toJson() => json.encode(toMap());

  factory Person.fromJson(String source) =>
      Person.fromMap(json.decode(source) as Map<String, dynamic>);
}
