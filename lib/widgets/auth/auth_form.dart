import 'package:chatapp/pickers/user_image_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({
    super.key,
    required this.submitFunction,
    required this.isLoading,
  });

  final bool isLoading;
  final void Function(
    String email,
    String userName,
    XFile image,
    String password,
    bool isLogIn,
    BuildContext ctx,
  ) submitFunction;

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final formKey = GlobalKey<FormState>();
  bool isLoggedIn = true;
  String userEmail = '';
  String userName = '';
  String userPassword = '';
  XFile userImageFile = XFile('path');

  void pickedImage(XFile image) {
    userImageFile = image;
  }

  void _trySubmit() {
    final isValid = formKey.currentState!.validate();

    FocusScope.of(context).unfocus();

    if (userImageFile == null && !isLoggedIn) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Please pick an image.'),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
      return;
    }

    if (isValid) {
      formKey.currentState!.save();
      widget.submitFunction(
        userEmail.trim(),
        userName.trim(),
        userImageFile,
        userPassword.trim(),
        isLoggedIn,
        context,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (!isLoggedIn)
                    UserImagePicker(
                      imagePickFunction: pickedImage,
                    ),
                  TextFormField(
                    key: const ValueKey('email'),
                    validator: ((value) {
                      if (value!.isEmpty || !value.contains('@')) {
                        return 'Please enter a valid email address.';
                      }
                      return null;
                    }),
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Email Address',
                    ),
                    onSaved: ((newValue) {
                      userEmail = newValue!;
                    }),
                  ),
                  if (!isLoggedIn)
                    TextFormField(
                      key: const ValueKey('name'),
                      validator: ((value) {
                        if (value!.isEmpty || value.length < 4) {
                          return 'Please enter atleast 4 characters.';
                        }
                        return null;
                      }),
                      decoration: const InputDecoration(
                        labelText: 'User name',
                      ),
                      onSaved: ((newValue) {
                        userName = newValue!;
                      }),
                    ),
                  TextFormField(
                    key: const ValueKey('password'),
                    validator: ((value) {
                      if (value!.isEmpty || value.length < 7) {
                        return 'Password must be atleast 7 characters long.';
                      }
                      return null;
                    }),
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                    ),
                    onSaved: ((newValue) {
                      userPassword = newValue!;
                    }),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  if (widget.isLoading) const CircularProgressIndicator(),
                  if (!widget.isLoading)
                    ElevatedButton(
                      onPressed: _trySubmit,
                      child: Text(
                        isLoggedIn ? 'Login' : 'Sign Up',
                      ),
                    ),
                  if (!widget.isLoading)
                    TextButton(
                      onPressed: () {
                        setState(() {
                          isLoggedIn = !isLoggedIn;
                        });
                      },
                      child: Text(
                        isLoggedIn
                            ? 'Create new account'
                            : 'I already have an account.',
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
