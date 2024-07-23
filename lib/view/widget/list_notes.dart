
import 'package:flutter/material.dart';
import 'package:notes/model/note.dart';
import 'package:notes/repositories/notes_repository.dart';
import 'package:notes/view/widget/card_note.dart';
import 'package:provider/provider.dart';

class ListNotes extends StatelessWidget {
  // final List list; 
  const ListNotes(
    // this.list, 
    {super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NotesRepository>(context);
    final List<Note> notesList = provider.notes;
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 3/2,
          crossAxisSpacing: 0.3,
        ),
        shrinkWrap: true,
        itemCount: notesList.length,
        itemBuilder: (ctx, i) => Padding(
          padding: const EdgeInsets.all(5),
          child: CardNote(i, notesList[i]),
        )),
    );
  }
}