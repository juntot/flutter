import 'package:flutter/material.dart';

class Heart extends StatefulWidget {
  final Function clickheart;
  Heart({this.clickheart});
  @override
  _HeartState createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<Color> colorTweenAnimation;
  Animation<double> _tweenSerries;
  bool isLiked = false;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(duration: Duration(milliseconds: 300), vsync: this);

    colorTweenAnimation = ColorTween(begin: Colors.grey, end: Colors.red)
        .animate(_animationController);

    _tweenSerries = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 30, end: 50), weight: 50),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 50, end: 30), weight: 50),
    ]).animate(_animationController);


    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          isLiked = true;
        });
      }
      if (status == AnimationStatus.dismissed) {
        setState(() {
          isLiked = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (BuildContext context, _) {
        return IconButton(
          icon: Icon(
            Icons.favorite,
            color: colorTweenAnimation.value,
            size: _tweenSerries.value,
          ),
          onPressed: () {
            isLiked
                ? _animationController.reverse()
                : _animationController.forward();
          },
        );
      },
    );
  }
}
