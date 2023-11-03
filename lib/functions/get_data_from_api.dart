import 'dart:convert';

import 'package:http/http.dart' as http;


 Future getData({
  required String url ,
})async{
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return json.decode(response.body);
  }
  else {
    print('Error');
  }
}