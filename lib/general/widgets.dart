import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';

import 'allExports.dart';

// Just a basic text widget (which will be generally used)
class CommonText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final bool bold;
  final bool decor;
  final bool underLine;
  final bool lineThrough;
  final Color decorColor;
  final double letterSpace;
  final CommonSvgIconModel svgIcon;
  final IconData simpleIcon;
  final bool placeIconFirst;
  final Color particularSvgColor;
  final bool alignTextCenter;

  CommonText({
    @required this.text,
    this.size,
    this.color,
    this.bold,
    this.decor,
    this.underLine,
    this.lineThrough,
    this.decorColor,
    this.letterSpace,
    this.svgIcon,
    this.simpleIcon,
    this.particularSvgColor,
    this.placeIconFirst,
    this.alignTextCenter,
  });

  @override
  Widget build(BuildContext context) {
    if (svgIcon == null && simpleIcon == null) {
      return Text(text,
          textScaleFactor: 1,
          textAlign: alignTextCenter != null ? TextAlign.center : null,
          style: TextStyle(
            color: color == null ? AppColors().commonBlack : color,
            fontSize: size == null ? 21 : size,
            fontWeight: bold == null || bold == false
                ? FontWeight.normal
                : FontWeight.w700,
            fontFamily: 'Sans',
            fontFamilyFallback: <String>[
              'Noto',
            ],
            decoration: decor == null || decor == false
                ? TextDecoration.none
                : underLine == true
                    ? TextDecoration.underline
                    : lineThrough == true
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
            decorationColor:
                decorColor == null ? AppColors().commonBlack : decorColor,
            letterSpacing: letterSpace == null ? 0 : letterSpace,
            
          ));
    } else {
      if (svgIcon != null) {
        return Wrap(
          //using this method of text and svg, the svg will always be the last item
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(text + ' ',
            textAlign: alignTextCenter != null ? TextAlign.center : null,
                textScaleFactor: 1,
                style: TextStyle(
                  color: color == null ? AppColors().commonBlack : color,
                  fontSize: size == null ? 21 : size,
                  fontWeight: bold == null || bold == false
                      ? FontWeight.normal
                      : FontWeight.w700,
                  fontFamily: 'Sans',
                  fontFamilyFallback: <String>[
                    'Noto',
                  ],
                  decoration: decor == null || decor == false
                      ? TextDecoration.none
                      : underLine == true
                          ? TextDecoration.underline
                          : lineThrough == true
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                  decorationColor:
                      decorColor == null ? AppColors().commonBlack : decorColor,
                  letterSpacing: letterSpace == null ? 0 : letterSpace,
                )),
            CommonSvgIcon(
              svgDetials: svgIcon,
              size: size == null ? 21 : size,
              color: particularSvgColor,
            ),
          ],
        );
      } else {
        if (placeIconFirst == null || !placeIconFirst) {
          return Wrap(
            //using this method of text and icon, the icon will always be the last item
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(text + ' ',
              textAlign: alignTextCenter != null ? TextAlign.center : null,
                  textScaleFactor: 1,
                  style: TextStyle(
                    color: color == null ? AppColors().commonBlack : color,
                    fontSize: size == null ? 21 : size,
                    fontWeight: bold == null || bold == false
                        ? FontWeight.normal
                        : FontWeight.w700,
                    fontFamily: 'Sans',
                    fontFamilyFallback: <String>[
                      'Noto',
                    ],
                    decoration: decor == null || decor == false
                        ? TextDecoration.none
                        : underLine == true
                            ? TextDecoration.underline
                            : lineThrough == true
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                    decorationColor: decorColor == null
                        ? AppColors().commonBlack
                        : decorColor,
                    letterSpacing: letterSpace == null ? 0 : letterSpace,
                  )),
              Icon(
                simpleIcon,
                size: size == null ? 21 : size,
                color: color == null ? AppColors().black : color,
              ),
            ],
          );
        } else {
          return Wrap(
            //using this method of text and icon, the icon will always be the last item
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Icon(
                simpleIcon,
                size: size == null ? 21 : size,
                color: color == null ? AppColors().black : color,
              ),
              Text(' ' + text,
              textAlign: alignTextCenter != null ? TextAlign.center : null,
                  textScaleFactor: 1,
                  style: TextStyle(
                    color: color == null ? AppColors().commonBlack : color,
                    fontSize: size == null ? 21 : size,
                    fontWeight: bold == null || bold == false
                        ? FontWeight.normal
                        : FontWeight.w700,
                    fontFamily: 'Sans',
                    fontFamilyFallback: <String>[
                      'Noto',
                    ],
                    decoration: decor == null || decor == false
                        ? TextDecoration.none
                        : underLine == true
                            ? TextDecoration.underline
                            : lineThrough == true
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                    decorationColor: decorColor == null
                        ? AppColors().commonBlack
                        : decorColor,
                    letterSpacing: letterSpace == null ? 0 : letterSpace,
                  )),
            ],
          );
        }
      }
    }
  }
}

