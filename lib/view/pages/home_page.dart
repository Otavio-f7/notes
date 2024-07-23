import 'package:flutter/material.dart';
import 'package:notes/repositories/notes_repository.dart';
import 'package:notes/utils/theme_provider.dart';
import 'package:notes/view/widget/list_notes.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key,});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NotesRepository>(context);
    var screenSize = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: const Text('Notes'),
        actions: [
          IconButton(
            onPressed: (){
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            }, 
            icon: Provider.of<ThemeProvider>(context).isLightMode 
              ? const Icon(Icons.dark_mode) 
              : const Icon(Icons.light_mode), 
          ),
        ],
      ),
      body: SizedBox(
        height: screenSize,
        child:  const Column(
          children: [
            Expanded(child: ListNotes()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.surface,
        onPressed: () async {
          await provider.insertNotes();
          Navigator.of(context).pushNamed('/note', arguments: provider.notes.last);
          },
        child: const Icon(Icons.add),
      )
    );
  }
}