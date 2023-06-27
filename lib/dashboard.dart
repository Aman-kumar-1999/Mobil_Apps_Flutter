import 'package:eqipped_test/component/sidemenu.dart';
import 'package:eqipped_test/config/size_config.dart';
import 'package:eqipped_test/style/colors.dart';
import 'package:eqipped_test/style/style.dart';
import 'package:flutter/material.dart';
import 'package:eqipped_test/component/paymentDetailList.dart';
import 'component/BarChartCopmponent.dart';
import 'component/HistoryTable.dart';
import 'component/appBarActionItems.dart';
import 'component/header.dart';
import 'component/infocard.dart';
import 'config/responsive.dart';

class Dashboard extends StatelessWidget {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      // key: _drawerKey,
      // drawer: SizedBox(width: 300, child: SideMenu()),
      appBar: !Responsive.isDesktop(context)
          ? AppBar(
              elevation: 0,
              backgroundColor: AppColors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black,size: 25,),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
                AppBarActionItems(),
              ],
            )
          : const PreferredSize(
              preferredSize: Size.zero,
              child: SizedBox(),
            ),
      body: SafeArea(
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Expanded(
            //   flex: 1,
            //   child: SideMenu(),
            // ),
            Expanded(
              flex: 10,
              child: SizedBox(
                width: double.infinity,
                height: SizeConfig.screenHeight,
                // color: AppColors.secondaryBg,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                      vertical: 30.0, horizontal: 30.0),
                  child: Column(
                    children: [
                      const Header(),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical! * 4,
                      ),
                      SizedBox(
                        width: SizeConfig.screenWidth,
                        child: Wrap(
                          spacing: 20,
                          runSpacing: 20,
                          alignment: WrapAlignment.spaceBetween,
                          children: [
                            InfoCard(
                                icon: 'assets/credit-card.svg',
                                label: 'Total \nOrders',
                                amount: '\$5998'),
                            InfoCard(
                                icon: 'assets/transfer.svg',
                                label: 'Total Products ',
                                amount: '\134780'),
                            InfoCard(
                                icon: 'assets/bank.svg',
                                label: 'Total Vendors ',
                                amount: '\$233'),
                            InfoCard(
                                icon: 'assets/invoice.svg',
                                label: 'Total Users to ',
                                amount: '\9845'),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical! * 4,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          Row(

                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  PrimaryText(
                                    text: 'Balance',
                                    size: 16,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.secondary,
                                  ),
                                  PrimaryText(
                                      text: '\$1500',
                                      size: 30,
                                      fontWeight: FontWeight.w800),
                                ],
                              ),
                            ],
                          ),
                          const PrimaryText(
                            text: 'Past 30 DAYS',
                            size: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColors.secondary,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical! * 3,
                      ),
                      Container(
                        height: 180,
                        child: BarChartCopmponent(),
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical! * 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          PrimaryText(
                              text: 'History',
                              size: 30,
                              fontWeight: FontWeight.w800),
                          PrimaryText(
                            text: 'Transaction of lat 6 month',
                            size: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColors.secondary,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical! * 3,
                      ),
                      HistoryTable(),
                      if (!Responsive.isDesktop(context))
                        const PaymentDetailList()
                    ],
                  ),
                ),
              ),
            ),
            if (Responsive.isDesktop(context))
              Expanded(
                flex: 4,
                child: SingleChildScrollView(
                  child: Container(
                    width: double.infinity,
                    height: SizeConfig.screenHeight,
                    color: AppColors.secondaryBg,
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(
                          vertical: 30.0, horizontal: 30.0),
                      child: Column(
                        children: const [
                          // AppBarAction(),
                          PaymentDetailList(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
