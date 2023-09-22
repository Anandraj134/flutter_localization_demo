import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_localization_demo/l10n/l10n.dart';
import 'package:flutter_localization_demo/author.dart';
import 'package:flutter_localization_demo/l10n/locale_keys.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: L10n.all,
      path: 'assets/l10n',
      fallbackLocale: L10n.all[0],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final authors = [
    Author(
        name: LocaleKeys.AkhenatenName.tr(),
        bio: LocaleKeys.AkhenatenBio.tr(),
        image: "https://images.quotable.dev/profile/400/akhenaten.jpg"),
    Author(
        name: LocaleKeys.AlbertName.tr(),
        bio: LocaleKeys.AlbertBio.tr(),
        image: "https://images.quotable.dev/profile/400/albert-schweitzer.jpg")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 700,
        width: double.infinity,
        child: Column(
          children: [
            ListTile(
              leading: const CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://images.quotable.dev/profile/400/akhenaten.jpg"),
              ),
              title: Text(LocaleKeys.AkhenatenName.tr()),
              subtitle: Text(LocaleKeys.AkhenatenBio.tr()),
            ),
            ListTile(
              leading: const CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://images.quotable.dev/profile/400/akhenaten.jpg"),
              ),
              title: Text(LocaleKeys.AlbertName.tr()),
              subtitle: Text(LocaleKeys.AlbertBio.tr()),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () async {
                    await context.setLocale(const Locale("en"));
                  },
                  child: const Text("English"),
                ),
                TextButton(
                  onPressed: () async {
                    await context.setLocale(const Locale("ar"));
                  },
                  child: const Text("Arebic"),
                ),
                TextButton(
                  onPressed: () async {
                    await context.setLocale(const Locale("de"));
                  },
                  child: const Text("dutch"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
