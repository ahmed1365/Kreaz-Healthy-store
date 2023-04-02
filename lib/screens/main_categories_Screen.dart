import 'package:flutter/material.dart';
import 'package:kreaz/screens/categories_screen.dart';
import '../dummy_data.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/main_drawer.dart';

class main_caregories_Screen extends StatelessWidget {
  static const routeName = 'main_cat';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     /* appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text(
          "Kreaz Healthy store",
          style: TextStyle(fontSize: 20, color: Colors.white70),
        ),
        elevation: 5,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(150),
              child: Image.asset(
                'assets/ic_launcher.png',
              ),
            ),
          ),
        ),
      ),*/
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/kk.jpg"),
              fit: BoxFit.cover,
            )),
            child: GridView.builder(
                padding: EdgeInsets.symmetric(vertical: 160, horizontal: 100),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 5 / 2,
                  crossAxisSpacing: 30,
                  mainAxisSpacing: 100,
                ),
                itemCount: MAIN_CATEGORIES.length,
                itemBuilder: (context, index) {
                  var item = MAIN_CATEGORIES[index];
                  return Container(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0)),
                          backgroundColor: item.color,
                          textStyle: TextStyle(
                            fontSize: 16,
                            fontFamily: 'ArefRuqaa-regular',
                            fontWeight: FontWeight.bold,
                          )),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CategoriesScreen(
                                      kId: item.id,
                                      color: item.color,
                                      title: item.title,
                                    )));
                      },
                      child: Text(item.title),
                    ),
                  );
                }),
          ),
          Positioned(
            top: 40,
            left: -30,
            height: 33,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: Container(
                height: 250,
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                width: 400,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 200,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50.0),
                        child:
                            Image(image: AssetImage("assets/ic_launcher.png")),
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      "Kreaz Healthy Store",
                      style:GoogleFonts.pacifico(
                        fontSize: 24,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 50,
            height: 27,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Sponsored By Ganache",
                  style: TextStyle(
                      fontSize: 22, color: Colors.white, fontFamily: "COMICS"),
                ),
                SizedBox(
                  width: 12,
                ),
                Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100.0),
                    child: Image(image: AssetImage("assets/gg.jpg")),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

/*
      drawer: MainDrawer(),
*/
    );
  }
}
