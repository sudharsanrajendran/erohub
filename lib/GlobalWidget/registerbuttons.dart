import 'package:flutter/material.dart';

class VizBottomBar extends StatefulWidget {
  final Color backgroundcolor;
  final Color backgroundfirstcolor;
  final Color backgroundsecondcolor;
  final Color borderfirstcolor;
  final Color bordersecondcolor;
  final Widget loginontap;
  final Widget registerontap;
  final Color textColor1;
  final Color textColor2;
  const VizBottomBar({
    super.key,
    required this.backgroundcolor,
    required this.backgroundfirstcolor,
    required this.backgroundsecondcolor,
    required this.borderfirstcolor,
    required this.bordersecondcolor,
    required this.loginontap,
    required this.registerontap,
    required this.textColor1, required this.textColor2,
  });

  @override
  State<VizBottomBar> createState() => _VizBottomBarState();
}

class _VizBottomBarState extends State<VizBottomBar> {
  bool isFirstButtonSelected = false;
  bool isSecondButtonSelected = false;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: widget.backgroundcolor,
      child: SizedBox(
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  isFirstButtonSelected = true;
                });
                Future.delayed(const Duration(milliseconds: 200), () {
                  setState(() {
                    isFirstButtonSelected = false;
                  });
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => widget.loginontap),
                  );
                });
              },
              child: Container(
                height: 40,
                width: 130,
                decoration: BoxDecoration(
                  color: isFirstButtonSelected
                      ? widget.backgroundfirstcolor
                      : widget.backgroundsecondcolor,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: isFirstButtonSelected
                        ? widget.borderfirstcolor
                        : widget.bordersecondcolor,
                    width: 3.0,
                  ),
                ),
                child: Center(
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: isFirstButtonSelected ? widget.textColor1 : widget.textColor2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isSecondButtonSelected = true;
                });
                Future.delayed(const Duration(milliseconds: 200), () {
                  setState(() {
                    isSecondButtonSelected = false;
                  });
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => widget.registerontap),
                  );
                });
              },
              child: Container(
                height: 40,
                width: 130,
                decoration: BoxDecoration(
                  color: isSecondButtonSelected
                      ? widget.backgroundfirstcolor
                      : widget.backgroundsecondcolor,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: isSecondButtonSelected
                        ? widget.borderfirstcolor
                        : widget.bordersecondcolor,
                    width: 3.0,
                  ),
                ),
                child: Center(
                  child: Text(
                    "Register",
                    style: TextStyle(
                      color: isSecondButtonSelected ? widget.textColor1 : widget.textColor2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
