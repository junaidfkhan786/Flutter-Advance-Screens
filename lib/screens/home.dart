import 'package:flutter/material.dart';
import 'package:flutterui/provider/theme_provider.dart';
import 'package:flutterui/screens/silverappbar.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Flutter UI')),
        actions: [
          Switch.adaptive(
            value: themeProvider.isDarkMode,
            onChanged: (value) {
              final provider =
                  Provider.of<ThemeProvider>(context, listen: false);
              provider.toggleTheme(value);
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: List.generate(
              1,
              (index) => InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => AdvancedSliverAppBar()));
                    },
                    child: const Card(
                      elevation: 2,
                      child: Center(
                        child: Text(
                          'SilverAppBar',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  )),
        ),
      ),
    );
  }
}