// Just a basic text widget (which will be generally used) with max line implementation (for many reasons I do not want to implement max line into the main one)
class CommonTextWithMaxLines extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final bool bold;
  final bool decor;
  final bool underLine;
  final bool lineThrough;
  final Color decorColor;
  final double letterSpace;
  final CommonSvgIconModel svgIcon;
  final IconData simpleIcon;
  final int maxLines;
  final bool alignTextCenter;

  CommonTextWithMaxLines({
    @required this.text,
    this.size,
    this.color,
    this.bold,
    this.decor,
    this.underLine,
    this.lineThrough,
    this.decorColor,
    this.letterSpace,
    this.svgIcon,
    this.simpleIcon,
    this.maxLines,
    this.alignTextCenter,
  });

  @override
  Widget build(BuildContext context) {
    if (svgIcon == null && simpleIcon == null) {
      return Text(text,
         textAlign: alignTextCenter != null ? TextAlign.center : null,
          maxLines: maxLines,
          overflow: TextOverflow.ellipsis,
          textScaleFactor: 1,
          style: TextStyle(
            color: color == null ? AppColors().commonBlack : color,
            fontSize: size == null ? 21 : size,
            fontWeight: bold == null || bold == false
                ? FontWeight.normal
                : FontWeight.w700,
            fontFamily: 'Sans',
            fontFamilyFallback: <String>[
              'Noto',
            ],
            decoration: decor == null || decor == false
                ? TextDecoration.none
                : underLine == true
                    ? TextDecoration.underline
                    : lineThrough == true
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
            decorationColor:
                decorColor == null ? AppColors().commonBlack : decorColor,
            letterSpacing: letterSpace == null ? 0 : letterSpace,
          ));
    } else {
      if (svgIcon != null) {
        return Wrap(
          //using this method of text and svg, the svg will always be the last item
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(text + ' ',
            textAlign: alignTextCenter != null ? TextAlign.center : null,
                maxLines: maxLines,
                overflow: TextOverflow.ellipsis,
                textScaleFactor: 1,
                style: TextStyle(
                  color: color == null ? AppColors().commonBlack : color,
                  fontSize: size == null ? 21 : size,
                  fontWeight: bold == null || bold == false
                      ? FontWeight.normal
                      : FontWeight.w700,
                  fontFamily: 'Sans',
                  fontFamilyFallback: <String>[
                    'Noto',
                  ],
                  decoration: decor == null || decor == false
                      ? TextDecoration.none
                      : underLine == true
                          ? TextDecoration.underline
                          : lineThrough == true
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                  decorationColor:
                      decorColor == null ? AppColors().commonBlack : decorColor,
                  letterSpacing: letterSpace == null ? 0 : letterSpace,
                )),
            CommonSvgIcon(
              svgDetials: svgIcon,
              size: size == null ? 21 : size,
            ),
          ],
        );
      } else {
        return Wrap(
          //using this method of text and icon, the icon will always be the last item
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(text + ' ',
            textAlign: alignTextCenter != null ? TextAlign.center : null,
                maxLines: maxLines,
                overflow: TextOverflow.ellipsis,
                textScaleFactor: 1,
                style: TextStyle(
                  color: color == null ? AppColors().commonBlack : color,
                  fontSize: size == null ? 21 : size,
                  fontWeight: bold == null || bold == false
                      ? FontWeight.normal
                      : FontWeight.w700,
                  fontFamily: 'Sans',
                  fontFamilyFallback: <String>[
                    'Noto',
                  ],
                  decoration: decor == null || decor == false
                      ? TextDecoration.none
                      : underLine == true
                          ? TextDecoration.underline
                          : lineThrough == true
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                  decorationColor:
                      decorColor == null ? AppColors().commonBlack : decorColor,
                  letterSpacing: letterSpace == null ? 0 : letterSpace,
                )),
            Icon(
              simpleIcon,
              size: size == null ? 21 : size,
            ),
          ],
        );
      }
    }
  }
}

