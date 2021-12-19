import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getglam/controller/controllerauth.dart';
import 'package:getglam/controller/themecontroller.dart';
import 'package:getglam/main.dart';

class CustomAppBar extends AppBar {
  final BuildContext context;
  final ThemeController controller;
  final Controllerauth controluser;

  // Creating a custom AppBar that extends from Appbar with super();
  CustomAppBar({
    Key? key,
    required this.controller,
    required this.context,
    required this.controluser,

    // required this.tile,
  }) : super(
          backgroundColor: Colors.purple.shade900,
          leading: Container(
              width: 120,
              height: 120,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: InkWell(
                child: Image.asset(
                  'assets/img/icon.png',
                ),
                onTap: () {
                  print('signout');
                  signOutDialog(context);
                },
              )),
          title: Image.asset(
            'assets/img/glamtext.png',
            width: 125,
            fit: BoxFit.contain,
          ),

          //Text(controluser.userf),

          actions: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 10, 10, 6),
              child: InkWell(
                child:
                    // Image.asset(
                    //   'assets/img/pclosedeyeico.png',
                    //   height: 6,
                    //   fit: BoxFit.cover,
                    // ),
                    IconButton(
                  icon: Obx(
                    () => Icon(
                      controller.darkMode
                          ? Icons.light_mode_rounded
                          : Icons.dark_mode_rounded,
                    ),
                  ),
                  onPressed: () => controller.darkMode = !controller.darkMode,
                ),
              ),
            ),
          ],
          centerTitle: true,
          elevation: 10,
        );
}
