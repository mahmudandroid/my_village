import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './models/readermodel.dart';
import './models/thememodel.dart';
import './models/sourcemodel.dart';
import './models/feedmodel.dart';
import './models/favmodel.dart';
import 'package:provider/provider.dart';
import 'interfaces/home.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(
  new MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SourceModel()),
        ChangeNotifierProvider(create: (context) => FeedModel()),
        ChangeNotifierProvider(create: (context) => ReaderModel()),
        ChangeNotifierProvider(create: (context) => ThemeModel()),
        ChangeNotifierProvider(create: (context) => FavModel()),
      ],
      child: MyApp(),
  )
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Sbeam RSS Reader',
      theme: ThemeData(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        accentColor: Color(0xFF2a90ec),
        appBarTheme: AppBarTheme(
            color: Colors.white,
            iconTheme: IconThemeData(color: Colors.black54),
            elevation: 4
        ),
        popupMenuTheme: PopupMenuThemeData(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
            textStyle: GoogleFonts.getFont('Noto Sans', textStyle: TextStyle(color: Colors.black, fontSize: 16))
        ),
        textTheme: TextTheme(
          headline6: GoogleFonts.getFont('Noto Sans', textStyle: TextStyle(color: Colors.black)),
          subtitle1: GoogleFonts.getFont('Noto Sans'),
          headline5: GoogleFonts.getFont('Noto Sans'),
        ),
        primaryTextTheme: TextTheme(
          headline6: GoogleFonts.getFont('Noto Sans', textStyle: TextStyle(color: Colors.black)),
          subtitle1: GoogleFonts.getFont('Noto Sans'),
          headline5: GoogleFonts.getFont('Noto Sans'),
        ),
        pageTransitionsTheme: PageTransitionsTheme(builders: {TargetPlatform.android: CupertinoPageTransitionsBuilder()}),
        dialogTheme: DialogTheme(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
        // visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      darkTheme: ThemeData(
          backgroundColor: Color(0xFF121212),
          brightness: Brightness.dark,
          cardColor: Color(0xFF272727),
          accentColor: Color(0xFF78a4e7),
          appBarTheme: AppBarTheme(
              color: Color(0xFF383838),
              iconTheme: IconThemeData(color: Colors.white),
              elevation: 4
          ),
          popupMenuTheme: PopupMenuThemeData(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
              textStyle: GoogleFonts.getFont('Noto Sans', textStyle: TextStyle(color: Colors.white, fontSize: 16))
          ),
          textTheme: TextTheme(
            headline6: GoogleFonts.getFont('Noto Sans', textStyle: TextStyle(color: Colors.white)),
            subtitle1: GoogleFonts.getFont('Noto Sans'),
            headline5: GoogleFonts.getFont('Noto Sans'),
          ),
          primaryTextTheme: TextTheme(
            headline6: GoogleFonts.getFont('Noto Sans', textStyle: TextStyle(color: Colors.white)),
            subtitle1: GoogleFonts.getFont('Noto Sans'),
            headline5: GoogleFonts.getFont('Noto Sans'),
          ),
          pageTransitionsTheme: PageTransitionsTheme(builders: {TargetPlatform.android: CupertinoPageTransitionsBuilder()}),
          dialogTheme: DialogTheme(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          ),
          // visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: MyHomePage(title: 'Home Page'),
      themeMode: (Provider.of<ThemeModel>(context).currentTheme == ThemeOptions.system) ? ThemeMode.system
          : ((Provider.of<ThemeModel>(context).currentTheme == ThemeOptions.light) ? ThemeMode.light : ThemeMode.dark),
    );
  }
}