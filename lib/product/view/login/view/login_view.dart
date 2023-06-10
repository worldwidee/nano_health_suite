import 'package:figma_to_flutter/figma_to_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:nano_health_suite/core/constants/icon_paths.dart';
import 'package:nano_health_suite/core/states/app_settings/app_settings.dart';
import 'package:nano_health_suite/product/view/login/model/login_view_model.dart';
import 'package:nano_health_suite/product/view/login/view/login_banner.dart';
import 'package:nano_health_suite/product/widgets/sized_button/sized_button.dart';
import 'package:nano_health_suite/product/widgets/textfield/textfield.dart';

import '../../../widgets/context_updater.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController =
      TextEditingController(text: "mor_2314");
  TextEditingController passwordController =
      TextEditingController(text: "83r5^_");

  var model = LoginViewModel();

  @override
  Widget build(BuildContext context) {
    return ContextUpdater(
      child: GetBuilder<AppSettings>(
        builder: (controller) {
          final appearance = controller.appearance;
          var figma = Figma.of(context);
          return Scaffold(
            backgroundColor: appearance.background,
            body: SingleChildScrollView(
              child: Column(children: [
                const LoginBanner(),
                Padding(
                  padding: figma.paddingSymmetric(horizontal: 36),
                  child: Column(
                    children: [
                      const FigmaBox(
                        height: 54,
                      ),
                      Observer(builder: (context) {
                        return RixaTextFieldFull(
                          height: figma.px(65, Axis.vertical),
                          width: double.infinity,
                          error: model.errorEmail,
                          errorText: model.errorTextEmail,
                          errorStyle: figma.style(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: appearance.invalid,
                              fontFamily: 'SF Pro Display'),
                          hintText: "",
                          labelText: "Email",
                          labelStyle: figma.style(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: appearance.credentialText,
                              fontFamily: 'SF Pro Display'),
                          textStyle: figma.style(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              color: appearance.credentialText,
                              fontFamily: 'SF Pro Display'),
                          focusedColor: appearance.credentialFocusedUnderline,
                          enabledColor: appearance.credentialUnderline,
                          controller: emailController,
                          innerPadding: figma.paddingOnly(bottom: 11, left: 6),
                          suffixIcon: Padding(
                            padding: figma.paddingOnly(right: 19.86),
                            child: Image.asset(
                              !model.errorEmail
                                  ? IconPaths.checkmark
                                  : IconPaths.close,
                              width: figma.px(14.29, Axis.horizontal),
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        );
                      }),
                      const FigmaBox(
                        height: 32,
                      ),
                      Observer(builder: (context) {
                        return RixaTextFieldFull(
                          height: figma.px(65, Axis.vertical),
                          width: double.infinity,
                          hintText: "",
                          labelText: "Password",
                          error: model.errorPassword,
                          errorText: model.errorTextPassword,
                          errorStyle: figma.style(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: appearance.invalid,
                              fontFamily: 'SF Pro Display'),
                          labelStyle: figma.style(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: appearance.credentialText,
                              fontFamily: 'SF Pro Display'),
                          obscureText: model.obscureText,
                          textStyle: figma.style(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              color: appearance.credentialText,
                              fontFamily: 'SF Pro Display'),
                          focusedColor: appearance.credentialFocusedUnderline,
                          enabledColor: appearance.credentialUnderline,
                          controller: passwordController,
                          innerPadding: figma.paddingOnly(bottom: 11, left: 6),
                          suffixIcon: Padding(
                            padding: figma.paddingOnly(right: 9.86),
                            child: TextButton(
                              onPressed: () {
                                model.updateObscureText();
                              },
                              style: TextButton.styleFrom(
                                minimumSize: Size.zero,
                                padding: figma.paddingAll(10),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: Image.asset(
                                model.obscureText
                                    ? IconPaths.hide
                                    : IconPaths.visible,
                                color: appearance.credentialActiveBtn,
                                width: figma.px(14.29, Axis.horizontal),
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                        );
                      }),
                      const FigmaBox(
                        height: 24,
                      ),
                      SizedButton(
                        onPressed: () {
                          model.login(
                              username: emailController.text.trim(),
                              context: context,
                              password: passwordController.text);
                        },
                        width: double.infinity,
                        height: figma.px(74, Axis.vertical),
                        radius: 62,
                        color: appearance.primary,
                        child: Text(
                          "Continue",
                          style: figma.style(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              color: appearance.buttonText,
                              fontFamily: 'SF Pro Display'),
                        ),
                      ),
                      const FigmaBox(
                        height: 33,
                      ),
                      TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            minimumSize: Size.zero,
                            padding: figma.paddingAll(10),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text(
                            "NEED HELP?",
                            style: figma.style(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: appearance.credentialHintText,
                                fontFamily: 'SF Pro Display'),
                          ))
                    ],
                  ),
                )
              ]),
            ),
          );
        },
      ),
    );
  }
}
