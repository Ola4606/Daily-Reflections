import 'allExports.dart';

//all app colors come from here cause of the use of dark and light mode in this app
bool appIsLightMode = true;


class AppColors {
   
  Color mainColor = appIsLightMode ? CompanyData().color1 : CompanyData().color1;
  Color commonBlack = appIsLightMode ? Colors.black87 : Colors.white;
  Color blandGrey = appIsLightMode ? Colors.grey[200] : Colors.grey[200];
  Color deepRed = appIsLightMode ? Colors.red[700] : Colors.red[400];
  Color textWhite = appIsLightMode ? Colors.white : Colors.white;
  Color white = appIsLightMode ? Colors.white : Colors.blueGrey[800];
  Color simpleBlue = appIsLightMode ? Colors.blue[400] : Colors.blue[300];
  Color simpleRed = appIsLightMode ? Colors.red[400] : Colors.red[300];
  Color simpleGreen = appIsLightMode ? Colors.green[400] : Colors.green[300];
  Color grey = appIsLightMode ? Colors.grey : Colors.white60;
  Color blandBlack = appIsLightMode ? Colors.black54 : Colors.white60;
  Color black = appIsLightMode ? Colors.black : Colors.white;
  Color red = appIsLightMode ? Colors.red : Colors.red[400];
  Color blueAcc = appIsLightMode ? Colors.blueAccent : Colors.blueAccent;
  Color redAcc = appIsLightMode ? Colors.redAccent : Colors.redAccent;
  Color greenAcc = appIsLightMode ? Colors.greenAccent : Colors.greenAccent;
  Color blandGrey3 = appIsLightMode ? Colors.grey[300] : Colors.grey[200];
  Color darkGrey = appIsLightMode ? Colors.grey[700] : Colors.grey[350];
  Color scaffoldColor = appIsLightMode ? Colors.grey[200] : Colors.blueGrey[900];

}
