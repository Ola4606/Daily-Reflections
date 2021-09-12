import 'package:dailyreflections/general/allExports.dart';

class Feeds extends StatefulWidget {
  @override
  _FeedsState createState() => _FeedsState();
}

class _FeedsState extends State<Feeds> {
  @override
  Widget build(BuildContext context) {
    String _timeOfDay = getTimeOfTheDay();

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50,
          ), //IMPORTANT

          TheHubRichText(commonTexts: [
            CommonText(
              text: 'Daily Reflections\n',
              size: 30,
              color: AppColors().black,
            ),
            CommonText(
              text: '$_timeOfDay, here is today\'s Bible backed reflection...',
              size: 17,
              color: Colors.grey,
            ),
          ]),

          SizedBox(
            height: 30,
          ),

          CommonText(
            text: 'Rest',
            size: 27,
            color: AppColors().black,
          ),
          
          CommonText(
            text: 'Backed By: Proverbs 27:23',
            size: 18,
            color: AppColors().mainColor,
          ),

          SizedBox(
            height: 20,
          ),
          

          CommonText(
            text: '''The psalmist discovered the secret to true rest for his soul. With the frantic pace of modern day living and enormous responsibilities, most people are seeking true rest for the soul. True rest for the soul can be found by trusting in God the maker of heaven and earth. Are you seeking true rest for your wearied soul? Put your trust in God Almighty.
\"Truly my soul finds rest in God. My salvation comes from him. Truly He is my rock and my salvation. He is my fortress, l will never be shaken\"''',
            size: 20,
            color: AppColors().commonBlack,
          ),

           SizedBox(
            height: 25,
          ),

          CommonText(
            text: 'Reflections by Adenike Otoide',
            size: 17,
            color: AppColors().grey,
            alignTextCenter: true,
          ),
          CommonText(
            text: 'Day 244 | Sep, 1 2021',
            size: 17,
            color: AppColors().grey,
          ),

          SizedBox(
            height: 25,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //  Container(
              //    width: ((MediaQuery.of(context).size.width  / 2) - 42.5), //42.5 os 30(apploader padding) plus 12.5(half the sizedbox width)
              //  ),
              CommonTextButtonBig(
                text: 'More Options',
                buttonColor: AppColors().textWhite,
                textColor: AppColors().black,
                buttonBorderColor: AppColors().darkGrey,
                onTapped: () {
                  showMoreOptions(context);
                },
              ),

              SizedBox(
                width: 25,
              ),

              CommonTextButtonBig(
                text: 'Share',
                buttonColor: AppColors().mainColor,
                textColor: AppColors().textWhite,
              ),
            ],
          ),

         

          SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}

// shows bottom modal sheet for more options
showMoreOptions(BuildContext context) {
  showModalBottomSheet(
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
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return CommonBottomSheetMobile(
            heightPercentage: 0.65,
            refreshMe: () => setState(() {}),
            topWidgets: [
              Center(child: roundedModalSheetTopSitter()),

              SizedBox(height: 19), //common space

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(),
                  CancelBottomSheetButton(
                      onTapped: () => Navigator.pop(context)),
                ],
              ),
            ],
            widgets: [
              SizedBox(height: 17), //common space

              CommonText(
                text: 'More Options:',
              ),

              SizedBox(height: 20), //common space

              CommonOptionContainerType3(
                onTap: () {},
                title: 'Share Reflection',
                titleSize: 19,
                subText: 'Share this reflections with others',
                subTextSize: 17,
              ),

              CommonOptionContainerType3(
                onTap: () {},
                title: 'Bookmark Reflection',
                titleSize: 19,
                subText: 'Save reflection in your bookmarks',
                subTextSize: 17,
              ),

              CommonOptionContainerType3(
                onTap: () {},
                title: 'Comment',
                titleSize: 19,
                subText: 'Send a special message to the writer',
                subTextSize: 17,
                
              )
            ],
          );
        });
      });
}
