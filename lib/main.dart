import 'package:flutter/material.dart';
import './pages/auth.dart';
import 'package:flutter/rendering.dart';
import './pages/manage_products.dart';
import './pages/products.dart';
import './pages/product.dart';
import './models/Product.dart';
import 'package:scoped_model/scoped_model.dart';
import './scoped-models/Products.dart';
import './scoped-models/main.dart';
/*void main() {
  //provided by material file of flutter package
  runApp(MyApp());
} */

//this is equivalent to above
void main() {
  //debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //Scaffold create the white page
    return ScopedModel<MainModel>(
      model: MainModel(),
      child: MaterialApp(
        theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.deepPurple,
            accentColor: Colors.pinkAccent,
            buttonColor: Colors.pinkAccent),
        //home: AuthPage(),
        routes: {
          '/': (BuildContext context) =>
              AuthPage(), //represents home --> either have this or home argument in the material app
          '/products': (BuildContext context) => ProductsPage(),
          '/admin': (BuildContext context) => ManageProductsPage(),
          // '/product':(BuildContext context) => ProductPage()
        },
        onGenerateRoute: (RouteSettings settings) {
          //a function that will be called when we navigate to a named route which is not registered in the routes registery
          final List<String> pathElement = settings.name.split('/');
          if (pathElement[0] != '') {
            //this will not load any page
            return null;
          }
          if (pathElement[1] == 'product') {
            final int index = int.parse(pathElement[2]);
            return MaterialPageRoute<bool>(
              builder: (BuildContext context) {
                return ProductPage(index);
              },
            );
          }
        },

        onUnknownRoute: (RouteSettings settings) {
          return MaterialPageRoute(builder: (BuildContext context) {
            return ProductsPage();
          });
        },
      ),
    );

    //core root widget -- MAterialApp
    //build should always return a widget until it returns a flutter widget.
  }
}
