import 'package:flutter/material.dart';

import 'package:crudapp1/style/style.dart';

class ProductCreateScreen extends StatefulWidget {
  const ProductCreateScreen({super.key});

  @override
  State<ProductCreateScreen> createState() => _ProductCreateScreenState();
}

class _ProductCreateScreenState extends State<ProductCreateScreen> {
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
                    onChanged: (value) {},
                    decoration: appInputDecoration("Product Name"),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    onChanged: (value) {},
                    decoration: appInputDecoration("Product Code"),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    onChanged: (value) {},
                    decoration: appInputDecoration("Product Image"),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    onChanged: (value) {},
                    decoration: appInputDecoration("Unit Price"),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    onChanged: (value) {},
                    decoration: appInputDecoration("Total Price"),
                  ),
                  SizedBox(height: 20),
                  appDropDownStyle(
                    DropdownButton(
                      value: "",
                      items: [
                        DropdownMenuItem(value: "", child: Text("Select QT")),
                        DropdownMenuItem(value: "1 pcs", child: Text("1 pcs")),
                        DropdownMenuItem(value: "2 pcs", child: Text("2 pcs")),
                        DropdownMenuItem(value: "3 pcs", child: Text("3 pcs")),
                        DropdownMenuItem(value: "4 pcs", child: Text("4 pcs")),
                      ],
                      onChanged: (value) {},
                      isExpanded: true,
                      underline: Container(),
                    ),
                  ),
                  Container(
                    child: ElevatedButton(
                      style: appButtonStyle(),
                      onPressed: () {},
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
