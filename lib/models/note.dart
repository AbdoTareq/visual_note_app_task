import 'dart:convert';
import 'dart:typed_data';

class Note {
  final int? id;
  final String title;
  final String description;
  final String dateInMiliSeconds;
  final String image;
  final int isOpen;
  Note({
    this.id,
    required this.title,
    required this.description,
    required this.dateInMiliSeconds,
    required this.image,
    required this.isOpen,
  });

  Note copyWith({
    int? id,
    String? title,
    String? description,
    String? dateInMiliSeconds,
    String? image,
    int? isOpen,
  }) {
    return Note(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      dateInMiliSeconds: dateInMiliSeconds ?? this.dateInMiliSeconds,
      image: image ?? this.image,
      isOpen: isOpen ?? this.isOpen,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'dateInMiliSeconds': dateInMiliSeconds,
      'image': image,
      'isOpen': isOpen,
    };
  }

  factory Note.fromMap(Map<dynamic, dynamic> map) {
    return Note(
      id: map['id']?.toInt(),
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      dateInMiliSeconds: map['dateInMiliSeconds'] ?? '',
      image: map['image'] ?? '',
      isOpen: map['isOpen']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Note.fromJson(String source) => Note.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Note(id: $id, title: $title, description: $description, dateInMiliSeconds: $dateInMiliSeconds, image: $image, isOpen: $isOpen)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Note &&
        other.id == id &&
        other.title == title &&
        other.description == description &&
        other.dateInMiliSeconds == dateInMiliSeconds &&
        other.image == image &&
        other.isOpen == isOpen;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        dateInMiliSeconds.hashCode ^
        image.hashCode ^
        isOpen.hashCode;
  }
}
