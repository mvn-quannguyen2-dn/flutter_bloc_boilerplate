// Cores
import 'package:flutter/material.dart';
import 'package:flutter_bloc_boilerplate/blocs/app_bloc.dart';
import 'package:flutter_bloc_boilerplate/blocs/export_blocs.dart';
import 'package:flutter_bloc_boilerplate/utils/constants/app_languages.dart';
import 'package:flutter_bloc_boilerplate/utils/helpers/index.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final textLanguageController = TextEditingController();

  List<Locale> listLanguage = AppLanguageHelper.supportLanguage;
  Locale languageSelected = AppLanguageHelper.defaultLanguage;

  ///On change language
  Future<void> changeLanguage() async {
    AppBloc.languageBloc.add(OnChangeLanguage(languageSelected));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          TranslateHelper.of(context).translate('settings'),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            ListView.builder(
              padding: EdgeInsets.only(left: 16),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                Widget trailing = Icon(
                  Icons.language,
                  color: Colors.grey,
                );
                final item = listLanguage[index];
                if (item == languageSelected) {
                  trailing = Icon(
                    Icons.language,
                    color: Theme.of(context).primaryColor,
                  );
                }
                return ListTile(
                  title: Text(
                    AppLanguages.getGlobalLanguageName(item.languageCode),
                  ),
                  trailing: trailing,
                  onTap: () => setState(() => languageSelected = item),
                );
              },
              itemCount: listLanguage.length,
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: changeLanguage,
                child: Text('Change Language'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
