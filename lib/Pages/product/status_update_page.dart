import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:signature/signature.dart';

class StatusUpdatePage extends StatefulWidget {
  const StatusUpdatePage({super.key});

  @override
  State<StatusUpdatePage> createState() => _StatusUpdatePageState();
}

class _StatusUpdatePageState extends State<StatusUpdatePage> {
  Uint8List? exportedImage;
  Uint8List? exportedImage1;
  SignatureController controller = SignatureController();
  SignatureController controller2 = SignatureController();
  final TextEditingController notes = TextEditingController();

  var selectReminderType;
  var isSelect = false;
  var reminderId;

  var reminderValue;
  List<Map<String, dynamic>> items = [
    {"id": 1, "name": "Drop Off"},
    {"id": 2, "name": "Sorting"},
    {"id": 3, "name": "Booking Office"},
    {"id": 4, "name": "On The Airlines"},
    {"id": 5, "name": "Arrived in Airport"},
    {"id": 6, "name": "Waiting for Custom Confirmation"},
    {"id": 7, "name": "Waiting for Custom Clearing"},
    {"id": 8, "name": "In Delivery Hub"},
    {"id": 9, "name": "On the way to Destination"},
    {"id": 10, "name": "Ready for Collection"},
    {"id": 11, "name": "Collected"},
    {"id": 12, "name": "Others"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Signature"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
            children: [
              SizedBox(
                height: 10.h,
              ),
              Container(
                  alignment: Alignment.center,
                  height: 35,
                  width: 300,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  child: DropdownButton(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      isExpanded: true,
                      hint: Text(
                          "${isSelect ? selectReminderType : 'Select Record Type'}"),
                      underline: SizedBox(),
                      icon: const Icon(Icons.keyboard_arrow_down),
                      value: reminderValue,
                      items: items
                          .map((e) => DropdownMenuItem(
                                onTap: () {
                                  selectReminderType = e['name'].toString();
                                },
                                value: e['id'],
                                child: Text(
                                  "${e['name']}",
                                ),
                              ))
                          .toList(),
                      onChanged: (value) {
                        var id = value;
                        reminderId = value;
                        print("Category Id $id");
                        // _con.getClassId(value.toString());
                        setState(() {
                          reminderId = value.toString();
                          isSelect = true;
                        });
                      })),
              SizedBox(height: 10.h),
              InkWell(
                onTap: () {
                  expirationDatePicker(context);
                },
                child: Container(
                  width: 300,
                  height: 35,
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 0),
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.8, color: Colors.grey)),
                  child: exprirationDateStatus == false
                      ? const Text(
                          "Expiration Date",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        )
                      : Text(
                          "${pickDate.day}-${pickDate.month}-${pickDate.year}"),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Container(
                alignment: Alignment.topLeft,
                width: 300,
                child: TextField(
                  controller: notes,
                  decoration: InputDecoration(
                    labelText: 'Notes',
                    hintText: "Note",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  maxLines: 2, // Allows multiple lines for notes
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                width: 300.w,
                child: Text(
                  "OPERATION MANAGER:",
                  style: TextStyle(
                      fontSize: 13.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Signature(
                controller: controller,
                height: 100.h,
                width: 300.w,
                backgroundColor: Colors.lightBlue[400]!,
              ),
              SizedBox(height: 5.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 40.h,
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () async {
                          controller.clear();
                        },
                        child: Text("Clear")),
                  ),
                  Container(
                       height: 40.h,
                    padding: const EdgeInsets.all(5),
                    child: ElevatedButton(
                      onPressed: () async {
                        exportedImage = await controller.toPngBytes();

                        print(exportedImage);

                        setState(() {});
                      },
                      child: Text("Save Signature"),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Container(
                child: Text(
                  "RECEIVER SIGN:",
                  style: TextStyle(
                      fontSize: 13.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
              ),
                  SizedBox(height: 8.h),
              Signature(
                controller: controller2,
                height: 100.h,
                width: 300.w,
                backgroundColor: Colors.lightBlue[400]!,
              ),
              SizedBox(height: 5.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                       height: 40.h,
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () async {
                          controller2.clear();
                        },
                        child: Text("Clear")),
                  ),
                  Container(
                       height: 40.h,
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        exportedImage = await controller.toPngBytes();

                        print(exportedImage);

                        setState(() {});
                      },
                      child: Text("Save Signature"),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.h,), 
              Container(
              margin: EdgeInsets.symmetric(horizontal: 70.w),
              height: 40.h,
                child: ElevatedButton(
                    onPressed: () async {},
                    child: Text(
                      "Update Now",
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.white,
                          wordSpacing: 0.5,
                          fontWeight: FontWeight.w700),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green)),
              ),
                SizedBox(height: 15.h,), 
            ],
          ),
        ));
  }

  String? selectExprDate;
  var exprirationDate;
  bool exprirationDateStatus = false;
  DateTime pickDate = DateTime.now();

  expirationDatePicker(context) async {
    DateTime? userSelectedDate = await showDatePicker(
      context: context,
      initialDate: pickDate,
      firstDate: DateTime(2021),
      lastDate: DateTime(2030, 01, 01),
    );

    if (userSelectedDate == null) {
      return;
    } else {
      setState(() {
        exprirationDateStatus = true;
        pickDate = userSelectedDate;

        exprirationDate = "${pickDate.year}-${pickDate.month}-${pickDate.day}";
        print("Expiration Date $exprirationDate");
      });
    }
  }
}
