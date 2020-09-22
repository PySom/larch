class Register {
  String firstName;
  String lastName;
  String email;
  String password;
  String confirmPassword;
  String phone = '08045673211';

  Register(
      {this.firstName, this.lastName, this.email, this.password, this.phone});

  Map<String, String> toJson() {
    final Map<String, String> data = new Map<String, String>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['password'] = this.password;
    data['confirmPassword'] = this.password;
    data['phoneNumber'] = this.phone;
    return data;
  }
}
