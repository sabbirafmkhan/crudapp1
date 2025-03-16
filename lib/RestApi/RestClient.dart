import 'dart:convert';
import 'package:crudapp1/style/style.dart';
import 'package:http/http.dart' as http;

Future<bool> productCreateRequest(formValues) async {
  var URL = Uri.parse("https://crud.teamrabbil.com/api/v1/CreateProduct");
  var postBody = jsonEncode(formValues);
  var postHeader = {"Content-Type": "application/json"};
  var response = await http.post(URL, headers: postHeader, body: postBody);
  var resultCode = response.statusCode;
  var resultBody = jsonDecode(response.body);

  if (resultCode == 200 && resultBody['status'] == "success") {
    successToast("Product created successfully");
    return true;
  } else {
    errorToast("Something went wrong");
    return false;
  }
}
