import 'package:flutter/material.dart';
import 'package:preferences_app/providers/theme_provider.dart';
import 'package:preferences_app/share_preferences/preferences.dart';
import 'package:preferences_app/widgets/side_menu.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  static const String routerName ='Settings';

   const SettingsScreen ({Key? key}) : super(key:  key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
/*
  bool isDarkmode = Preferences.isDarkmode;
  int gender =1;
  String name= 'Pedro';
*/
   @override
   Widget build (BuildContext context){  
      return Scaffold(
        appBar: AppBar(
          title: const  Text('Settings'),
          ),
          drawer: const SideMenu(),
         body: SingleChildScrollView(   // recomendable cuando tienes cajas de texto, para evitar que el teclado puede tapar el widget
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                const Text('Ajustes', style: TextStyle( fontSize: 45,fontWeight: FontWeight.w300),),
                const Divider(),
                SwitchListTile(
                  value: Preferences.isDarkmode, 
                  title: const Text('Darkmode'),
                onChanged:  ( value ){
                      Preferences.isDarkmode=value;
                      final themeProvider = Provider.of<ThemeProvider>(context,listen:false);
                      value 
                        ? themeProvider.setDarkmode() 
                        : themeProvider.setLightMode();
                      setState(() {      });


                }
                ),
                const Divider(),
                RadioListTile<int>(
                  title: const Text('Masculino'),
                  value: 1, //el valor que asigna cuando se cambia
                  groupValue:Preferences.gender,  // la variable que debe pintar
                  onChanged: ( value ){
                      Preferences.gender =value ?? 1 ;
                      setState(() {      });

                  }
                  
                  ),
                const Divider(),
                RadioListTile<int>(
                  title: const Text('Femenino'),
                  value: 2, 
                  groupValue: Preferences.gender, 
                  onChanged: ( value ){
                      Preferences.gender = value ?? 2 ;  // o ponemos el value que es un 2, o lo asignamos en caso que venga vacío
                      setState(() {      });

                  }
                  
                  )  ,
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    initialValue: Preferences.name,
                    onChanged: (value) {
                      Preferences.name =value;
                      setState(() {      });                      
                    },
                    decoration: const InputDecoration(
                      labelText: 'Nombre',
                      helperText: 'Nombre del usuario',

                    ),
                
                  ),
                )                                  
              ]
              ,),
         )

      );
   }
}