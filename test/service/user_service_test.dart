import 'package:flutter_test/flutter_test.dart';
import 'package:meu_bolso_seguro_mobile/models/user.dart';
import 'package:meu_bolso_seguro_mobile/services/base_service.dart';

void main() {

  testWidgets('should validate name is not null', (WidgetTester tester) async {
    var userService = UserService();
    User user = User(id: 0, name: "Luiz", password: "1234", email: "danilo91519188@gmail.com");
    var isValid = userService.validate(user);
    expect(true , isValid);
  });

  testWidgets('should validate password is not null', (WidgetTester tester) async {
    var userService = UserService();
    User user = User(id: 0, name: "Luiz", password: "1234", email: "danilo91519188@gmail.com");
    var isValid = userService.validate(user);
    expect(true , isValid);
  });

  testWidgets('should validate password is empty', (WidgetTester tester) async {
    var userService = UserService();
    User user = User(id: 0, name: "Luiz", password: "", email: "danilo91519188@gmail.com");
    var isValid = userService.validate(user);
    expect(false , isValid);
  });

  testWidgets('should validate password is null', (WidgetTester tester) async {
    var userService = UserService();
    User user = User(id: 0, name: "Luiz", password: null, email: "danilo91519188@gmail.com");
    var isValid = userService.validate(user);
    expect(false , isValid);
  });

  testWidgets('should validate email is null', (WidgetTester tester) async {
    var userService = UserService();
    User user = User(id: 0, name: "Luiz", password: null, email: null);
    var isValid = userService.validate(user);
    expect(false , isValid);
  });
}

class UserService extends BaseSevice<User> {

  @override
  validate(User user) {
    if (user.name == null || user.name.isEmpty)
      return false;
    if (user.password == null || user.password.isEmpty)
      return false;
    if (user.email == null || user.email.isEmpty)
      return false;
    return true;
  }


}

