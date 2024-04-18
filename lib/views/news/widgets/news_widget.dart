import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

import '../../../consts/app_colors.dart';
import '../../../consts/app_text_styles/news_text_style.dart';
import '../../../data/model/news_model.dart';
import '../../../util/app_routes.dart';

class NewsWidget extends StatelessWidget {
  const NewsWidget({super.key, required this.newsModel});

  final NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushNamed(AppRoutes.article, arguments: newsModel);
        },
        child: Container(
          height: screenSize.height * 0.4,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: AppColors.blackColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(5.0),
              bottomRight: Radius.circular(5.0),
            ),
            border: Border(
                top: BorderSide(
              color: AppColors.whiteColor.withOpacity(0.1),
              width: 1.0,
            )),
          ),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          newsModel.title,
                          maxLines: 4,
                          style: NewsTextStyle.title,
                        ),
                      ),
                      SizedBox(
                        height: screenSize.height * 0.005,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          newsModel.text,
                          maxLines: 2,
                          style: NewsTextStyle.preview,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: FancyShimmerImage(
                  width: screenSize.width,
                  height: screenSize.height * 0.235,
                  boxFit: BoxFit.cover,
                  imageUrl: newsModel.imageUrl,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
