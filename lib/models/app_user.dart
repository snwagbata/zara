class AppUser {
  final String uid;
  final String name;
  final String email;
  final List<String> classes;

  AppUser(
      {required this.uid,
      required this.name,
      required this.email,
      required this.classes});

  factory AppUser.fromMap(Map<String, dynamic> data) {
    return AppUser(
      uid: data['uid'],
      name: data['name'],
      email: data['email'],
      classes: List.from(data['classes']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'classes': classes,
    };
  }
}
