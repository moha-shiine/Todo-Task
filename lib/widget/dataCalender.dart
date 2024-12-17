import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskapp/color/them.dart';

Widget dataCalenderWidget(
    {void Function(DateTime)? onDateChange, DateTime? initialDate}) {
  // ignore: unused_local_variable
  final DateTime currentDate = DateTime.now();

  return EasyDateTimeLine(
    onDateChange: onDateChange,
    timeLineProps: const EasyTimeLineProps(),
    headerProps: const EasyHeaderProps(
      showHeader: false,
      padding: EdgeInsets.only(
        top: 0,
        left: 20,
        bottom: 0,
        right: 0,
      ),
      showMonthPicker: false,
      //   selectedDateStyle: TextStyle(
      //       color: Colors.red, fontSize: 16, fontWeight: FontWeight.w600),
    ),
    dayProps: const EasyDayProps(
        height: 60.0,
        width: 60.0,
        activeDayStyle: DayStyle(
          borderRadius: 10.0,
        )),
    itemBuilder: (
      BuildContext context,
      DateTime date,
      bool isSelected,
      VoidCallback onTap,
    ) {
      bool isToday = date.day == DateTime.now().day;
      return InkResponse(
        onTap: onTap,
        child: Container(
          height: 65.0,
          width: 60.0,
          decoration: BoxDecoration(
            //  shape: BoxShape.circle,
            borderRadius: BorderRadius.circular(100),
            color: null,
            border: isSelected || isToday
                ? Border.all(
                    color: isSelected
                        ? Colorthem.SecondryColor
                        : Colors.transparent,
                    width: 1,
                  )
                : null,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                EasyDateFormatter.shortDayName(date, "en_US"),
                style: TextStyle(
                  color: isSelected ? Colorthem.PrimaryColor : Colors.grey,
                  fontWeight: FontWeight.w600,
                  fontSize: 12.0,
                ),
              ),
              const Gap(10),
              Center(
                child: Text(
                  date.day.toString(),
                  style: TextStyle(
                    color: isSelected ? Colorthem.PrimaryColor : Colors.grey,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
    initialDate: initialDate ?? DateTime.now(),
  );
}
