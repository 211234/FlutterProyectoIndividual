import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Ejercicio3Screen extends StatelessWidget {
  const Ejercicio3Screen({super.key});

  // Método para realizar la llamada
  void _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Lista de Emergencia'),
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Icon(CupertinoIcons.back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            _buildContactCard('Papa', '916 348 5830'),
            _buildContactCard('Mama', '916 101 2517'),
            _buildContactCard('Hermano (Raul)', '916 138 0845'),
            _buildContactCard('Hermana (Itzel)', '916 164 0472'),
          ],
        ),
      ),
    );
  }

  Widget _buildContactCard(String name, String phoneNumber) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey4,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: const TextStyle(
              fontSize: 18,
              color: CupertinoColors.black,
            ),
          ),
          CupertinoButton(
            padding: EdgeInsets.zero,
            child: const Icon(CupertinoIcons.phone),
            onPressed: () => _makePhoneCall(phoneNumber),
          ),
        ],
      ),
    );
  }
}
