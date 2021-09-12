
import 'package:flutter/services.dart';
import 'general/allExports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Hive.initFlutter(); //IMPORTANT
  //  Hive.registerAdapter(TodoAdapter());

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors().textWhite, // navigation bar color
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarColor: AppColors().textWhite, // status bar color
        statusBarIconBrightness: Brightness.dark));

    return MaterialApp(
        title: CompanyData().name,
        debugShowCheckedModeBanner: false,

        // darkTheme: ThemeData(
        //   brightness: Brightness.light,
        //   primarySwatch: primaryColorMaterial,
        //   scaffoldBackgroundColor: TheHubColors().white,
        // ),
        home: AppLoader());
  }
}
