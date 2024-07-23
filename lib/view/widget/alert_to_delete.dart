import 'package:flutter/material.dart';
import 'package:notes/repositories/notes_repository.dart';
import 'package:provider/provider.dart';

class AlertToDelete extends StatelessWidget {
  final int index;
  final int id;
  const AlertToDelete(this.index, this.id, {super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NotesRepository>(context);
    return AlertDialog(
          actionsAlignment: MainAxisAlignment.center,
          alignment: Alignment.center,
          title: const Text('Exluir', textAlign: TextAlign.center,),
          content: const Text('Deseja excluir essa nota', textAlign: TextAlign.center),
          actions: [
            TextButton(
              onPressed: (){
                provider.deleteNote(index, id);
                Navigator.of(context).pop();
              }, 
              child:  const Text('Sim'),
            ),
            TextButton(
              onPressed: (){Navigator.of(context).pop();}, 
              child: const Text('Não'),
            ),
          ],
        );
  }
}