String persianPriceFormatter(int price) {
  String eng = price.toString();
  final buffer = StringBuffer();
  for (int i = 0; i < eng.length; i++) {
    int position = eng.length - i;
    buffer.write(eng[i]);
    if (position > 1 && position % 3 == 1) {
      buffer.write(',');
    }
  }
  const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  const persian = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];

  String formatted = buffer.toString();
  for (int i = 0; i < english.length; i++) {
    formatted = formatted.replaceAll(english[i], persian[i]);
  }

  return formatted;
}

String persianNumberFormatter(int number) {
  const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  const persian = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];
  String formatted = number.toString();
  for (int i = 0; i < english.length; i++) {
    formatted = formatted.replaceAll(english[i], persian[i]);
  }
  return formatted;
}
