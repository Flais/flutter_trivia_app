import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:trivia_app_flutter/app/modules/home/ui/widgets/back_ground_circle.dart';
import 'package:trivia_app_flutter/app/modules/home/ui/widgets/button_widget.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF251F28),
      body: stack(),
    );
  }

  Widget stack() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          BackGroundCircle(
            positionedFromBottom: 75,
            positionedFromLeft: MediaQuery.of(context).size.width * .05,
            circleSize: 10,
            circleColor: Color(0xFF1D90A7),
          ),
          BackGroundCircle(
            positionedFromBottom: 20,
            positionedFromLeft: MediaQuery.of(context).size.width * .055,
            circleSize: 25,
            circleColor: Color(0xFF802651),
          ),
          BackGroundCircle(
            positionedFromBottom: -35,
            positionedFromLeft: MediaQuery.of(context).size.width * .18,
            circleSize: 50,
            circleColor: Color(0xFF2C8347),
          ),
          BackGroundCircle(
            positionedFromBottom: -3,
            positionedFromLeft: MediaQuery.of(context).size.width * .45,
            circleSize: 10,
            circleColor: Color(0xFF15489A),
          ),
          BackGroundCircle(
            positionedFromBottom: 25,
            positionedFromLeft: MediaQuery.of(context).size.width * .63,
            circleSize: 10,
            circleColor: Color(0xFF649D17),
          ),
          BackGroundCircle(
            positionedFromBottom: -5,
            positionedFromLeft: MediaQuery.of(context).size.width * .78,
            circleSize: 30,
            circleColor: Color(0xFF208183),
          ),
          BackGroundCircle(
            positionedFromBottom: 70,
            positionedFromLeft: MediaQuery.of(context).size.width * .90,
            circleSize: 10,
            circleColor: Color(0xFF50567B),
          ),
          BackGroundCircle(
            positionedFromBottom: 40,
            positionedFromLeft: MediaQuery.of(context).size.width * .98,
            circleSize: 15,
            circleColor: Color(0xFF2C8347),
          ),
          BackGroundCircle(
            positionedFromBottom: -15,
            positionedFromLeft: MediaQuery.of(context).size.width * .95,
            circleSize: 25,
            circleColor: Color(0xFF186B9A),
          ),
          body(),
        ],
      ),
    );
  }

  body() {
    return SafeArea(
      child: Center(
        child: Container(
          width: 500,
          margin: EdgeInsets.only(left: 35, right: 35, bottom: 20),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: 50),
                Image.asset(
                  'assets/images/trivia_logo_transparent.png',
                  width: 100,
                ),
                SizedBox(height: 25),
                displayText(),
                SizedBox(height: 30),
                textField(),
                SizedBox(height: 20),
                buttons(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget textField() {
    return TextFormField(
      controller: controller.numberTriviaTextController,
      textAlign: TextAlign.center,
      cursorColor: Colors.transparent,
      cursorWidth: 0,
      keyboardType: TextInputType.number,
      style: TextStyle(fontSize: 22, color: Colors.white),
      decoration: InputDecoration(
        hintText: 'Type a number here!',
        hintStyle: TextStyle(fontSize: 22, color: Colors.white),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }

  Widget buttons() {
    final List<Widget> _buttons = <Widget>[
      StandardButton(
        text: 'GO!',
        onTap: () {
          if (controller.numberTriviaTextController.text.trim() != '') {
            controller.getNumberTrivia(
              numberTrivia:
                  double.parse(controller.numberTriviaTextController.text),
            );
            FocusScope.of(context).requestFocus(FocusNode());
          } else {
            controller.setDisplayText('Please, type something');
          }
        },
      ),
      Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 25,
        ),
        child: Text(
          'OR',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
      StandardButton(
        text: 'Get a Random Fact!',
        fontSize: 16,
        onTap: () {
          controller.getRandomNumberTrivia();
          FocusScope.of(context).requestFocus(FocusNode());
        },
      ),
    ];

    return Builder(
      builder: (BuildContext context) {
        return MediaQuery.of(context).orientation == Orientation.portrait
            ? Column(
                children: _buttons,
              )
            : Row(
                children: _buttons,
              );
      },
    );
  }

  Widget displayText() {
    return Observer(
      builder: (_) {
        return Text(
          controller.displayText,
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        );
      },
    );
  }
}