//the styling of a common text
TextStyle commonTextStyle(double fontsize) {
  return TextStyle(
    color: AppColors().commonBlack,
    fontSize: fontsize,
    fontWeight: FontWeight.normal,
    fontFamily: 'Sans',
    fontFamilyFallback: <String>[
      'Noto',
    ],
  );
}

// to simplify my use of rich texts
class TheHubRichText extends StatelessWidget {
  final List<CommonText> commonTexts;
  final CommonSvgIconModel svgIcon;
  final double svgIconSize;

  TheHubRichText({@required this.commonTexts, this.svgIcon, this.svgIconSize});

  @override
  Widget build(BuildContext context) {
    List<InlineSpan> textSpans = [];

    for (var i = 0; i < commonTexts.length; i++) {
      textSpans.add(commonTexttoTextSpan(commonTexts[i]));
    }

    if (svgIcon != null) {
      return Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          RichText(
            textScaleFactor: 1,
            text: TextSpan(children: textSpans),
          ),
          CommonSvgIcon(
            svgDetials: svgIcon,
            size: svgIconSize == null ? 21 : svgIconSize,
          ),
        ],
      );
    } else {
      return RichText(
        textScaleFactor: 1,
        text: TextSpan(children: textSpans),
      );
    }
  }
}

// to create a apple like design I am making this rounded container that will sit on top of the bottom modal sheet
Widget roundedModalSheetTopSitter() {
  return MouseRegion(
    cursor: SystemMouseCursors.click,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(9)),
        color: AppColors().grey,
      ),
      height: 5,
      width: 25,
    ),
  );
}

class CommonTextButton extends StatelessWidget {
  final String text;
  final Color iconColor;
  final IconData icon;
  final double textSize;
  final Color textColor;
  final Function onTapped;
  final double width;
  final double height;

  const CommonTextButton(
      {Key key,
      @required this.text,
      this.iconColor,
      this.icon,
      this.textSize,
      this.textColor,
      this.onTapped,
      this.width,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (icon != null) {
      return MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: onTapped,
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                  color: iconColor == null ? AppColors().mainColor : iconColor,
                  borderRadius: BorderRadius.all(Radius.circular(7))),
              child: Padding(
                padding: const EdgeInsets.all(7.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      icon,
                      size: textSize == null ? 14 : textSize,
                      color:
                          textColor == null ? AppColors().textWhite : textColor,
                    ),
                    SizedBox(width: 4),
                    CommonText(
                      text: text,
                      size: textSize == null ? 14 : textSize,
                      color:
                          textColor == null ? AppColors().textWhite : textColor,
                    ),
                  ],
                ),
              ),
            ),
          ));
    } else {
      return MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                  color: iconColor == null ? AppColors().mainColor : iconColor,
                  borderRadius: BorderRadius.all(Radius.circular(7))),
              child: Padding(
                padding: const EdgeInsets.all(7.0),
                child: CommonText(
                  text: text,
                  size: textSize == null ? 14 : textSize,
                  color: textColor == null ? AppColors().textWhite : textColor,
                ),
              ),
            ),
          ));
    }
  }
}


class CommonTextButtonBig extends StatelessWidget {
  final String text;
  final Color buttonColor;
  final IconData icon;
  final Color iconColor;
  final Color buttonBorderColor;
  final double textSize;
  final Color textColor;
  final Function onTapped;
  final double horizontalPadding; //to determine the width
  final CommonSvgIconModel svgIconForText;

