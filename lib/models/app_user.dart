class AppUser {
  final String uid;
  final String name;
  final String email;
  final List<String> courses;

  AppUser(
      {required this.uid,
      required this.name,
      required this.email,
      required this.courses});

  factory AppUser.fromMap(Map<String, dynamic> data) {
    return AppUser(
      uid: data['uid'],
      name: data['name'],
      email: data['email'],
      courses: List.from(data['courses'] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'courses': courses,
    };
  }
}
