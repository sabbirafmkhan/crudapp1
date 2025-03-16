import 'package:crudapp1/RestApi/RestClient.dart';
import 'package:crudapp1/screens/ProductGridViewScreen.dart';
import 'package:flutter/material.dart';
import 'package:crudapp1/style/style.dart';

class ProductUpdateScreen extends StatefulWidget {
  final Map productItem;
  const ProductUpdateScreen(this.productItem, {super.key});

  @override
  State<ProductUpdateScreen> createState() => _ProductUpdateScreenState();
}

class _ProductUpdateScreenState extends State<ProductUpdateScreen> {
  Map<String, String> formValues = {
    "Img": "",
    "ProductCode": "",
    "ProductName": "",
    "Qty": "",
    "TotalPrice": "",
    "UnitPrice": "",
  };
  bool loading = false;

  @override
  void initState() {
    super.initState();
    formValues.update("Img", (value) => widget.productItem['Img']);
    formValues.update(
      "ProductCode",
      (value) => widget.productItem['ProductCode'],
    );
    formValues.update(
      "ProductName",
      (value) => widget.productItem['ProductName'],
    );
    formValues.update("Qty", (value) => widget.productItem['Qty']);
    formValues.update(
      "TotalPrice",
      (value) => widget.productItem['TotalPrice'],
    );
    formValues.update("UnitPrice", (value) => widget.productItem['UnitPrice']);
  }

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
      await ProductUpdateRequest(formValues, widget.productItem['_id']);

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => ProductGridViewScreen()),
        (Route route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Update Product"), centerTitle: true),
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
                            initialValue: formValues['ProductName'],
                            onChanged: (textValue) {
                              inputOnChange("ProductName", textValue);
                            },
                            decoration: appInputDecoration("Product Name"),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            initialValue: formValues['ProductCode'],
                            onChanged: (textValue) {
                              inputOnChange("ProductCode", textValue);
                            },
                            decoration: appInputDecoration("Product Code"),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            initialValue: formValues['Img'],
                            onChanged: (textValue) {
                              inputOnChange("Img", textValue);
                            },
                            decoration: appInputDecoration("Product Image"),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            initialValue: formValues['UnitPrice'],
                            onChanged: (textValue) {
                              inputOnChange("UnitPrice", textValue);
                            },
                            decoration: appInputDecoration("Unit Price"),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            initialValue: formValues['TotalPrice'],
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
                            child: successButtonChild("Update"),
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
