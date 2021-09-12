import 'package:ionicons/ionicons.dart';

import 'allExports.dart';

class CommonSvgIconModel {//model for svg icons of theHub
  final String assetPath;
  final String label;
  final IconData placeHolder;

  CommonSvgIconModel(this.assetPath, this.label, this.placeHolder);
}

class AppIcons {
  
  //home bottom navBar
  var bikes = CommonSvgIconModel('assets/icons/bikes.svg', 'Bikes', Icons.home);

}