import 'dart:convert';
import 'package:http/http.dart' as http;

productCreateRequest(formValues) async {
  var URL = Uri.parse("https://crud.teamrabbil.com/api/v1/CreateProduct");
  var postBody = jsonEncode(formValues);
  var postHeader = {"Content-Type": "application/json"};
  var response = await http.post(URL, headers: postHeader, body: postBody);
}
