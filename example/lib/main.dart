import 'package:button_variant/button_types.dart';
import 'package:button_variant/button_variant.dart';
import 'package:button_variant/icon_placement.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('ButtonVariant Demo')),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              spacing: 8,
              children: [
                // Elevated
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 8,
                  children: [
                    ButtonVariant(
                      icon: Icons.dashboard,
                      iconPlacement: IconPlacement.top,
                      textStyle: Theme.of(context).textTheme.titleLarge,
                      tooltip: 'A cool tooltip',
                      type: ButtonTypes.elevated,
                      onPressed: () {},
                    ),
                    ButtonVariant(
                      icon: Icons.dashboard,
                      iconPlacement: IconPlacement.top,
                      textStyle: Theme.of(context).textTheme.titleLarge,
                      tooltip: 'A cool tooltip',
                      type: ButtonTypes.elevated,
                      onPressed: null,
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 8,
                  children: [
                    ButtonVariant(
                      icon: Icons.dashboard,
                      label: 'Label',
                      iconPlacement: IconPlacement.left,
                      textStyle: Theme.of(context).textTheme.titleLarge,
                      tooltip: 'A cool tooltip',
                      type: ButtonTypes.elevated,
                      onPressed: () {},
                    ),
                    ButtonVariant(
                      icon: Icons.dashboard,
                      label: 'Label',
                      iconPlacement: IconPlacement.top,
                      textStyle: Theme.of(context).textTheme.titleLarge,
                      tooltip: 'A cool tooltip',
                      type: ButtonTypes.elevated,
                      onPressed: () {},
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 8,
                  children: [
                    ButtonVariant(
                      icon: Icons.dashboard,
                      label: 'Label',
                      iconPlacement: IconPlacement.right,
                      textStyle: Theme.of(context).textTheme.titleLarge,
                      tooltip: 'A cool tooltip',
                      type: ButtonTypes.elevated,
                      onPressed: null,
                    ),
                    ButtonVariant(
                      icon: Icons.dashboard,
                      label: 'Label',
                      iconPlacement: IconPlacement.bottom,
                      textStyle: Theme.of(context).textTheme.titleLarge,
                      tooltip: 'A cool tooltip',
                      type: ButtonTypes.elevated,
                      onPressed: null,
                    ),
                  ],
                ),
                // Filled
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 8,
                  children: [
                    ButtonVariant(
                      icon: Icons.dashboard,
                      iconPlacement: IconPlacement.top,
                      textStyle: Theme.of(context).textTheme.titleLarge,
                      tooltip: 'A cool tooltip',
                      type: ButtonTypes.filled,
                      onPressed: () {},
                    ),
                    ButtonVariant(
                      icon: Icons.dashboard,
                      iconPlacement: IconPlacement.top,
                      textStyle: Theme.of(context).textTheme.titleLarge,
                      tooltip: 'A cool tooltip',
                      type: ButtonTypes.filled,
                      onPressed: null,
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 8,
                  children: [
                    ButtonVariant(
                      icon: Icons.dashboard,
                      label: 'Label',
                      iconPlacement: IconPlacement.left,
                      textStyle: Theme.of(context).textTheme.titleLarge,
                      tooltip: 'A cool tooltip',
                      type: ButtonTypes.filled,
                      onPressed: () {},
                    ),
                    ButtonVariant(
                      icon: Icons.dashboard,
                      label: 'Label',
                      iconPlacement: IconPlacement.top,
                      textStyle: Theme.of(context).textTheme.titleLarge,
                      tooltip: 'A cool tooltip',
                      type: ButtonTypes.filled,
                      onPressed: () {},
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 8,
                  children: [
                    ButtonVariant(
                      icon: Icons.dashboard,
                      label: 'Label',
                      iconPlacement: IconPlacement.right,
                      textStyle: Theme.of(context).textTheme.titleLarge,
                      tooltip: 'A cool tooltip',
                      type: ButtonTypes.filled,
                      onPressed: null,
                    ),
                    ButtonVariant(
                      icon: Icons.dashboard,
                      label: 'Label',
                      iconPlacement: IconPlacement.bottom,
                      textStyle: Theme.of(context).textTheme.titleLarge,
                      tooltip: 'A cool tooltip',
                      type: ButtonTypes.filled,
                      onPressed: null,
                    ),
                  ],
                ),
                // Tonal
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 8,
                  children: [
                    ButtonVariant(
                      icon: Icons.dashboard,
                      iconPlacement: IconPlacement.top,
                      textStyle: Theme.of(context).textTheme.titleLarge,
                      tooltip: 'A cool tooltip',
                      type: ButtonTypes.tonal,
                      onPressed: () {},
                    ),
                    ButtonVariant(
                      icon: Icons.dashboard,
                      iconPlacement: IconPlacement.top,
                      textStyle: Theme.of(context).textTheme.titleLarge,
                      tooltip: 'A cool tooltip',
                      type: ButtonTypes.tonal,
                      onPressed: null,
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 8,
                  children: [
                    ButtonVariant(
                      icon: Icons.dashboard,
                      label: 'Label',
                      iconPlacement: IconPlacement.left,
                      textStyle: Theme.of(context).textTheme.titleLarge,
                      tooltip: 'A cool tooltip',
                      type: ButtonTypes.tonal,
                      onPressed: () {},
                    ),
                    ButtonVariant(
                      icon: Icons.dashboard,
                      label: 'Label',
                      iconPlacement: IconPlacement.top,
                      textStyle: Theme.of(context).textTheme.titleLarge,
                      tooltip: 'A cool tooltip',
                      type: ButtonTypes.tonal,
                      onPressed: () {},
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 8,
                  children: [
                    ButtonVariant(
                      icon: Icons.dashboard,
                      label: 'Label',
                      iconPlacement: IconPlacement.right,
                      textStyle: Theme.of(context).textTheme.titleLarge,
                      tooltip: 'A cool tooltip',
                      type: ButtonTypes.tonal,
                      onPressed: null,
                    ),
                    ButtonVariant(
                      icon: Icons.dashboard,
                      label: 'Label',
                      iconPlacement: IconPlacement.bottom,
                      textStyle: Theme.of(context).textTheme.titleLarge,
                      tooltip: 'A cool tooltip',
                      type: ButtonTypes.tonal,
                      onPressed: null,
                    ),
                  ],
                ),
                // Outlined
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 8,
                  children: [
                    ButtonVariant(
                      icon: Icons.dashboard,
                      iconPlacement: IconPlacement.top,
                      textStyle: Theme.of(context).textTheme.titleLarge,
                      tooltip: 'A cool tooltip',
                      type: ButtonTypes.outlined,
                      onPressed: () {},
                    ),
                    ButtonVariant(
                      icon: Icons.dashboard,
                      iconPlacement: IconPlacement.top,
                      textStyle: Theme.of(context).textTheme.titleLarge,
                      tooltip: 'A cool tooltip',
                      type: ButtonTypes.outlined,
                      onPressed: null,
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 8,
                  children: [
                    ButtonVariant(
                      icon: Icons.dashboard,
                      label: 'Label',
                      iconPlacement: IconPlacement.left,
                      textStyle: Theme.of(context).textTheme.titleLarge,
                      tooltip: 'A cool tooltip',
                      type: ButtonTypes.outlined,
                      onPressed: () {},
                    ),
                    ButtonVariant(
                      icon: Icons.dashboard,
                      label: 'Label',
                      iconPlacement: IconPlacement.top,
                      textStyle: Theme.of(context).textTheme.titleLarge,
                      tooltip: 'A cool tooltip',
                      type: ButtonTypes.outlined,
                      onPressed: () {},
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 8,
                  children: [
                    ButtonVariant(
                      icon: Icons.dashboard,
                      label: 'Label',
                      iconPlacement: IconPlacement.right,
                      textStyle: Theme.of(context).textTheme.titleLarge,
                      tooltip: 'A cool tooltip',
                      type: ButtonTypes.outlined,
                      onPressed: null,
                    ),
                    ButtonVariant(
                      icon: Icons.dashboard,
                      label: 'Label',
                      iconPlacement: IconPlacement.bottom,
                      textStyle: Theme.of(context).textTheme.titleLarge,
                      tooltip: 'A cool tooltip',
                      type: ButtonTypes.outlined,
                      onPressed: null,
                    ),
                  ],
                ),
                // Text
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 8,
                  children: [
                    ButtonVariant(
                      icon: Icons.dashboard,
                      iconPlacement: IconPlacement.top,
                      textStyle: Theme.of(context).textTheme.titleLarge,
                      tooltip: 'A cool tooltip',
                      type: ButtonTypes.text,
                      onPressed: () {},
                    ),
                    ButtonVariant(
                      icon: Icons.dashboard,
                      iconPlacement: IconPlacement.top,
                      textStyle: Theme.of(context).textTheme.titleLarge,
                      tooltip: 'A cool tooltip',
                      type: ButtonTypes.text,
                      onPressed: null,
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 8,
                  children: [
                    ButtonVariant(
                      icon: Icons.dashboard,
                      label: 'Label',
                      iconPlacement: IconPlacement.left,
                      textStyle: Theme.of(context).textTheme.titleLarge,
                      tooltip: 'A cool tooltip',
                      type: ButtonTypes.text,
                      onPressed: () {},
                    ),
                    ButtonVariant(
                      icon: Icons.dashboard,
                      label: 'Label',
                      iconPlacement: IconPlacement.top,
                      textStyle: Theme.of(context).textTheme.titleLarge,
                      tooltip: 'A cool tooltip',
                      type: ButtonTypes.text,
                      onPressed: () {},
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 8,
                  children: [
                    ButtonVariant(
                      icon: Icons.dashboard,
                      label: 'Label',
                      iconPlacement: IconPlacement.right,
                      textStyle: Theme.of(context).textTheme.titleLarge,
                      tooltip: 'A cool tooltip',
                      type: ButtonTypes.text,
                      onPressed: null,
                    ),
                    ButtonVariant(
                      icon: Icons.dashboard,
                      label: 'Label',
                      iconPlacement: IconPlacement.bottom,
                      textStyle: Theme.of(context).textTheme.titleLarge,
                      tooltip: 'A cool tooltip',
                      type: ButtonTypes.text,
                      onPressed: null,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
