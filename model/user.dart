class User {
  String id;
  String name;
  dynamic age;

  User({this.id = '', required this.name, required this.age});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
    };
  }

  factory User.fromJson(Map<String, dynamic> m) {
    return User(id: m['id'], name: m['name'], age: m['age']);
  }
}
