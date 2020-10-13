import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:userapp/src/Services/Queries.service.dart';
import 'package:userapp/src/Services/Users.service.dart';
import 'package:userapp/src/models/User/User.model.dart';
import 'package:userapp/src/utils/HexColor.util.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        child: Stack(
          children: [
            _background(),
            _form(),
            _robot(),
          ],
        ),
      ),
    );
  }

  Widget _robot() => Column(
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
      );

  Widget _background() => Container(
        color: HexColor('#FEDD7C'),
        alignment: Alignment.bottomCenter,
      );

  Widget _form() => Column(
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
                      _field(
                        hint: 'Username',
                        icon: FeatherIcons.user,
                        controller: _userController,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      _field(
                        hint: 'Password',
                        icon: FeatherIcons.lock,
                        controller: _passwordController,
                        pass: true,
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      _button(),
                      SizedBox(
                        height: 35,
                      ),
                      _footer()
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
      );

  Widget _button() => Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: 49,
              child: RaisedButton(
                color: HexColor('#FEDD7C'),
                onPressed: _onSubmit,
                child: Text(
                  'SIGN IN',
                  style: Theme.of(context).textTheme.headline3,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
          ),
        ],
      );

  Widget _footer() => Row(
        children: [
          Expanded(
            flex: 5,
            child: Text(
              "Don't have an account?",
              textAlign: TextAlign.right,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              "   SIGN UP",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ],
      );

  Widget _field(
          {String hint,
          IconData icon,
          TextEditingController controller,
          bool pass = false}) =>
      Row(
        children: [
          Expanded(
            flex: 1,
            child: Icon(
              icon,
              color: HexColor('#FEDD7C'),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
            flex: 5,
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                hintText: hint,
              ),
              obscureText: pass,
            ),
          ),
          SizedBox(
            width: 15,
          ),
        ],
      );

  void _onSubmit() {
    Future.sync(() async {
      var result = await UserService.getContacts();
      if (result.hasException) {
        _openTooltip(message: 'Error: ${result.exception}');
      } else if (result.loading && result.data == null) {
        _openTooltip(message: 'Credenciales incorrectas');
      } else {
        if (_login(data: result.data))
          Navigator.pushNamed(context, 'home');
        else
          _openTooltip(message: 'Credenciales incorrectas');
      }
    });
  }

  bool _login({Map data}) {
    dynamic list =
        (data['users']['data'] as List).map((e) => User.json(e)).toList();
    list = list.where((element) {
      if (element.username == _userController.text &&
          element.phone == _passwordController.text)
        return true;
      else
        return false;
    });
    return list.isNotEmpty;
  }

  void _openTooltip({String message}) {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
