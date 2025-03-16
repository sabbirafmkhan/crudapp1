import 'dart:convert';
import 'package:crudapp1/style/style.dart';
import 'package:http/http.dart' as http;

// productCreateRequest
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

//productGridViewListRequest:

Future<List> productGridViewListRequest() async {
  var URL = Uri.parse("https://crud.teamrabbil.com/api/v1/ReadProduct");
  var postHeader = {"Content-Type": "application/json"};
  var response = await http.get(URL, headers: postHeader);

  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);

  if (resultCode == 200 && resultBody['status'] == "success") {
    successToast("Request Success");
    return resultBody['data'];
  } else {
    errorToast("Request fail ! try again");
    return [];
  }
}

//// productDeleteRequest:
Future<bool> productDeleteRequest(id) async {
  var URL = Uri.parse("https://crud.teamrabbil.com/api/v1/DeleteProduct/$id");
  var postHeader = {"Content-Type": "application/json"};
  var response = await http.get(URL, headers: postHeader);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);

  if (resultCode == 200 && resultBody['status'] == "success") {
    successToast("Request Success");
    return true;
  } else {
    errorToast("Request fail ! try again");
    return false;
  }
}
