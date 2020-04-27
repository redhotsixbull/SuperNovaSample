/*
*  welcome_widget_animation1_element3.dart
*  Spacebook
*
*  Created by Supernova.
*  Copyright © 2018 Supernova. All rights reserved.
    */

import 'dart:math';
import 'package:flutter/widgets.dart';
import 'package:spacebook/values/values.dart';
import 'package:supernova_flutter_ui_toolkit/keyframes.dart';

Animation<double> _createScaleProperty(AnimationController animationController) => Interpolation<double>(keyframes: [
  Keyframe<double>(fraction: 0, value: 1),
  Keyframe<double>(fraction: 0.00001, value: 0.3),
  Keyframe<double>(fraction: 0.2, value: 1.1),
  Keyframe<double>(fraction: 0.4, value: 0.9),
  Keyframe<double>(fraction: 0.6, value: 1.03),
  Keyframe<double>(fraction: 0.8, value: 0.97),
  Keyframe<double>(fraction: 1, value: 1),
]).animate(CurvedAnimation(
  curve: Interval(0, 1, curve: Cubic(0.215, 0.61, 0.355, 1)),
  parent: animationController,
));

Animation<double> _createOpacityProperty(AnimationController animationController) => Interpolation<double>(keyframes: [
  Keyframe<double>(fraction: 0, value: 1),
  Keyframe<double>(fraction: 0.00001, value: 0),
  Keyframe<double>(fraction: 0.6, value: 1),
  Keyframe<double>(fraction: 1, value: 1),
]).animate(CurvedAnimation(
  curve: Interval(0, 1, curve: Cubic(0.215, 0.61, 0.355, 1)),
  parent: animationController,
));

Animation<Color> _createBorderColorProperty(AnimationController animationController) => ColorInterpolation(keyframes: [
  Keyframe<Color>(fraction: 0, value: Color.fromARGB(0, 0, 0, 0)),
  Keyframe<Color>(fraction: 0.33333, value: Color.fromARGB(0, 0, 0, 0)),
  Keyframe<Color>(fraction: 1, value: Color.fromARGB(0, 0, 0, 0)),
]).animate(CurvedAnimation(
  curve: Interval(0, 1, curve: Cubic(0.42, 0, 0.58, 1)),
  parent: animationController,
));

Animation<double> _createTranslationXProperty(AnimationController animationController) => Interpolation<double>(keyframes: [
  Keyframe<double>(fraction: 0, value: 0),
  Keyframe<double>(fraction: 0, value: 50),
  Keyframe<double>(fraction: 1, value: -200),
]).animate(CurvedAnimation(
  curve: Interval(0, 1, curve: Cubic(0.42, 0, 0.58, 1)),
  parent: animationController,
));

Widget _defaultBuilder(BuildContext context, WelcomeWidgetAnimation1Element3AnimationState animationState, Widget child) => child;


class WelcomeWidgetAnimation1Element3 extends StatelessWidget {
  
  WelcomeWidgetAnimation1Element3({
    Key key,
    this.child,
    this.builder = _defaultBuilder,
    @required AnimationController animationController
  }) : assert(animationController != null),
       this.scale = _createScaleProperty(animationController),
       this.opacity = _createOpacityProperty(animationController),
       this.borderColor = _createBorderColorProperty(animationController),
       this.translationX = _createTranslationXProperty(animationController),
       super(key: key);
  
  final Animation<double> scale;
  final Animation<double> opacity;
  final Animation<Color> borderColor;
  final Animation<double> translationX;
  final Widget child;
  final ValueWidgetBuilder<WelcomeWidgetAnimation1Element3AnimationState> builder;
  
  
  @override
  Widget build(BuildContext context) {
  
    return AnimatedBuilder(
      animation: Listenable.merge([
        this.scale,
        this.opacity,
        this.borderColor,
        this.translationX,
      ]),
      child: this.child,
      builder: (context, widget) {
      
        return Opacity(
          opacity: this.opacity.value,
          child: Transform.translate(
            offset: Offset(this.translationX.value, 0),
            child: Transform.scale(
              scale: this.scale.value,
              alignment: Alignment.center,
              child: this.builder(context, this._createAnimationState(), widget),
            ),
          ),
        );
      },
    );
  }
  
  
  WelcomeWidgetAnimation1Element3AnimationState _createAnimationState() {
  
    return WelcomeWidgetAnimation1Element3AnimationState(
      borderColor: this.borderColor.value,
    );
  }
}


class WelcomeWidgetAnimation1Element3AnimationState {
  
  WelcomeWidgetAnimation1Element3AnimationState({
    this.borderColor,
  });
  
  final Color borderColor;
}