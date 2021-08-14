import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@lazySingleton
class HttpAgent {
  HttpAgent({
    required this.client,
  });

  final http.Client client;

  Future<String> fetchFromApi() async {
    try {
      final url = Uri.parse(
          'https://us-central1-gettheemailtest.cloudfunctions.net/start');
      final response =
          await client.get(url, headers: {"Authorization": "sim-sim"});
      if (response.statusCode == 200) {
        return response.body;
      }
      return "Сервер вернул ответ со статусом ${response.statusCode}.";
    } catch (e) {
      return "Произошла ошибка!!!\nОшибка: $e";
    }
  }
}
