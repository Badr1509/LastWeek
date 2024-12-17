import 'dart:convert';
import 'package:http/http.dart' as http;

class Gpt {
  Future<String> getData(String prompt) async {
    String link = "the link here ";
    var uri = Uri.parse(link);

    var header = {
      "Content-Type": "application/json",
      "Authorization":
          "key"
    };

    var body = {
      "model": "gpt-3.5-turbo",
      "messages": [
        {"role": "system", "content": "You are a helpful assistant."},
        {"role": "user", "content": prompt}
      ]
    };

    var request = await http.post(
      uri,
      headers: header,
      body: json.encode(body),
    );
    var response = json.decode(request.body);

    String content = response["choices"][0]["message"]["content"];
    print(content);

    return content;
  }
}