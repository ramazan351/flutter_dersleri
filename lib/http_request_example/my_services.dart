import 'package:http/http.dart' as http;

class MyServices {
  Future createUser() async {
    var client = http.Client();

    try {
      var response = await client.post(Uri.parse("https://reqres.in/api/users"),
          body: {"name": "Ramazan", "jop": "Software Engineer"});
      print("StatusCode: ${response.statusCode}");
      print(response.body);
    } catch (e) {
      print(e);
    } finally {
      client.close();
    }
  }

  getUserInfo() async {
    var client = http.Client();

    try {
      var response = await client.get(
        Uri.parse("https://dummyjson.com/products"),
      );
      print(response.body);
    } catch (e) {
      print("Hata verdi:$e");
    } finally {
      client.close();
    }
  }
}
