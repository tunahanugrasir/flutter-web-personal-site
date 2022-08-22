import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'first_page.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: [
          FirstPage(
            pageController: pageController,
          ),
          Container(color: const Color(0xff29339b), child: Image.asset("assets/Saly-13.png")),
          Container(
            color: Colors.amber,
            child: Container(
                color: const Color(0xffee4266),
                child: SvgPicture.asset(
                  "assets/svg_image.svg",
                )),
          ),
          Container(color: const Color(0xff9191e9), child: SvgPicture.asset("assets/canva/3.svg")),
        ],
      ),
    );
  }
}
