# flutter_localization_demo

A new Flutter project.

# Project Setup
### 1. Add Dependency to you pubspec.yaml
```
dependencies:
  easy_localization: ^3.0.0
```
### 2. Create Folders and Files
```
assets/l10n
```
> inside this folder we need to create json files in ```<language_code>.json```<br>
> Example: en.json
### 3. Declare an assets folder in pubspec.yaml file
```
assets:
- assets/l10n/
```
### 4. Generate locale_keys by running the code
```
flutter pub run easy_localization:generate -S assets/l10n -f keys -O lib/l10n -o locale_keys.g.dart
```
> This command generates a locale_keys.g.dart file in a lib/l10n folder. <br>The file contains the JSON keys from our translation files for easy access.
### 5. (Optional) Add Support to Ios
> Go to ios/Runner/Info.plist file and add below code
```
   <array>
       <string>en</string>
       <string>ar</string>
       <string>de</string>
   </array>
```
> Add all the supported languages
### 6. main.dart modification
```
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
    supportedLocales: L10n.all,
    path: 'assets/l10n',
    fallbackLocale: L10n.all[0],
    child: const MyApp(),
  ));
}
```
### 7. Material App modification
```
localizationsDelegates:context.localizationDelegates ,
supportedLocales: context.supportedLocales,
locale: context.locale,
```
_______
# **Now you can change the language by changing the locale**
_______
