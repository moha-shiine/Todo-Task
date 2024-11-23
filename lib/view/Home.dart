import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:gap/gap.dart';
import 'package:taskapp/app/addData.dart';
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
      body: Column(children: [
        Expanded(flex: 1, child: HeaderWidget()),
        Expanded(
            flex: 2,
            child: Container(
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Colorthem.thirtColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        dataCalenderWidget(),
                        Gap(10),
                        ListView.builder(
                            shrinkWrap: true,
                            physics: AlwaysScrollableScrollPhysics(),
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.symmetric(vertical: 8),
                                // padding: EdgeInsets.symmetric(vertical: 6),
                                height: 145,
                                // height: MediaQuery.of(context).size.height * 0.2,
                                width: double.infinity,

                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(26),
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
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      minTileHeight: 10,
                                      isThreeLine: true,
                                      trailing: Text(
                                        "2024/11/02",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Text(
                                        "waxaan samay nayaa app task anigoo isticmalaya flutter and dart",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Gap(10),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 17),
                                          child: Container(
                                            alignment: Alignment.center,
                                            height: 30,
                                            width: 110,
                                            decoration: BoxDecoration(
                                                color: Colorthem.SecondryColor,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Center(
                                                child: Text(
                                              "Compelet",
                                              style: TextStyle(
                                                  color: Colorthem.thirtColor,
                                                  fontSize: 14,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            )),
                                          ),
                                        ),
                                        Spacer(),
                                        Icon(
                                          IconlyLight.editSquare,
                                          color: Colorthem.PrimaryColor,
                                        ),
                                        Gap(10),
                                        Icon(
                                          IconlyLight.delete,
                                          color: Colorthem.SecondryColor,
                                        ),
                                        Gap(10)
                                      ],
                                    )
                                  ],
                                  //       ),
                                  //     );
                                  //   ],
                                  // ),
                                ),
                                // height: 222,
                              );
                            })
                      ],
                    ),
                  ),
                )))
      ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => DateTimePickerWithStartEndTime()));
        },
        child: Container(
          height: 77,
          width: 77,
          decoration: BoxDecoration(
              border: Border.all(
                  width: 8,
                  color: const Color.fromARGB(255, 201, 176, 255)
                      .withOpacity(0.2)),
              color: Colorthem.SecondryColor,
              borderRadius: BorderRadius.circular(100)),
          child: Icon(
            Icons.add,
            color: Colorthem.thirtColor,
            size: 33,
          ),
        ),
      ),
    );
  }
}
