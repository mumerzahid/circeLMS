import 'package:crice_hospital_app/ui/screens/dashboard/dashboard_view.dart';
import 'package:crice_hospital_app/ui/screens/notification_screen/notification_screen_view.dart';
import 'package:crice_hospital_app/ui/screens/report/report_view.dart';
import 'package:crice_hospital_app/ui/screens/report/report_viewmodel.dart';
import 'package:crice_hospital_app/ui/screens/screen_switcher/screen_switcher_viewmodel.dart';
import 'package:crice_hospital_app/ui/screens/visits_screen/visit_screen_view.dart';
import 'package:crice_hospital_app/ui/widgets/custom_app_bar.dart';
import 'package:crice_hospital_app/ui/widgets/drawyer.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ScreenSwitchView extends StatelessWidget {
  const ScreenSwitchView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ScreenSwitcherViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: CustomAppBar(
            height: MediaQuery.of(context).size.height * 0.32,
            sName: model.currentScreen,
            fCall: true,
            topNavigationCallBack: model.switchTabs,
            vScreen: model.valuePressedString),
        drawer: MyCustomDrawer(),
        body: IndexedStack(
          index: model.indexPosition,
          children: [
            DashboardView(),
            ReportView(),
            VisitScreenView(),
            NotificationScreenView(),
          ],
        ),
      ),
      viewModelBuilder: () => ScreenSwitcherViewModel(),
    );
  }
}
