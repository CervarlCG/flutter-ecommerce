import 'package:ecommerce/models/entities/store.dart';
import 'package:ecommerce/models/theme/spacing.dart';
import 'package:ecommerce/models/theme/theme_data.dart';
import 'package:ecommerce/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      Provider(create: (context) => Store(currency: 'USD', decimals: 2))
    ],
    child: const EcommerceApp(),
  ));
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme,
      home: const EntryPage(),
    );
  }
}

class EntryPage extends StatefulWidget {
  const EntryPage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<EntryPage> createState() => _EntryPageState();
}

class _EntryPageState extends State<EntryPage> {
  int _selectedNavigationIndex = 0;

  void _handleOnTapNavigationItem(int index) {
    setState(() {
      _selectedNavigationIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        body: const HomeView(),
        bottomNavigationBar: Container(
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                        width: 1,
                        color: theme.colorScheme.secondary.withOpacity(0.1)))),
            child: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                    icon: Icon(
                      FeatherIcons.home,
                      size: spacing(1.3),
                    ),
                    label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(
                      FeatherIcons.shoppingBag,
                      size: spacing(1.3),
                    ),
                    label: 'Shop'),
                BottomNavigationBarItem(
                    icon: Icon(
                      FeatherIcons.shoppingCart,
                      size: spacing(1.3),
                    ),
                    label: 'Cart'),
                BottomNavigationBarItem(
                    icon: Icon(FeatherIcons.user, size: spacing(1.3)),
                    label: 'Account')
              ],
              selectedFontSize: 12,
              selectedItemColor: theme.colorScheme.primary,
              unselectedItemColor: theme.colorScheme.onSurface,
              showUnselectedLabels: true,
              backgroundColor: theme.colorScheme.surface,
              type: BottomNavigationBarType.fixed,
              currentIndex: _selectedNavigationIndex,
              onTap: _handleOnTapNavigationItem,
            )));
  }
}
