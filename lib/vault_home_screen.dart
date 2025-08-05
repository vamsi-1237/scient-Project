import 'package:flutter/material.dart';
import 'package:flutter_application_1/add_credential_screen.dart';



class VaultHomeScreen extends StatefulWidget {
  const VaultHomeScreen({super.key});// pos of the widget in the widget tree

  @override
  State<VaultHomeScreen> createState() => _VaultHomeScreenState();
}
class _VaultHomeScreenState extends State<VaultHomeScreen> {
  List<Map<String, String>> credentials = [];

  void _navigateToAddCredential() async {
    final result = await Navigator.push<Map<String, String>>(
      context,
      MaterialPageRoute(builder: (context) => const AddCredentialScreen()),
    );

    if (result != null && result['site']!.isNotEmpty && result['password']!.isNotEmpty) {
      setState(() {
        credentials.add(result);
      });
    }
  }

  void _deleteCredential(int index) {
    setState(() {
      credentials.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Password Vault'),
        centerTitle: true,
      ),
      body: credentials.isEmpty
          ? const Center(child: Text('No credentials yet!'))
          : ListView.builder(
              itemCount: credentials.length,
              itemBuilder: (context, index) {
                final item = credentials[index];
                return ListTile(
                  title: Text(item['site']!),
                  subtitle: Text(item['password']!),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => _deleteCredential(index),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToAddCredential,
        child: const Icon(Icons.add),
      ),
    );
  }
}