import 'package:flutter/material.dart';
import 'common/config/config.dart';
import 'package:flutter_boss/splash.dart';
import 'package:flutter_boss/layout_type.dart';
import 'package:flutter_boss/widgets/chat_page.dart';
import 'package:flutter_boss/widgets/company_page.dart';
import 'package:flutter_boss/widgets/job_page.dart';
import 'package:flutter_boss/widgets/mine_page.dart';

void main() => runApp(new App());

class App extends StatelessWidget {
  final String title;

  App({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primaryIconTheme: const IconThemeData(color: Colors.white),
        brightness: Brightness.light,
        primaryColor: Config.GLOBAL_COLOR,
        accentColor: Config.GLOBAL_COLOR,
      ),
      home: new SplashPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MainPageState createState() => new _MainPageState();
}

class _MainPageState extends State<MainPage> {
  LayoutType _layoutSelection = LayoutType.job;

  Color _colorTabMatching({LayoutType layoutSelection}) {
    return layoutSelection == _layoutSelection
        ? Config.GLOBAL_COLOR
        : Colors.grey;
  }

  BottomNavigationBarItem _buildItem(
      {IconData icon, LayoutType layoutSelection}) {
    String text = layoutName(layoutSelection);

    return new BottomNavigationBarItem(
      icon: new Icon(
        icon,
        color: _colorTabMatching(layoutSelection: layoutSelection),
      ),
      title: new Text(
        text,
        style: new TextStyle(
          color: _colorTabMatching(layoutSelection: layoutSelection),
        ),
      ),
    );
  }

  Widget _buildButtonNavBar() {
    return new BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        _buildItem(icon: Icons.home, layoutSelection: LayoutType.job),
        _buildItem(icon: Icons.computer, layoutSelection: LayoutType.company),
        _buildItem(icon: Icons.message, layoutSelection: LayoutType.chat),
        _buildItem(
            icon: Icons.accessibility_new, layoutSelection: LayoutType.mine),
      ],
      onTap: _onSelectTab,
    );
  }

  void _onLayoutSelected(LayoutType selection) {
    setState(() {
      _layoutSelection = selection;
    });
  }

  void _onSelectTab(int index) {
    switch (index) {
      case 0:
        _onLayoutSelected(LayoutType.job);
        break;
      case 1:
        _onLayoutSelected(LayoutType.company);
        break;
      case 2:
        _onLayoutSelected(LayoutType.chat);
        break;
      case 3:
        _onLayoutSelected(LayoutType.mine);
        break;
    }
  }

  Widget _buildBody() {
    LayoutType layoutSelection = _layoutSelection;
    switch (layoutSelection) {
      case LayoutType.job:
        return new JobPage();
      case LayoutType.company:
        return new CompanyPage();
      case LayoutType.chat:
        return new ChatPage();
      case LayoutType.mine:
        return new MinePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _buildBody(),
      bottomNavigationBar: _buildButtonNavBar(),
    );
  }
}
