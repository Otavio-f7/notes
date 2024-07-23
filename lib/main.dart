import 'package:flutter/material.dart';
import 'package:notes/repositories/notes_repository.dart';
import 'package:notes/utils/theme_provider.dart';
import 'package:notes/view/pages/home_page.dart';
import 'package:notes/view/pages/note_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => NotesRepository()),
      ],
      child: Builder(
        builder: (context) {
          return MaterialApp(
            title: 'Notes',
            theme: Provider.of<ThemeProvider>(context).themedata,
            debugShowCheckedModeBanner: false,  
            routes: {
              '/' : (ctx)=> const HomePage(),
              '/note' : (ctx)=> const NotePage(),
            },
          );
        }
      ),
    );
  }
}
