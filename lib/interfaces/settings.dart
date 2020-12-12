import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/thememodel.dart';
import '../models/feedmodel.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings", style: Theme.of(context).textTheme.headline6),
        centerTitle: true,
      ),
      body: Container(
        color: Theme.of(context).backgroundColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            ThemeSettingCard(),
            // FontSettingCard(),
            ClearDataCard(),
            Card(
                elevation: 0,
                child: InkWell(
                  onTap: (){
                    launch("https://github.com/sbeam-dev/SbeamRSS/blob/master/Docs.md");
                  },
                  child: ListTile(
                    leading: FaIcon(FontAwesomeIcons.questionCircle, color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black),
                    title: Text("Help"),
                  ),
                )
            ),
            Card(
              elevation: 0,
              child: InkWell(
                onTap: (){
                  showAboutDialog(
                      context: context,
                      applicationVersion: "v1.0.2",
                      applicationLegalese: "Distributed under MPL-2.0 license",
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(22, 8, 0, 8),
                          child: Text("Github:", style: TextStyle(fontFamily: 'sans'),),
                        ),
                        Center(
                            child: Text("github.com/sbeam-dev/SbeamRSS", style: TextStyle(fontFamily: 'sans', fontSize: 13),)
                        )
                      ]
                  );
                },
                child: ListTile(
                  leading: FaIcon(FontAwesomeIcons.infoCircle, color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black),
                  title: Text("About"),
                ),
              )
            )

          ],
        ),
      ),
    );
  }
}

class ThemeSettingCard extends StatefulWidget {
  @override
  _ThemeSettingCardState createState() => new _ThemeSettingCardState();
}

class _ThemeSettingCardState extends State<ThemeSettingCard> {
  ThemeOptions _currentOption;
  @override
  Widget build(BuildContext context) {
    _currentOption = Provider.of<ThemeModel>(context).currentTheme;
    return Card(
        elevation: 0,
        child: InkWell(
          onTap: (){
            showDialog(
                context: context,
                child: SimpleDialog(
                  title: Text("Choose theme..."),
                  children: <Widget>[
                    RadioListTile<ThemeOptions>(
                      title: Text("System default"),
                      value: ThemeOptions.system,
                      groupValue: _currentOption,
                      onChanged: (value) {
                        Provider.of<ThemeModel>(context, listen: false).setTheme(value);
                        setState(() {
                          _currentOption = value;
                        });
                        Navigator.pop(context);
                      },
                    ),
                    RadioListTile<ThemeOptions>(
                      title: Text("Light"),
                      value: ThemeOptions.light,
                      groupValue: _currentOption,
                      onChanged: (value) {
                        Provider.of<ThemeModel>(context, listen: false).setTheme(value);
                        setState(() {
                          _currentOption = value;
                        });
                        Navigator.pop(context);
                      },
                    ),
                    RadioListTile<ThemeOptions>(
                      title: Text("Dark"),
                      value: ThemeOptions.dark,
                      groupValue: _currentOption,
                      onChanged: (value) {
                        Provider.of<ThemeModel>(context, listen: false).setTheme(value);
                        setState(() {
                          _currentOption = value;
                        });
                        Navigator.pop(context);
                      },
                    ),
                  ],
                )
            );
          },
          child: ListTile(
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[FaIcon(FontAwesomeIcons.palette, color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black)],
            ),
            title: Text("Theme"),
            subtitle: Text((_currentOption == ThemeOptions.system) ? "System default"
                : ((_currentOption == ThemeOptions.light) ? "Light" : "Dark")),
          ),
        )
    );
  }
}

