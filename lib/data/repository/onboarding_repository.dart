import 'package:shared_preferences/shared_preferences.dart';

class OnboardingRepository {
  static final OnboardingRepository onboardingRepository =
      OnboardingRepository.internal();

  factory OnboardingRepository() {
    return onboardingRepository;
  }

  OnboardingRepository.internal();

  Future<bool> checkFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTime = prefs.getBool('first_time') ?? true;

    return isFirstTime;
  }

  Future<void> setFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('first_time', false);
  }
}
