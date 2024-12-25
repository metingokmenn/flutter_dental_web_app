import 'package:flutter/material.dart';
import 'package:flutter_dental_web_app/pages/home_page.dart';
import 'package:flutter_dental_web_app/pages/services_page.dart';
import 'package:go_router/go_router.dart';

import 'pages/about_page.dart';
import 'pages/contact_page.dart';

import 'package:flutter_web_plugins/url_strategy.dart';

void main() {
  usePathUrlStrategy();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Diş Hekimi Tanıtım Sayfası',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(primary: Colors.white),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }

  final GoRouter _router = GoRouter(routes: [
    GoRoute(
        path: '/', // Base route
        pageBuilder: (context, state) => NoTransitionPage(
              child: HomePage(),
            )),
    GoRoute(
      path: '/about',
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: AboutPage()),
    ),
    GoRoute(
      path: '/contact',
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: ContactPage()),
    ),
    GoRoute(
      path: '/services',
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: ServicesPage()),
    ),
  ], routerNeglect: true);
}
