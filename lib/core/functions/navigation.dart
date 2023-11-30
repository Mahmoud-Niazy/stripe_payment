import 'package:flutter/material.dart';

navigate({
  required BuildContext context,
  required Widget screen ,
}){
  Navigator.of(context).push(
    PageRouteBuilder(
      pageBuilder: (context, animation1, animation2) =>
          FadeTransition(
            opacity: animation1,
            child: screen,
          ),
    ),
  );
}