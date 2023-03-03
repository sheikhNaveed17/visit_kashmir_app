import 'package:app2/Config/configuration.dart';
import 'package:app2/DataModel/filterModel.dart';
import 'package:app2/customComponents/customBasicUI.dart';
import 'package:app2/customComponents/customButton.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class tourerType extends StatefulWidget {
  var data;

  tourerType({Key? key, required this.data}) : super(key: key);

  @override
  State<tourerType> createState() => tourerTypeState();
}

class tourerTypeState extends State<tourerType> {
  String question = "What kind of Tourer you are\n& what Intrests you keep?";
  bool isIconVisible = false;
  var btnBgColor = transparent;
  var textClr = buttonInsideText;

  dynamic valueChoose;
  List listItems = [
    "Family",
    "Couples",
    "Senior Couples",
    "HoneyMoon",
    "Solo",
    "Friends",
    "Pilgrims",
    "School / University"
  ];

  List<String> interest = [
    "Events",
    "Parks",
    "Nature",
    "Valleys",
    "Gardens",
    "Wellness",
    "Museums",
    "Landmarks",
    "Nightlife",
    "Markets",
    "Sports",
    "Activities",
    "Shopping",
    "FoodPlaces",
    "Water Falls",
    "Historic Sites",
    "Wildlife Areas",
    "Religious Sites",
    "Ancient Ruins",
    "Scenic Drives",
    "Water Bodies"
  ];
  List<String>? selectedUserList = [];

  @override
  Widget build(BuildContext context) {
    return customBasicUI(
      countBar: 0.6,
      questionCounter: 5,
      count: 3,
      WidgetList: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Image.asset(
                'images/toureeType.png',
                height: 120.h,
                width: 120.w,
              ),
              Text(
                question,
                textAlign: TextAlign.center,
                style: internalQ,
              ),
              SizedBox(
                height: 13.h,
              ),
              DropdownButton(
                menuMaxHeight: 200.h,
                borderRadius: BorderRadius.circular(12),
                isExpanded: true,
                hint: Text("Choose your Tourer Type", style: buttonInsideText),
                value: valueChoose,
                onChanged: (newValue) {
                  setState(() {
                    print(newValue);
                    valueChoose = newValue as String;
                    widget.data.query?.travelerType = valueChoose;
                  });
                },
                items: listItems.map((valueItem) {
                  return DropdownMenuItem(
                    value: valueItem,
                    child: Text(valueItem, style: buttonInsideText),
                  );
                }).toList(),
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  selectedUserList! == null || selectedUserList!.isEmpty
                      ? Text("Choose your Intrests", style: buttonInsideText)
                      : Text("Edit your Intrests", style: buttonInsideText),
                  SizedBox(
                    height: 20.h,
                    width: 20.w,
                    child: FloatingActionButton(
                      backgroundColor: primaryYellow,
                      onPressed: openFilterDialog,
                      child:
                          selectedUserList! == null || selectedUserList!.isEmpty
                              ? const Icon(Icons.filter_alt_outlined, size: 14)
                              : const Icon(Icons.edit, size: 14),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 72,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: selectedUserList?.length,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          margin: const EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                              color: primaryBG,
                              borderRadius: BorderRadius.circular(32)),
                          child: Row(
                            children: [
                              Text(
                                selectedUserList![index],
                                style: intrestText,
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        Align(
          alignment: FractionalOffset.bottomRight,
          child: customButton(
            page: 6,
            text: "Next",
            hsize: 63,
            wsize: 141,
            Bwsize: 132,
            Bhsize: 56,
            Ebrsize: 28,
            Ibrsize: 28,
            data: widget.data,
          ),
        ),
      ],
    );
  }

  void openFilterDialog() async {
    await FilterListDialog.display<String>(
      context,
      listData: interest,
      selectedListData: selectedUserList,
      choiceChipLabel: (user) => user!,
      validateSelectedItem: (list, val) => list!.contains(val),
      onItemSearch: (user, query) {
        return user.toLowerCase().contains(query.toLowerCase());
      },
      onApplyButtonClick: (list) {
        setState(() {
          selectedUserList = List.from(list!);
          widget.data.query?.interests = selectedUserList;
        });
        Navigator.pop(context);
      },
    );
  }
}
