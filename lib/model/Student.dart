class Student {
  String name;
  int age;
  String mobileNumber;
  String email;

  Student(
      {required this.name,
      required this.age,
      required this.mobileNumber,
      required this.email});

  // Convert Student Object into Map

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'age': age,
      'mobileNumber': mobileNumber,
      'email': email,
    };
  }

  // Create a Student object from Map

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
        name: map['name'] ?? "",
        age: map['age'] ?? 0,
        mobileNumber: map['mobileNumber'] ?? "",
        email: map['email'] ?? "");
  }
}
