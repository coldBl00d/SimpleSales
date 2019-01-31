import 'package:flutter/material.dart';
import './products.dart';
import './product_control.dart';

class ProductManager extends StatefulWidget {
  final Map<String, String> startingProduct;

  ProductManager({this.startingProduct});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProductManagerState();
  }
}

class _ProductManagerState extends State<ProductManager> {
  //not changeable from inside (but can add data into it as in cant make it a different list.)
  //can be changed from outside when you create a new product.
  //if you need to block adding data into this product then we need to init as
  //final List<String> _products = const [] --> this will block any further addition to this list
  final List<Map<String, String>> _products = [];

  //ran before build
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.startingProduct != null) {
      this._products.add(widget.startingProduct);
    }
  }

  void _addProduct(Map<String, String> newProduct) {
    setState(() {
      this._products.add(newProduct);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(children: [
      Container(
        margin: EdgeInsets.all(6.0),
        child: ProductControl(_addProduct),
      ),
      Expanded(
        child: Products(products: _products),
      )
    ]);
  }
}
