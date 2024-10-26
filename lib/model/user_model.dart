class User {
  final int id;
  final String firstName;
  final String lastName;
  final String username;
  final String password;

  User({
    this.id = 1,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.password,
  });

  // Convert a User object into a Map.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'username': username,
      'password': password,
    };
  }

  // Create a User object from a Map.
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      firstName: map['first_name'],
      lastName: map['last_name'],
      username: map['username'],
      password: map['password'],
    );
  }
}
