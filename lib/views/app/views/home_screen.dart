import 'package:flewly/consts/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../data/model/news_model.dart';
import '../../flight/views/flight_screen.dart';
import '../../news/views/news_screen.dart';
import '../../settings/views/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> homeWidgets = [
    FlightScreen(),
    NewsScreen(
      newsModel: news,
    ),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: homeWidgets[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              height: size.height * 0.025,
              currentIndex == 0
                  ? 'assets/icons/home_blue.svg'
                  : 'assets/icons/home.svg',
            ),
            label: 'cars',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              height: size.height * 0.025,
              currentIndex == 1
                  ? 'assets/icons/news_blue.svg'
                  : 'assets/icons/news.svg',
            ),
            label: 'news',
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                height: size.height * 0.025,
                currentIndex == 2
                    ? 'assets/icons/settings_blue.svg'
                    : 'assets/icons/settings.svg',
              ),
              label: 'settings'),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        backgroundColor: AppColors.greyColor,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}
