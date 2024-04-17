import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/onboarding_cubit/onboarding_cubit.dart';
import '../data/model/news_model.dart';
import '../data/model/quiz_model.dart';
import '../data/repository/onboarding_repository.dart';
import '../views/app/views/home_screen.dart';
import '../views/news/views/article_screen.dart';
import '../views/onboarding_screen/view/onboarding_screen.dart';
import '../views/quiz/views/question_screen.dart';
import '../views/settings/views/settings_screen.dart';
import '../views/operation/views/operation_screen.dart';

abstract class AppRoutes {
  static const home = 'home';
  static const welcome = 'welcome';
  static const profile = 'profile';
  static const operation = 'oparetion';
  static const article = 'article';
  static const quiz = 'quiz';

  static MaterialPageRoute onGenerateRoute(RouteSettings settings) {
    final Widget child;

    OnboardingRepository onboardingRepository = OnboardingRepository();
    OnboardingCubit onboardingCubit = OnboardingCubit(onboardingRepository);

    switch (settings.name) {
      case home:
        child = const HomeScreen();
      case profile:
        child = const SettingsScreen();
      case operation:
        child = FinanceScreen();

      case article:
        NewsModel news = settings.arguments as NewsModel;
        child = ArticleScreen(
          newsModel: news,
        );
      case quiz:
        List<Question> questions = settings.arguments as List<Question>;
        void resetQuestions() {
          for (var question in questions) {
            question.isLocked = false;
            question.selectedOption = null;
          }
        }
        child = QuestionScreen(
          questions: questions,
          onRetakeQuiz: resetQuestions,
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
