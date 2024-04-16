class Question {
  final String text;

  // final Category;
  final List<Option> options;
  bool isLocked;
  Option? selectedOption;

  Question({
    required this.text,
    // required this.Category,
    required this.options,
    this.isLocked = false,
    this.selectedOption,
  });
}

// enum Category { rules, teams, players, clubHistory }

class Option {
  final String text;
  final bool isCorrect;

  const Option({
    required this.text,
    required this.isCorrect,
  });
}

final questions = [
  Question(
      text: 'What is APR in the context of credit cards and loans?',
      options: [
        Option(text: 'Annual Percentage Rate', isCorrect: true),
        Option(text: 'Automatic Payment Recognition', isCorrect: false),
        Option(text: 'Annual Amortization Rate', isCorrect: false)
      ]),
  Question(
      text:
          'What is the process of assessing the value of an asset or property called?',
      options: [
        Option(text: 'Shareholder Assessment', isCorrect: false),
        Option(text: ' Market Valuation', isCorrect: true),
        Option(text: 'Active Management', isCorrect: false)
      ]),
  Question(text: 'What is ETF?', options: [
    Option(text: 'One-time Trading Fund', isCorrect: false),
    Option(text: 'Exchange-Traded Fund', isCorrect: true),
    Option(text: 'Economic Tariff Fund', isCorrect: false)
  ]),
  Question(text: 'What is the difference between stocks and bonds?', options: [
    Option(
        text:
            'Bonds represent ownership in a company, and stocks represent a promise to return money.',
        isCorrect: false),
    Option(
        text:
            ' Stocks represent ownership in a company, and bonds represent a company\'s debt obligation.',
        isCorrect: true),
    Option(text: 'Bonds and stocks are the same thing.', isCorrect: false),
  ]),
  Question(text: 'What is an IRA?', options: [
    Option(text: 'Individual Reserve Account ', isCorrect: false),
    Option(text: ' Individual Stock Growth', isCorrect: false),
    Option(text: 'Individual Retirement Account', isCorrect: true),
  ]),
  Question(text: 'What factors affect a person\'s credit score?', options: [
    Option(text: 'Monthly income amount and eye color.', isCorrect: false),
    Option(text: 'Payment history and debt level.', isCorrect: true),
    Option(
        text: 'Love for cats and the number of friends on social media.',
        isCorrect: false),
  ]),
  Question(
      text:
          'What is cash flow, and why is it important for financial planning?',
      options: [
        Option(
            text:
                ' It\'s the cash flowing into a bank account, important for loan repayment.',
            isCorrect: false),
        Option(
            text: ' It\'s a company\'s profit, important for stock growth.',
            isCorrect: false),
        Option(
            text:
                'It\'s the flow of cash into and out of a business or personal finances, important for evaluating financial health and decision-making.',
            isCorrect: true),
      ]),
  Question(text: 'What is compound interest?', options: [
    Option(text: ' Interest paid by the bank each year.', isCorrect: false),
    Option(
        text: 'Interest accrued only on the principal amount.',
        isCorrect: false),
    Option(
        text:
            'Interest earned on the initial deposit and the interest already earned on it.',
        isCorrect: true),
  ]),
  Question(
      text: 'What types of insurance are typically included in auto insurance?',
      options: [
        Option(
            text: 'Life insurance and unemployment insurance.',
            isCorrect: false),
        Option(text: 'Home insurance and health insurance.', isCorrect: false),
        Option(
            text: ' Damage insurance and injury insurance.', isCorrect: true),
      ]),
  Question(
      text:
          'What is an investment portfolio, and why is it important for risk diversification?',
      options: [
        Option(
            text:
                ' It\'s a collection of funds gathered for investment in a single asset.',
            isCorrect: false),
        Option(
            text:
                'It\'s a combination of various assets such as stocks, bonds, real estate, and others, important for reducing investment risk.',
            isCorrect: true),
        Option(
            text:
                'It\'s a strategy of investing only in one type of asset for maximizing profit.',
            isCorrect: false),
      ]),
  Question(
      text: 'What documents are required for filing a tax return in the USA?',
      options: [
        Option(text: 'Only a passport.', isCorrect: false),
        Option(text: 'Only a W-2 form.', isCorrect: false),
        Option(
            text: 'W-2 form, 1099 form, income, and deduction information.',
            isCorrect: true),
      ]),
  Question(text: 'What strategies can be used for debt reduction?', options: [
    Option(text: 'Only ignoring debts.', isCorrect: false),
    Option(
        text: 'Creating a budget and planning debt repayment.',
        isCorrect: true),
    Option(text: 'Closing all credit cards.', isCorrect: false),
  ]),
  Question(text: 'What is the rule of 72 used for in finance?', options: [
    Option(text: 'Calculating compound interest.', isCorrect: true),
    Option(text: 'Assessing creditworthiness', isCorrect: false),
    Option(text: 'Determining retirement age.', isCorrect: false),
  ]),
  Question(
      text: 'What does FICO stand for in relation to credit scores?',
      options: [
        Option(
            text: 'Financial Indicators and Credit Outcomes.',
            isCorrect: false),
        Option(
            text: ' Financial Instrument for Credit Oversight.',
            isCorrect: false),
        Option(text: 'Fair Isaac Corporation.', isCorrect: true),
      ]),
  Question(text: 'What is the purpose of a 401(k) retirement plan?', options: [
    Option(text: 'Tax-free savings account.', isCorrect: false),
    Option(
        text: 'Employer-sponsored retirement savings plan.', isCorrect: true),
    Option(text: ' Student loan repayment program.', isCorrect: false),
  ]),
];
