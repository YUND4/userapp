import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:userapp/src/utils/HexColor.util.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              color: HexColor('#FEDD7C'),
              alignment: Alignment.bottomCenter,
            ),
            Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 2.1,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 30, top: 80, right: 30),
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Icon(
                                    FeatherIcons.user,
                                    color: HexColor('#FEDD7C'),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  flex: 5,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      hintText: 'Username',
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Icon(
                                    FeatherIcons.lock,
                                    color: HexColor('#FEDD7C'),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  flex: 5,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      hintText: 'Password',
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 35,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 49,
                                    child: RaisedButton(
                                      color: HexColor('#FEDD7C'),
                                      onPressed: () => {
                                        Navigator.pushNamed(context, 'home')
                                      },
                                      child: Text(
                                        'SIGN IN',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline3,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 35,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: Text(
                                    "Don't have an account?",
                                    textAlign: TextAlign.right,
                                    style:
                                        Theme.of(context).textTheme.headline5,
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    "   SIGN UP",
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(110),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Image.asset(
                      'assets/images/download.png',
                      height: MediaQuery.of(context).size.height / 1.9,
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
