import 'package:app2/DataModel/recommendationModel/dataModel.dart';
import 'package:app2/Home/halfWay.dart';
import 'package:app2/Network/ApiBaseClient/ApiConstants.dart';
import 'package:app2/Network/ApiBaseClient/Base_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:reactive_date_time_picker/reactive_date_time_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../Config/configuration.dart';
import '../../DataModel/3_mainModels/placesdropdown.dart';
import '../../customComponents/customBasicUI.dart';
import '../../customComponents/customButton.dart';

class daysActivities extends StatefulWidget {
  const daysActivities({Key? key, required this.data}) : super(key: key);

  // final int totalDays;
  final data;

  @override
  State<daysActivities> createState() => _State();
}

class _State extends State<daysActivities> with SingleTickerProviderStateMixin {
  var dayD;

  // List of items in our dropdown menu
  var triggers = [
    'arrived',
    'departure',
    'visit',
  ];

  var actions = [
    {"_id": 0, "name": "srinagar"},
    {"_id": 1, "name": "gulmarg"},
    {"_id": 2, "name": "pahalgham"},
    {"_id": 3, "name": "songmarg"},
    {"_id": 4, "name": "Doodhpathri"}
  ];

  // var actions = [
  //   {"_id": 0, "name": "srinagar"},
  // ];

  List<dynamic> items = [];

  BaseClient _baseClient = BaseClient();

  late int index;
  late int dayCounter;
  final form = FormGroup({
    'days': FormArray([]),
  });

  FormArray get daysDetails => form.control('days') as FormArray;
  late final int days;
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    days = widget.data.query.totalDaysStay!;
    index = 0;
    dayCounter = 1;
    for (int i = 1; i <= days; i++) {
      if (widget.data.itineraryForm != null) {
        addFormArray(i);
        daysDetails.patchValue(widget.data.itineraryForm);
        dayCounter++;
      } else {
        addFormArray(i);
        dayCounter++;
      }
    }
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  bool showAnimation = false;

