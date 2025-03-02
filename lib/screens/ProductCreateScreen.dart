import 'package:flutter/material.dart';

import '../style/style.dart';

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
                    decoration: appInputDecoration("Product Description"),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    onChanged: (value) {},
                    decoration: appInputDecoration("Product Price"),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    onChanged: (value) {},
                    decoration: appInputDecoration("Product Image"),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    onChanged: (value) {},
                    decoration: appInputDecoration("Product Category"),
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
