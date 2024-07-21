import 'package:ecommerce/models/entities/store.dart';
import 'package:ecommerce/models/theme/theme_data.dart';
import 'package:ecommerce/screens/home.dart';
import 'package:ecommerce/widgets/navigation/bottom_navigation.dart';
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
      bottomNavigationBar: BottomNavigationView(
        backgroundColor: theme.colorScheme.primary,
        color: theme.colorScheme.onPrimary,
        selectedBackgroundColor: theme.colorScheme.surface,
        selectedColor: theme.colorScheme.onSurface,
        items: [
          BottomNavigationViewItem(icon: FeatherIcons.home, label: 'Home'),
          BottomNavigationViewItem(
              icon: FeatherIcons.shoppingCart, label: 'Cart'),
          BottomNavigationViewItem(icon: FeatherIcons.user, label: 'Account'),
        ],
      ),
    );
  }
}
