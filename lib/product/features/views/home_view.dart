import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

import 'first_page.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with SingleTickerProviderStateMixin {
  late PageController pageController;
  late AnimationController animationController;
  bool textOnTap = true;
  @override
  void initState() {
    super.initState();
    pageController = PageController();

    animationController = AnimationController(vsync: this);

    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        pageController.animateToPage(1, curve: Curves.bounceOut, duration: const Duration(seconds: 3));
        animationController.reset();
      }
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        child: PageView(
          controller: pageController,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          children: [
            //Center(child: Lottie.asset("assets/lottie/rocket_launch.json")),
            Container(
              child: SvgPicture.asset(
                "assets/svg/deneme1.svg",
                fit: BoxFit.cover,
              ),
            ),

            Container(
              color: Colors.white,
              //color: const Color(0xff231243),
              child: Transform.scale(
                  alignment: Alignment.center,
                  scaleX: 5,
                  scaleY: 2,
                  // transform: Matrix4.identity()..scale(2.5),
                  child: Lottie.asset("assets/lottie/background.json", reverse: true)),
            ),
            // Container(
            //   color: const Color(0xffc2f970),
            //   child: Lottie.asset("assets/lottie/hand4.json", controller: animationController, repeat: false,
            //       onLoaded: (animation) {
            //     animationController.duration = animation.duration;
            //     animationController.forward();
            //   }),
            // ),
            FirstPage(
              pageController: pageController,
            ),
            Container(
                color: const Color(0xff9191e9),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 68.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height / 2,
                          color: Colors.white,
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  textOnTap = !textOnTap;
                                });
                              },
                              child: AnimatedCrossFade(
                                firstChild: const Text(
                                  "FLUTTER",
                                  style: TextStyle(fontSize: 100),
                                ),
                                secondChild: const Text(
                                  "DEVELOPER",
                                ),
                                crossFadeState: textOnTap ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                                duration: const Duration(seconds: 2),
                                firstCurve: Curves.bounceInOut,
                                secondCurve: Curves.easeInOut,
                                sizeCurve: Curves.elasticInOut,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(child: SvgPicture.asset("assets/canva/3.svg")),
                  ],
                )),
            Container(color: const Color(0xff29339b), child: Image.asset("assets/Saly-13.png")),
            Container(
              color: Colors.amber,
              child: Container(
                  color: const Color(0xffee4266),
                  child: SvgPicture.asset(
                    "assets/svg_image.svg",
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
