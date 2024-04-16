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
          height: screenSize.height * 0.49,
          width: double.maxFinite,
          // padding: EdgeInsets.symmetric(vertical: screenSize.width * 0.005),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Colors.white,
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: FancyShimmerImage(
                  width: screenSize.width,
                  height: screenSize.height * 0.235,
                  boxFit: BoxFit.cover,
                  imageUrl: newsModel.imageUrl,
                ),
              ),
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
                      Spacer(),
                      Row(
                        children: [
                          SizedBox(
                            width: screenSize.width * 0.58,
                          ),
                          Container(
                            height: screenSize.height * 0.045,
                            width: screenSize.width * 0.32,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.blueColor.withOpacity(0.05)),
                            child: Center(
                              child: Text(
                                'Open news',
                                style: NewsTextStyle.read,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: screenSize.height * 0.005,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
