import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:v_room_app/providers/homeProvider/navigation_provider.dart';
import 'package:v_room_app/providers/locale/appLocalization.dart';
import 'package:v_room_app/providers/locale/localizationProvider.dart';
import 'package:v_room_app/screens/splash.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';
import 'package:v_room_app/utils/FontsUtils.dart';

main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: LocalProvider()),
      ChangeNotifierProvider.value(value: AppNavigationProvider()),
    ],
    child: MyMaterial(),
  ));
}

class MyMaterial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var locProvider = Provider.of<LocalProvider>(context);
//final localeLanguage = Platform.localeName;
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: locProvider.appLocal,
        //locale: Locale('en'),
        theme: ThemeData(
            primaryColor: ColorsUtils.primaryGreen,
            fontFamily: FontUtils.MULI_FONT),
        supportedLocales: [
          Locale('en', 'US'),
          Locale('ar', ''),
        ],
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        localeResolutionCallback:
         (local, supportedLocals) {
          for(var supportedLocal in supportedLocals) {
            if (supportedLocal.languageCode == local.languageCode
            &&
            supportedLocal.countryCode == local.countryCode
            ) {
                return supportedLocal;
            }
          }
          return supportedLocals.first;
        },
        home: Splash(),
      ),
    );
  }
}


