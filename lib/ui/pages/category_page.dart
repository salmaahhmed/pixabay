import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pixabay_task/ui/pages/combined_page.dart';
import 'package:pixabay_task/ui/pages/images_page.dart';
import 'package:pixabay_task/ui/pages/videos_page.dart';

class CategoryPage extends StatefulWidget {
  final String category;
  const CategoryPage(this.category) : super();

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  var selectedTab = "1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: Colors.red.shade900,
        automaticallyImplyLeading: true,
        elevation: 0,
        title: Text(
          widget.category,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.all(20),
              child: CupertinoSlidingSegmentedControl(
                  groupValue: selectedTab,
                  children: {
                    "1": Text("Images"),
                    "2": Text("Videos"),
                    "3": Text("All")
                  },
                  onValueChanged: (value) {
                    setState(() {
                      selectedTab = value as String;
                    });
                  }),
            ),
          ),
          if (selectedTab == "1") Expanded(child: ImagesPage(widget.category)),
          if (selectedTab == "2") Expanded(child: VideosPage(widget.category)),
          if (selectedTab == "3")
            Expanded(child: CombinedPage(widget.category)),
        ],
      ),
    );
  }
}
