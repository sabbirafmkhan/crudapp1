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
  inputOnChange(mapKey, textValue) {
    setState(() {
      formValues.update(mapKey, (value) => textValue);
    });
  }

  formOnSubmit() {
    if (formValues["Img"]!.length == 0) {
      errorToast("Please enter product image");
    } else if (formValues["ProductCode"]!.length == 0) {
      errorToast("Please enter product code");
    } else if (formValues["ProductName"]!.length == 0) {
      errorToast("Please enter product name");
    } else if (formValues["Qty"]!.length == 0) {
      errorToast("Please select quantity");
    } else if (formValues["TotalPrice"]!.length == 0) {
      errorToast("Please enter total price");
    } else if (formValues["UnitPrice"]!.length == 0) {
      errorToast("Please enter unit price");
    } else {
      //data api
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
            child: SingleChildScrollView(
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
                        DropdownMenuItem(value: "", child: Text("Select QT")),
                        DropdownMenuItem(value: "1 pcs", child: Text("1 pcs")),
                        DropdownMenuItem(value: "2 pcs", child: Text("2 pcs")),
                        DropdownMenuItem(value: "3 pcs", child: Text("3 pcs")),
                        DropdownMenuItem(value: "4 pcs", child: Text("4 pcs")),
                      ],
                      onChanged: (textValue) {
                        inputOnChange("Qty", textValue);
                      },
                      isExpanded: true,
                      underline: Container(),
                    ),
                  ),
                  Container(
                    child: ElevatedButton(
                      style: appButtonStyle(),
                      onPressed: () {
                        formOnSubmit();
                      },
                      child: successButtonChild("Create"),
                    ),
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
