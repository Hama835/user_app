import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_application/data/service_company.dart';
import 'package:user_application/utils/networking_utils.dart';

import '../widgets.dart';

class ServiceScreen extends StatefulWidget {
  // id used to sort the service by id.
  String categoryId;

  ServiceScreen(this.categoryId);

  @override
  _ServiceScreenState createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen>
    with SingleTickerProviderStateMixin {
  // The list of the categories to be returned.
  List<ServiceCompany> services = [];

  bool isShowIndicator = true;

  // Animate the color of progressbar.
  AnimationController _animationController;
  Animation<Color> _colorTween;

  @override
  void initState() {
    _animationController = AnimationController(
        duration: Duration(milliseconds: 1800), vsync: this, value: 1);
    _colorTween = _animationController
        .drive(ColorTween(begin: Colors.black, end: Colors.blue));
    _animationController.repeat();
    getData();
    super.initState();
  }

  void getData() async {
    services = await NetworkingUtils.getServicesByCategoryId(widget.categoryId);
    setState(() {
      isShowIndicator = false;
      services = services;
    });
  }

  @override
  Widget build(BuildContext context) {
    double appbarSize = AppBar().preferredSize.height;

    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
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
                        "Service",
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
                          itemCount: services.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ServiceListItem(
                              currentService: services[index],
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
