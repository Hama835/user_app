import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_application/constants.dart';
import 'package:user_application/data/category_service.dart';
import 'package:user_application/gen_a/A.dart';
import 'package:user_application/utils/networking_utils.dart';
import 'package:user_application/screens/service_screen.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen>
    with SingleTickerProviderStateMixin {
  // The size of appbar used to create custom appbar.
  double appbarSize = AppBar().preferredSize.height;

  // The list of the categories to be returned.
  List<Category> categories = [];

  // The list of Image assets.
  List<String> imageAssets = [
    A.assets_images_cleaning,
    A.assets_images_repairing,
    A.assets_images_electronics,
    A.assets_images_painting
  ];

  bool isShowIndicator = true;

  // Animate the color of progressbar.
  AnimationController _animationController;
  Animation<Color> _colorTween;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: Duration(milliseconds: 1800),
      vsync: this,
      value: 1
    );
    _colorTween = _animationController
        .drive(ColorTween(begin: Colors.black, end: Colors.blue));
    _animationController.repeat();
    getData();
    super.initState();
  }

  void getData() async {
    categories = await NetworkingUtils.getCategories();
    setState(() {
      isShowIndicator = false;
      categories = categories;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraint) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Category",
                        style: TextStyle(
                          fontSize: appbarSize - 20,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  isShowIndicator
                      ? Expanded(
                        child: Center(
                            child: CircularProgressIndicator(
                              valueColor: _colorTween,
                            ),
                          ),
                      )
                      : Expanded(
                          child: ListView.separated(
                          padding: EdgeInsets.all(8),
                          itemCount: categories.length,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ServiceScreen(categories[index].id.toString()),
                                  ),
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.all(20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      flex:1,
                                      child: Image.asset(imageAssets[index],width: 100, height: 100,),
                                    )
                                    ,
                                    Flexible(
                                      flex: 3,
                                      child: Center(
                                        child: Text(
                                          categories[index].name.toString(),
                                          style: TextStyle(
                                            color:Colors.white,
                                            fontSize: 22,
                                            fontWeight: FontWeight.w400
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                height: 150,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.blue,
                                    boxShadow: [
                                      BoxShadow(color: Colors.grey, blurRadius: 5, spreadRadius: 1)
                                    ]),

                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              const Divider(),
                        ))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
