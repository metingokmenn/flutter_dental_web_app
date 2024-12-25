import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Dt. İlayda Tutku Zenci',centerTitle: false,
      ),
    );
  }
}
