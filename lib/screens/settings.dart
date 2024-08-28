import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _toggleValue = true; // State variable to store the toggle value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Haptic feedback'),
            subtitle: const Text('App vibrations'),
            value: _toggleValue,
            onChanged: (bool value) {
              setState(() {
                _toggleValue = value;
              });
            },
          ),
          ListTile(
            title: const Text('Language'),
            subtitle: const Text('English'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Color Scheme'),
            subtitle: const Text('System'),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            title: const Text('About'),
            subtitle: const Text('Version 2024.8.12-dev'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
