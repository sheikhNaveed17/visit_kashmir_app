import 'dart:async';
import 'dart:collection';
import 'dart:convert';

import 'package:app2/Config/configuration.dart';
import 'package:app2/DataModel/3_mainModels/3_foodsModel.dart';
import 'package:app2/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:filter_list/filter_list.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../DataModel/filterModel/filterGeneric.dart';
import '../../../DataModel/filterModel/filter_model.dart';
import '../../../Network/ApiBaseClient/Base_client.dart';
import '../../../whereToGo/DetailScreen/detailsScreen.dart';
import '../../main_home/Components/icn_btn_with_count.dart';

class ScrollList extends StatefulWidget {
  final String? dynamicEndPoint;
  final String? SingleEndPoint;
  final dynamic jSonConvert;
  final dynamic SingleJSonConvert;
  final dynamic limit;
  final dynamic searchData;

  const ScrollList(
      {Key? key,
      this.dynamicEndPoint,
      this.jSonConvert,
      this.SingleEndPoint,
      this.SingleJSonConvert,
      this.limit,
      this.searchData})
      : super(key: key);

  @override
  State<ScrollList> createState() => _ScrollListState();
}

class _ScrollListState extends State<ScrollList> {
  final controller = ScrollController();

  // List<dynamic> items = List.generate(
  //   15,
  //   (index) => 'Item ${index + 1}',
  // );

  List<dynamic> items = [];

  int page = 0;

  int limit = 6;

  bool hasMore = true;

  bool isLoading = false;

  bool empt = true;

  int count = 0;

  List<String> interest = [
    'Recommended',
    'Top Tier',
    'Most Viewed',
    'Popular',
    'Budget Friendly'
  ];

  List<String>? selectedUserList = [];

  @override
  void initState() {
    fetch();
    super.initState();
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        fetch();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future fetch() async {
    if (isLoading) return;
    isLoading = true;
    BaseClient base = BaseClient();
    var response = await base.post(
      widget.dynamicEndPoint as String,
      filterModelToJson(
        FilterModel(
          limit: limit,
          page: page,
        ),
      ),
    );

    if (response != null) {
      final data = widget.jSonConvert(response);
      print(data.data[0].name);

      final List newItems = data.data;

      setState(() {
        page++;
        isLoading = false;

        if (newItems.length < 6) {
          hasMore = false;
        }
        items.addAll(newItems);
      });
    }
  }

  Future refresh() async {
    setState(() {
      isLoading = false;
      hasMore = true;
      page = 0;
      items.clear();
    });
    fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 25, 16, 0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: kSecondaryColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextField(
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          Timer(const Duration(seconds: 1), () async {
                            BaseClient base = BaseClient();
                            var response = await base.post(
                              'foodplace/list',
                              filterGenericSearchToJson(
                                FilterGenericSearch(
                                  limit: 0,
                                  filter: Filter_search(name: value),
                                ),
                              ),
                            );

                            // print(response.data);
                            if (response != null) {
                              final data = widget.jSonConvert(response);
                              print(data.data);
                              if (data.data.isEmpty) {
                                setState(() {
                                  empt = false;
                                });
                              } else {
                                print("data found");
                                final List newItems = data.data;
                                setState(() {
                                  items.clear();
                                  items.addAll(newItems);
                                  isLoading = false;
                                });
                              }
                            } else {
                              print("Something Went Wrong");
                            }
                          });
                        } else {
                          print("worked");
                          refresh();
                          empt = true;
                        }
                      },
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: "Search",
                        hintStyle: categorie,
                        prefixIcon: const Icon(Icons.search),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                IconBtnWithCounter(
                  svgSrc: "images/filter.svg",
                  numOfitem: count,
                  press: () {
                    openFilterDialog();
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: refresh,
              color: ePrimary,
              child: empt
                  ? GridView.builder(
                      controller: controller,
                      itemCount: items.length + 1,
                      padding: const EdgeInsets.all(15),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1, childAspectRatio: 2.4),
                      itemBuilder: (context, index) {
                        if (index < items.length) {
                          final item = items[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Material(
                              elevation: 3,
                              borderRadius: BorderRadius.circular(16),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: kSecondaryColor.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                margin: const EdgeInsets.all(5),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => DetailScreen(
                                          dynamicID: item.id,
                                          SingleEndPoint:
                                              widget.SingleEndPoint as String,
                                          jSonConvert: widget.SingleJSonConvert,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(6.0),
                                          child: CachedNetworkImage(
                                            imageUrl: item.images[0],
                                            imageBuilder:
                                                (context, imageProvider) =>
                                                    Container(
                                              width: 165.2.w,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                image: DecorationImage(
                                                  image: imageProvider,
                                                  fit: BoxFit.fill,
                                                ),
                                                shape: BoxShape.rectangle,
                                              ),
                                            ),
                                            placeholder: (context, url) =>
                                                Container(
                                              alignment: Alignment.center,
                                              child:
                                                  const CircularProgressIndicator(),
                                            ),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Container(
                                              width: 165.2.w,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                image: const DecorationImage(
                                                  image: AssetImage(
                                                      "images/filenotfound.jpg"),
                                                  fit: BoxFit.fill,
                                                ),
                                                shape: BoxShape.rectangle,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            right: 12,
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  item.name,
                                                  // "gulmarg",
                                                  style: TextStyle(
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily: 'Montserrat',
                                                    color: eFont,
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.location_on,
                                                    size: 18.sp,
                                                    color: Colors.red,
                                                  ),
                                                  SizedBox(
                                                    width: 6.w,
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Text(
                                                      "Baramulla",
                                                      style: CardnNameList,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.star_rate_rounded,
                                                    size: 18.sp,
                                                    color: Colors.orangeAccent,
                                                  ),
                                                  SizedBox(
                                                    width: 6.w,
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Text(
                                                      "4.3",
                                                      style: CardnNameList,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Align(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: Text(
                                                        "See More",
                                                        style:
                                                            CardnNameListSeeMore,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        } else {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Center(
                              child: hasMore
                                  ? CircularProgressIndicator(
                                      color: ePrimary,
                                    )
                                  : Text(
                                      "You have Reached the End. That's all for Today.",
                                      style: CardnNameList,
                                    ),
                            ),
                          );
                        }
                      },
                    )
                  : Center(
                      child: Text(
                        "No result found. Try Entering something different.",
                        style: CardnNameList,
                      ),
                    ),
            ),
          ),
        ],
      ),
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
          count = list.length;
          print(list);
          // widget.data.interest = selectedUserList;
          // print(widget.data.toJson());
        });
        Navigator.pop(context);
      },
    );
  }
}
