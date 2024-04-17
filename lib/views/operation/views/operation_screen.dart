import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import '../../../consts/app_colors.dart';
import '../../../util/app_routes.dart';
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

  double get _totalForYear {
    double total = 0;
    operations.forEach((op) {
      if (op['type'] == 'Income') {
        total += op['amount'];
      } else {
        total -= op['amount'];
      }
    });
    return total;
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
    final screenSize = MediaQuery.of(context).size;
    final groupedOperations = _groupOperationsByDate();
    final sortedDates = groupedOperations.keys.toList()
      ..sort((a, b) => b.compareTo(a));
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: AppColors.blackColor,
        title: const Text(
          'Finance',
          // style: SynopsisTextStyle.appbar,
          textAlign: TextAlign.center,
        ),
      ),
      body: Container(
        color: AppColors.blackColor,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  // color: AppColors.darkGreyColor,
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Colors.black,
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
                                        //  style: FinanceTextStyle.bannerTitles,
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
                                  style: TextStyle(color: AppColors.greenColor),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Colors.black,
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
                                        //  style: FinanceTextStyle.bannerTitles,
                                        textAlign: TextAlign.center,
                                      ),
                                      Spacer(),
                                      Image.asset('assets/icons/output.png')
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  '- $_totalSpendings \$',
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            operations.isNotEmpty
                ? Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(15),
                            topLeft: Radius.circular(15)),
                        //  color: AppColors.darkGreyColor,
                      ),
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
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  DateFormat('MMMM d, yyyy').format(
                                      DateFormat('yyyy-MM-dd').parse(date)),
                                  //  style: FinanceTextStyle.date
                                ),
                              ),
                              ...dailyOperations.map((op) {
                                bool isIncome = op['type'] == 'Income';
                                return ListTile(
                                  leading: SvgPicture.asset(
                                      'assets/images/money.svg'),
                                  title: Row(
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            '${op['description']} ',
                                            // style: FinanceTextStyle.tileTitle,
                                            softWrap: false,
                                            maxLines: 1,
                                            overflow: TextOverflow.fade,
                                          ),
                                          Text(
                                            '${op['comment']} ',
                                            // style: FinanceTextStyle.tileSubitle,
                                            softWrap: false,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                      Spacer(),
                                      Text(
                                        '${isIncome ? "+" : "-"}${op['amount']}\$',
                                        // style: isIncome
                                        //     ? FinanceTextStyle.tileSumIn
                                        //     : FinanceTextStyle.tileSumSp,
                                      )
                                    ],
                                  ),
                                );
                              }).toList(),
                            ],
                          );
                        },
                      ),
                    ),
                  )
                : Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: screenSize.height * 0.1,
                        ),
                        const Text(
                          'There is no information on income and expenses yet',
                          // style: FinanceTextStyle.tileTitle,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Click on the button below',
                          //  style: FinanceTextStyle.input,
                        ),
                      ],
                    ),
                  )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: AppColors.greenColor,
        child: Icon(Icons.add, color: Colors.white),
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
