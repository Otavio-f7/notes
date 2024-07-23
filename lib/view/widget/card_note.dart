import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notes/model/note.dart';
import 'package:notes/view/widget/alert_to_delete.dart';

class CardNote extends StatelessWidget {

  final Note note;

  const CardNote(this.note, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).pushNamed('/note', arguments: note);
      },
      onLongPress: () => showDialog(
        context: context,
        builder: (_)=> AlertToDelete(note.id)
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
        child: Card(
          elevation: 1.5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 8,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                ),
                child: Row(
                  children: [
                    const Spacer(),
                    Container(
                      margin: EdgeInsets.zero,
                      padding: const EdgeInsets.only(right: 5),
                      child: Text(DateFormat('dd MMM').format(
                        DateTime.fromMillisecondsSinceEpoch(note.modified)
                        ).toString()),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    note.text,
                    style: const TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}