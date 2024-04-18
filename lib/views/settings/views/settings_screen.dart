import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../consts/app_colors.dart';
import '../../../consts/app_text_styles/settings_text_style.dart';
import '../../app/views/my_in_app_web_view.dart';
import '../../app/widgets/chosen_action_button_widget.dart';
import '../widgets/settings_widget.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  bool isSwitched = false;
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
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
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Settings',
                  style: SettingsTextStyle.title,
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                  child: Container(
                    width: size.width * 0.95,
                    decoration: BoxDecoration(
                      // color: AppColors.lightGreyColor,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          const Text(
                            'Your opinion is important!',
                            style: SettingsTextStyle.bannerTitle,
                          ),
                          SizedBox(
                            height: size.height * 0.005,
                          ),
                          const Text(
                            'We need your feedback',
                            style: SettingsTextStyle.bannerSubTitle,
                          ),
                          SizedBox(
                            height: size.height * 0.005,
                          ),
                          ChosenActionButton(
                            text: 'Rate app',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MyScreenForVIew(
                                      url: 'https://google.com/'),
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                SettingsTile(
                    text: 'Privacy Policy',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const MyScreenForVIew(url: 'https://google.com/'),
                        ),
                      );
                    },
                    action: SvgPicture.asset('assets/icons/arrow.svg'),
                    assetName: 'assets/icons/terms.svg'),
                SizedBox(
                  height: size.height * 0.01,
                ),
                SettingsTile(
                    text: 'Notification',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const MyScreenForVIew(url: 'https://google.com/'),
                        ),
                      );
                    },
                    action: SvgPicture.asset('assets/icons/arrow.svg'),
                    assetName: 'assets/icons/privacy.svg'),
                SettingsTile(
                    text: 'Notification',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const MyScreenForVIew(url: 'https://google.com/'),
                        ),
                      );
                    },
                    action: SvgPicture.asset('assets/icons/arrow.svg'),
                    assetName: 'assets/icons/support.svg'),
                SizedBox(
                  height: size.height * 0.4,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
