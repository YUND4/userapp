import 'package:flutter/material.dart';
import 'package:userapp/src/utils/HexColor.util.dart';

class InitPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: HexColor('#FEDD7C'),
          child: Stack(
            children: [
              Column(
                children: <Widget>[
                  SizedBox(height: 158),
                  Container(
                    margin: EdgeInsets.only(left: 40, right: 20),
                    child: Text(
                      'USERAPP',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 40, right: 20),
                    child: Text(
                      'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam',
                      style: Theme.of(context).textTheme.headline4,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 40,
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 49,
                          child: RaisedButton(
                            color: HexColor('#1A1A1A'),
                            onPressed: () =>
                                Navigator.pushNamed(context, 'login'),
                            child: Text(
                              'IR A LOGIN',
                              style: Theme.of(context).textTheme.headline3,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 300,
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 1.1),
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  'assets/images/download.png',
                  centerSlice: Rect.zero,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
