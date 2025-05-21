import 'package:flutter/material.dart';
import 'package:project_frame/view/theme/swith_theme.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Frame"),
        actions: [
          ThemeSwitch()
        ],
      ),
      body: ScreenTypeLayout.builder(
        mobile: (context) => _buildMobileLayout(),
        tablet: (context) => _buildTabletLayout(),
        desktop: (context) => _buildDesktopLayout(),
      ),
    );
  }

  Widget _buildMobileLayout() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.phone_android, size: 60),
          SizedBox(height: 16),
          Text("Mobile Layout", style: TextStyle(fontSize: 20)),
        ],
      ),
    );
  }

  Widget _buildTabletLayout() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.tablet, size: 80),
          SizedBox(height: 16),
          Text("Tablet Layout", style: TextStyle(fontSize: 24)),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.desktop_windows, size: 100),
          SizedBox(height: 16),
          Text("Desktop Layout", style: TextStyle(fontSize: 28)),
        ],
      ),
    );
  }
}

