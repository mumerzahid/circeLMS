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
                height: 50,
                width: 50,
                child: Center(
                  child: Image.asset(imgUrl,
                    width: 25,
                    height: 25,
                  ),
                ),
              ),
              Positioned(
                left: 12,
                top: 40,
                child: Container(
                  height: 25,
                  width: 25,
                  color: Colors.transparent,
                  child: Image.asset('assets/images/Diamond.png'),
                ),
              )
            ],
            overflow: Overflow.visible,
          ),
          Container(
            width: 80,
              padding: EdgeInsets.only(top: 15),
              child: Center(
                child: Text(
                  screenName,
                  style: TextStyle(color:
                  pressed?Color.fromRGBO(107, 126, 130, 1):
                   Color.fromRGBO(146, 204, 180, 1)
                  ),
                ),
              )
          ),
        ],
      );
  }
}