  const CommonTextButtonBig(
      {Key key,
      @required this.text,
      this.buttonColor,
      this.icon,
      this.iconColor,
      this.buttonBorderColor,
      this.textSize,
      this.textColor,
      this.onTapped,
      this.horizontalPadding,
      this.svgIconForText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTapped,
        child: Container(
          decoration: BoxDecoration(
              color: buttonColor == null ? AppColors().mainColor.withOpacity(0.8) : buttonColor,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              border: Border.all(color: buttonBorderColor != null ? buttonBorderColor :buttonColor == null ? AppColors().mainColor.withOpacity(0.8) : buttonColor),
              ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding == null ? 25 : horizontalPadding,
                vertical: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                icon != null ?
                Icon(
                  icon,
                  size: textSize == null ? 14 : textSize,
                  color: textColor == null ? AppColors().textWhite : textColor,
                )
                
                :
                
                Container(),

                icon != null ?
                SizedBox(width: 4)
                :
                
                Container(),

                
                CommonText(
                  text: text,
                  size: textSize == null ? 14 : textSize,
                  color: textColor == null ? AppColors().textWhite : textColor,
                  svgIcon: svgIconForText,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  }



class CommonSvgIcon extends StatelessWidget {
  //to simplify my use of svg icons

  final CommonSvgIconModel svgDetials;
  final double size;
  final Color color;

  const CommonSvgIcon(
      {Key key, @required this.svgDetials, this.size, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      svgDetials.assetPath,
      width: size == null ? 21 : size,
      height: size == null ? 21 : size,
      color: color == null ? null : color,
      semanticsLabel: svgDetials.label,
      placeholderBuilder: (BuildContext context) => Icon(
        svgDetials.placeHolder,
        size: size == null ? 21 : size,
        color: color == null ? AppColors().commonBlack : color,
      ),
    );
  }
}

class CommonTextField extends StatelessWidget {
  final TextEditingController controller;
  final int maxLines;
  final int minLines;
  final String hintText;
  final int maxLength;
  final Function onChanged;

  const CommonTextField(
      {Key key,
      @required this.controller,
      this.maxLines,
      this.hintText,
      this.maxLength,
      this.onChanged,
      this.minLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (maxLength == null) {
      return Padding(
        //do not remove or change padding it is important concerning the stacked counter
        padding: EdgeInsets.symmetric(vertical: 5.0),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: TextField(
            controller: controller,
            style: commonTextStyle(19),
            minLines: minLines == null ? 1 : minLines,
            maxLines: maxLines == null ? null : maxLines,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(20),
              filled: true,
              fillColor: AppColors().grey.withOpacity(0.2),
              hintText: hintText == null ? 'Type here..' : hintText,
              hintStyle: TextStyle(
                color: AppColors().grey,
                fontSize: 19,
                fontWeight: FontWeight.normal,
                fontFamily: 'Sans',
                fontFamilyFallback: <String>[
                  'Noto',
                ],
              ),
              counterText: '',
              enabledBorder: InputBorder.none,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
            maxLength: maxLength == null ? null : maxLength,
          ),
        ),
      );
    } else {
      return Stack(
        children: [
          Padding(
            //do not remove or change padding it is important concerning the stacked counter
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: TextField(
                controller: controller,
                onChanged: (_) => onChanged(),
                style: commonTextStyle(19),
                minLines: minLines == null ? 1 : minLines,
                maxLines: maxLines == null ? null : maxLines,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(20),
                  filled: true,
                  fillColor: AppColors().grey.withOpacity(0.2),
                  hintText: hintText == null ? 'Type here..' : hintText,
                  hintStyle: TextStyle(
                    color: AppColors().grey,
                    fontSize: 19,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Sans',
                    fontFamilyFallback: <String>[
                      'Noto',
                    ],
                  ),
                  counterText: '',
                  enabledBorder: InputBorder.none,
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                maxLength: maxLength == null ? null : maxLength,
              ),
            ),
          ),
          Positioned(
              right: 10,
              top: 0,
              child: CommonTextFieldCounter(
                  currentCount: controller.text.length, totalCount: maxLength))
        ],
      );
    }
  }
}

//a custom counter for textfields

class CommonTextFieldCounter extends StatelessWidget {
  final int currentCount;
  final int totalCount;

  const CommonTextFieldCounter(
      {Key key, @required this.currentCount, @required this.totalCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors().mainColor.withOpacity(0.2),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Center(
          child: CommonText(text: '$currentCount/$totalCount', size: 14)),
    );
  }
}

//
ScrollController _commonBottomSheetMobileScrollContoller;

//to make my use of bottom sheets in mobile view simplified
class CommonBottomSheetMobile extends StatefulWidget {
  final List<Widget> widgets;
  final List<Widget> topWidgets;
  final Color color;
  final String mainButtonText;
  final Color mainButtonColor;
  final Function mainButtonOnTapped;
  final Function refreshMe;
  final CommonSvgIconModel mainButtonSvgIcon;
  final double heightPercentage;

  const CommonBottomSheetMobile(
      {Key key,
      @required this.widgets,
      this.color,
      this.mainButtonText,
      this.mainButtonColor,
      this.mainButtonOnTapped,
      this.topWidgets,
      @required this.refreshMe,
      this.mainButtonSvgIcon,
      this.heightPercentage})
      : super(key: key);

  @override
  _CommonBottomSheetMobileState createState() =>
      _CommonBottomSheetMobileState();
}

class _CommonBottomSheetMobileState extends State<CommonBottomSheetMobile> {
  @override
  Widget build(BuildContext context) {
    if (widget.mainButtonText == null) {
      return Container(
        height: widget.heightPercentage == null
            ? MediaQuery.of(context).size.height * 0.9
            : MediaQuery.of(context).size.height * widget.heightPercentage,
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(top: 60),
              child: SingleChildScrollView(
                //controller: _commonBottomSheetMobileScrollContoller,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: widget.widgets),
              ),
            ),

            //top widgets
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: AppColors().white,
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: widget.topWidgets),
              ),
            ),
          ],
        ),
      );
    } else {
      return Container(
        height: MediaQuery.of(context).size.height * 0.9,
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 30),
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(top: 60),
              child: SingleChildScrollView(
                //controller: _commonBottomSheetMobileScrollContoller,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: widget.widgets),
              ),
            ),

            //main button
            Align(
                alignment: Alignment.bottomCenter,
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () => widget.mainButtonOnTapped(),
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors().mainColor,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 80, vertical: 12.5),
                        child: CommonText(
                          text: widget.mainButtonText,
                          size: 14,
                          color: AppColors().textWhite,
                          svgIcon: widget.mainButtonSvgIcon,
                        ),
                      ),
                    ),
                  ),
                )),

            //top widgets
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: AppColors().white,
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: widget.topWidgets),
              ),
            ),
          ],
        ),
      );
    }
  }
}

