import 'package:flutter/material.dart';

class CanidaeSplash extends StatelessWidget {
  CanidaeSplash({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff757575),
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(36.0, 242.0),
            child:
                // Adobe XD layer: 'Logo-removebg' (shape)
                Container(
              width: 340.0,
              height: 340.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/logo.png.png'),
                  fit: BoxFit.fill,
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xff3e3e3e),
                    offset: Offset(0, 3),
                    blurRadius: 6,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
