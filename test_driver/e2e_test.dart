// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';
import 'pages/home_page.dart';

void main() {
  group('Counter App', () {
    late FlutterDriver driver;
    late HomePage homePage = HomePage(driver);

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      driver.close();
    });

    test('starts at 0', () async {
      // Use the `driver.getText` method to verify the counter starts at 0.
      expect(await homePage.getCounterValue(), "0");
    });

    test('increments the counter', () async {
      // First, tap the button.
      homePage.clickBtnPlus();

      // Then, verify the counter text is incremented by 1.
      expect(await homePage.getCounterValue(), "1");

      //I have implemented in HomePage class, It is same like Thread.sleep(2);
      await Future.delayed(Duration(seconds: 3));

      // Again, tap the plus button.
      homePage.clickBtnPlus();

      // Then, verify the counter text is incremented by 2.
      expect(await homePage.getCounterValue(), "2");

    });

    test('Test the Alert box', () async {

      homePage.clickShowMessageButton();

      expect (await homePage.getAlertText(), "Counter value is: 2");

      await Future.delayed(Duration(seconds: 3));

      homePage.clickCloseButton();

    });

    test("Test the Subtract Button", () async {

      homePage.clickSubtractButton();

      await Future.delayed(Duration(seconds: 3));

      expect (await homePage.getCounterValue(), "2");

    });
  });
}