//call a bottom sheet

callBottomModalSheet(
  BuildContext context,
  double heightPercentage,
  List<Widget> topWidgets,
  List<Widget> widgets,
) {
  return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: AppColors().white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (BuildContext context,
            StateSetter setState /*You can rename this!*/) {
          Function refresh = () {
            setState(() {});
          };
          return CommonBottomSheetMobile(
              widgets: widgets,
              topWidgets: topWidgets,
              refreshMe: () => refresh(),
              heightPercentage: heightPercentage);
        });
      });
}

Widget yesOrNoRadioButtons(
    bool isYes, Function yesPressed, Function noPressed) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      //Yes

      MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              yesPressed();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CommonText(
                  text: 'Yes',
                  size: 15,
                ),
                SizedBox(width: 5),
                Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors().grey),
                      shape: BoxShape.circle,
                      color: isYes
                          ? AppColors().mainColor.withOpacity(0.5)
                          : Colors.transparent),
                ),
              ],
            ),
          )),

      SizedBox(width: 20),

      //No

      MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              noPressed();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CommonText(
                  text: 'No',
                  size: 15,
                ),
                SizedBox(width: 5),
                Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors().grey),
                      shape: BoxShape.circle,
                      color: !isYes
                          ? AppColors().mainColor.withOpacity(0.5)
                          : Colors.transparent),
                ),
              ],
            ),
          )),
    ],
  );
}

