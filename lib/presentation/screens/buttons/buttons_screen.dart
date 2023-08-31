import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = "buttons_screen";
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Buttons Screen"),
      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => context.pop()),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          spacing: 10,
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {}, child: const Text('Elevated buttons')),
            const ElevatedButton(
                onPressed: null, child: Text('Elevated disabled')),
            ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.access_alarm_outlined),
                label: const Text('Elevated icon')),
            FilledButton(onPressed: () {}, child: const Text('filled button')),
            FilledButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.account_tree_outlined),
                label: const Text('Filled icon')),
            OutlinedButton(
                onPressed: () {}, child: const Text('outlined button')),
            OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add_road),
                label: const Text('outlined icon')),
            TextButton(onPressed: () {}, child: const Text('text button')),
            TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.account_circle),
                label: const Text('text button icon')),
            const CustomButtom(),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add_alert),
              color: colors.primary,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add_alert),
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(colors.primary),
                iconColor: const MaterialStatePropertyAll(Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomButtom extends StatelessWidget {
  const CustomButtom({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: (){},
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Hola Mundo',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
