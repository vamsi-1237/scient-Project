import 'package:flutter/material.dart';

class AddCredentialScreen extends StatefulWidget {
  const AddCredentialScreen({super.key});

  @override
  State<AddCredentialScreen> createState() => _AddCredentialScreenState();
}

class _AddCredentialScreenState extends State<AddCredentialScreen> {
  final TextEditingController _siteController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _saveCredential() {
    final site = _siteController.text.trim();
    final password = _passwordController.text.trim();

    if (site.isNotEmpty && password.isNotEmpty) {
      Navigator.pop(context, {'site': site, 'password': password});
    }
  }

  @override
  void dispose() {
    _siteController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Credential'), elevation: 2.0),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _siteController,
              decoration: const InputDecoration(
                labelText: 'Site / App Name',
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  borderSide: BorderSide(
                    color: Colors.blueAccent,
                    width: 2,
                    strokeAlign: BorderSide.strokeAlignOutside,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  borderSide: BorderSide(
                    color: Colors.blueAccent,
                    width: 2,
                    strokeAlign: BorderSide.strokeAlignOutside,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _saveCredential,
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
