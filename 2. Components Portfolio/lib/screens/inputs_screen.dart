import 'package:components_portfolio/widgets/widgets.dart';
import 'package:flutter/material.dart';

class InputsScreen extends StatelessWidget {
  const InputsScreen({super.key, required this.appBar});

  final AppBar appBar;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();
    final Map<String, dynamic> formValues = {
      'first_name': 'John',
      'last_name': 'Doe',
      'email': 'john@doe.com',
      'age': 23,
      'password': '123123123asd',
    };

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: myFormKey,
            child: Column(
              children: [
                CustomInput(
                  helperText: 'First name',
                  hintText: 'Hint text',
                  icon: Icons.account_box,
                  labelText: 'First name',
                  formProperty: 'first_name',
                  formValues: formValues,

                  // suffixIcon: Icons.access_time_filled,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomInput(
                  helperText: 'Lastname',
                  hintText: 'Write your lastname',
                  icon: Icons.account_box,
                  labelText: 'Lastname',
                  formProperty: 'last_name',
                  formValues: formValues,
                  // suffixIcon: Icons.access_time_filled,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomInput(
                  helperText: 'Email',
                  hintText: 'Write your email',
                  labelText: 'Email',
                  suffixIcon: Icons.email,
                  inputType: 'email',
                  formProperty: 'email',
                  formValues: formValues,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomInput(
                  helperText: 'Age',
                  hintText: 'Write your age',
                  labelText: 'Age',
                  suffixIcon: Icons.numbers,
                  inputType: 'number',
                  formProperty: 'age',
                  formValues: formValues,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomInput(
                  helperText: 'Password',
                  hintText: '*********',
                  labelText: 'Password',
                  suffixIcon: Icons.key,
                  inputType: 'password',
                  formProperty: 'password',
                  formValues: formValues,
                ),
                const SizedBox(
                  height: 30,
                ),
                DropdownButtonFormField(
                  items: const [
                    DropdownMenuItem(
                      value: 'admin',
                      child: Text('Admininistrator'),
                    ),
                    DropdownMenuItem(
                      value: 'user',
                      child: Text('Normal user'),
                    ),
                    DropdownMenuItem(
                      value: 'superadmin',
                      child: Text('Super Admin'),
                    ),
                    DropdownMenuItem(
                      value: 'client',
                      child: Text('Client'),
                    ),
                  ],
                  onChanged: (value) => {formValues['role'] = value ?? 'admin'},
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  child: const SizedBox(
                    width: double.infinity,
                    child: Center(child: Text('Save')),
                  ),
                  onPressed: () {
                    print(formValues);
                    FocusScope.of(context).requestFocus(FocusNode());
                    if (!myFormKey.currentState!.validate()) {
                      return;
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
