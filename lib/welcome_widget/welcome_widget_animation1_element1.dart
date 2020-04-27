/*
*  welcome_widget_animation1_element1.dart
*  Spacebook
*
*  Created by Supernova.
*  Copyright © 2018 Supernova. All rights reserved.
    */

import 'dart:math';
import 'package:flutter/widgets.dart';
import 'package:spacebook/values/values.dart';
import 'package:supernova_flutter_ui_toolkit/keyframes.dart';

Animation<double> _createTranslationXProperty(AnimationController animationController) => Interpolation<double>(keyframes: [
  Keyframe<double>(fraction: 0, value: 0),
  Keyframe<double>(fraction: 0.00001, value: 197),
  Keyframe<double>(fraction: 1, value: 0),
]).animate(CurvedAnimation(
  curve: Interval(0, 1, curve: Cubic(0, 0, 1, 1)),
  parent: animationController,
));


class WelcomeWidgetAnimation1Element1 extends StatelessWidget {
  
  WelcomeWidgetAnimation1Element1({
    Key key,
    this.child,
    @required AnimationController animationController
  }) : assert(animationController != null),
       this.translationX = _createTranslationXProperty(animationController),
       super(key: key);
  
  final Animation<double> translationX;
  final Widget child;
  
  
  @override
  Widget build(BuildContext context) {
  
    return AnimatedBuilder(
      animation: Listenable.merge([
        this.translationX,
      ]),
      child: this.child,
      builder: (context, widget) {
      
        return Transform.translate(
          offset: Offset(this.translationX.value, 0),
          child: widget,
        );
      },
    );
  }
}