import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart'; // For Instagram icon

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[900], // Dark background color
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Address and Contact Info
          const Text(
            'Özel Okmeydanı Polikliniği\nPiyalepaşa Taştan Sokak No: 20 D:Kat: 2-3, 34440 Beyoğlu/İstanbul',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Telefon: 0 (542) 655 44 44',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 24),

          // Social Media Icon
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  icon: const Icon(
                    FontAwesomeIcons.instagram,
                    color: Colors.pinkAccent,
                  ),
                  iconSize: 32,
                  onPressed: () async {
                    const url = 'https://www.instagram.com/yourclinic';
                    if (await canLaunchUrl(Uri.parse(url))) {
                      await launchUrl(Uri.parse(url));
                    }
                  }),
            ],
          ),
          const SizedBox(height: 24),

          // Copyright
          const Text(
            '© 2024 Özel Okmeydanı Polikliniği. Tüm hakları saklıdır.',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white38,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
