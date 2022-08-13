import 'dart:convert';

class Job_Model {
  String type;
  String title;
  String description;
  String org;
  String city;
  String category;
  DateTime expDate;
  DateTime createdAt;
  Job_Model({
    required this.type,
    required this.title,
    required this.description,
    required this.org,
    required this.city,
    required this.category,
    required this.expDate,
    required this.createdAt,
  });

  Job_Model copyWith({
    String? type,
    String? title,
    String? description,
    String? org,
    String? city,
    String? category,
    DateTime? expDate,
    DateTime? createdAt,
  }) {
    return Job_Model(
      type: type ?? this.type,
      title: title ?? this.title,
      description: description ?? this.description,
      org: org ?? this.org,
      city: city ?? this.city,
      category: category ?? this.category,
      expDate: expDate ?? this.expDate,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'type': type});
    result.addAll({'title': title});
    result.addAll({'description': description});
    result.addAll({'org': org});
    result.addAll({'city': city});
    result.addAll({'category': category});
    result.addAll({'expDate': expDate.millisecondsSinceEpoch});
    result.addAll({'createdAt': createdAt.millisecondsSinceEpoch});

    return result;
  }

  factory Job_Model.fromMap(Map<String, dynamic> map) {
    return Job_Model(
      type: map['type'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      org: map['org'] ?? '',
      city: map['city'] ?? '',
      category: map['category'] ?? '',
      expDate: DateTime.fromMillisecondsSinceEpoch(map['expDate']),
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Job_Model.fromJson(String source) =>
      Job_Model.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Job_Model(type: $type, title: $title, description: $description, org: $org, city: $city, category: $category, expDate: $expDate, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Job_Model &&
        other.type == type &&
        other.title == title &&
        other.description == description &&
        other.org == org &&
        other.city == city &&
        other.category == category &&
        other.expDate == expDate &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return type.hashCode ^
        title.hashCode ^
        description.hashCode ^
        org.hashCode ^
        city.hashCode ^
        category.hashCode ^
        expDate.hashCode ^
        createdAt.hashCode;
  }
}
