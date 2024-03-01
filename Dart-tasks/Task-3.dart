    import 'dart:async';

class Calculator {
  double add(double a, double b) {
    return a + b;
  }

  double subtract(double a, double b) {
    return a - b;
  }

  double multiply(double a, double b) {
    return a * b;
  }

  double divide(double a, double b) {
    if (b == 0) {
     throw ZeroDivisonError('Cannot divide by zero');
    }
    return a / b;
  }
}
  Calculator calculator = Calculator();

  try {
    double number1 = double.parse(await promptUser('Enter number 1: '));
    double number2 = double.parse(await promptUser('Enter number 2: '));
  var operator= promptUser('Enter the operation');
    if(operator=='+'){
    double result = calculator.add(number1, number2);
    
    printResultAfterDelay(result);}
    if(operator=='*'){
    double result = calculator.multiply(number1, number2);
    
    printResultAfterDelay(result);}
    if(operator=='/'){
    double result = calculator.divide(number1, number2);
    
    printResultAfterDelay(result);}
    if(operator=='-'){
    double result = calculator.subtract(number1, number2);
    
    printResultAfterDelay(result);}
    
  } catch (e) {
    print('Error: $e');
  }
}

Future<String> promptUser(String message) {
  Completer<String> completer = Completer();

  Timer(Duration(seconds: 5), () {
    completer.complete('5');
  });

  print(message);
  return completer.future;
}

void printResultAfterDelay(double result) {
  Timer(Duration(seconds: 5), () {
    print('Result: $result');
  });
}
