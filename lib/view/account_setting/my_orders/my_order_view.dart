import 'package:cattel_feed/language/language.dart';
import 'package:cattel_feed/model/order_model/order_model.dart';
import 'package:cattel_feed/resource/const/colors.dart';
import 'package:cattel_feed/resource/const/textstyle.dart';
import 'package:cattel_feed/resource/component/appbar_component.dart';
import 'package:cattel_feed/resource/utils/utils.dart';
import 'package:cattel_feed/view/account_setting/my_orders/my_order_tiel.dart';
import 'package:cattel_feed/view_model/controller/logged_in_user_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

List orderType = [
  LanguagesKey.delivered.tr,
  LanguagesKey.ongoing.tr,
  LanguagesKey.cancelled.tr
];

class MyOrderView extends StatefulWidget {
  static String routes = "/account_&_settings/my_order";
  const MyOrderView({super.key});

  @override
  State<MyOrderView> createState() => _MyOrderViewState();
}

class _MyOrderViewState extends State<MyOrderView> {
  String select = orderType[0];
  List<OrderModel> allmyorders = [];
  List<OrderModel> myorder = [];
  bool loading = true;

  // List orderDetails = [
  //   "Buy again",
  //   "View Details",
  //   "Track Order",
  //   Icons.more_vert
  // ];
  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(LanguagesKey.myOrders.tr),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                  height: 40.h,
                  padding: EdgeInsets.all(5.sp),
                  margin: EdgeInsets.symmetric(horizontal: 10.w),
                  decoration: BoxDecoration(
                      color: AppColors.greythinColor,
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    children: orderType
                        .map(
                          (e) => Expanded(
                            child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: e == select
                                        ? Colors.white
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(5)),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      select = e;

                                      if (select.contains(orderType[0])) {
                                        myorder = allmyorders
                                            .where((element) =>
                                                element.orderStatus ==
                                                    OrderStatus.DISPATCHED ||
                                                element.orderStatus ==
                                                    OrderStatus.DELIVERED)
                                            .toList();
                                      } else if (select
                                          .contains(orderType[1])) {
                                        myorder = allmyorders
                                            .where((element) =>
                                                element.orderStatus ==
                                                    OrderStatus.NEW ||
                                                element.orderStatus ==
                                                    OrderStatus.PROCESSING)
                                            .toList();
                                      } else {
                                        myorder = allmyorders
                                            .where((element) =>
                                                element.orderStatus ==
                                                    OrderStatus.CANCELLED ||
                                                element.orderStatus ==
                                                    OrderStatus.REJECTED ||
                                                element.orderStatus ==
                                                    OrderStatus.RETURNED)
                                            .toList();
                                      }
                                    });
                                  },
                                  child: Text(
                                    e,
                                    style: GetTextTheme.fs16_regular,
                                  ),
                                )),
                          ),
                        )
                        .toList(),
                  )),
              5.h.heightBox,
              Expanded(
                child: myorder.isEmpty
                    ? Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w)
                                .copyWith(top: 20.h),
                            child: Image.asset(
                              "assets/icon/no_order.png",
                            ),
                          ),
                          Text(
                            LanguagesKey.noOrderFound.tr,
                            style: GetTextTheme.fs20_bold,
                          ),
                          Text(
                            LanguagesKey.noOrderFoundMessage.tr,
                            style: GetTextTheme.fs14_regular,
                          )
                        ],
                      )
                    : ListView(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        children: myorder
                            .map((e) => MYOrderTile(
                                  tapClick: (p0) {
                                    setState(() {
                                      // select = p0;
                                    });
                                  },
                                  selected: select,
                                  order: e,
                                ))
                            .toList(),
                      ),
              )
            ],
          ),
          loading
              ? Container(
                  color: Colors.white,
                  alignment: Alignment.center,
                  child:
                      CircularProgressIndicator(color: AppColors.primaryColor),
                )
              : const SizedBox()
        ],
      ),
    );
  }

  getData() async {
    var controller = Get.find<LoggedInUserController>();
    String uid = controller.userModel!.uid;

    await FirebaseFirestore.instance
        .collection("order")
        .where("uid", isEqualTo: uid)
        .get()
        .then((value) {
      allmyorders =
          value.docs.map((e) => OrderModel.fromJson(e.id, e.data())).toList();
    }).onError((error, stackTrace) =>
            Utils.flushBarErrorMessage(error.toString(), context));

    myorder = allmyorders
        .where((element) =>
            element.orderStatus == OrderStatus.DISPATCHED ||
            element.orderStatus == OrderStatus.DELIVERED)
        .toList();
    setState(() {
      loading = false;
    });
  }
}
