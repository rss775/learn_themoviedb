import 'package:flutter/material.dart';
import 'package:themoviedb/Theme/app_button_style.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({super.key});

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login to your account'),
        ),
        body: ListView(
          children: [
            _HeaderWidget(),
          ],
        ));
  }
}

class _HeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 16,
      color: Colors.black,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 25),
          _FormWidget(),
          SizedBox(height: 25),
          Text(
            'In order to use the editing and rating capabilities of TMDb, as well as get personal recommendations you will need to login to your account. If you do not have an account, registering for an account is free and simple.',
            style: textStyle,
          ),
          SizedBox(height: 5),
          TextButton(
              onPressed: () {},
              style: AppButtonStyle.linkButton,
              child: Text('Register')),
          SizedBox(height: 25),
          Text(
            'If you signed up but didn`t get your verification email.',
            style: textStyle,
          ),
          SizedBox(height: 5),
          TextButton(
              onPressed: () {},
              style: AppButtonStyle.linkButton,
              child: Text('Verify email')),
        ],
      ),
    );
  }
}

class _FormWidget extends StatefulWidget {
  @override
  State<_FormWidget> createState() => __FormWidgetState();
}

class __FormWidgetState extends State<_FormWidget> {
  final _loginTextController = TextEditingController(text: 'admin');
  final _passwordTextController = TextEditingController(text: 'admin');
  String? errorText = null;

  void _auth() {
    final login = _loginTextController.text;
    final password = _passwordTextController.text;
    if (login == 'admin' && password == 'admin') {
      errorText = null;

      // Navigator.of(context).pushNamed('/main_screen');
      Navigator.of(context).pushReplacementNamed('/main_screen');
    } else {
      errorText = 'Не верный логин или пароль';
      print('show error');
    }
    setState(() {});
  }

  void _resetPassword() {
    print('reset password');
  }

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 16,
      color: Color(0xFF212529),
    );
    final color = Color(0xFF01B4E4);
    final textFieldDecorator = InputDecoration(
      border: OutlineInputBorder(),
      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      isCollapsed: true,
    );
    final errorText = this.errorText;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (errorText != null) ...[
          Text(
            errorText,
            style: TextStyle(
              fontSize: 17,
              color: Colors.red,
            ),
          ),
          SizedBox(height: 20)
        ],
        Text(
          'Username',
          style: textStyle,
        ),
        SizedBox(height: 5),
        TextField(
          controller: _loginTextController,
          decoration: textFieldDecorator,
        ),
        SizedBox(height: 20),
        Text(
          'Password',
          style: textStyle,
        ),
        SizedBox(height: 5),
        TextField(
          controller: _passwordTextController,
          decoration: textFieldDecorator,
          obscureText: true,
        ),
        SizedBox(height: 25),
        Row(
          children: [
            ElevatedButton(
              onPressed: _auth,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(color),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                textStyle: MaterialStateProperty.all(
                  TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 8,
                  ),
                ),
              ),
              child: Text('Login'),
            ),
            SizedBox(
              width: 30,
            ),
            TextButton(
              onPressed: _resetPassword,
              style: AppButtonStyle.linkButton,
              child: Text('Reset Password'),
            ),
          ],
        )
      ],
    );
  }
}
