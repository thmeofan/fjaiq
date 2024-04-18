import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import '../../../consts/app_colors.dart';
import '../../../consts/app_text_styles/home_screen_text_style.dart';
import '../../../consts/app_text_styles/settings_text_style.dart';
import '../../../util/shared_pref_service.dart';
import 'constructor_screen.dart';

class FinanceScreen extends StatefulWidget {
  @override
  _FinanceScreenState createState() => _FinanceScreenState();
}

class _FinanceScreenState extends State<FinanceScreen> {
  List<Map<String, dynamic>> operations = [];

  @override
  void initState() {
    super.initState();
    _loadOperations();
  }

  void _loadOperations() async {
    operations = await SharedPreferencesService.loadOperations();
    setState(() {});
  }

  void _addOperation(Map<String, dynamic> operation) async {
    setState(() {
      operations.add(operation);
    });
    await SharedPreferencesService.saveOperations(operations);
  }

  double get _totalIncome {
    return operations
        .where((op) => op['type'] == 'Income')
        .fold(0, (prev, op) => prev + op['amount']);
  }

  double get _totalSpendings {
    return operations
        .where((op) => op['type'] == 'Spendings')
        .fold(0, (prev, op) => prev + op['amount']);
  }

  Map<String, List<Map<String, dynamic>>> _groupOperationsByDate() {
    Map<String, List<Map<String, dynamic>>> grouped = {};
    for (var operation in operations) {
      String date = operation['date'];
      if (!grouped.containsKey(date)) {
        grouped[date] = [];
      }
      grouped[date]!.add(operation);
    }
    return grouped;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final groupedOperations = _groupOperationsByDate();
    final sortedDates = groupedOperations.keys.toList()
      ..sort((a, b) => b.compareTo(a));
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: AppColors.blackColor,
      ),
      body: Container(
        color: AppColors.blackColor,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Finance',
                          style: SettingsTextStyle.title,
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                  ],
                ),
              ),
            ),
            operations.isNotEmpty
                ? Expanded(
                    child: Container(
                      height: size.height * 0.95,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(15),
                            topLeft: Radius.circular(15)),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      color: AppColors.lightGreyColor,
                                    ),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 6.0,
                                          ),
                                          child: Row(
                                            children: [
                                              Text(
                                                'Incomes',
                                                style: HomeScreenTextStyle
                                                    .bannerTitle,
                                                textAlign: TextAlign.center,
                                              ),
                                              Spacer(),
                                              Image.asset(
                                                'assets/icons/input.png',
                                                color: AppColors.greenColor,
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          '+ $_totalIncome \$',
                                          style:
                                              HomeScreenTextStyle.bannerIncome,
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      color: AppColors.lightGreyColor
                                          .withOpacity(0.4),
                                    ),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 6.0,
                                          ),
                                          child: Row(
                                            children: [
                                              Text(
                                                'Spendings',
                                                style: HomeScreenTextStyle
                                                    .bannerTitle,
                                                textAlign: TextAlign.center,
                                              ),
                                              Spacer(),
                                              Image.asset(
                                                  'assets/icons/output.png')
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          '- $_totalSpendings \$',
                                          style: HomeScreenTextStyle
                                              .bannerSpendings,
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: sortedDates.length,
                              itemBuilder: (ctx, index) {
                                String date = sortedDates[index];
                                List<Map<String, dynamic>> dailyOperations =
                                    groupedOperations[date]!;

                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Text(
                                          DateFormat('MMMM d, yyyy').format(
                                              DateFormat('yyyy-MM-dd')
                                                  .parse(date)),
                                          style: HomeScreenTextStyle.titleDate),
                                    ),
                                    ...dailyOperations.map((op) {
                                      bool isIncome = op['type'] == 'Income';
                                      return Container(
                                        decoration: BoxDecoration(
                                          border: Border(
                                            top: BorderSide(
                                              color: AppColors.whiteColor
                                                  .withOpacity(0.1),
                                              width: 1.0,
                                            ),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: ListTile(
                                            title: Row(
                                              children: [
                                                Column(
                                                  children: [
                                                    Text(
                                                      '${op['description']} ',
                                                      softWrap: false,
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.fade,
                                                      style: HomeScreenTextStyle
                                                          .titleName,
                                                    ),
                                                  ],
                                                ),
                                                Spacer(),
                                                Text(
                                                  '${isIncome ? "+" : "-"}${op['amount']}\$',
                                                  style: isIncome
                                                      ? HomeScreenTextStyle
                                                          .income
                                                      : HomeScreenTextStyle
                                                          .spending,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        SvgPicture.asset(
                          'assets/images/home.svg',
                          width: size.width * 0.9,
                          height: size.height * 0.3,
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Text(
                          'There\'s no info',
                          style: HomeScreenTextStyle.emptyTitle,
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Text(
                          'Add your incomes and expenses',
                          style: HomeScreenTextStyle.emptySubtitle,
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                      ],
                    ),
                  )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: AppColors.greenColor,
        child: const Icon(
          Icons.add,
        ),
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ConstructorScreen()),
          );
          if (result != null) {
            _addOperation(result);
          }
        },
      ),
    );
  }
}
