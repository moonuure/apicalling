class UserDoB {
  final DateTime? date;
  final int? age;

  UserDoB({
    required this.date,
    required this.age,
  });

  factory UserDoB.fromMap(Map<String, dynamic> e) {
    if (e == null || e['dob'] == null) {
      return UserDoB(date: null, age: null);
    }
    return UserDoB(
      date: DateTime.parse(e?['dob']['date']),
      age: e?['dob']['age'],
    );
  }
}
