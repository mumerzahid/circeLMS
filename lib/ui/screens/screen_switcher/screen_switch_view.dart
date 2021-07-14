import 'package:crice_hospital_app/app/locator.dart';
import 'package:crice_hospital_app/ui/screens/dashboard/dashboard_view.dart';
import 'package:crice_hospital_app/ui/screens/drawer_view/drawer_view.dart';
import 'package:crice_hospital_app/ui/screens/notification_screen/notification_screen_view.dart';
import 'package:crice_hospital_app/ui/screens/report/report_view.dart';
import 'package:crice_hospital_app/ui/screens/screen_switcher/screen_switcher_viewmodel.dart';
import 'package:crice_hospital_app/ui/screens/visits_screen/visit_screen_view.dart';
import 'package:crice_hospital_app/ui/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stacked/stacked.dart';

class ScreenSwitchView extends StatelessWidget {
  final int index;
  final String screenName;
  const ScreenSwitchView(
      {Key key, this.index = 0, this.screenName = "DASHBOARD"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ScreenSwitcherViewModel>.reactive(
      onModelReady: (model) => SchedulerBinding.instance
          .addPostFrameCallback((_) => model.setIndex(index, screenName)),
      builder: (context, model, child) => Scaffold(
        appBar: CustomAppBar(
            height: MediaQuery.of(context).size.height * 0.36,
            sName: model.currentScreen,
            fCall: true,
            topNavigationCallBack: model.switchTabs,
            vScreen: model.valuePressedString),
        drawer: DrawerView(),
        // MyCustomDrawer(),

        body: Center(
          child: model.indexPosition == 0
              ? DashboardView()
              : model.indexPosition == 1
                  ? ReportView()
                  : model.indexPosition == 2
                      ? VisitScreenView()
                      : NotificationScreenView(),
        ),
      ),
      fireOnModelReadyOnce: false,
      disposeViewModel: false,
      initialiseSpecialViewModelsOnce: true,
      viewModelBuilder: () => locator<ScreenSwitcherViewModel>(),
    );
  }
}