Widget customOptionsRadioButtons(BuildContext context, bool isYes,
    Function yesPressed, Function noPressed, String yesText, String noText) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      //Yes

      MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              yesPressed();
            },
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 100,
                  child: Wrap(
                    children: [
                      CommonText(
                        text: yesText,
                        size: 17,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors().grey),
                      shape: BoxShape.circle,
                      color: isYes
                          ? AppColors().mainColor.withOpacity(0.5)
                          : Colors.transparent),
                ),
              ],
            ),
          )),

      SizedBox(height: 20),

      //No

      MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              noPressed();
            },
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 100,
                  child: Wrap(
                    children: [
                      CommonText(
                        text: noText,
                        size: 17,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors().grey),
                      shape: BoxShape.circle,
                      color: !isYes
                          ? AppColors().mainColor.withOpacity(0.5)
                          : Colors.transparent),
                ),
              ],
            ),
          )),
    ],
  );
}

loadingWave(BuildContext context, dynamic size, Color color) {
  return Center(
      child: SpinKitWave(
    color: color,
    size: size,
  ));
}

Widget cachedNetworkImage(
    BuildContext context,
    String mediaUrl,
    double placeHolderHeight,
    double placeHolderWidth,
    String hash,
    bool showCurve,
    bool showError) {
  return ClipRRect(
    borderRadius:
        showCurve ? BorderRadius.all(Radius.circular(10)) : BorderRadius.zero,
    child: CachedNetworkImage(
      imageUrl: mediaUrl,
      fit: BoxFit.cover,
      placeholder: (context, url) => Container(
        decoration: BoxDecoration(
          borderRadius: showCurve
              ? BorderRadius.all(Radius.circular(10))
              : BorderRadius.zero,
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [
                0.3,
                1
              ],
              colors: [
                Colors.grey[700],
                Colors.grey,
              ]),
        ),
        height: placeHolderHeight,
        width: placeHolderWidth,
      ),
      errorWidget: (context, url, error) => showError
          ? Center(
              child: Text('Oops, there was an error loading the image 😢',
                  textScaleFactor: 1,
                  style: TextStyle(
                    color: AppColors().commonBlack,
                    fontSize: 21,
                    fontFamily: 'Noto',
                  )),
            )
          : Container(
              decoration: BoxDecoration(
                borderRadius: showCurve
                    ? BorderRadius.all(Radius.circular(10))
                    : BorderRadius.zero,
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [
                      0.3,
                      1
                    ],
                    colors: [
                      Colors.grey[700],
                      Colors.grey,
                    ]),
              ),
              height: placeHolderHeight,
              width: placeHolderWidth,
            ),
    ),
  );
}

Widget sliderImage(BuildContext context, String mediaUrl, double imageHeight,
    double imageWidth, bool curveImage) {
  return ClipRRect(
    borderRadius:
        curveImage ? BorderRadius.all(Radius.circular(10)) : BorderRadius.zero,
      child: Container(
      height: imageHeight,
      width: imageWidth,
      child: cachedNetworkImage(
          context, mediaUrl, imageHeight, imageWidth, '', curveImage, false),
    ),
  );
}

Widget imagesSlider(
    BuildContext context, List<String> imageList, double height, double width, bool curveImage) {
  //widget the contains image slider
  return ClipRRect(
    borderRadius:
        curveImage ? BorderRadius.all(Radius.circular(10)) : BorderRadius.zero,
      child: CarouselSlider(
      options: CarouselOptions(
        height: height,
        viewportFraction: 1,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 7),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        scrollDirection: Axis.horizontal,
        // onPageChanged: (index, reason) {
        //   currentLinkIndex = index;
        //   refresh();
        // }
      ),
      items: imageList.map((i) {
        return sliderImage(context, i, height, width, curveImage);
      }).toList(),
    ),
  );

}



