class DataOfUser {
  String firstName, lastName, email, password;
  DataOfUser(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.password});
  factory DataOfUser.fromJson(data) {
    return DataOfUser(
        firstName: data['First Name'],
        lastName: data['Last Name'],
        email: data['Email'],
        password: data['Password']);
  }
}
