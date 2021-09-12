import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'allExports.dart';

//this fuction is used by my TheHubRichTextWidget to help convert CommonText to TextSpan
InlineSpan commonTexttoTextSpan(CommonText commonText) {
  return TextSpan(
      text: commonText.text,
      style: TextStyle(
        color: commonText.color == null
            ? AppColors().commonBlack
            : commonText.color,
        fontSize: commonText.size == null ? 21 : commonText.size,
        fontWeight: commonText.bold == null || commonText.bold == false
            ? FontWeight.normal
            : FontWeight.bold,
        fontFamily: 'Sans',
        decoration: commonText.decor == null || commonText.decor == false
            ? TextDecoration.none
            : commonText.underLine == true
                ? TextDecoration.underline
                : commonText.lineThrough == true
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
        decorationColor: commonText.color == null
            ? AppColors().commonBlack
            : commonText.color,
        letterSpacing:
            commonText.letterSpace == null ? 0 : commonText.letterSpace,
      ));
}

/// Calculates number of weeks for a given year as per https://en.wikipedia.org/wiki/ISO_week_date#Weeks_per_year
int numOfWeeks(int year) {
  DateTime dec28 = DateTime(year, 12, 28);
  int dayOfDec28 = int.parse(DateFormat("D").format(dec28));
  return ((dayOfDec28 - dec28.weekday + 10) / 7).floor();
}

/// Calculates week number from a date as per https://en.wikipedia.org/wiki/ISO_week_date#Calculation
int weekNumber(DateTime date) {
  int dayOfYear = int.parse(DateFormat("D").format(date));
  int woy = ((dayOfYear - date.weekday + 10) / 7).floor();
  if (woy < 1) {
    woy = numOfWeeks(date.year - 1);
  } else if (woy > numOfWeeks(date.year)) {
    woy = 1;
  }
  return woy;
}

showSnackLong(BuildContext context, String text, bool shouldBeRed) {
  if (shouldBeRed) {
     showToast('$text',
        context: context,
        backgroundColor: AppColors().deepRed,
        textAlign: TextAlign.center,
        textStyle: TextStyle(
    color: AppColors().textWhite,
    fontSize: 17,
    fontWeight: FontWeight.normal,
    fontFamily: 'Sans',
    fontFamilyFallback: <String>[
      'Noto',
      
    ],
  ),
        textPadding: EdgeInsets.all(15),
        toastHorizontalMargin: 7,
        borderRadius: BorderRadius.all(Radius.circular(10)),
                    animation: StyledToastAnimation.slideFromTop,
                    reverseAnimation: StyledToastAnimation.slideToTop,
                    position: StyledToastPosition.top,
                    startOffset: Offset(0.0, -3.0),
                    reverseEndOffset: Offset(0.0, -3.0),
                    duration: Duration(seconds: 7),
                    //Animation duration   animDuration * 2 <= duration
                    animDuration: Duration(seconds: 2),
                    curve: Curves.elasticOut,
                    reverseCurve: Curves.fastOutSlowIn);

  } else {
    showToast('$text',
        context: context,
        backgroundColor: AppColors().simpleBlue,
        textAlign: TextAlign.center,
        textStyle: TextStyle(
    color: AppColors().textWhite,
    fontSize: 17,
    fontWeight: FontWeight.normal,
    fontFamily: 'Sans',
    fontFamilyFallback: <String>[
      'Noto',
      
    ],
  ),
        textPadding: EdgeInsets.all(15),
        toastHorizontalMargin: 7,
        borderRadius: BorderRadius.all(Radius.circular(10)),
                    animation: StyledToastAnimation.slideFromTop,
                    reverseAnimation: StyledToastAnimation.slideToTop,
                    position: StyledToastPosition.top,
                    startOffset: Offset(0.0, -3.0),
                    reverseEndOffset: Offset(0.0, -3.0),
                    duration: Duration(seconds: 7),
                    //Animation duration   animDuration * 2 <= duration
                    animDuration: Duration(seconds: 2),
                    curve: Curves.elasticOut,
                    reverseCurve: Curves.fastOutSlowIn);
  }
}

String getTimeOfTheDay() {

  var hour24format = DateTime.now().hour;

  if(hour24format == 0) {

    return 'Good Morning';

  } else if(hour24format > 0 && hour24format < 12) {

    return 'Good Morning';

  } else if(hour24format >= 12 && hour24format < 17) {

    return 'Good Afternoon';

  } else {

    return 'Good Evening';

  }

}

String durationToReadableString(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, "0");
  String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));


  
 if(twoDigitMinutes == '01') { //to correct mins to min
    if(duration.inHours == 0) {
    return "$twoDigitMinutes min";
  } else if(duration.inHours == 1) {
    return "${duration.inHours}hr $twoDigitMinutes min";
  } else {
    return "${duration.inHours}hrs $twoDigitMinutes min";
  }
  
 } else {
    if(duration.inHours == 0) {
    return "$twoDigitMinutes mins";
  } else if(duration.inHours == 1) {
    return "${duration.inHours}hr $twoDigitMinutes mins";
  } else {
    return "${duration.inHours}hrs $twoDigitMinutes mins";
  }
  
 }


}


bool isSameDate(DateTime that, DateTime other) {
    return that.year == other.year && that.month == other.month
           && that.day == other.day;
  }


String priceFormatter(int price) {
  var formatter = NumberFormat("#,##0");
  return formatter.format(price);
}


//to launch email app
launchEmail(String email) async{

  await launch('mailto:$email?subject=');

}


//to launch phone call app
launchPhone(String phoneNum) async{

  await launch('tel:$phoneNum');

}

//to launch whatsapp
launchWhatsApp(String phoneNum) async{

  await launch('https://wa.me/$phoneNum');

}


