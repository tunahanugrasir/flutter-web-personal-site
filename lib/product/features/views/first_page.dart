import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class FirstPage extends StatefulWidget {
  final PageController pageController;
  const FirstPage({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> with SingleTickerProviderStateMixin {
  bool isSayHello = false;
  bool isNameClick = false;
  bool isCounterStart = false;
  int count = 0;
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(duration: const Duration(milliseconds: 500), vsync: this);
    super.initState();
  }

  void sayHello() {
    setState(() {
      isSayHello = !isSayHello;
      isCounterStart = true;
      if (isCounterStart) return startCount();
    });
  }

  void startCount() {
    count++;
  }

  void nameClik() {
    setState(() {
      isNameClick = !isNameClick;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Animation<double> offsetAnimation =
        Tween(begin: 0.0, end: 24.0).chain(CurveTween(curve: Curves.elasticIn)).animate(animationController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              animationController.reverse();
            }
          });
    return Container(
      color: const Color(0xffc2f970),
      child: Stack(
        children: [
          Center(child: Lottie.asset("assets/resim.json")),
          Positioned(
            top: 250,
            left: 500,
            child: InkWell(
              onTap: () {
                animationController.forward(from: 0.0);
              },
              child: AnimatedBuilder(
                animation: offsetAnimation,
                builder: ((context, child) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24.0),
                    padding: EdgeInsets.only(left: offsetAnimation.value + 24.0, right: 24.0 - offsetAnimation.value),
                    child: SvgPicture.asset("assets/lottie/hand1.json"),
                  );
                }),
              ),
            ),
          ),
          Container(
            color: Colors.amber,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("Hi! I'm Tunahan,\nPeoples call me Tuna"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
