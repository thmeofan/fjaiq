import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../consts/app_colors.dart';
import '../../../consts/app_text_styles/news_text_style.dart';
import '../../../consts/app_text_styles/settings_text_style.dart';
import '../../../data/model/news_model.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key, required this.newsModel});

  final NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
        elevation: 0,
        titleSpacing: -5,
        title: const Text(
          'Back',
          style: SettingsTextStyle.back,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: SvgPicture.asset(
            'assets/icons/leading.svg',
            width: screenSize.width * 0.04,
            height: screenSize.width * 0.04,
            // color: Colors.white,
          ),
        ),
      ),
      body: Container(
        color: AppColors.blackColor,
        child: Column(
          children: [
            SizedBox(
              height: screenSize.height * 0.25,
              width: screenSize.width * 0.92,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: FancyShimmerImage(
                  boxFit: BoxFit.cover,
                  imageUrl: newsModel.imageUrl,
                ),
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: screenSize.width * 0.04,
                  vertical: screenSize.width * 0.01),
              child: Text(
                newsModel.title,
                style: NewsTextStyle.articleTitle,
                textAlign: TextAlign.start,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    //  color: AppColors.darkGreyColor,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(screenSize.width * 0.04),
                    child: Text(
                      newsModel.text,
                      style: NewsTextStyle.articleText,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
