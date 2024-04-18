import 'package:fjaiq/views/app/widgets/chosen_action_button_widget.dart';
import 'package:fjaiq/views/quiz/views/question_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../consts/app_colors.dart';
import '../../../consts/app_text_styles/categories_text_style.dart';
import '../../../consts/app_text_styles/settings_text_style.dart';
import '../../../data/model/quiz_model.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  void navigateToQuiz(BuildContext context, List<Question> questions) {
    void resetQuestions() {
      for (var question in questions) {
        question.isLocked = false;
        question.selectedOption = null;
      }
    }

    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => QuestionScreen(
        questions: questions,
        onRetakeQuiz: resetQuestions,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.blackColor,
      ),
      body: Container(
        color: AppColors.blackColor,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: size.width * 0.03),
                Text(
                  'Quiz',
                  style: SettingsTextStyle.title,
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            SvgPicture.asset(
              'assets/images/quiz.svg',
              width: size.width * 0.9,
              height: size.height * 0.3,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Check how much you know about finance',
                style: CategoriesTextStyle.resultSubtitle,
                textAlign: TextAlign.center,
              ),
            ),
            Spacer(),
            ChosenActionButton(
              text: 'Start',
              onTap: () => navigateToQuiz(context, questions),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
          ],
        ),
      ),
    );
  }
}
