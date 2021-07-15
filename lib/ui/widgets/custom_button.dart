import 'package:crice_hospital_app/constants/constants_messages.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String imgUrl;
  final String screenName;
  final bool pressed;

  const CustomButton(
      {Key key,
      @required this.imgUrl,
      @required this.screenName,
      this.pressed = false})
      : super(key: key);
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
                  color: const Color.fromRGBO(25, 87, 94, 1),
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5.0),
                  topRight: Radius.circular(5.0),
                  bottomLeft: Radius.circular(5.0),
                  bottomRight: Radius.circular(5.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.1),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              height: MediaQuery.of(context).size.width *
                  0.1, // was fixed height and width 50,
              width: MediaQuery.of(context).size.width * 0.1,
              child: Center(
                child: Image.asset(
                  imgUrl,
                  width: MediaQuery.of(context).size.width *
                      0.045, //was fixed height and width 25
                  height: MediaQuery.of(context).size.width * 0.045,
                ),
              ),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width * 0.026, // 12
              top: MediaQuery.of(context).size.width * 0.08, // 40
              child: Container(
                height: MediaQuery.of(context).size.width * 0.05, //25
                width: MediaQuery.of(context).size.width * 0.05, //25
                color: Colors.transparent,
                child: Image.asset('assets/images/Diamond.png'),
              ),
            )
          ],
          clipBehavior: Clip.none,
          // overflow: Overflow.visible,
        ),
        Container(
            width: MediaQuery.of(context).size.width * 0.195, //80
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.width * 0.035, // 12
            ),
            child: Center(
              child: Text(
                screenName,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: ConstantsMessages.fontSmall,
                    color: pressed
                        ? Color.fromRGBO(107, 126, 130, 1)
                        : Color.fromRGBO(146, 204, 180, 1)),
              ),
            )),
      ],
    );
  }
}
