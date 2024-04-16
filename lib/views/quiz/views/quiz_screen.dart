import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:football_quiz/consts/app_colors.dart';
import 'package:football_quiz/consts/app_text_styles/categories_text_style.dart';
import 'package:football_quiz/views/widgets/buttons/chosen_action_button_widget.dart';
import 'dart:async';
import 'dart:ui' as ui;
import '../../../data/models/quiz_model.dart';
import '../../../util/progress_manger.dart';
import '../widgets/option_widget.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key, required this.questions, this.onRetakeQuiz});

  final List<Question> questions;
  final VoidCallback? onRetakeQuiz; // Add this callback

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  int _questionNumber = 1;
  bool _isQuizFinished = false;

  int calculateScore() {
    int score = 0;
    for (var question in widget.questions) {
      if (question.isLocked && question.selectedOption?.isCorrect == true) {
        score++;
      }
    }
    return score;
  }

  void resetQuiz() {
    setState(() {
      _isQuizFinished = false;
      _questionNumber = 1;
      _controller.jumpToPage(0);
    });
    for (var question in widget.questions) {
      question.isLocked = false;
      question.selectedOption = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            widget.questions[0].category,
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: SvgPicture.asset(
              'assets/icons/back.svg',
              width: 24.0,
              height: 24.0,
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background.png'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.transparent.withOpacity(1),
                BlendMode.dstATop,
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 150,
              ),
              Text(
                '$_questionNumber/${widget.questions.length}',
                style: CategoriesTextStyle.title,
              ),
              SizedBox(
                height: size.width * 0.1,
              ),
              Expanded(
                  child: PageView.builder(
                itemCount: widget.questions.length,
                controller: _controller,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  if (_isQuizFinished) {}
                  final question = widget.questions[index];
                  return buildQuestion(question);
                },
              ))
            ],
          ),
        ),
      ),
    );
  }

  Widget buildQuestion(Question? question) {
    Size size = MediaQuery.of(context).size;
    if (_isQuizFinished) {
      return Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRect(
              child: BackdropFilter(
                filter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(
                  height: size.width * 0.3,
                  width: size.width * 0.88,
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white.withOpacity(0.2),
                    border: Border.all(color: AppColors.whiteColor),
                  ),
                  child: Center(
                    child: Text(
                      " ${calculateScore()} / ${widget.questions.length}.",
                      style: CategoriesTextStyle.result,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.3,
            ),
            ChosenActionButton(
              text: 'Continue',
              onTap: () {
                resetQuiz();
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    }
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRect(
            child: BackdropFilter(
              filter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(
                height: size.height * 0.3,
                width: size.width * 0.88,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white.withOpacity(0.2),
                  border: Border.all(
                    color: question!.isLocked
                        ? (question.selectedOption?.isCorrect ?? false
                            ? AppColors.lightBlueColor
                            : AppColors.redColor)
                        : AppColors.lightGreyColor,
                    width: 1.5,
                  ),
                ),
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    question.text,
                    style: CategoriesTextStyle.question,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.2,
          ),
          Expanded(
            child: OptionWidget(
                question: question,
                onClickedOption: (option) {
                  if (question.isLocked) {
                    return;
                  } else {
                    setState(() {
                      question.isLocked = true;
                      question.selectedOption = option;
                    });

                    Future.delayed(Duration(seconds: 1), () async {
                      if (_controller.page!.toInt() ==
                          widget.questions.length - 1) {
                        int score = calculateScore();
                        await onQuizCompleted(question.category, score);
                        setState(() {
                          _isQuizFinished = true;
                        });
                      } else {
                        _controller.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                        setState(() {
                          _questionNumber += 1;
                        });
                      }
                    });
                  }
                }),
          ),
        ],
      ),
    );
  }

  Color getColorForOption(Option option, Question question) {
    final isSelected = option == question.selectedOption;
    if (question.isLocked) {
      if (isSelected) {
        return option.isCorrect ? AppColors.lightBlueColor : AppColors.redColor;
      } else if (option.isCorrect) {
        return AppColors.lightBlueColor;
      }
    }
    return AppColors.lightGreyColor;
  }
}
