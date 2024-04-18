import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import '../../../consts/app_colors.dart';
import '../../../consts/app_text_styles/settings_text_style.dart';
import '../../app/widgets/chosen_action_button_widget.dart';
import '../../app/widgets/input_widget.dart';
import '../widgets/dropdown_widget.dart';

class ConstructorScreen extends StatefulWidget {
  @override
  _ConstructorScreenState createState() => _ConstructorScreenState();
}

class _ConstructorScreenState extends State<ConstructorScreen> {
  final _descriptionController = TextEditingController();
  final _amountController = TextEditingController();
  final _dateController = TextEditingController();

  String _operationType = 'Income';
  List<bool> _isSelected = [true, false];

  void _toggleOperationType(int index) {
    setState(() {
      if (index == 0) {
        _operationType = 'Income';
        _isSelected = [true, false];
      } else {
        _operationType = 'Spendings';
        _isSelected = [false, true];
      }
    });
  }

  void _saveOperation() {
    try {
      final description = _descriptionController.text;
      final amount = double.tryParse(_amountController.text);
      final date = _dateController.text;

      if (description.isEmpty || amount == null || date.isEmpty) {
        _showErrorSnackBar('Make sure you filled all the fields');
        debugPrint(
            'Validation failed: description, amount, or date is missing.');
        return;
      }

      final operation = {
        'description': description,
        'amount': amount,
        'type': _operationType,
        'date': date,
      };

      Navigator.of(context).pop(operation);
    } catch (e) {
      _showErrorSnackBar('Make sure you filled all the fields');
      debugPrint('Error in _saveOperation: $e');
    }
  }

  void _showErrorSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyle(color: AppColors.redColor),
      ),
      backgroundColor: AppColors.lightGreyColor,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.dark(
              primary: AppColors.blackColor,
              onPrimary: AppColors.greenColor,
              surface: AppColors.blackColor,
              onSurface: Colors.white,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
            ),
            textTheme: TextTheme(
              bodyMedium: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        _dateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    _amountController.dispose();
    _dateController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
            width: size.width * 0.04,
            height: size.width * 0.04,
            // color: Colors.white,
          ),
        ),
      ),
      body: Container(
        color: AppColors.blackColor,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ToggleButtons(
                  isSelected: _isSelected,
                  onPressed: _toggleOperationType,
                  borderRadius: BorderRadius.circular(5.0),
                  selectedColor: Colors.white,
                  fillColor: Colors.white.withOpacity(0.25),
                  renderBorder: false,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.13,
                          vertical: size.height * 0.017),
                      decoration: BoxDecoration(
                        color: _isSelected[0]
                            ? AppColors.whiteColor
                            : AppColors.lightGreyColor,
                        borderRadius: _isSelected[0]
                            ? BorderRadius.only(
                                topRight: Radius.circular(5.0),
                                bottomRight: Radius.circular(5.0),
                              )
                            : BorderRadius.circular(0.0),
                      ),
                      child: Text(
                        'Income',
                        style: TextStyle(
                          color: _isSelected[0]
                              ? Colors.black
                              : Colors.white.withOpacity(0.35),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.11,
                          vertical: size.height * 0.017),
                      decoration: BoxDecoration(
                        color: _isSelected[1]
                            ? AppColors.whiteColor
                            : AppColors.lightGreyColor,
                        borderRadius: _isSelected[1]
                            ? BorderRadius.only(
                                topLeft: Radius.circular(5.0),
                                bottomLeft: Radius.circular(5.0),
                              )
                            : BorderRadius.circular(0.0),
                      ),
                      child: Text(
                        'Spendings',
                        style: TextStyle(
                          color: _isSelected[1]
                              ? Colors.black
                              : Colors.white.withOpacity(0.35),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Container(
                height: size.height * 0.8,
                //  color: AppColors.darkGreyColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      InputWidget(
                        controller: _amountController,
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        label: 'Enter amount',
                      ),
                      // InputWidget(

                      DropdownWidget(
                        options: const [
                          'Salary',
                          'Freelance',
                          'Investments',
                          'Rental Income',
                          'Side Jobs',
                          'Bonuses and Awards',
                          'Passive Income',
                          'Social Benefits',
                          'Sales',
                          'Consulting and Training',
                        ],
                        onChanged: (String value) {
                          _descriptionController.text = value;
                        },
                      ),
                      GestureDetector(
                        onTap: _pickDate,
                        child: AbsorbPointer(
                          child: InputWidget(
                            controller: _dateController,
                            label: 'Date',
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.03),
                      ChosenActionButton(
                        text: 'Make an entry',
                        onTap: _saveOperation,
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
