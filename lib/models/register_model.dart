class Register {
  String firstName;
  String surName;
  String email;
  String password;
  String confirmPassword;
  String phone;

  Register(
      {this.firstName,
      this.surName,
      this.email,
      this.password,
      this.phone = '08045673211'});

  Map<String, String> toJson() {
    final Map<String, String> data = new Map<String, String>();
    data['firstName'] = this.firstName;
    data['surName'] = this.surName;
    data['email'] = this.email;
    data['password'] = this.password;
    data['confirmPassword'] = this.password;
    data['phoneNumber'] = this.phone;
    return data;
  }
}
