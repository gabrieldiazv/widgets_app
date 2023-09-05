import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = "snackbar_screen";

  const SnackbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void showCustomSnackbar(BuildContext context) {
      ScaffoldMessenger.of(context).clearSnackBars();
      final snackback = SnackBar(
          content: const Text('Hola Mundo'),
          action: SnackBarAction(
              label: 'OK!', 
              onPressed: () { },
          )
      );
      ScaffoldMessenger.of(context).showSnackBar(snackback);
    }

    void openDialog(BuildContext context){
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context)=> AlertDialog(
          title: const Text('Estas seguro?'),
          content: const Text('Lorem anim anim laborum eiusmod exercitation cupidatat consequat sit ipsum in officia duis aute occaecat.'),
          actions: [
            TextButton(
              onPressed: (){
                context.pop();
              }, 
              child: const Text('Cancelar')
            ),
            FilledButton(
              onPressed: (){
                context.pop();
              }, 
              child: const Text('Aceptar')
            )
          ],
        ) // el builder se construye en tiempo de ejecucion
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbar y Dialogos'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: (){
                showAboutDialog(
                  context: context,
                  children: [
                    const Text('Ad sint duis irure in adipisicing incididunt velit dolore. Adipisicing do id anim occaecat eiusmod ex est eu fugiat. Duis duis in magna dolor Lorem anim deserunt nisi voluptate. Anim nostrud fugiat deserunt magna eu exercitation. Exercitation aute culpa id adipisicing. Exercitation ad quis qui commodo nulla ad ipsum exercitation ut. Ea aliqua sint aliqua ad sit.'),
                  ]
                );
              }, 
              child: const Text('Licencias usadas')
            ),
            FilledButton.tonal(
              onPressed: () => openDialog(context),
              child: const Text('Mostrar Dialogo')
            )
          ]
        ),
      ),


      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}
