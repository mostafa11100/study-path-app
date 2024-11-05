import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:go_router/go_router.dart';

showerrordilog({message, context}) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.error,
    animType: AnimType.rightSlide,
    title: 'error',
    desc: message,
    btnCancelOnPress: null,
    btnOkOnPress: () {},
  ).show();
}

showesuccesdialog({message, context, ontap}) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.success,
    animType: AnimType.rightSlide,
    title: 'Success',
    desc: message,
    btnCancelOnPress: null,
    btnOkOnPress: () {
      GoRouter.of(context).pop();
      print("button");
      ontap();
    },
  ).show();
}

showeinfodialog({message, context, ontap}) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.success,
    animType: AnimType.rightSlide,
    title: 'warning',
    desc: message,
    btnCancelOnPress: () {},
    btnOkOnPress: () {
      ontap();
    },
  ).show();
}
