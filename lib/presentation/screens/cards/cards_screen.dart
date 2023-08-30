import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
class CardsScreen extends StatelessWidget {
  static const String name = "cards_screen";
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cards Screen"),
        leading: BackButton(
          color: colors.primary,
          onPressed: () => context.pop()
        ),
      ),
      body: const Placeholder(),
    );
  }
}