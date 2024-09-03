import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

GoR({required BuildContext context, required String name}) {
  GoRouter.of(context).push(name);
}
