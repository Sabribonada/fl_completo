import 'package:flutter/material.dart';
import 'package:flutter_estados/widgets/background.dart';
import 'package:flutter_estados/widgets/card_table.dart';
import 'package:flutter_estados/widgets/custom_btn_navigation.dart';
import 'package:flutter_estados/widgets/page_title.dart';
import 'package:flutter_estados/widgets/side_menu.dart';

class HomeScreen extends StatefulWidget {
  static String routerName = 'Home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text(HomeScreen.routerName),
          ),
      drawer: const SideMenu(),
      body: Stack(
        children: [BackgroundWidget(), _HomeBody()],
      ),
      // bottomNavigationBar: CustomBtnNav(),
    );
  }
}

class _HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 25),
        child: Column(children: [
          const PageTitle(),
          const SizedBox(
            height: 10,
          ),
          CardTable()
        ]),
      ),
    );
  }
}
