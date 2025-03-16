import 'package:crudapp1/RestApi/RestClient.dart';
import 'package:crudapp1/screens/ProductCreateScreen.dart';
import 'package:crudapp1/screens/ProductUpdateScreen.dart';
import 'package:crudapp1/style/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductGridViewScreen extends StatefulWidget {
  const ProductGridViewScreen({super.key});

  @override
  State<ProductGridViewScreen> createState() => _ProductGridViewScreenState();
}

class _ProductGridViewScreenState extends State<ProductGridViewScreen> {
  List productList = [];
  bool loading = true;

  @override
  void initState() {
    callData();
    super.initState();
  }

  callData() async {
    loading = true;
    var data = await productGridViewListRequest();
    setState(() {
      productList = data;
      loading = false;
    });
  }

  deleteItem(id) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Delete Product"),
          content: Text("Once Delete, you can't it back"),
          actions: [
            OutlinedButton(
              onPressed: () async {
                Navigator.pop(context);
                setState(() {
                  loading = true;
                });
                await productDeleteRequest(id);
                await callData();
              },
              child: Text("Yes"),
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("No"),
            ),
          ],
        );
      },
    );
  }

  updateItem(context, productItem) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (builder) => ProductUpdateScreen(productItem)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product List")),
      body: Stack(
        children: [
          screenBackground(context),
          Container(
            child:
                loading
                    ? Center(child: CircularProgressIndicator())
                    : RefreshIndicator(
                      onRefresh: () async {
                        await callData();
                      },
                      child: GridView.builder(
                        gridDelegate: productGridViewStyle(),
                        itemCount: productList.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  child: Image.network(
                                    productList[index]['Img'],
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(5, 5, 5, 8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(productList[index]['ProductName']),
                                      SizedBox(height: 7),
                                      Text(
                                        "Price: ${productList[index]['UnitPrice']} BDT",
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          OutlinedButton(
                                            onPressed: () {
                                              updateItem(
                                                context,
                                                productList[index],
                                              );
                                            },
                                            child: Icon(
                                              CupertinoIcons
                                                  .ellipsis_vertical_circle,
                                              color: Colors.green,
                                              size: 15,
                                            ),
                                          ),
                                          SizedBox(width: 7),
                                          OutlinedButton(
                                            onPressed: () {
                                              deleteItem(
                                                productList[index]['_id'],
                                              );
                                            },
                                            child: Icon(
                                              CupertinoIcons.delete,
                                              color: Colors.red,
                                              size: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (builder) => ProductCreateScreen()),
          );
        },
        child: Icon(CupertinoIcons.add),
      ),
    );
  }
}
