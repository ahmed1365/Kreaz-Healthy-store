import 'package:flutter/material.dart';
import 'package:kreaz/screens/categories_screen.dart';
import 'package:kreaz/screens/main_categories_Screen.dart';
import 'package:kreaz/screens/product_detail_screen.dart';
import 'package:kreaz/screens/products_screen.dart';
import 'screens/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kreaz Healthy store',
      theme: ThemeData(
          primarySwatch: Colors.brown,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyLarge: TextStyle(color: Color.fromRGBO(20, 50, 50, 1)),
                bodyMedium: TextStyle(color: Color.fromRGBO(20, 50, 50, 1)),
                titleLarge: TextStyle(
                    fontSize: 14,
                    fontFamily: 'COMICS',
                    fontWeight: FontWeight.bold),
              )),
      routes: {
        '/': (context) => main_caregories_Screen(),
        MainSplashScreen.routeName: (context) => MainSplashScreen(),
        CategoriesScreen.routeName: (context) => CategoriesScreen(),
        CategoryProductScreen.routeName: (context) => CategoryProductScreen(),
        ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Kreaz Healthy store'),
          elevation: 10,
          leading: Container(
            child: Image.asset('assets/ic_launcher.png'),
          ),
        ),
        body: null
    );
  }
}
