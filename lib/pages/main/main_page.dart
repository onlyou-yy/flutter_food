import 'package:flutter/material.dart';
import 'package:flutter_food/extensions/numExtensions/num_extensions.dart';
import 'package:flutter_food/pages/main/main_page_banner.dart';
import 'package:flutter_food/pages/main/main_page_popular_list.dart';
import 'package:flutter_food/pages/main/main_page_top_bar.dart';

class MainPage extends StatelessWidget {
  const MainPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            MainPageTopBar(),
            _buildBody()
          ],
        )
      ),
    );
  }

  Widget _buildBody(){
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            MainPageBanner(),
            SizedBox(height: 30.px,),
            MainPagePopularList(),
          ],
        ),
      )
    );
  }
}