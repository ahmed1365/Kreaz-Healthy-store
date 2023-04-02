import 'package:flutter/material.dart';
import 'package:kreaz/screens/products_screen.dart';
import 'package:kreaz/widgets/main_drawer.dart';
import '../models/category.dart';
import '../dummy_data.dart';

class CategoriesScreen extends StatefulWidget {
  final String kId;
  final Color color;
  final String title;
  final String imageUrl;

  const CategoriesScreen(
      {@required this.kId,
      @required this.color,
      @required this.title,
      @required this.imageUrl});

  static const routeName = 'category';

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<Category> data;

  getCategories() {}

  @override
  void initState() {
    super.initState();
    setState(() {
      data = DUMMY_CATEGORIES
          .where((element) => element.k.contains(widget.kId))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(fontSize: 15),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 130, horizontal: 20),
        child:GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 3,
                crossAxisSpacing: 40,
                mainAxisSpacing: 80),
            itemCount: data.length,
            itemBuilder: (context, index) {
              var item = data[index];
              return ElevatedButton(
                  style:ElevatedButton.styleFrom(
                      backgroundColor: item.color,
                      textStyle: TextStyle(
                          fontFamily: 'ArefRuqaa-Regular',
                          fontWeight: FontWeight.bold)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategoryProductScreen(
                                  catId: item.id,
                                  title: item.title,
                                  color: item.color,
                                )));
                  },
                  child: Text(item.title));
            }),
      ),
      drawer: MainDrawer(),
    );
  }
}
