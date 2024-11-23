import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

Widget dataCalenderWidget(
    {void Function(DateTime)? onDateChange, DateTime? initialDate}) {
  return EasyDateTimeLine(
    onDateChange: onDateChange,
    timeLineProps: const EasyTimeLineProps(),
    headerProps: const EasyHeaderProps(
      padding: EdgeInsets.only(
        top: 0,
        left: 20,
        bottom: 0,
        right: 0,
      ),
      showMonthPicker: true,
      selectedDateStyle: TextStyle(
          color: Colors.red, fontSize: 16, fontWeight: FontWeight.w600),
    ),
    dayProps: const EasyDayProps(
        height: 65.0,
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
            borderRadius: BorderRadius.circular(50.0),
            color: null,
            border: isSelected || isToday
                ? Border.all(
                    color: isSelected ? Colors.yellow : Colors.transparent,
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
                  color: isSelected ? Colors.blue : Colors.grey,
                  fontWeight: FontWeight.w600,
                  fontSize: 12.0,
                ),
              ),
              const Gap(10),
              Center(
                child: Text(
                  date.day.toString(),
                  style: TextStyle(
                    color: isSelected ? Colors.blue : Colors.grey,
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
