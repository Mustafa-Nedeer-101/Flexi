import 'package:flexi/bindings/general_bindings.dart';
import 'package:flexi/routes/app_routes.dart';
import 'package:flexi/utils/constants/colors.dart';
import 'package:flexi/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: CustomAppTheme.lightTheme,
      darkTheme: CustomAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      getPages: AppRoutes.pages,
      home: const Scaffold(
        backgroundColor: CColors.white,
        body: Center(
          child: CircularProgressIndicator(
            color: CColors.primary,
          ),
        ),
      ),
    );
  }
}
