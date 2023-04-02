import 'package:flutter/material.dart';
import 'package:kreaz/dummy_data.dart';

class ProductDetailScreen extends StatefulWidget {
  final Color color;
  final String title;
  final String imageUrl;

  ProductDetailScreen(
      {@required this.color, @required this.title, @required this.imageUrl});

  static const routeName = 'product';

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget buildSectionTitle(BuildContext ctx, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12),
      child: Text(
        text,
        style: Theme.of(ctx).textTheme.titleLarge,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 220,
      width: 300,
      child: child,
    );
  }

  Widget build(BuildContext context) {
    final proId = ModalRoute.of(context).settings.arguments as String;
    final selectedProduct =
        DUMMY_PRODUCTS.firstWhere((product) => product.id == proId);
    return Scaffold(
     /* appBar: AppBar(
        title: Text(
          selectedProduct.title,
          style: TextStyle(fontSize: 25),
        ),
      ),*/
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedProduct.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, "Ingredients المكونات"),
            buildContainer(ListView.builder(
              itemBuilder: (ctx, index) => Card(
                color: Theme.of(context).accentColor,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Text(selectedProduct.ingredients[index]),
                ),
              ),
              itemCount: selectedProduct.ingredients.length,
            )),
            buildSectionTitle(context, "Steps خطوات التحضير"),
            buildContainer(ListView.builder(
              itemBuilder: (ctx, index) => Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text(
                        "# ${index + 1} ",
                      ),
                      backgroundColor: Colors.grey,
                    ),
                    title: Text(
                      selectedProduct.steps[index],
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Divider(color: Colors.black, thickness: .7),
                ],
              ),
              itemCount: selectedProduct.steps.length,
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop(proId);
        },
        child: Icon(Icons.delete),
      ),
    );
  }
}
