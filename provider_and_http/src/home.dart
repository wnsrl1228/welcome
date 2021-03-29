import 'package:flutter/material.dart';
import 'package:flutter_provider_practice/src/provider/bottom_navigation_provider.dart';
import 'package:flutter_provider_practice/src/provider/count_provider.dart';
import 'package:flutter_provider_practice/src/ui/count_home_widget.dart';
import 'package:flutter_provider_practice/src/ui/movie_list_widget.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  CountProvider _countProvider;
  BottomNavigationProvider _bottomNavigationProvider;
  Widget _navigationBody() {
    switch (_bottomNavigationProvider.currentPage) {
      case 0:
        return CountHomeWidget();
        break;
      case 1:
        return MovieListWidget();
        break;
    }
    return Container();
  }

  Widget _bottomNavigationBarWidget() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.movie), label: "Movie"),
      ],
      currentIndex: _bottomNavigationProvider.currentPage,
      selectedItemColor: Colors.red,
      onTap: (index) {
        _bottomNavigationProvider.updateCurrentPage(index);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _countProvider = Provider.of<CountProvider>(context, listen: false);
    _bottomNavigationProvider = Provider.of<BottomNavigationProvider>(context);

    return Scaffold(
      body: _navigationBody(),
      bottomNavigationBar: _bottomNavigationBarWidget(),
    );
  }
}
