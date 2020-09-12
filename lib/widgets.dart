// The class contains whole of the custom widgets.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_application/screens/service_detail_screen.dart';

import 'constants.dart';
import 'data/service_company.dart';

class ServiceListItem extends StatelessWidget {
  final ServiceCompany currentService;

  ServiceListItem({this.currentService});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      child: Container(
        padding: EdgeInsets.all(10),
        height: 115,
        child: InkWell(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => ServiceDetailScreen(currentService),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(currentService.name, style: serviceItemTitle),
                    Text(
                      currentService.info,
                      style: TextStyle(
                        fontSize: 18,
                        decorationStyle: TextDecorationStyle.solid
                      ),
                    )
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.add_circle,
                        color: Colors.blueAccent,
                        size: 70,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.grey, blurRadius: 5, spreadRadius: 1)
            ]),
      ),
    );
  }
}
