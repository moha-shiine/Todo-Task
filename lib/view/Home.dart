import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:gap/gap.dart';
import 'package:taskapp/color/them.dart';
import 'package:taskapp/common/headerwidget.dart';

import '../widget/dataCalender.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colorthem.SecondryColor,
      body: Column(
        children: [
          Expanded(flex: 1, child: HeaderWidget()),
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                color: Colorthem.thirtColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    dataCalenderWidget(),
                    Gap(20),
                    Container(
                      height: 150,
                      // height: MediaQuery.of(context).size.height * 0.2,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                            color: Colorthem.SecondryColor, width: 1),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Gap(10),
                          ListTile(
                            title: Text(
                              "Task Appliction",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            minTileHeight: 10,
                            isThreeLine: true,
                            trailing: Text(
                              "2024/11/02",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                                "waxaan samay nayaa app task anigoo isticmalaya flutter"),
                          ),
                          Gap(10),
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 17),
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 30,
                                  width: 110,
                                  decoration: BoxDecoration(
                                      color: Colorthem.SecondryColor,
                                      borderRadius: BorderRadius.circular(4)),
                                  child: Center(
                                      child: Text(
                                    "Compelet",
                                    style: TextStyle(
                                        color: Colorthem.thirtColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal),
                                  )),
                                ),
                              ),
                              Spacer(),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(IconlyLight.editSquare)),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    IconlyLight.delete,
                                    color: Colorthem.PrimaryColor,
                                  )),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              height: 222,
            ),
          ),
        ],
      ),
    );
  }
}