class BottomInfo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  //bottom info
               Padding(
                           padding: const EdgeInsets.symmetric(vertical: 40),
                           child: Center(
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                               crossAxisAlignment: CrossAxisAlignment.center,
                               children: [
                                 CommonText(
                                      text: 'Copyright ${DateTime.now().year} | ${CompanyData().name}',
                                      size: 17,
                                      color: AppColors().grey,
                                    ),


                                     MouseRegion(
                       cursor: SystemMouseCursors.click,
                       
                                  child: GestureDetector(
                                    onTap: (){},
                                                                            child: TheHubRichText(commonTexts: [
                                         CommonText(
                                        text: 'Made by',
                                        size: 17,
                                        color: AppColors().grey,
                                    ),
                                    CommonText(
                                        text: ' Triplex Creativity',
                                        size: 17,
                                        color: AppColors().simpleBlue,
                                    ),
                                       ]),
                                     )
                                     )
                               ]
                             ),
                           ),
                         );
  }
}

commonAppBar(Widget leading, String titleX, bool centerTitle, List<Widget> actions, Color backGroundColor) {
   return AppBar(
      leading: leading,
      elevation: 0,
      backgroundColor: backGroundColor,
      title: CommonText(text: titleX, color: AppColors().black, size: 19, ),
      titleSpacing: 10,
      centerTitle: centerTitle,
      actions: actions,
    );
}

class CancelBottomSheetButton extends StatelessWidget {
  final IconData cancelIcon;
  final Color iconColor;
  final Color containerColor;
  final Function onTapped;

  const CancelBottomSheetButton(
      {Key key,
      this.cancelIcon,
      this.iconColor,
      this.containerColor,
      @required this.onTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTapped,
        child: Container(
          decoration: BoxDecoration(
            color: containerColor == null
                ? AppColors().grey.withOpacity(0.2)
                : containerColor,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          width: 35,
          height: 35,
          child: Center(
            child: Icon(
              cancelIcon == null ? Icons.close : cancelIcon,
              color: iconColor == null ? AppColors().mainColor : iconColor,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}


class CommonOptionContainerType1 extends StatelessWidget {

  final String title;
  final double titleSize;
  final Function onTap;

  const CommonOptionContainerType1({Key key, @required this.title, this.titleSize, @required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            width: MediaQuery.of(context).size.width,
            child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               
              CommonText(
                text: title,
                size: titleSize == null ? 18 : titleSize,
                color: AppColors().black,
              ),

              Icon(
                CupertinoIcons.forward, 
                size: 24, 
                color: AppColors().mainColor,
              ),

             ],
            ),
          ),

          Divider(thickness: 1, color: AppColors().blandGrey, height: 1,),
        ],
      ),
    );
  }
}


class CommonOptionContainerType2 extends StatelessWidget {

  final String title;
  final double titleSize;
  final IconData icon;
  final Function onTap;
  final bool isEndArranged;

  const CommonOptionContainerType2({Key key, @required this.title, this.titleSize, @required this.icon, @required this.onTap, @required this.isEndArranged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        width: MediaQuery.of(context).size.width,
        child: Row(
             mainAxisAlignment: isEndArranged ? MainAxisAlignment.end : MainAxisAlignment.start,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [

              Icon(
                icon, 
                size: 24, 
                color: AppColors().black,
              ),



              SizedBox(width: 20),

               
              CommonText(
                text: title,
                size: titleSize == null ? 18 : titleSize,
                color: AppColors().black,
              ),

             ],
            ),
      ),
    );
  }
}


class CommonOptionContainerType3 extends StatelessWidget {

  final String title;
  final double titleSize;
  final String subText;
  final double subTextSize;
  final Function onTap;

  const CommonOptionContainerType3({Key key, @required this.title, this.titleSize, @required this.onTap, this.subText, this.subTextSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            width: MediaQuery.of(context).size.width,
            child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                
                  CommonText(
                    text: title,
                    size: titleSize == null ? 18 : titleSize,
                    color: AppColors().black,
                  ),
                
                  SizedBox(height: 10,),
                
                  CommonText(
                    text: subText,
                    size: subTextSize == null ? 18 : subTextSize,
                    color: AppColors().darkGrey,
                  ),
                ],
              ),
                
              Icon(
                CupertinoIcons.forward, 
                size: 24, 
                color: AppColors().mainColor,
              ),
                
             ],
            ),
          ),
        ),

        Divider(thickness: 1, color: AppColors().blandGrey, height: 1,),
      ],
    );
  }
}
