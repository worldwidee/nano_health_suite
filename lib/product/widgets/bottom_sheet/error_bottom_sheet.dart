import 'package:figma_to_flutter/figma_to_flutter.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/icon_paths.dart';
import '../../../core/states/app_settings/app_settings.dart';
import '../sized_button/sized_button.dart';

class ErrorBottomSheetView extends StatefulWidget {
  final String title, message, submitBtnText;
  final String? errorIconPath;
  final bool listenConnection, neverClose;
  final Widget? errorWidget;
  final Function()? onConnected, onSubmitBtnPressed;
  const ErrorBottomSheetView(
      {super.key,
      required this.title,
      this.submitBtnText = "Ok",
      this.errorWidget,
      this.listenConnection = false,
      this.neverClose = false,
      this.onSubmitBtnPressed,
      this.errorIconPath,
      this.onConnected,
      required this.message});

  @override
  State<ErrorBottomSheetView> createState() => _ErrorBottomSheetViewState();
}

class _ErrorBottomSheetViewState extends State<ErrorBottomSheetView> {
  bool countdownEnded = false;
  bool submitPressed = false;
  @override
  void initState() {
    if (widget.listenConnection) {
      AppSettings.instance.addListener(listenInternetConnection);
    }
    super.initState();
  }

  @override
  void dispose() {
    if (widget.listenConnection) {
      AppSettings.instance.removeListener(listenInternetConnection);
    }
    super.dispose();
  }

  void listenInternetConnection() {
    if (AppSettings.instance.isDeviceConnected) {
      if (widget.onConnected != null) widget.onConnected!();
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    var figma = Figma.of(context);
    final appearance = AppSettings.instance.appearance;
    return WillPopScope(
      onWillPop: () async {
        return !widget.listenConnection && !widget.neverClose ? true : false;
      },
      child: FigmaBox(
        height: 330,
        child: Padding(
          padding: figma.paddingOnly(
            top: 21,
            right: 30,
            left: 30,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FigmaContainer(
                height: 5,
                width: 134,
                decoration: BoxDecoration(
                    color: appearance.bottomSheetStick,
                    borderRadius: BorderRadius.circular(30)),
              ),
              figma.spacer(30, Axis.vertical),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  widget.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: figma.style(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: appearance.bottomSheetTitle,
                      fontFamily: 'SF Pro Display'),
                ),
              ),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(),
                  if (widget.listenConnection == true)
                    const FigmaBox(
                      width: 53,
                      height: 53,
                      child:
                          CircularProgressIndicator(color: Color(0xFFBEBEBE)),
                    )
                  else
                    widget.errorWidget ??
                        FigmaContainer(
                          width: 53,
                          height: 53,
                          decoration: BoxDecoration(
                              color: appearance.bottomErrorIconBg,
                              shape: BoxShape.circle),
                          alignment: Alignment.center,
                          child: Image.asset(
                            IconPaths.error,
                            height: figma.px(23, Axis.vertical),
                          ),
                        ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      widget.message,
                      textAlign: TextAlign.center,
                      style: figma.style(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: appearance.bottomSheetText,
                          fontFamily: 'SF Pro Display'),
                    ),
                  ),
                  const SizedBox(),
                ],
              )),
              SizedButton(
                width: double.infinity,
                height: figma.px(56, Axis.vertical),
                radius: 14,
                onPressed: () {
                  if (isDismissible) {
                    submitPressed = true;
                    if (widget.onSubmitBtnPressed != null) {
                      widget.onSubmitBtnPressed!();
                    } else {
                      Navigator.pop(context);
                    }
                  }
                },
                linearGradient: LinearGradient(
                    colors: appearance.gradientColors,
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
                child: Text(widget.submitBtnText,
                    style: figma.style(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: appearance.bottomSheetText,
                        fontFamily: 'SF Pro Display')),
              ),
              figma.spacer(40, Axis.vertical),
            ],
          ),
        ),
      ),
    );
  }

  bool get isDismissible {
    return (!widget.listenConnection);
  }
}

class ErrorBottomSheet {
  static void unknownErr({required BuildContext context}) {
    customView(
        title: "An unknown error occurred",
        message: "An unknown error occurred.",
        context: context);
  }

  static void wrongFileType({required BuildContext context}) {
    customView(
        title: "Wrong file type!",
        message: "The file you upload must be\nXML type.",
        context: context);
  }

  static void connectionErr({required BuildContext context}) {
    customView(
        title: "Network or service is not avaliable",
        message:
            "We could not establish an internet connection to our service at the moment. Please make sure that you are connected to your network.",
        context: context);
  }

  static void blockedPass(
      {required BuildContext context, required Function() onSubmitBtnPressed}) {
    customView(
        title: "Wrong password limit",
        message: "You have exceeded your limit",
        isDismissible: false,
        neverClose: true,
        submitBtnText: "Re-set password",
        onSubmitBtnPressed: onSubmitBtnPressed,
        context: context);
  }

  static void updateWarning({required BuildContext context}) {
    customView(
        title: "Update Avaliable",
        message: "Update the version of the application",
        isDismissible: false,
        context: context);
  }

  static void listenConnection(
      {required BuildContext context, required Function() onConnected}) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
        barrierColor: Colors.black.withOpacity(0.6),
        isDismissible: false,
        backgroundColor: const Color(0xFFE1E1E1),
        context: context,
        builder: (context) {
          return SingleChildScrollView(
            child: ErrorBottomSheetView(
                title: "Network or service is not avaliable",
                message:
                    "We could not establish an internet connection to our service at the moment. Please make sure that you are connected to your network.",
                onConnected: onConnected,
                listenConnection: true),
          );
        });
  }

  static void customView(
      {required String title,
      required String message,
      String? errorIconPath,
      Widget? errorWidget,
      String submitBtnText = "Ok",
      Function()? onSubmitBtnPressed,
      bool neverClose = false,
      bool? isDismissible,
      required BuildContext context}) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
        barrierColor: Colors.black.withOpacity(0.6),
        backgroundColor: const Color(0xFFE1E1E1),
        isDismissible: isDismissible ?? true,
        context: context,
        builder: (context) {
          return SingleChildScrollView(
            child: ErrorBottomSheetView(
              title: title,
              message: message,
              neverClose: neverClose,
              errorWidget: errorWidget,
              submitBtnText: submitBtnText,
              errorIconPath: errorIconPath,
              onSubmitBtnPressed: onSubmitBtnPressed,
            ),
          );
        });
  }
}
