import 'package:flutter/material.dart';
import 'package:flutter_dental_web_app/widgets/animated_counter_row.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Hakkımızda Başlığı
          const Text(
            "Hakkımızda",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          const AnimatedCounterRow(),
          const SizedBox(height: 32),

          // Hakkımızda Paragrafı
          const Text(
            "Özel Okmeydanı Polikliniği olarak, sağlıklı ve estetik bir gülümsemenin herkesin hakkı olduğuna inanıyoruz. "
            "Yılların deneyimi ve modern tedavi yöntemlerimizle, diş sağlığınızı korumak ve geliştirmek için çalışıyoruz.\n"
            "Uzman diş hekimlerimiz ve güler yüzlü ekibimiz, size konforlu ve güvenilir bir tedavi süreci sunmayı hedefler. "
            "Polikliniğimizde en son teknolojileri kullanarak, kişiye özel tedavi planları oluşturuyor ve sizin için en iyi sonuçları sağlamayı amaçlıyoruz.\n"
            "Hizmetlerimiz arasında diş temizliği, dolgu ve kanal tedavisi, diş beyazlatma, ortodonti ve implant tedavisi gibi geniş bir yelpaze bulunuyor. "
            "Ayrıca, çocuklardan yetişkinlere kadar her yaştan hastamızın ihtiyaçlarına uygun çözümler sunuyoruz.\n"
            "Sağlığınız ve memnuniyetiniz bizim önceliğimizdir. Polikliniğimizi ziyaret ederek, profesyonel hizmetlerimiz ve sıcak ortamımızla tanışabilirsiniz. "
            "Çünkü güzel bir gülümseme, sağlıklı bir yaşamın anahtarıdır.",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),

          // Vurgu Metni
          const Text(
            "Özel Okmeydanı Polikliniği - Sağlıklı gülümsemeler için buradayız!",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.teal,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),

          // Ekibimiz Bölümü
          const Text(
            'Ekibimiz',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),

          const Text(
            "Ekibimiz, alanında uzman hekimlerden oluşmaktadır. Her bir hekimimiz, modern tedavi yöntemlerini kullanarak sağlığınızı önceliklendirir.",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),

          // Hekimlerin Fotoğrafları
          SizedBox(
            width: screenWidth * 0.9,
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 16,
              runSpacing: 16,
              children: [
                _buildDoctorCard(
                  imagePath: 'assets/images/doctor-1.jpg',
                  name: 'Dr. Ahmet Yılmaz',
                  specialty: 'Ortodonti Uzmanı',
                ),
                _buildDoctorCard(
                  imagePath: 'assets/images/doctor-2.jpg',
                  name: 'Dr. Mehmet Kaya',
                  specialty: 'Estetik Diş Hekimi',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Doktor Kartı Oluşturucu
  Widget _buildDoctorCard({
    required String imagePath,
    required String name,
    required String specialty,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            imagePath,
            width: 500,
            height: 500,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          name,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          specialty,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black54,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
