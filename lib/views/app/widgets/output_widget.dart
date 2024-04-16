import 'package:flutter/material.dart';
import '../../../consts/app_text_styles/constructor_text_style.dart';

class OutputWidget extends StatelessWidget {
  final String text;
  final Widget leading;
  final List<Widget> actions;

  const OutputWidget({
    Key? key,
    required this.text,
    required this.leading,
    this.actions = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.05,
      child: Row(
        children: <Widget>[
          leading,
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                text,
                style: ConstructorTextStyle.lable,
              ),
            ),
          ),
          if (actions.isNotEmpty)
            Row(
              children: actions,
            ),
        ],
      ),
    );
  }
}
