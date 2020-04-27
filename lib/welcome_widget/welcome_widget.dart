/*
*  welcome_widget.dart
*  Spacebook
*
*  Created by Supernova.
*  Copyright © 2018 Supernova. All rights reserved.
    */

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:spacebook/login_widget/login_widget.dart';
import 'package:spacebook/signup_widget/signup_widget.dart';
import 'package:spacebook/values/values.dart';
import 'package:spacebook/welcome_widget/welcome_widget_animation1_element1.dart';
import 'package:spacebook/welcome_widget/welcome_widget_animation1_element2.dart';
import 'package:spacebook/welcome_widget/welcome_widget_animation1_element3.dart';


class WelcomeWidget extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() => _WelcomeWidgetState();
}


class _WelcomeWidgetState extends State<WelcomeWidget> with TickerProviderStateMixin {
  AnimationController spacebookTextAnimationController;
  AnimationController conquerTheStarsTextAnimationController;
  AnimationController logoImageAnimationController;
  
  @override
  void initState() {
  
    super.initState();
    
    this.spacebookTextAnimationController = AnimationController(duration: Duration(milliseconds: 1000), vsync: this);
    this.conquerTheStarsTextAnimationController = AnimationController(duration: Duration(milliseconds: 1000), vsync: this);
    this.logoImageAnimationController = AnimationController(duration: Duration(milliseconds: 2000), vsync: this);
    
    this.startAnimationOne();
  }
  
  @override
  void dispose() {
  
    super.dispose();
    
    this.spacebookTextAnimationController.dispose();
    this.conquerTheStarsTextAnimationController.dispose();
    this.logoImageAnimationController.dispose();
  }
  
  void onSignUpPressed(BuildContext context) => Navigator.push(context, MaterialPageRoute(builder: (context) => SignupWidget()));
  
  void onLogInPressed(BuildContext context) => Navigator.push(context, MaterialPageRoute(builder: (context) => LoginWidget()));
  
  void startAnimationOne() {
  
    this.spacebookTextAnimationController.forward();
    this.conquerTheStarsTextAnimationController.forward();
    this.logoImageAnimationController.forward();
  }
  
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.31089, 1.09827),
            end: Alignment(0.68911, -0.09827),
            stops: [
              0,
              1,
            ],
            colors: [
              Color.fromARGB(255, 248, 132, 98),
              Color.fromARGB(255, 140, 28, 140),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(top: 128),
                child: WelcomeWidgetAnimation1Element3(
                  animationController: this.logoImageAnimationController,
                  builder: (context, state, widget) {
                  
                    return Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: state.borderColor,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(51, 0, 0, 0),
                            offset: Offset(0, 20),
                            blurRadius: 25,
                          ),
                        ],
                      ),
                      child: widget,
                    );
                  },
                  child: Image.asset(
                    "assets/images/logo.png",
                    fit: BoxFit.none,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 206,
                height: 57,
                margin: EdgeInsets.only(top: 25),
                child: WelcomeWidgetAnimation1Element1(
                  animationController: this.spacebookTextAnimationController,
                  child: Text(
                    "Spacebook",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.accentText,
                      fontFamily: "Lato",
                      fontWeight: FontWeight.w400,
                      fontSize: 42,
                      letterSpacing: -1,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(top: 20),
                child: WelcomeWidgetAnimation1Element2(
                  animationController: this.conquerTheStarsTextAnimationController,
                  child: Text(
                    "Conquer the stars\nfrom behind the screen.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.accentText,
                      fontFamily: "Lato",
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
            Spacer(),
            Container(
              height: 60,
              margin: EdgeInsets.only(left: 30, right: 30, bottom: 85),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: 148,
                    height: 60,
                    child: FlatButton(
                      onPressed: () => this.onSignUpPressed(context),
                      color: Color.fromARGB(255, 255, 255, 255),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(2)),
                      ),
                      textColor: Color.fromARGB(255, 217, 104, 111),
                      padding: EdgeInsets.all(0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/icon-sign-up.png",),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "SIGN UP",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromARGB(255, 217, 104, 111),
                              fontFamily: "Lato",
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: 148,
                    height: 60,
                    child: FlatButton(
                      onPressed: () => this.onLogInPressed(context),
                      color: Color.fromARGB(255, 255, 255, 255),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(2)),
                      ),
                      textColor: Color.fromARGB(255, 219, 104, 110),
                      padding: EdgeInsets.all(0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/icon-log-in.png",),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "LOG IN",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromARGB(255, 219, 104, 110),
                              fontFamily: "Lato",
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Text(
                  "© 2050 Supernova Studio",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.accentText,
                    fontFamily: "Lato",
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
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