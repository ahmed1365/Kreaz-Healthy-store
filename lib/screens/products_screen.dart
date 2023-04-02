import 'package:flutter/material.dart';
import 'package:kreaz/widgets/productItem.dart';
import '../dummy_data.dart';
import '../models/meal.dart';

class CategoryProductScreen extends StatefulWidget {
  final String catId;
  final String imageUrl;
  final Color color;
  final String title;

  CategoryProductScreen({
    @required this.catId,
    @required this.color,
    @required this.title,
    @required this.imageUrl,
    });

  static const routeName = 'category_product';


  @override
  State<CategoryProductScreen> createState() => _CategoryProductScreenState();
}

class _CategoryProductScreenState extends State<CategoryProductScreen> {
  List<Meal> data;
@override
  void initState() {
    super.initState();
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    data = DUMMY_PRODUCTS
        .where((element) => element.categories.contains(widget.catId))
        .toList();


    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: TextStyle(fontSize: 20),),
      ),
      body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (ctx, index) {
            var item = data[index];
            return ProductItem(
              id: item.id,
              imageUrl: item.imageUrl,
              title: item.title,
              duration: item.duration,
              complexity: item.complexity,
              affordability: item.affordability,
            );
          }
          ),
    );
  }
}
