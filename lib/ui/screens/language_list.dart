import 'package:flutter/material.dart';
import 'package:flutter_map_pet/config/constants.dart';
import 'package:flutter_map_pet/ui/screens/widgets/language_tile.dart';

class LanguageActivity extends StatelessWidget {
  static const String route = "/language";

  const LanguageActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> _langWidgets = [];
    AppConstants.languages.forEach(
            (lang, value) => _langWidgets.add( LanguageTile(language: lang, title: value,) )
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Выберите язык"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: _langWidgets,
        )
      ),
    );
  }
}
