import 'package:meu_bolso_seguro_mobile/models/base_model.dart';

class User extends BaseModel<int> {

  int id;
  String name;
  String password;
  String email;

  User({this.id, this.name, this.password, this.email});

  @override
  String toString() {
    return 'User {id: $id, name: $name, password: $password, email:$email} ';
  }

}