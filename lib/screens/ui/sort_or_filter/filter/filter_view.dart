import 'package:cattel_feed/Helper/textstyle.dart';
import 'package:cattel_feed/const/colors.dart';
import 'package:cattel_feed/screens/component/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class FilterView extends StatefulWidget {
  const FilterView({super.key});

  @override
  State<FilterView> createState() => _FilterViewState();
}

class _FilterViewState extends State<FilterView> {
 

List<FilterModel> modellist = filterMethod.map((e) => FilterModel.fromJson(e)).toList();
  

  String selectCategory = "Category";
  @override
  Widget build(BuildContext context) {
    return  Row(
        children: [
          Column(
              children: filterMethod.map((e) {
            return InkWell(
              onTap: () => setState(() {
                selectCategory = e["name"];
              }),
              child: Container(
                height: 50,
                width: 103.w,
                padding: EdgeInsets.only(left: 5.w),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: selectCategory.contains(e["name"])?Colors.transparent: AppColors.gerythinColor,
                    border: Border(
                        bottom: BorderSide(color: AppColors.greylightcolor))),
                child: Text(e["name"],style: GetTextTheme.fs16_regular),
              ),
            );
          }).toList()),
          Expanded(
              child: Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.w.heightBox,
                Text(
                  selectCategory,
                  style: GetTextTheme.fs16_bold,
                ),
                20.w.heightBox,
                if (selectCategory.contains("Category") ||
                    selectCategory.contains("Gender"))
                  ...filterMethod[selectCategory.toString().contains("Category")
                          ? 0
                          : 1]["type"]
                      .map((e) {
                    return CheckboxListTile(
                      contentPadding: EdgeInsets.zero,
                      controlAffinity: ListTileControlAffinity.leading,
                      title: customText(e, GetTextTheme.fs16_regular),
                      activeColor: Colors.black,
                      value: false,
                      onChanged: (value) {},
                    );
                  })
                else 
                  Wrap(children: modellist[selectCategory.contains("Color")?2:selectCategory.contains("Price")?3:4].type.generate((index) {
              return Padding(
                padding: const EdgeInsets.all(3),
                child: Chip(label:  Text(modellist[selectCategory.contains("Color")?2:selectCategory.contains("Price")?3:4].type[index]),
                        backgroundColor: AppColors.whiteColor,
                        side: BorderSide(color: AppColors.gerythinColor),
                        labelStyle: GetTextTheme.fs16_regular,
                        ),
              );}
                  )
                      )
                
             
                
               
                 
              ],
            ),
          ))
        ],
      );
    
  }
}



 List filterMethod = [
    {
      "name": "Category",
      "type": [
        "Caps",
        "Belts",
        "Rings",
        "Bangles & Braclets",
        "Socks",
        "Wallets",
        "Sunglasses",
        "Umbrellas",
      ]
    },
    {
      "name": "Gender",
      "type": [
        "Men",
        "Women",
      ]
    },
    {
      "name": "Color",
      "type": [
        "Red",
        "Black",
        "Blue",
        "Brown",
        "Green",
        "white",
        "Grey",
        "Purple",
        "Silver",
        "Skin",
        "Pink",
      ]
    },
    {
      "name": "Price",
      "type": [
        "Under ₹ 200",
        "Under ₹ 300",
        "Under ₹ 450",
        "Under ₹ 700",
        "Under ₹ 850",
        "Under ₹ 1000",
        "Under ₹ 1000 - ₹ 1500",
        "Under ₹ 1500 - ₹ 2000"
      ],
    },
    {
      "name": "Size",
      "type": ["S", "M", "L", "XL", "XXL", "XXXL", "30", "40"]
    },
  ];
class FilterModel {
  String name;
  List<String> type;

  FilterModel(this.name, this.type);

  FilterModel.fromJson(Map<String, dynamic> json) : name = json['name'] ?? "",
  type = json['type'] ?? []; 
}