import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:dailyreflections/general/allExports.dart';
import 'package:ionicons/ionicons.dart';

//
final _pages = [
  BottomNavIcons(
    'Reflections',
    Ionicons.home_outline,
    Feeds(),
  ),
  BottomNavIcons(
    'Bible',
    Ionicons.book_outline,
    Bible(),
  ),
  BottomNavIcons(
    'Add',
    Ionicons.add_outline,
    Container(),
  ),
  BottomNavIcons(
    'Bookmarks',
    Ionicons.bookmark_outline,
    BookMarks(),
  ),
  BottomNavIcons(
    'Profile',
    Ionicons.person_add_outline,
    Profile(),
  ),
];

//
bool hasRunLauchSubAppFunction = false;
int selectedPageIndex = 0;

lauchSubAppFunction() async {
  //functions that need to be run at the start of the app

  await Future.delayed(Duration(seconds: 2));

  return 'done'; // it just needs to return anything to state the function is done!
}

class AppLoader extends StatefulWidget {
  @override
  _AppLoaderState createState() => _AppLoaderState();
}

class _AppLoaderState extends State<AppLoader> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: lauchSubAppFunction(), //IMPORTANT
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Scaffold(
              backgroundColor: AppColors().textWhite,
              body: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                    TheHubRichText(commonTexts: [
                      CommonText(
                        text: 'Daily ',
                        color: AppColors().darkGrey,
                        size: 35,
                      ),
                      CommonText(
                        text: 'Reflections',
                        color: AppColors().darkGrey,
                        size: 35,
                      ),
                    ]),
                  ])));
        } else {
          return Scaffold(
            backgroundColor: AppColors().textWhite,
            body: Center(
                child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: _pages[selectedPageIndex].page,
            )),
            bottomNavigationBar: bottomNavBar(context, () => setState(() {})),
          );
        }
      },
    );
  }
}

Widget bottomNavBar(BuildContext context, Function refreshApp) {
  return Container(
    padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
    margin: EdgeInsets.only(bottom: 5, left: 10, right: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      color: AppColors().mainColor.withOpacity(0.15),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: _pages.map((page) {
        return MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                if (_pages.indexOf(page) == 2) {
                  //add page

                  //to first take it to the home page if its not

                  if (selectedPageIndex != 0) {
                    selectedPageIndex = 0;
                    refreshApp();
                  }

                  //call bottom modal sheet here!!!!!!!!!!!!!!

                } else {
                  selectedPageIndex = _pages.indexOf(page);
                  refreshApp();
                }
              },
              child: _pages.indexOf(page) == 2  ?  //add task page

                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors().mainColor.withOpacity(0.8),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          width: 40,
                          height: 40,
                          child: Center(
                            child: Icon(page.pageIcon,
                            color: AppColors().textWhite,
                            size: 20),
                          ),
                        ),
                        SizedBox(height: 5),
                        Container(
                          width: 5,
                          height: 5,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.transparent,
                          ),
                        )
                      ],
                    )


                  : 
                  
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(page.pageIcon,
                            color: selectedPageIndex == _pages.indexOf(page)
                                ? AppColors().mainColor
                                : AppColors().darkGrey,
                            size: 21),
                        SizedBox(height: 5),
                        Container(
                          width: 5,
                          height: 5,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: selectedPageIndex == _pages.indexOf(page)
                                ? AppColors().mainColor
                                : Colors.transparent,
                          ),
                        )
                      ],
                    ),
            ));
      }).toList(),
    ),
  );
}