  @override
  Widget build(BuildContext context) {
    return customBasicUI(
      countBar: 1.0,
      questionCounter: 5,
      count: 5,
      WidgetList: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Image.asset(
                'images/activity.png',
                height: 68.h,
                width: 78.w,
              ),
              Text(
                "What are the events for\nyour Days ?",
                textAlign: TextAlign.center,
                style: internalQ,
              ),
              SizedBox(
                height: 18.h,
              ),
              SizedBox(
                height: 260.h,
                child: Stack(
                  alignment: AlignmentDirectional.topCenter,
                  children: <Widget>[
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: ReactiveForm(
                        formGroup: form,
                        child: Column(
                          children: <Widget>[
                            ReactiveFormArray(
                                formArrayName: 'days',
                                builder: (context, formArray, child) {
                                  final cities = daysDetails.controls
                                      .map((control) => control as FormGroup)
                                      .map((currentForm) {
                                    index = daysDetails.controls
                                        .indexOf(currentForm);
                                    if (index == days - 1) {
                                      print(index);
                                    }
                                    return Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.white70,
                                              width: 1.5),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(5))),
                                      child: ReactiveForm(
                                        formGroup: currentForm,
                                        child: SingleChildScrollView(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: primaryYellow,
                                                width: 2,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(12),
                                              ),
                                            ),
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 4),
                                                  child: Text(
                                                    'Day ${index + 1}',
                                                    style: dayFont,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      SizedBox(
                                                        width: 100,
                                                        height: 60,
                                                        child:
                                                            ReactiveDropdownField<
                                                                dynamic>(
                                                          formControlName:
                                                              'trigger',
                                                          icon: Icon(
                                                              Icons
                                                                  .arrow_drop_down,
                                                              color: smallFont),
                                                          items: triggers.map(
                                                              (String
                                                                  triggers) {
                                                            return DropdownMenuItem(
                                                              value: triggers,
                                                              child: Text(
                                                                  triggers,
                                                                  style:
                                                                      buttonInsideText),
                                                            );
                                                          }).toList(),
                                                          decoration:
                                                              InputDecoration(
                                                            hintText:
                                                                triggers.first,
                                                            hintStyle:
                                                                buttonInsideText,
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      SizedBox(
                                                        width: 100,
                                                        height: 60,
                                                        child:
                                                            ReactiveDropdownField<
                                                                dynamic>(
                                                          formControlName:
                                                              'action',
                                                          decoration:
                                                              InputDecoration(
                                                            hintText: 'Action',
                                                            hintStyle:
                                                                buttonInsideText,
                                                          ),
                                                          icon: Icon(
                                                              Icons
                                                                  .arrow_drop_down,
                                                              color: smallFont),
                                                          items: actions.map(
                                                              (Map actions) {
                                                            return DropdownMenuItem(
                                                              value: actions[
                                                                  '_id'],
                                                              child: Text(
                                                                actions['name'],
                                                                style:
                                                                    buttonInsideText,
                                                              ),
                                                            );
                                                          }).toList(),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                // index == 0 ? Text("data"): Text(""),
                                                // Padding(
                                                //   padding: const EdgeInsets.only(top: 8),
                                                //   child: Column(
                                                //     children: [
                                                //       Text(
                                                //         "data",
                                                //         style: buttonInsideText,
                                                //       ),
                                                //     ],
                                                //   ),
                                                // ),

                                                index == 0
                                                    ? Center(
                                                        child: SizedBox(
                                                          height: 90.h,
                                                          width: 110.w,
                                                          child:
                                                              ReactiveDateTimePicker(
                                                            formControlName:
                                                                'arrivalTime',
                                                            style:
                                                                buttonInsideText,
                                                            type:
                                                                ReactiveDatePickerFieldType
                                                                    .time,
                                                            decoration:
                                                                InputDecoration(
                                                              labelText:
                                                                  'Arrival Time',
                                                              labelStyle:
                                                                  buttonInsideText,
                                                              suffixIcon:
                                                                  const Icon(Icons
                                                                      .watch_later_outlined),
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    : SizedBox(),

                                                index == days - 1
                                                    ? Center(
                                                        child: SizedBox(
                                                          height: 90.h,
                                                          width: 110.w,
                                                          child:
                                                              ReactiveDateTimePicker(
                                                            formControlName:
                                                                'departureTime',
                                                            style:
                                                                buttonInsideText,
                                                            type:
                                                                ReactiveDatePickerFieldType
                                                                    .time,
                                                            decoration:
                                                                InputDecoration(
                                                              labelText:
                                                                  'Depart Time',
                                                              labelStyle:
                                                                  buttonInsideText,
                                                              suffixIcon:
                                                                  const Icon(Icons
                                                                      .watch_later_outlined),
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    : SizedBox(),

                                                SizedBox(
                                                  height: 38.h,
                                                  child: Row(
                                                    children: [
                                                      ReactiveCheckbox(
                                                        formControlName: 'stay',
                                                        activeColor:
                                                            primaryYellow,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(6),
                                                        ),
                                                        side: BorderSide(
                                                            color:
                                                                primaryYellow),
                                                      ),
                                                      Text(
                                                        'Staying for night?',
                                                        style: checkbox,
                                                      ),
                                                    ],
                                                  ),
                                                ),

                                                const SizedBox(
                                                  height: 6,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  });
                                  return Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Wrap(
                                        runSpacing: 10,
                                        children: cities.toList(),
                                      )
                                    ],
                                  );
                                }),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: FractionalOffset.bottomRight,
          child: Container(
            height: 63.h,
            width: 141.w,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(36),
                bottomRight: Radius.circular(28),
              ),
              color: primaryLightYellow,
            ),
            child: Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(132.w, 56.h),
                  primary: primaryYellow,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      bottomRight: Radius.circular(28),
                    ),
                  ),
                ),
                child: Text(
                  "Next",
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: white,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Montserrat'),
                ),
                onPressed: () {
                  form.valid ? _onPressed() : _showToast(context);
                  customButton(
                    data: widget.data,
                    page: 8,
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  addFormArray(int? index) async {
    print('here $index');
    print(index?.bitLength);
    if (index == 1) {
      daysDetails.add(FormGroup({
        'day': FormControl<dynamic>(value: dayCounter),
        'arrivalTime':
            FormControl<DateTime>(value: DateTime.now(), validators: [
          Validators.required,
        ]),
        'trigger': FormControl<dynamic>(value: '', validators: [
          Validators.required,
        ]),
        'action': FormControl<dynamic>(value: '', validators: [
          Validators.required,
        ]),
        'stay': FormControl<bool>(value: false)
      }));
    } else if (index == days) {
      daysDetails.add(FormGroup({
        'day': FormControl<dynamic>(value: dayCounter),
        'departureTime':
            FormControl<DateTime>(value: DateTime.now(), validators: [
          Validators.required,
        ]),
        'trigger': FormControl<dynamic>(value: '', validators: [
          Validators.required,
        ]),
        'action': FormControl<dynamic>(value: '', validators: [
          Validators.required,
        ]),
        'stay': FormControl<bool>(value: false)
      }));
    } else if (index! <= index) {
      daysDetails.add(FormGroup({
        'day': FormControl<dynamic>(value: dayCounter),
        'trigger': FormControl<dynamic>(value: '', validators: [
          Validators.required,
        ]),
        'action': FormControl<dynamic>(value: '', validators: [
          Validators.required,
        ]),
        'stay': FormControl<bool>(value: false)
      }));
    }

    // }
    setState(() {});
  }

  _removeForm(index) async {
    // print(index);
    daysDetails.removeAt(index);
  }

  _onPressed() {
    var a = daysDetails.value![0]['arrivalTime'];
    String formattedA = DateFormat.Hm().format(a);

    var d = daysDetails.value![days - 1]['departureTime'];
    String formattedD = DateFormat.Hm().format(d);

    daysDetails.value![0] = {
      "day": daysDetails.value![0]['day'],
      "arrivalTime": formattedA,
      "trigger": daysDetails.value![0]['trigger'],
      "action": daysDetails.value![0]['action'],
      "stay": daysDetails.value![0]['stay']
    };

    daysDetails.value![days - 1] = {
      "day": daysDetails.value![days - 1]['day'],
      "departureTime": formattedD,
      "trigger": daysDetails.value![days - 1]['trigger'],
      "action": daysDetails.value![days - 1]['action'],
      "stay": daysDetails.value![days - 1]['stay']
    };

    widget.data.itineraryForm = daysDetails.value;
    showAnimation = true;

    var DataObject = userDataModelToJson(widget.data);
    print(DataObject);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => halfWay(data: DataObject)),
    );
  }

  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Please submit the form'),
        action: SnackBarAction(
            label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
}