// class FontSettingCard extends StatefulWidget {
//   @override
//   _FontSettingCardState createState() => new _FontSettingCardState();
// }
//
// class _FontSettingCardState extends State<FontSettingCard> {
//   FontOptions _currentOption;
//   String fontToStr(FontOptions opt) {
//     switch(opt) {
//       case FontOptions.JP: return "Japanese";
//       case FontOptions.KR: return "Korean";
//       case FontOptions.TC: return "Chinese(Traditional)";
//       case FontOptions.SC: return "Chinese(Simplified)";
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     _currentOption = Provider.of<ThemeModel>(context).currentFont;
//     return Card(
//         elevation: 0,
//         child: InkWell(
//           onTap: (){
//             showDialog(
//                 context: context,
//                 child: SimpleDialog(
//                   title: Text("Choose font variant..."),
//                   children: <Widget>[
//                     RadioListTile<FontOptions>(
//                       title: Text("Japanese"),
//                       value: FontOptions.JP,
//                       groupValue: _currentOption,
//                       onChanged: (value) {
//                         Provider.of<ThemeModel>(context, listen: false).setFont(value);
//                         setState(() {
//                           _currentOption = value;
//                         });
//                         Navigator.pop(context);
//                       },
//                     ),
//                     RadioListTile<FontOptions>(
//                       title: Text("Korean"),
//                       value: FontOptions.KR,
//                       groupValue: _currentOption,
//                       onChanged: (value) {
//                         Provider.of<ThemeModel>(context, listen: false).setFont(value);
//                         setState(() {
//                           _currentOption = value;
//                         });
//                         Navigator.pop(context);
//                       },
//                     ),
//                     RadioListTile<FontOptions>(
//                       title: Text("Chinese(Traditional)"),
//                       value: FontOptions.TC,
//                       groupValue: _currentOption,
//                       onChanged: (value) {
//                         Provider.of<ThemeModel>(context, listen: false).setFont(value);
//                         setState(() {
//                           _currentOption = value;
//                         });
//                         Navigator.pop(context);
//                       },
//                     ),
//                     RadioListTile<FontOptions>(
//                       title: Text("Chinese(Simplified)"),
//                       value: FontOptions.SC,
//                       groupValue: _currentOption,
//                       onChanged: (value) {
//                         Provider.of<ThemeModel>(context, listen: false).setFont(value);
//                         setState(() {
//                           _currentOption = value;
//                         });
//                         Navigator.pop(context);
//                       },
//                     ),
//                   ],
//                 )
//             );
//           },
//           child: ListTile(
//             leading: Icon(Icons.font_download, color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black),
//             title: Text("CJK font variant"),
//             subtitle: Text(fontToStr(_currentOption)),
//           ),
//         )
//     );
//   }
// }
//
//

class ClearDataCard extends StatefulWidget {
  @override
  _ClearDataCardState createState() => _ClearDataCardState();
}

class _ClearDataCardState extends State<ClearDataCard> {
  // 0 (default) all 1 a week 2 a month 3 a season 4 a year
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 0,
        child: InkWell(
          onTap: (){
            showDialog(
                context: context,
                child: SimpleDialog(
                  title: Text("Delete old feeds"),
                  children: <Widget>[
                    SimpleDialogOption(
                      onPressed: (){
                        Provider.of<FeedModel>(context, listen: false).clearFeeds(0);
                        Navigator.pop(context);
                      },
                      child: Text("All", style: Theme.of(context).textTheme.subtitle1,),
                    ),
                    SimpleDialogOption(
                      onPressed: (){
                        Provider.of<FeedModel>(context, listen: false).clearFeeds(1);
                        Navigator.pop(context);
                      },
                      child: Text("A week ago", style: Theme.of(context).textTheme.subtitle1,),
                    ),
                    SimpleDialogOption(
                      onPressed: (){
                        Provider.of<FeedModel>(context, listen: false).clearFeeds(2);
                        Navigator.pop(context);
                      },
                      child: Text("A month ago", style: Theme.of(context).textTheme.subtitle1,),
                    ),
                    SimpleDialogOption(
                      onPressed: (){
                        Provider.of<FeedModel>(context, listen: false).clearFeeds(3);
                        Navigator.pop(context);
                      },
                      child: Text("3 months ago", style: Theme.of(context).textTheme.subtitle1,),
                    ),
                    SimpleDialogOption(
                      onPressed: (){
                        Provider.of<FeedModel>(context, listen: false).clearFeeds(4);
                        Navigator.pop(context);
                      },
                      child: Text("A year ago", style: Theme.of(context).textTheme.subtitle1,),
                    ),
                  ],
                )
            );
          },
          child: ListTile(
            // contentPadding: EdgeInsets.fromLTRB(20, 0, 16, 0),
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[FaIcon(FontAwesomeIcons.hdd, color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black)],
            ),
            title: Text("Clear cache"),
            subtitle: Text("Delete stored old feeds"),
          ),
        )
    );
  }
}