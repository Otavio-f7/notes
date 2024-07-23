
import 'package:flutter/material.dart';
import 'package:notes/model/note.dart';
import 'package:notes/repositories/notes_repository.dart';
import 'package:provider/provider.dart';

class NotePage extends StatefulWidget {
  const NotePage({super.key});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  @override
  Widget build(BuildContext context) {
    var note = ModalRoute.of(context)!.settings.arguments as Note;
    var repository = Provider.of<NotesRepository>(context);
    final formKey = GlobalKey<FormState>();
    final textNote = TextEditingController();
    textNote.text = note.text;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
        actions: [
          IconButton(
            onPressed: (){
              if(formKey.currentState!.validate()){
                repository.setNotes( note.id, textNote.text, DateTime.now().millisecondsSinceEpoch);
                Navigator.of(context).pop();
              }
            }, 
            icon: const Icon(Icons.save)
          ),
        ],
      ),
      body: Form(
        key: formKey,
        child: TextFormField(
          maxLines: 33,
          controller: textNote,
          keyboardType: TextInputType.multiline,
          validator: (value) {
            if(value!.isEmpty) return 'Informe um texto para a nota';
            return null; 
          },
        ),
      ),
    );
  }
}


