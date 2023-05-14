import 'package:flutter/material.dart';
import 'package:share_portfolio/views/screens/home/nepse_index_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Scrapper.scrapData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: RefreshIndicator(
        onRefresh: () async {
          // Scrapper.scrapData();
        },
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            children: const [
              NepseIndexScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
