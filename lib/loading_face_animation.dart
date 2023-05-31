// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_custompaint_and_animations_asshidev/moving_car.dart';

class LoadingFaceAnimationScreen extends StatelessWidget {
  const LoadingFaceAnimationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: GestureDetector(
            onDoubleTap: () => const MovingCar(),
            child: const LoadingFaceAnimation(
              side: 250,
              stopDuration: 1000,
            ),
          ),
        ),
      ),
    );
  }
}

class LoadingFaceAnimation extends StatefulWidget {
  final double side;
  // for how long should the animation stop before continuing again
  final int stopDuration;
  const LoadingFaceAnimation(
      {super.key, required this.side, required this.stopDuration});

  @override
  State<LoadingFaceAnimation> createState() => _LoadingFaceAnimationState();
}

class _LoadingFaceAnimationState extends State<LoadingFaceAnimation> {
  late Attribute attributes1;
  late Attribute attributes2;
  late Attribute attributes3;

  late Duration animatedContainerDuration;
  late double commonPadding;

  int count = 0;

  @override
  void initState() {
    attributes1 = Attribute(
        height: widget.side / 3,
        width: widget.side / 3,
        alignment: Alignment.bottomRight);
    attributes2 = Attribute(
        height: widget.side / 3,
        width: widget.side / 3,
        alignment: Alignment.bottomRight);
    attributes3 = Attribute(
        height: widget.side / 3,
        width: widget.side / 3,
        alignment: Alignment.bottomRight);

    commonPadding = widget.side / 15;
    animatedContainerDuration =
        Duration(microseconds: (widget.stopDuration / 9).floor());

    changeAttribute1();

    super.initState();
  }

  changeAttribute1() {
    Future.delayed(Duration(microseconds: (widget.stopDuration / 18).floor()))
        .whenComplete(() {
      setState(() {
        attributes1 = getAttribute(attributes1, widget.side);
        Future.delayed(
                Duration(milliseconds: (widget.stopDuration / 4.5).floor()))
            .whenComplete(() {
          setState(() {
            attributes1 = getAttribute(attributes1, widget.side);
          });
          changeAttribute2();
        });
      });
    });
  }

  changeAttribute2() {
    Future.delayed(Duration(
            microseconds:
                (widget.stopDuration / 9 - widget.stopDuration / 18).floor()))
        .whenComplete(() {
      setState(() {
        attributes2 = getAttribute(attributes2, widget.side);
        Future.delayed(
                Duration(milliseconds: (widget.stopDuration / 4.5).floor()))
            .whenComplete(() {
          setState(() {
            attributes2 = getAttribute(attributes2, widget.side);
          });
          changeAttribute3();
        });
      });
    });
  }

  changeAttribute3() {
    Future.delayed(Duration(microseconds: (widget.stopDuration / 18).floor()))
        .whenComplete(() {
      setState(() {
        attributes3 = getAttribute(attributes3, widget.side);
        Future.delayed(
                Duration(milliseconds: (widget.stopDuration / 4.5).floor()))
            .whenComplete(() {
          setState(() {
            attributes3 = getAttribute(attributes3, widget.side);
          });
          changeAttribute1();
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: widget.side,
          width: widget.side,
          alignment: attributes1.alignment,
          child: AnimatedContainer(
            height: attributes1.height,
            width: attributes1.width,
            duration: animatedContainerDuration,
            padding: EdgeInsets.all(commonPadding),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(60),
              ),
            ),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(
                  Radius.circular(60),
                ),
              ),
            ),
          ),
        ),
        Transform.rotate(
          angle: -pi / 2,
          child: Container(
            height: widget.side,
            width: widget.side,
            alignment: attributes2.alignment,
            child: AnimatedContainer(
              height: attributes2.height,
              width: attributes2.width,
              duration: animatedContainerDuration,
              padding: EdgeInsets.all(commonPadding),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(60),
                ),
              ),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(
                    Radius.circular(60),
                  ),
                ),
              ),
            ),
          ),
        ),
        Transform.rotate(
          angle: pi / 2,
          child: Container(
            height: widget.side,
            width: widget.side,
            alignment: attributes3.alignment,
            child: AnimatedContainer(
              height: attributes3.height,
              width: attributes3.width,
              duration: animatedContainerDuration,
              padding: EdgeInsets.all(commonPadding),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(60),
                ),
              ),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(
                    Radius.circular(60),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Attribute {
  final double height;
  final double width;
  final Alignment alignment;
  Attribute({
    required this.height,
    required this.width,
    required this.alignment,
  });
}

getAttribute(Attribute currentAttribute, double side) {
  if (currentAttribute.alignment == Alignment.bottomRight &&
      currentAttribute.width == side &&
      currentAttribute.height == side / 3) {
    return Attribute(
      height: side / 3,
      width: side / 3,
      alignment: Alignment.bottomLeft,
    );
  }
  if (currentAttribute.alignment == Alignment.bottomLeft &&
      currentAttribute.width == side / 3.0 &&
      currentAttribute.height == side / 3.0) {
    return Attribute(
      height: side,
      width: side / 3,
      alignment: Alignment.bottomLeft,
    );
  }
  if (currentAttribute.alignment == Alignment.bottomLeft &&
      currentAttribute.width == side / 3.0 &&
      currentAttribute.height == side) {
    return Attribute(
      height: side / 3,
      width: side / 3,
      alignment: Alignment.topLeft,
    );
  }
  if (currentAttribute.alignment == Alignment.topLeft &&
      currentAttribute.width == side / 3 &&
      currentAttribute.height == side / 3) {
    return Attribute(
      height: side / 3,
      width: side,
      alignment: Alignment.topLeft,
    );
  }
  if (currentAttribute.alignment == Alignment.topLeft &&
      currentAttribute.width == side &&
      currentAttribute.height == side / 3) {
    return Attribute(
      height: side / 3,
      width: side / 3,
      alignment: Alignment.topRight,
    );
  }
  if (currentAttribute.alignment == Alignment.topRight &&
      currentAttribute.width == side / 3 &&
      currentAttribute.height == side / 3) {
    return Attribute(
      height: side,
      width: side / 3,
      alignment: Alignment.topRight,
    );
  }
  if (currentAttribute.alignment == Alignment.topRight &&
      currentAttribute.width == side / 3 &&
      currentAttribute.height == side) {
    return Attribute(
      height: side / 3,
      width: side / 3,
      alignment: Alignment.bottomRight,
    );
  }
  if (currentAttribute.alignment == Alignment.bottomRight &&
      currentAttribute.width == side / 3 &&
      currentAttribute.height == side / 3) {
    return Attribute(
      height: side / 3,
      width: side,
      alignment: Alignment.bottomRight,
    );
  }
}
