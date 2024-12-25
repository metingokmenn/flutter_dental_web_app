import 'package:flutter/material.dart';
import 'package:flutter_dental_web_app/widgets/animated_counter_row.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // List of services
    final List<Map<String, String>> services = [
      {
        'title': 'Diş Taşı Temizliği',
        'description':
            'Dişlerinizi plak ve tartardan arındırarak sağlıklı bir gülümseme kazanın.',
        'icon': 'assets/images/dis-tasi.jpeg',
      },
      {
        'title': 'Dolgu Tedavisi',
        'description':
            'Çürük dişlerinizi onararak sağlıklı bir diş yapısı oluşturuyoruz.',
        'icon': 'assets/images/dolgu.jpg',
      },
      {
        'title': 'Kanal Tedavisi',
        'description':
            'Hasar görmüş dişlerinizi kurtarmak için ileri tedavi yöntemleri sunuyoruz.',
        'icon': 'assets/images/kanal.jpg',
      },
      {
        'title': 'Diş Beyazlatma',
        'description':
            'Parlak ve beyaz bir gülüş için profesyonel diş beyazlatma.',
        'icon': 'assets/images/beyazlatma.jpg',
      },
      {
        'title': 'Ortodonti',
        'description':
            'Dişlerinizi hizalamak için etkili ortodontik tedavi seçenekleri.',
        'icon': 'assets/images/ortodonti.jpg',
      },
      {
        'title': 'İmplant Tedavisi',
        'description':
            'Eksik dişler için doğal görünümlü ve dayanıklı çözümler.',
        'icon': 'assets/images/implant.jpg',
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 32,
        children: [
          // Section Title
          const Text(
            "Hizmetlerimiz",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          
          // Services Grid
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:
                  screenWidth > 600 ? 3 : 2, // Responsive column count
              crossAxisSpacing: 12, // Reduced spacing
              mainAxisSpacing: 12, // Reduced spacing
              // Adjusted aspect ratio
            ),
            itemCount: services.length,
            itemBuilder: (context, index) {
              final service = services[index];
              return _buildServiceCard(
                iconPath: service['icon']!,
                title: service['title']!,
                description: service['description']!,
              );
            },
          )
        ],
      ),
    );
  }

  // Service Card Builder
  Widget _buildServiceCard({
    required String iconPath,
    required String title,
    required String description,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icon
            Image.asset(
              iconPath,
              width: 400,
              height: 400,
              fit: BoxFit.contain,
            ),
            // Title
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            // Description
            Text(
              description,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
