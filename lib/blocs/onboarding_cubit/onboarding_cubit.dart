import '../../data/repository/onboarding_repository.dart';
import 'onboarding_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit(this.onboardingRepository) : super(OnboardingState(true));
  final OnboardingRepository onboardingRepository;

  Future<void> checkFirstTime() async {
    bool isFirstTime = await onboardingRepository.checkFirstTime();
    emit(OnboardingState(isFirstTime));
  }

  Future<void> setFirstTime() async {
    await onboardingRepository.setFirstTime();

    emit(OnboardingState(false));
  }
}
