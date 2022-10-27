import 'package:flutter/material.dart';
import 'package:touristapp/models/user.dart';
import 'package:touristapp/pages/home_page.dart';
import 'package:touristapp/pages/register_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _email = TextEditingController();
  final _password = TextEditingController();

  User userLoad = User.Empty();

  @override
  void initState() {
    _getUser();
    super.initState();
  }

  _getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> userMap = jsonDecode(prefs.getString("user")!);
    userLoad = User.fromJson(userMap);
  }

  void _showMsg(String msg) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
        SnackBar(content: Text(msg),
          action: SnackBarAction(
              label: 'Accept', onPressed: scaffold.hideCurrentSnackBar),
        )
    );
  }

  void _validateUser () {
    if (_email.text == userLoad.email && _password.text == userLoad.password){
      _showMsg("WELCOME");
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  const HomePage()));
    } else {
      _showMsg("Wrong Email or Password");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Center (
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                const Image(image: AssetImage('assets/images/logo.png'),width: 256,),
                const SizedBox(height: 25.0,),
                TextFormField(
                    controller: _email,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Email'
                    ),
                    keyboardType: TextInputType.emailAddress
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                    controller: _password,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Password'
                    ),
                    keyboardType: TextInputType.emailAddress
                ),
                const SizedBox(
                  height: 16.0,
                ),
                ElevatedButton(
                    onPressed: () {
                      _validateUser();
                    },
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 16),
                      //backgroundColor: Colors.purpleAccent COMMMENT
                    ),
                    child: const Text('Log in')
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterPage()));
                  },
                  child: const Text('Sign Up',
                    style: TextStyle(
                        color: Colors.red
                    ) ,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}