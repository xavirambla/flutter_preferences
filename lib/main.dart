import 'package:flutter/material.dart';
import 'package:preferences_app/providers/theme_provider.dart';
import 'package:preferences_app/screens/screens.dart';
import 'package:provider/provider.dart';

import 'share_preferences/preferences.dart';


//void main() => runApp(MyApp());
void main() async { 
//  await Preferences.init(); // esto fallará 
// PAra arreglarlo lanzamos este wiget y ahora funcionará
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init(); // esto fallará 
  //runApp(MyApp());
    runApp(
        MultiProvider(
          providers: [
            ChangeNotifierProvider( create: ( _ ) => ThemeProvider(isDarkmode: Preferences.isDarkmode)),
          ],
          child: const MyApp(),

        )

    );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: HomeScreen.routerName,
      routes: {
        HomeScreen.routerName :         ( _ ) => const HomeScreen(),
        SettingsScreen.routerName :     ( _ ) => const SettingsScreen(),
      },
      theme: Provider.of<ThemeProvider>(context).currentTheme,
      
    );
  }
}