import 'package:flutter_driver/flutter_driver.dart';

class HomePage {
  final txtCounter = find.byValueKey('counterText');
  final btnIncrement = find.byTooltip('Increment');
  final btnShowMessage = find.byValueKey('alertButton');
  final txtAlert = find.byValueKey("alert_text");
  final btnClose = find.byValueKey("close_button");
  final btnSubtract = find.text("Subtract");

  late FlutterDriver _driver;

  HomePage(FlutterDriver driver) {
    this._driver = driver;
  }

  Future <String> getCounterValue() async{
    return await _driver.getText(txtCounter);
  }

  Future <String> getAlertText() async{
    return await _driver.getText(txtAlert);
  }

  Future<void> clickCloseButton() async {
    _driver.tap(btnClose);
  }

  Future<void> clickBtnPlus() async {
      await _driver.tap(btnIncrement);
  }

  Future<void> clickSubtractButton() async{
    await _driver.tap(btnSubtract);
  }

  Future<void> clickShowMessageButton() async {
    _driver.tap(btnShowMessage);
  }

  Future<void> waitForElement() async {
    await Future.delayed(Duration(seconds: 3));
  }
}
