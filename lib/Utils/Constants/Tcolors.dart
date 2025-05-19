
import 'package:flutter/cupertino.dart';

class Tcolors{
  Tcolors._();
  //gradient Colors
  static const Gradient Welcomebackgroundcolor = LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
      Color(0xFF3BB5BE),
        Color(0xFFECEFF2)


      ]);
  static const Gradient logotext = LinearGradient(
      begin: Alignment(0.0, 0.0),
      end: Alignment(0.707, -0.707),
      colors: [

        Color(0xFFFFFFFF),
        Color(0xFFADE9B8),


        Color(0xFFDBD3E9)

      ]);


  static const Gradient homebackgroundcolor = LinearGradient(
      begin: Alignment(0.0, 0.0),
      end: Alignment(0.707, -0.707),
      colors: [
        Color(0xFFDBD3E9),
        Color(0xFFEFEBF6),
        Color(0xFFE9EDF7)

      ]);
  static const Gradient VIZBUTTON = LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        Color(0xFFDD7C52),
        Color(0xFFFE5271),
        Color(0xFFEA4891),
      ]);


  static const Gradient Homeiconcolor = LinearGradient(
  begin: Alignment(0.0, 0.0),
  end: Alignment(0.707, -0.707),
  colors: [
    Color(0xFFD99CCA),
    Color(0xFF90B9CE)
  ]);


  //appbar
  static const Color onboadcontainercolor=Color(0xFF0F818A);
  static const Color arrowcontainercolor=Color(0xFFFF7B1A);
  static const Color studeymaterialappbar=Color(0xFF3BB5BE);
  static const Color studmaterial_selectioncolor=Color(0xFF4CADDA);


//text
  static const Color viz_header_color=Color(0xFF7F48BE);
  static const Color viz_subheader=Color(0xFF4CADDA);
  static const Color viz_login_color=Color(0xFF3BB5BE);



//background

}