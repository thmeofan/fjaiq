class NewsModel {
  final String imageUrl;
  final String title;
  final String text;
  final String date;

  NewsModel({
    required this.imageUrl,
    required this.title,
    required this.text,
    required this.date,
  });
}

final news = [
  NewsModel(
      date: 'today',
      imageUrl: 'https://www.tekscan.com/sites/default/files/HighSpeedBoat.jpg',
      title: 'The Importance of Budgeting',
      text:
          'Financial literacy starts with learning how to budget properly. A budget is simply a plan for how you\'ll spend your money each month. It allows you to understand where your money is going and ensures you don\'t spend more than you earn.The first step is to track your income and expenses for a month. Total up your monthly income from jobs, side gigs, etc. Then categorize your expenses into needs like rent, groceries and utilities as well as wants like dining out, entertainment and vacations. Aim to spend no more than you earn each month, prioritizing needs over wants.Having a realistic budget helps you live within your means, pay bills on time, work towards goals like saving for emergencies, and avoid going into debt. Budgeting is the foundation for building wealth over time.'),
  NewsModel(
      imageUrl:
          'https://www.shutterstock.com/image-photo/sailboat-sea-evening-sunlight-over-600nw-717244969.jpg',
      title: 'Understanding Credit and Credit Scores',
      text:
          'Your credit score is one of the most important numbers in your financial life. It helps lenders determine your creditworthiness and ability to repay debt. A high score qualifies you for the best interest rates on loans and credit cards.Credit scores range from 300-850. Scores above 700 are considered good, while scores above 800 are excellent. Payment history is the biggest factor impacting your score, so paying all bills on time is crucial. Amounts owed, length of credit history, new credit applications and credit mix also play a role.Checking your credit report annually from the three major bureaus allows you to catch errors or signs of potential fraud. Practicing good credit habits like keeping balances low and limiting new applications will help maintain a strong credit score over time.',
      date: '22 march'),
  NewsModel(
      imageUrl:
          'https://i.pinimg.com/originals/58/7c/48/587c48648e29afaabf45ff2c0bfad6a2.jpg',
      title: 'The Power of Compound Interest',
      text:
          'One of the most powerful concepts in personal finance is compound interest. This is when the interest you earn starts earning interest itself over time. It\'s like a snowball that grows bigger and bigger as it rolls downhill.For example, if you invest \$10,000 with a 7% annual return, after one year you\'ll have \$10,700. The next year, you\'ll earn 7% interest on the new balance of \$10,700, giving you \$11,449. As the years go by, more and more interest accumulates on the growing balance.The earlier you start investing and the longer you leave your money invested, the more compound interest can work its magic. That\'s why it\'s so important to start saving and investing for retirement as soon as possible, even if you can only afford to put away small amounts initially. Compound interest is a wealth-building powerhouse.',
      date: '10 january'),

  NewsModel(
      imageUrl:
          'https://media.istockphoto.com/id/1126132797/photo/small-old-school-and-vintage-yellow-orange-speed-boat.webp?b=1&s=170667a&w=0&k=20&c=3kIZLea7d0CPg2c8b5jaQMPVOeoH3MiAn0xfj78PWnE=',
      title: 'Pay Yourself First',
      text:
          'The golden rule of saving and investing is to pay yourself first before anything else. Treat your future needs as a monthly bill that gets paid automatically, just like rent or a car payment. Even if you start small by allocating \$25 or \$50 per paycheck, those dollars add up significantly over time thanks to the power of compound growth.Set up automatic transfers from your checking account into dedicated savings and investment accounts so you don\'t even miss the money or have a chance to spend it frivolously. Paying yourself first by making savings a priority ensures you make a consistent habit of socking away money for important long-term goals like retirement, emergencies, education and more.Making a commitment to automatically pay your future self first develops the discipline required for building real wealth gradually over many years and decades. It\'s easy to fritter away small amounts, but when those small amounts are invested, they can blossom into substantial sums through compounding.',
      date: '28 february'),

  NewsModel(
      date: '17 march',
      imageUrl:
          'https://brunswick.scene7.com/is/image/brunswick/23_FIB_BL_FallUrgencyCampaign_HP_RESIZE?\$H-2000-2000\$&fit=constrain&fmt=webp-alpha',
      title: 'The Wonders of Compound Interest',
      text:
          'One of the most powerful tools for building wealth over decades is compound interest. This is where the interest, dividends and capital gains you earn begin earning interest on themselves over and over again in a virtuous cycle of growth.For example, \$10,000 invested for 30 years at a 7% annual return could grow to over \$76,000 thanks to compounding. Each year, the interest earned gets added to the principal balance, which then earns interest on the new larger balance the next year, and so on. Starting early maximizes this compounding effect.Investing even small amounts regularly in diversified stock and bond funds can create a substantial nest egg through the magic of compounding over many years. The key is making consistent contributions and giving your money as much time as possible to compound. Thanks to this exponential growth, money invested early in life has the largest impact.'),
//
  NewsModel(
      imageUrl:
          'https://static.wixstatic.com/media/fcaebf_66396a0d5b8d4bcb9f9368b52ae4e900~mv2.jpg/v1/fill/w_1000,h_552,al_c,q_85/fcaebf_66396a0d5b8d4bcb9f9368b52ae4e900~mv2.jpg',
      title: 'Diversify for Long-Term Growth',
      text:
          'The best way to grow your savings and investments for major goals like retirement is through a diversified portfolio of stocks, bonds and other assets. Don\'t put all your eggs in one basket by only owning a few investments. Instead, own total market index funds that provide broad exposure to thousands of stocks and investment grade bond funds.This diversification reduces overall portfolio volatility while still allowing you to capture the historically higher returns of the stock market over decades. Maintaining a diversified mix of assets like stocks, bonds, real estate and commodities helps buffer the ups and downs since different investments zig when others zag.It\'s also important to maintain a long-term outlook, regularly rebalance your portfolio to maintain your target asset allocation, and avoid emotional decisions based on short-term market moves. Diversification combined with patience, discipline and a buy-and-hold mentality is the path to long-term investment success.',
      date: '20 february'),

  NewsModel(
      imageUrl:
          'https://features.boats.com/boat-content/files/2012/05/Centurion-Enzo-244.jpg',
      title: 'Understanding Mortgages',
      text:
          'For most people, a mortgage will be the largest loan they ever take out. A mortgage is a type of loan used to purchase a home or property where the home itself serves as collateral for the lender.The most common mortgage is a 30-year fixed-rate loan where you lock in an interest rate for the full 30-year term. Your monthly payment stays the same for 30 years, making it easier to budget. However, you\'ll pay more interest over the life of the loan compared to a shorter term.A 15-year fixed mortgage has higher monthly payments but you pay it off twice as fast and with much less total interest paid to the lender over those 15 years.Your interest rate is determined by your credit score, down payment amount, debt-to-income ratio and the mortgage type. Higher credit scores and larger down payments qualify you for the best rates.It\'s recommended to get pre-approved by a lender before home shopping to understand what you can afford. Pre-approval involves providing pay stubs, tax returns, bank statements and having your credit pulled.',
      date: '18 march'),
];
