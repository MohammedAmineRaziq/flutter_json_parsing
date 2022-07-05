import 'package:http/http.dart' as http;
import 'package:jason_parsing/List.dart';

class Services {
  static const String baseUrl = "https://jsonplaceholder.typicode.com/users";

  static Future<List<User>> getUsers() async {
    try{
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        final List<User> users = usersFromJson(response.body);
        return users;
      } else {
        throw Exception("Failed to load users");
      }
    }catch(e){
      return Future.error(e);
    }
  }
}