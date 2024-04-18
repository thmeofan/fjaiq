import 'package:fjaiq/consts/app_text_styles/categories_text_style.dart';
import 'package:fjaiq/views/app/widgets/chosen_action_button_widget.dart';
import 'package:flutter/material.dart';
import '../../../consts/app_colors.dart';
import '../../../consts/app_text_styles/settings_text_style.dart';

class MiniGameScreen extends StatefulWidget {
  const MiniGameScreen({super.key});

  @override
  State<MiniGameScreen> createState() => _MiniGameScreenState();
}

class _MiniGameScreenState extends State<MiniGameScreen> {
  List<int> numbers = List.generate(20, (index) => index ~/ 2 + 1);
  List<bool> flipped = List.filled(20, false);
  int score = 0;
  int? firstFlippedIndex;

  @override
  void initState() {
    super.initState();
    numbers.shuffle();
  }

  void resetGame() {
    setState(() {
      numbers.shuffle();
      flipped = List.filled(20, false);
      score = 0;
      firstFlippedIndex = null;
    });
  }

  void flipCard(int index) {
    if (!flipped[index]) {
      setState(() {
        flipped[index] = true;
        if (firstFlippedIndex == null) {
          firstFlippedIndex = index;
        } else {
          int? firstIndex = firstFlippedIndex;
          if (firstIndex != null && numbers[firstIndex] == numbers[index]) {
            score += 2;
            firstFlippedIndex = null;
          } else {
            Future.delayed(Duration(milliseconds: 500), () {
              setState(() {
                flipped[firstIndex!] = false;
                flipped[index] = false;
                firstFlippedIndex = null;
              });
            });
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                const Text(
                  'Find a pair',
                  style: SettingsTextStyle.title,
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Container(
              width: size.width * 0.95,
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: AppColors.whiteColor.withOpacity(0.1),
                    width: 1.0,
                  ),
                  bottom: BorderSide(
                    color: AppColors.whiteColor.withOpacity(0.1),
                    width: 1.0,
                  ),
                ),
              ),
              child: Center(
                child: Text(
                  'Score: $score',
                  style: CategoriesTextStyle.score,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                ),
                itemCount: 20,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => flipCard(index),
                    child: Container(
                      margin: EdgeInsets.all(4.0),
                      color: flipped[index]
                          ? (numbers[index] % 2 == 0
                              ? AppColors.whiteColor
                              : AppColors.greenColor)
                          : AppColors.lightGreyColor,
                      child: flipped[index]
                          ? Center(
                              child: Text(
                                '${numbers[index]}',
                                style: TextStyle(fontSize: 32.0),
                              ),
                            )
                          : null,
                    ),
                  );
                },
              ),
            ),
            ChosenActionButton(
              text: 'Restart',
              onTap: resetGame,
            ),
            SizedBox(
              height: size.height * 0.03,
            )
          ],
        ),
      ),
    );
  }
}
