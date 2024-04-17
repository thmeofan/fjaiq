import 'package:fjaiq/views/quiz/views/question_screen.dart';
import 'package:fjaiq/views/quiz/views/quiz_screen.dart';
import 'package:fjaiq/views/settings/views/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../consts/app_colors.dart';

import '../../../data/model/news_model.dart';
import '../../../data/model/quiz_model.dart';
import '../../mini_game/views/mini_game_screen.dart';
import '../../news/views/news_screen.dart';
import '../../operation/views/finance_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> homeWidgets = [
    FinanceScreen(),

    NewsScreen(
      newsModel: news,
    ),
    MiniGameScreen(),
    QuizScreen(),
    SettingsScreen(),
    // const ProfileScreen()
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
              'assets/icons/finance.svg',
              width: size.height * 0.032,
              height: size.height * 0.032,
              color: currentIndex == 0
                  ? AppColors.greenColor
                  : AppColors.whiteColor,
            ),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/news.svg',
              width: size.height * 0.032,
              height: size.height * 0.032,
              color: currentIndex == 1
                  ? AppColors.greenColor
                  : AppColors.whiteColor,
            ),
            label: 'Новости',
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/game.svg',
                width: size.height * 0.032,
                height: size.height * 0.032,
                color: currentIndex == 2
                    ? AppColors.greenColor
                    : AppColors.whiteColor,
              ),
              label: 'Калькулятор'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/quiz.svg',
                width: size.height * 0.032,
                height: size.height * 0.032,
                color: currentIndex == 3
                    ? AppColors.greenColor
                    : AppColors.whiteColor,
              ),
              label: 'Операции'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/settings.svg',
                width: size.height * 0.032,
                height: size.height * 0.032,
                color: currentIndex == 4
                    ? AppColors.greenColor
                    : AppColors.whiteColor,
              ),
              label: ''),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.blackColor,
        unselectedItemColor: AppColors.whiteColor,
        selectedItemColor: AppColors.orangeColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedLabelStyle: const TextStyle(
            // color: AppColors.lightBlueColor,
            ),
        unselectedLabelStyle: const TextStyle(
          color: AppColors.blackColor,
        ),
      ),
    );
  }
}
