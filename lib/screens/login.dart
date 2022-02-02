import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var wrongLogin = 'Неверный логин';
    var wrongPassword = 'Неверный пароль';
    final _formKey = GlobalKey<FormState>();

    const borderStyle = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(18.0)),
      borderSide: BorderSide(color: Colors.yellowAccent, width: 2),
    );
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.deepPurple[500],
          width: double.infinity,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Итоговая работа курса Flutter',
                    style: TextStyle (fontStyle: FontStyle.italic,fontSize: 20,color: Colors.yellowAccent),),
                    const SizedBox(height: 20),
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value != '+79120000000') {
                          return wrongLogin;
                        }
                      },
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                          icon: Icon(
                            Icons.mail,
                            color: Colors.yellowAccent,
                          ),
                          hintText: '+79120000000',
                          enabledBorder: borderStyle,
                          focusedBorder: borderStyle,
                          errorBorder: borderStyle,
                          filled: true,
                          fillColor: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value != 'pass') {
                          return wrongPassword;
                        }
                      },
                      obscureText: true,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                          icon: Icon(
                            Icons.lock,
                            color: Colors.yellowAccent,
                          ),
                          enabledBorder: borderStyle,
                          focusedBorder: borderStyle,
                          errorBorder: borderStyle,
                          filled: true,
                          hintText: 'pass',
                          fillColor: Colors.white),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.pushNamed(context, '/home');
                          }
                        },
                        child: const Text(
                          'Войти',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.yellowAccent
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
