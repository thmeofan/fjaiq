import 'package:flutter/material.dart';
import '../../../consts/app_colors.dart';
import '../../../consts/app_text_styles/settings_text_style.dart';
import '../../../data/model/news_model.dart';
import '../widgets/news_widget.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key, required this.newsModel});

  final List<NewsModel> newsModel;

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
          child: Column(children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.height * 0.018),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'News',
                    style: SettingsTextStyle.title,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: newsModel.length,
                itemBuilder: (BuildContext context, int index) {
                  return NewsWidget(newsModel: newsModel[index]);
                },
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
          ]),
        ));
  }
}
