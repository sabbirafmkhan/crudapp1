import 'package:crudapp1/RestApi/RestClient.dart';
import 'package:flutter/material.dart';
import 'package:crudapp1/style/style.dart';

class ProductCreateScreen extends StatefulWidget {
  const ProductCreateScreen({super.key});

  @override
  State<ProductCreateScreen> createState() => _ProductCreateScreenState();
}

class _ProductCreateScreenState extends State<ProductCreateScreen> {
  Map<String, String> formValues = {
    "Img": "",
    "ProductCode": "",
    "ProductName": "",
    "Qty": "",
    "TotalPrice": "",
    "UnitPrice": "",
  };
  bool loading = false;

  inputOnChange(mapKey, textValue) {
    setState(() {
      formValues.update(mapKey, (value) => textValue);
    });
  }

  formOnSubmit() async {
    if (formValues["Img"]!.isEmpty) {
      errorToast("Please enter product image");
    } else if (formValues["ProductCode"]!.isEmpty) {
      errorToast("Please enter product code");
    } else if (formValues["ProductName"]!.isEmpty) {
      errorToast("Please enter product name");
    } else if (formValues["Qty"]!.isEmpty) {
      errorToast("Please select quantity");
    } else if (formValues["TotalPrice"]!.isEmpty) {
      errorToast("Please enter total price");
    } else if (formValues["UnitPrice"]!.isEmpty) {
      errorToast("Please enter unit price");
    } else {
      setState(() {
        loading = true;
      });
      await productCreateRequest(formValues);
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create Product"), centerTitle: true),
      body: Stack(
        children: [
          screenBackground(context),
          Container(
            child:
                loading
                    ? Center(child: CircularProgressIndicator())
                    : SingleChildScrollView(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          TextFormField(
                            onChanged: (textValue) {
                              inputOnChange("ProductName", textValue);
                            },
                            decoration: appInputDecoration("Product Name"),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            onChanged: (textValue) {
                              inputOnChange("ProductCode", textValue);
                            },
                            decoration: appInputDecoration("Product Code"),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            onChanged: (textValue) {
                              inputOnChange("Img", textValue);
                            },
                            decoration: appInputDecoration("Product Image"),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            onChanged: (textValue) {
                              inputOnChange("UnitPrice", textValue);
                            },
                            decoration: appInputDecoration("Unit Price"),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            onChanged: (textValue) {
                              inputOnChange("TotalPrice", textValue);
                            },
                            decoration: appInputDecoration("Total Price"),
                          ),
                          SizedBox(height: 20),
                          appDropDownStyle(
                            DropdownButton(
                              value: formValues["Qty"],
                              items: [
                                DropdownMenuItem(
                                  value: "",
                                  child: Text("Select QT"),
                                ),
                                DropdownMenuItem(
                                  value: "1 pcs",
                                  child: Text("1 pcs"),
                                ),
                                DropdownMenuItem(
                                  value: "2 pcs",
                                  child: Text("2 pcs"),
                                ),
                                DropdownMenuItem(
                                  value: "3 pcs",
                                  child: Text("3 pcs"),
                                ),
                                DropdownMenuItem(
                                  value: "4 pcs",
                                  child: Text("4 pcs"),
                                ),
                              ],
                              onChanged: (textValue) {
                                if (textValue is String) {
                                  inputOnChange("Qty", textValue);
                                }
                              },
                              isExpanded: true,
                              underline: Container(),
                            ),
                          ),
                          ElevatedButton(
                            style: appButtonStyle(),
                            onPressed: () {
                              formOnSubmit();
                            },
                            child: successButtonChild("Create"),
                          ),
                        ],
                      ),
                    ),
          ),
        ],
      ),
    );
  }
}
