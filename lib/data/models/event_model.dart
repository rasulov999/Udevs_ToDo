class EvetFields {
  static const String id = "id";
  static const String name = "name";
  static const String description = "description";
  static const String location = "location";
  static const String color = "color";
}

class EventModel {
  final int? id;
  final String name;
  final String description;
  final String location;
 // final String color;

  EventModel({
    this.id,
    required this.name,
    required this.description,
    required this.location,
    //required this.color,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      location: json['location'],
      ///color: json['color'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      EvetFields.id: id,
      EvetFields.name: name,
      EvetFields.description: description,
      EvetFields.location: location,
    //  EvetFields.color: color
    };
  }

  EventModel copyWith({
    int? id,
    String? name,
    String? description,
    String? location,
    ///String? color,
  }) =>
      EventModel(
          id: id ?? this.id,
          name: name ?? this.name,
          description: description ?? this.description,
          location: location ?? this.description,
         // color: color ?? this.color,
          );
}
