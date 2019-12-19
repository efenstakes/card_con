

class User {

  int id;
  String name;
  String email;
  String avatar = 'https://media.geeksforgeeks.org/wp-content/uploads/20190719161521/core.jpg';
  String phone;
  Map<String, String> address;
  

  User({ this.id, this.name, this.email, this.phone });

  static User fromJson(Map<String, dynamic> userJson) {
    return User(
      id: userJson['id'],
      name: userJson['name'],
      email: userJson['email'],
      // address: userJson['address'],
      phone: userJson['phone'],
    );
  }// User fromJson(Map<String, dynamic> userJson) { .. }



}