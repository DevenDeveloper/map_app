
class UserModel {
  String id;
  String email;
  String mobileNo;
  String firstName;
  String lastName;
  String dob;
  String currentLocation;
  String password;

  UserModel({
    required this.id,
    required this.email,
    required this.mobileNo,
    required this.firstName,
    required this.lastName,
    required this.dob,
    required this.currentLocation,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'mobileNo': mobileNo,
      'firstName': firstName,
      'lastName': lastName,
      'dob': dob,
      'currentLocation': currentLocation,
      'password': password,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      email: map['email'] ?? '',
      mobileNo: map['mobileNo'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      dob: map['dob'] ?? '',
      currentLocation: map['currentLocation'] ?? '',
      password: map['password'] ?? '',
    );
  }
}
