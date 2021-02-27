import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:adobe_xd/blend_mask.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CanidaeLogin extends StatelessWidget {
  CanidaeLogin({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff757575),
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(4.7, 62.0),
            child:
                // Adobe XD layer: 'Title [PLATFORM:MOB…' (text)
                SizedBox(
              width: 403.0,
              child: Text(
                '¡Te extrañamos!',
                style: TextStyle(
                  fontFamily: 'Fira Sans',
                  fontSize: 52,
                  color: const Color(0xffffffff),
                  height: 0.6730769230769231,
                ),
                textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: false),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(29.0, 142.0),
            child:
                // Adobe XD layer: 'New user? [PLATFORM…' (text)
                Text(
              'Inicia sesión',
              style: TextStyle(
                fontFamily: 'Fira Sans',
                fontSize: 32,
                color: const Color(0xffffffff),
                height: 0.84375,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(31.0, 661.0),
            child:
                // Adobe XD layer: 'Button' (group)
                SizedBox(
              width: 368.0,
              height: 59.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 368.0, 59.0),
                    size: Size(368.0, 59.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    child:
                        // Adobe XD layer: 'Area' (shape)
                        Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.0),
                        color: const Color(0xfffc3465),
                      ),
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(132.0, 19.0, 104.0, 22.0),
                    size: Size(368.0, 59.0),
                    fixedWidth: true,
                    fixedHeight: true,
                    child:
                        // Adobe XD layer: 'Label' (text)
                        Text(
                      'Iniciar sesión',
                      style: TextStyle(
                        fontFamily: 'Noto Sans',
                        fontSize: 16,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(40.0, 467.0),
            child:
                // Adobe XD layer: 'Input' (group)
                SizedBox(
              width: 351.0,
              height: 48.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 351.0, 48.0),
                    size: Size(351.0, 48.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    child:
                        // Adobe XD layer: 'Area' (shape)
                        Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        color: const Color(0xffffdede),
                      ),
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(16.0, 13.0, 166.0, 22.0),
                    size: Size(351.0, 48.0),
                    pinLeft: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child:
                        // Adobe XD layer: 'Value' (text)
                        Text(
                      'ejemplo@correo.com',
                      style: TextStyle(
                        fontFamily: 'Noto Sans',
                        fontSize: 16,
                        color: const Color(0x7d3d3d3d),
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(40.0, 574.0),
            child:
                // Adobe XD layer: 'Input' (group)
                SizedBox(
              width: 351.0,
              height: 48.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 351.0, 48.0),
                    size: Size(351.0, 48.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    child:
                        // Adobe XD layer: 'Area' (shape)
                        Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        color: const Color(0xffffdede),
                      ),
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(16.0, 13.0, 70.0, 22.0),
                    size: Size(351.0, 48.0),
                    pinLeft: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child:
                        // Adobe XD layer: 'Value' (text)
                        Text(
                      '********',
                      style: TextStyle(
                        fontFamily: 'Noto Sans',
                        fontSize: 16,
                        color: const Color(0x993d3d3d),
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(57.0, 443.0),
            child: Text(
              'Correo',
              style: TextStyle(
                fontFamily: 'Fira Sans',
                fontSize: 16,
                color: const Color(0xff3e3e3e),
                height: 1.6875,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(57.0, 551.0),
            child: Text(
              'Contraseña',
              style: TextStyle(
                fontFamily: 'Fira Sans',
                fontSize: 16,
                color: const Color(0xff3e3e3e),
                height: 1.6875,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(149.0, 403.9),
            child:
                // Adobe XD layer: '- Sign in with -' (group)
                SizedBox(
              width: 114.0,
              height: 19.0,
              child: Stack(
                children: <Widget>[
                  Transform.translate(
                    offset: Offset(-1053.5, 0.0),
                    child:
                        // Adobe XD layer: 'Typography [TAG:UI_…' (text)
                        SizedBox(
                      width: 2221.0,
                      child: Text(
                        'O usa tu correo',
                        style: TextStyle(
                          fontFamily: 'Noto Sans',
                          fontSize: 14,
                          color: const Color(0xff3d3d3d),
                          letterSpacing: 0.42,
                          fontWeight: FontWeight.w700,
                          height: 1.4285714285714286,
                        ),
                        textHeightBehavior:
                            TextHeightBehavior(applyHeightToFirstAscent: false),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(45.0, 790.9),
            child:
                // Adobe XD layer: '- Sign in with -' (group)
                SizedBox(
              width: 322.0,
              height: 19.0,
              child: Stack(
                children: <Widget>[
                  Transform.translate(
                    offset: Offset(-1053.5, 0.0),
                    child:
                        // Adobe XD layer: 'Typography [TAG:UI_…' (text)
                        SizedBox(
                      width: 2429.0,
                      child: Text.rich(
                        TextSpan(
                          style: TextStyle(
                            fontFamily: 'Noto Sans',
                            fontSize: 14,
                            color: const Color(0xff3d3d3d),
                            letterSpacing: 0.42,
                            height: 1.4285714285714286,
                          ),
                          children: [
                            TextSpan(
                              text: '¿Aún no tienes una cuenta?',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextSpan(
                              text: ' Crea una cuenta',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        textHeightBehavior:
                            TextHeightBehavior(applyHeightToFirstAscent: false),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(118.0, 748.9),
            child:
                // Adobe XD layer: '- Sign in with -' (group)
                SizedBox(
              width: 176.0,
              height: 19.0,
              child: Stack(
                children: <Widget>[
                  Transform.translate(
                    offset: Offset(-1053.5, 0.0),
                    child:
                        // Adobe XD layer: 'Typography [TAG:UI_…' (text)
                        SizedBox(
                      width: 2283.0,
                      child: Text(
                        'Olvidé mi contraseña 😣',
                        style: TextStyle(
                          fontFamily: 'Noto Sans',
                          fontSize: 14,
                          color: const Color(0xff3d3d3d),
                          letterSpacing: 0.42,
                          fontWeight: FontWeight.w600,
                          height: 1.4285714285714286,
                        ),
                        textHeightBehavior:
                            TextHeightBehavior(applyHeightToFirstAscent: false),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(330.0, 271.0),
            child:
                // Adobe XD layer: 'Google-Button' (group)
                BlendMask(
              blendMode: BlendMode.srcOver,
              region: Offset(330.0, 271.0) & Size(40.0, 40.0),
              child: SizedBox(
                width: 40.0,
                height: 40.0,
                child: Stack(
                  children: <Widget>[
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(0.0, 0.0, 40.0, 40.0),
                      size: Size(40.0, 40.0),
                      pinLeft: true,
                      pinRight: true,
                      pinTop: true,
                      pinBottom: true,
                      child:
                          // Adobe XD layer: 'btn_google_light_no…' (group)
                          Stack(
                        children: <Widget>[
                          Pinned.fromSize(
                            bounds: Rect.fromLTWH(0.0, 0.0, 40.0, 40.0),
                            size: Size(40.0, 40.0),
                            pinLeft: true,
                            pinRight: true,
                            pinTop: true,
                            pinBottom: true,
                            child:
                                // Adobe XD layer: 'button' (group)
                                Stack(
                              children: <Widget>[
                                Pinned.fromSize(
                                  bounds: Rect.fromLTWH(0.0, 0.0, 40.0, 40.0),
                                  size: Size(40.0, 40.0),
                                  pinLeft: true,
                                  pinRight: true,
                                  pinTop: true,
                                  pinBottom: true,
                                  child:
                                      // Adobe XD layer: 'button-bg' (group)
                                      Stack(
                                    children: <Widget>[
                                      Pinned.fromSize(
                                        bounds:
                                            Rect.fromLTWH(0.0, 0.0, 40.0, 40.0),
                                        size: Size(40.0, 40.0),
                                        pinLeft: true,
                                        pinRight: true,
                                        pinTop: true,
                                        pinBottom: true,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(2.0),
                                            color: const Color(0xffffffff),
                                          ),
                                        ),
                                      ),
                                      Pinned.fromSize(
                                        bounds:
                                            Rect.fromLTWH(0.0, 0.0, 40.0, 40.0),
                                        size: Size(40.0, 40.0),
                                        pinLeft: true,
                                        pinRight: true,
                                        pinTop: true,
                                        pinBottom: true,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(2.0),
                                          ),
                                        ),
                                      ),
                                      Pinned.fromSize(
                                        bounds:
                                            Rect.fromLTWH(0.0, 0.0, 40.0, 40.0),
                                        size: Size(40.0, 40.0),
                                        pinLeft: true,
                                        pinRight: true,
                                        pinTop: true,
                                        pinBottom: true,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(2.0),
                                          ),
                                        ),
                                      ),
                                      Pinned.fromSize(
                                        bounds:
                                            Rect.fromLTWH(0.0, 0.0, 40.0, 40.0),
                                        size: Size(40.0, 40.0),
                                        pinLeft: true,
                                        pinRight: true,
                                        pinTop: true,
                                        pinBottom: true,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(2.0),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Pinned.fromSize(
                            bounds: Rect.fromLTWH(10.8, 18.3, 18.0, 18.0),
                            size: Size(40.0, 40.0),
                            pinBottom: true,
                            fixedWidth: true,
                            fixedHeight: true,
                            child:
                                // Adobe XD layer: 'logo_googleg_48dp' (group)
                                Stack(
                              children: <Widget>[
                                Pinned.fromSize(
                                  bounds: Rect.fromLTWH(0.0, 0.0, 18.0, 18.0),
                                  size: Size(18.0, 18.0),
                                  pinLeft: true,
                                  pinRight: true,
                                  pinTop: true,
                                  pinBottom: true,
                                  child:
                                      // Adobe XD layer: 'Shape' (shape)
                                      SvgPicture.string(
                                    _svg_cm9djp,
                                    allowDrawingOutsideViewBox: true,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(345.2, 282.0),
            child: SvgPicture.string(
              _svg_r4inwf,
              allowDrawingOutsideViewBox: true,
            ),
          ),
          Transform.translate(
            offset: Offset(41.0, 271.0),
            child: Container(
              width: 234.5,
              height: 40.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.0),
                color: const Color(0xffffffff),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(49.0, 280.0),
            child:
                // Adobe XD layer: 'Google-Button' (group)
                SizedBox(
              width: 19.0,
              height: 22.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 19.0, 22.0),
                    size: Size(19.0, 22.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    child:
                        // Adobe XD layer: 'btn_google_light_no…' (group)
                        Stack(
                      children: <Widget>[
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(0.0, 0.0, 19.0, 22.0),
                          size: Size(19.0, 22.0),
                          pinLeft: true,
                          pinRight: true,
                          pinTop: true,
                          pinBottom: true,
                          child:
                              // Adobe XD layer: 'button' (group)
                              Stack(
                            children: <Widget>[
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(0.0, 0.0, 19.0, 22.0),
                                size: Size(19.0, 22.0),
                                pinLeft: true,
                                pinRight: true,
                                pinTop: true,
                                pinBottom: true,
                                child:
                                    // Adobe XD layer: 'button-bg' (group)
                                    Stack(
                                  children: <Widget>[
                                    Pinned.fromSize(
                                      bounds:
                                          Rect.fromLTWH(0.0, 0.0, 19.0, 22.0),
                                      size: Size(19.0, 22.0),
                                      pinLeft: true,
                                      pinRight: true,
                                      pinTop: true,
                                      pinBottom: true,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(2.0),
                                          color: const Color(0xffffffff),
                                        ),
                                      ),
                                    ),
                                    Pinned.fromSize(
                                      bounds:
                                          Rect.fromLTWH(0.0, 0.0, 19.0, 22.0),
                                      size: Size(19.0, 22.0),
                                      pinLeft: true,
                                      pinRight: true,
                                      pinTop: true,
                                      pinBottom: true,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(2.0),
                                        ),
                                      ),
                                    ),
                                    Pinned.fromSize(
                                      bounds:
                                          Rect.fromLTWH(0.0, 0.0, 19.0, 22.0),
                                      size: Size(19.0, 22.0),
                                      pinLeft: true,
                                      pinRight: true,
                                      pinTop: true,
                                      pinBottom: true,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(2.0),
                                        ),
                                      ),
                                    ),
                                    Pinned.fromSize(
                                      bounds:
                                          Rect.fromLTWH(0.0, 0.0, 19.0, 22.0),
                                      size: Size(19.0, 22.0),
                                      pinLeft: true,
                                      pinRight: true,
                                      pinTop: true,
                                      pinBottom: true,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(2.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(0.7, 2.0, 18.0, 18.0),
                          size: Size(19.0, 22.0),
                          pinLeft: true,
                          pinRight: true,
                          pinTop: true,
                          pinBottom: true,
                          child:
                              // Adobe XD layer: 'logo_googleg_48dp' (group)
                              Stack(
                            children: <Widget>[
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(9.0, 7.4, 8.6, 8.5),
                                size: Size(18.0, 18.0),
                                pinRight: true,
                                pinBottom: true,
                                fixedWidth: true,
                                fixedHeight: true,
                                child:
                                    // Adobe XD layer: 'Shape' (shape)
                                    SvgPicture.string(
                                  _svg_mb2j7e,
                                  allowDrawingOutsideViewBox: true,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(1.0, 10.7, 14.0, 7.3),
                                size: Size(18.0, 18.0),
                                pinLeft: true,
                                pinBottom: true,
                                fixedWidth: true,
                                fixedHeight: true,
                                child:
                                    // Adobe XD layer: 'Shape' (shape)
                                    SvgPicture.string(
                                  _svg_j3wxra,
                                  allowDrawingOutsideViewBox: true,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(0.0, 5.0, 4.0, 8.1),
                                size: Size(18.0, 18.0),
                                pinLeft: true,
                                fixedWidth: true,
                                fixedHeight: true,
                                child:
                                    // Adobe XD layer: 'Shape' (shape)
                                    SvgPicture.string(
                                  _svg_30r8ib,
                                  allowDrawingOutsideViewBox: true,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(1.0, 0.0, 14.1, 7.3),
                                size: Size(18.0, 18.0),
                                pinLeft: true,
                                pinTop: true,
                                fixedWidth: true,
                                fixedHeight: true,
                                child:
                                    // Adobe XD layer: 'Shape' (shape)
                                    SvgPicture.string(
                                  _svg_7tutsa,
                                  allowDrawingOutsideViewBox: true,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(0.0, 0.0, 18.0, 18.0),
                                size: Size(18.0, 18.0),
                                pinLeft: true,
                                pinRight: true,
                                pinTop: true,
                                pinBottom: true,
                                child:
                                    // Adobe XD layer: 'Shape' (shape)
                                    SvgPicture.string(
                                  _svg_bgfmij,
                                  allowDrawingOutsideViewBox: true,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(92.0, 283.0),
            child: Text(
              'ACCEDER CON GOOGLE',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 14,
                color: const Color(0x8a3e3e3e),
                fontWeight: FontWeight.w500,
                height: 2.142857142857143,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_cm9djp =
    '<svg viewBox="0.0 0.0 18.0 18.0" ><path transform="translate(0.0, 0.0)" d="M 0 0 L 18 0 L 18 18 L 0 18 L 0 0 Z" fill="none" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_r4inwf =
    '<svg viewBox="345.2 282.0 9.6 18.0" ><path transform="translate(343.57, 282.0)" d="M 10.61824321746826 10.12499904632568 L 11.1181640625 6.867421627044678 L 7.992421627044678 6.867421627044678 L 7.992421627044678 4.753476619720459 C 7.992421627044678 3.862265586853027 8.429062843322754 2.993554830551147 9.828984260559082 2.993554830551147 L 11.25 2.993554830551147 L 11.25 0.2200781106948853 C 11.25 0.2200781106948853 9.960469245910645 0 8.7275390625 0 C 6.153398036956787 0 4.47081995010376 1.560234427452087 4.47081995010376 4.384687423706055 L 4.47081995010376 6.867421627044678 L 1.609453082084656 6.867421627044678 L 1.609453082084656 10.12499904632568 L 4.47081995010376 10.12499904632568 L 4.47081995010376 18 L 7.992421627044678 18 L 7.992421627044678 10.12499904632568 L 10.61824321746826 10.12499904632568 Z" fill="#4267b2" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_mb2j7e =
    '<svg viewBox="9.0 7.4 8.6 8.5" ><path transform="translate(0.0, 0.0)" d="M 17.63997077941895 9.204543113708496 C 17.63997077941895 8.56635570526123 17.58267211914063 7.952728271484375 17.47637176513672 7.363639831542969 L 9 7.363639831542969 L 9 10.8449878692627 L 13.84358406066895 10.8449878692627 C 13.63498401641846 11.96998405456543 13.00088691711426 12.92318058013916 12.04768943786621 13.56137943267822 L 12.04768943786621 15.81947135925293 L 14.95637989044189 15.81947135925293 C 16.65817260742188 14.25267601013184 17.63997077941895 11.94548416137695 17.63997077941895 9.204543113708496 L 17.63997077941895 9.204543113708496 Z" fill="#4285f4" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_j3wxra =
    '<svg viewBox="1.0 10.7 14.0 7.3" ><path transform="translate(0.0, 0.0)" d="M 8.999972343444824 17.99997711181641 C 11.42996406555176 17.99997711181641 13.46725749969482 17.19407844543457 14.95635223388672 15.81948471069336 L 12.04766178131104 13.56139278411865 C 11.24176502227783 14.10139083862305 10.21086883544922 14.42048931121826 8.999972343444824 14.42048931121826 C 6.655890464782715 14.42048931121826 4.671807289123535 12.83729457855225 3.964079856872559 10.71000099182129 L 0.9572725296020508 10.71000099182129 L 0.9572725296020508 13.04179382324219 C 2.438174247741699 15.98318386077881 5.481804847717285 17.99997711181641 8.999972343444824 17.99997711181641 L 8.999972343444824 17.99997711181641 Z" fill="#34a853" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_30r8ib =
    '<svg viewBox="0.0 5.0 4.0 8.1" ><path transform="translate(0.0, 0.0)" d="M 3.96407675743103 10.70998287200928 C 3.784077167510986 10.16998481750488 3.681807518005371 9.593166351318359 3.681807518005371 8.999988555908203 C 3.681807518005371 8.406810760498047 3.784077167510986 7.829992294311523 3.96407675743103 7.289993286132813 L 3.96407675743103 4.958181381225586 L 0.9572696685791016 4.958181381225586 C 0.3477258682250977 6.173177719116211 0 7.547722816467285 0 8.999988555908203 C 0 10.45228385925293 0.3477258682250977 11.82677936553955 0.9572696685791016 13.04177474975586 L 3.96407675743103 10.70998287200928 L 3.96407675743103 10.70998287200928 Z" fill="#fbbc05" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_7tutsa =
    '<svg viewBox="1.0 0.0 14.1 7.3" ><path transform="translate(0.0, 0.0)" d="M 8.999974250793457 3.579537868499756 C 10.32136917114258 3.579537868499756 11.50766563415527 4.033626079559326 12.44046306610107 4.925433158874512 L 15.02175331115723 2.344081878662109 C 13.46315860748291 0.891815185546875 11.42586612701416 0 8.999974250793457 0 C 5.481806755065918 0 2.438176155090332 2.016813278198242 0.9572744369506836 4.958163261413574 L 3.964081764221191 7.289975166320801 C 4.671809196472168 5.162712574005127 6.655892372131348 3.579537868499756 8.999974250793457 3.579537868499756 L 8.999974250793457 3.579537868499756 Z" fill="#ea4335" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_bgfmij =
    '<svg viewBox="0.0 0.0 18.0 18.0" ><path  d="M 0 0 L 17.99993896484375 0 L 17.99993896484375 17.99993896484375 L 0 17.99993896484375 L 0 0 Z" fill="none" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
