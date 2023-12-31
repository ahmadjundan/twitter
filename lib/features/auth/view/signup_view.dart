import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controller/auth_controller.dart';
import '../widgets/auth_field.dart';
import '../../../theme/theme.dart';
import 'login_view.dart';
import '../../../constants/ui_constants.dart';
import 'package:twitter_clone/constants/constants.dart';
import '../../../common/common.dart';


class SignUpView extends ConsumerStatefulWidget {
  const SignUpView({super.key});
  static route() => MaterialPageRoute(
        builder: (context) => const SignUpView(),
      );

  @override
  ConsumerState<SignUpView> createState() => _SignUpViewState();
} 
  class _SignUpViewState extends ConsumerState<SignUpView> {
    final appBar = UIConstants.appBar();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    @override
    void dispose() {
      super.dispose();
        emailController.dispose();
        passwordController.dispose();
    }

    void onSignUp() {
      ref.read(authControllerProvider.notifier).signUp(
        email: emailController.text,
        password: passwordController.text,
        context: context,
      );
    }

    @override
    Widget build(BuildContext context) {
      final isLoading = ref.watch(authControllerProvider);
      return Scaffold(
      appBar: appBar,
      body: isLoading
      ? const Loader()
      : Center (
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              AuthField(
                controller: emailController,
                hintText: 'Email',
              ),
              const SizedBox(height: 25.0),
              AuthField(
                controller: passwordController,
                hintText: 'Password',
              ),
              const SizedBox(height: 25.0),
              Align(
                alignment: Alignment.centerRight,
                child: RoundedSmallButton(
                  onTap: onSignUp,
                  label: 'Done',
                ),
              ),
              const SizedBox(height: 40,),
              RichText(
                text: TextSpan(
                  text: "Sudah punya akun? ",
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                  children: [
                  TextSpan(
                    text: "Login",
                    style: const TextStyle(
                      color: Pallete.blueColor,
                      fontSize: 16,
                    ),
                    recognizer: TapGestureRecognizer().. onTap = () {
                      Navigator.push(
                        context,
                        LoginView.route(),
                        );
                    },
                  ),
                ]
                ),
              ),
            ],
          ),
        ),
      ),
    );
    }
  }
