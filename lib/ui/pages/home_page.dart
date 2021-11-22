import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pixabay_task/ui/pages/category_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<GridItem> _listItem = [
    GridItem("Clouds", "assets/clouds.jpeg"),
    GridItem("Cars", "assets/cars.jpeg"),
    GridItem("Urban", "assets/urban.jpeg"),
    GridItem("RedBull", "assets/redbull.jpeg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Select category",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Expanded(
                  child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 30,
                children: _listItem
                    .map((item) => InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) {
                              return CategoryPage(item.category);
                            }));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: AssetImage(item.Picture),
                                    fit: BoxFit.cover)),
                          ),
                        ))
                    .toList(),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

class GridItem {
  final String category;
  final String Picture;

  GridItem(this.category, this.Picture);
}
