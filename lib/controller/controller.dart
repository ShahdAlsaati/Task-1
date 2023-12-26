import 'package:get/get.dart';

class CalculatorController extends GetxController {
  RxString text = '0'.obs;
  double numOne = 0;
  double numTwo = 0;

  RxString result = ''.obs;
  RxString finalResult = '0'.obs;
  RxString opr = ''.obs;
  RxString preOpr = ''.obs;

  void calculation(btnText) {
    if (btnText == 'AC') {
      text('0');
      numOne = 0;
      numTwo = 0;
      result('');
      finalResult('0');
      opr('');
      preOpr('');
    } else if (opr.value == '=' && btnText == '=') {
      if (preOpr.value == '+') {
        finalResult(add());
      } else if (preOpr.value == '-') {
        finalResult(sub());
      } else if (preOpr.value == 'x') {
        finalResult(mul());
      } else if (preOpr.value == '/') {
        finalResult(div());
      }
      text(finalResult.value);
    } else if (btnText == '+' || btnText == '-' || btnText == 'x' || btnText == '/' || btnText == '=') {
      if (numOne == 0) {
        numOne = double.parse(result.value);
      } else {
        numTwo = double.parse(result.value);
      }

      if (opr.value == '+') {
        finalResult(add());
      } else if (opr.value == '-') {
        finalResult(sub());
      } else if (opr.value == 'x') {
        finalResult(mul());
      } else if (opr.value == '/') {
        finalResult(div());
      }
      preOpr.value = opr.value;
      opr(btnText);
      result('');
      text(finalResult.value);
    } else if (btnText == '%') {
      result((numOne / 100).toString());
      finalResult(doesContainDecimal(result.value));
      text(finalResult.value);
    } else if (btnText == '.') {
      if (!result.value.contains('.')) {
        result(result.value + '.');
      }
      finalResult(result.value);
      text(finalResult.value);
    } else if (btnText == '+/-') {
      result(result.value.startsWith('-') ? result.value.substring(1) : '-' + result.value);
      finalResult(result.value);
      text(finalResult.value);
    } else {
      result(result.value + btnText);
      finalResult(result.value);
      text(finalResult.value);
    }
  }

  String add() {
    result((numOne + numTwo).toString());
    numOne = double.parse(result.value);
    return doesContainDecimal(result.value);
  }

  String sub() {
    result((numOne - numTwo).toString());
    numOne = double.parse(result.value);
    return doesContainDecimal(result.value);
  }

  String mul() {
    result((numOne * numTwo).toString());
    numOne = double.parse(result.value);
    return doesContainDecimal(result.value);
  }

  String div() {
    result((numOne / numTwo).toString());
    numOne = double.parse(result.value);
    return doesContainDecimal(result.value);
  }

  String doesContainDecimal(dynamic result) {
    if (result.toString().contains('.')) {
      List<String> splitDecimal = result.toString().split('.');
      if (!(int.parse(splitDecimal[1]) > 0)) {
        return splitDecimal[0].toString();
      }
    }
    return result.toString();
  }
}
