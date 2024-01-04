class Account {
  // FIELDS
  final int id;
  String lastName;
  String firstName;
  int age;
  String? biography;

  // CONSTRUCTOR
  Account({
    required this.id,
    required this.lastName,
    required this.firstName,
    required this.age,
    required this.biography
  });

  // PUBLIC METHODS
  Map<String, dynamic> toArray() {
    return {
      'id_account': this.id,
      'last_name': this.lastName,
      'first_name': this.firstName,
      'years_old': this.age,
      'biography': this.biography
    };
  }

  // STATIC METHODS
  static Account fromJson(Map<String, dynamic> json) {
    return Account(
      id: json['id_account'] as int,
      lastName: json['last_name'] as String,
      firstName: json['first_name'] as String,
      age: json['years_old'] as int,
      biography: json['biography'] as String,
    );
  }
}
