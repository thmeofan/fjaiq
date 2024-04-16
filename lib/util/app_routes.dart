import 'package:boat/data/model/rental.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/onboarding_cubit/onboarding_cubit.dart';
import '../data/model/news_model.dart';
import '../data/repository/onboarding_repository.dart';
import '../views/homescreen/views/home_screen.dart';
import '../views/news/views/article_screen.dart';
import '../views/news/views/news_screen.dart';
import '../views/onboarding/view/onboarding_screen.dart';
import '../views/onboarding/view/start_screen.dart';
import '../views/settings/views/settings_screen.dart';

abstract class AppRoutes {
  static const home = 'home';
  static const welcome = 'welcome';
  static const start = 'start';
  static const profile = 'profile';
  static const article = 'article';
  static const news = 'news';
  static MaterialPageRoute onGenerateRoute(RouteSettings settings) {
    final Widget child;

    OnboardingRepository onboardingRepository = OnboardingRepository();
    OnboardingCubit onboardingCubit = OnboardingCubit(onboardingRepository);

    switch (settings.name) {
      case home:
        child = HomeScreen();
      case start:
        child = BlocProvider(
            create: (context) => onboardingCubit, child: const StartScreen());
      case profile:
        child = const SettingsScreen();
      case news:
        List<NewsModel> newsList = settings.arguments as List<NewsModel>;
        child = NewsScreen(
          newsModel: newsList,
        );
      case article:
        NewsModel news = settings.arguments as NewsModel;
        child = ArticleScreen(
          newsModel: news,
        );
      default:
        child = BlocProvider(
          create: (context) => onboardingCubit,
          child: const OnboardingScreen(),
        );
    }
    return MaterialPageRoute(builder: (_) => child);
  }
}
