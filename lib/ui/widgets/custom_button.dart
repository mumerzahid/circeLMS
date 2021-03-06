import 'package:crice_hospital_app/ui/screens/visits_screen/visit_screen_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String imgUrl;
  final String screenName;
  final bool pressed;

  const CustomButton({ Key key, @required this.imgUrl, @required this.screenName, this.pressed =false}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(134, 227, 220, 1),
                    border: Border.all(
                        width: 3,
                        color: const Color.fromRGBO(25, 87, 94, 1))),
                height: MediaQuery.of(context).size.height * 0.06, // was fixed height and width 50,
                width: MediaQuery.of(context).size.width * 0.11,
                child: Center(
                  child: Image.asset(imgUrl,
                    width:    MediaQuery.of(context).size.width * 0.055, //was fixed height and width 25
                    height:  MediaQuery.of(context).size.height * 0.03,
                  ),
                ),
              ),
              Positioned(
                left: MediaQuery.of(context).size.width * 0.03, // 12
                top: MediaQuery.of(context).size.width * 0.085, // 40
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.03, //25
                  width: MediaQuery.of(context).size.width * 0.055, //25
                  color: Colors.transparent,
                  child: Image.asset('assets/images/Diamond.png'),
                ),
              )
            ],
            overflow: Overflow.visible,
          ),
          Container(
            width:MediaQuery.of(context).size.width * 0.195, //80
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.018, // 12
              ),
              child: Center(
                child: Text(
                  screenName,
                  style: TextStyle(
                      fontSize:13,
                      color: pressed?Color.fromRGBO(107, 126, 130, 1):
                   Color.fromRGBO(146, 204, 180, 1)
                  ),
                ),
              )
          ),
        ],
      );
  }
}
