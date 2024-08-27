import 'package:chanq_weather_app/ui/root/bloc/bottom_nav_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ------------------------------------------------------
// Page - 최상위 페이지
// ------------------------------------------------------
class AppRootPage extends StatelessWidget {
  const AppRootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider<BottomNavBloc>(
            create: (context) => BottomNavBloc(),
          ),
        ],
        child: _RootBottomNavPage(),
      ),
    );
  }
}

// ------------------------------------------------------
// View
// ------------------------------------------------------
class _RootBottomNavPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBloc, BottomNavItems>(
      builder: (context, state) {
        return Scaffold(
          body: RootPageItemView(item: state),
          bottomNavigationBar: _buildBottomNavigationBar(context, state),
        );
      },
    );
  }

  // 바텀 네비게이션 바 생성
  BottomNavigationBar _buildBottomNavigationBar(
      BuildContext context, BottomNavItems state) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Tab1',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Tab2',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Tab3',
        ),
      ],
      currentIndex: state.index,
      onTap: (index) {
        context.read<BottomNavBloc>().add(BottomNavItems.values[index]);
      },
    );
  }
}

// ------------------------------------------------------
// View - 바텀 네비게이션 아이템 뷰
// ------------------------------------------------------
class RootPageItemView extends StatelessWidget {
  const RootPageItemView({super.key, required this.item});

  final BottomNavItems item;

  @override
  Widget build(BuildContext context) {
    switch (item) {
      case BottomNavItems.tab1:
        return Container(
          color: Colors.red,
          child: Center(
            child: Text('Tab1'),
          ),
        );
      case BottomNavItems.tab2:
        return Container(
          color: Colors.green,
          child: Center(
            child: Text('Tab2'),
          ),
        );
      case BottomNavItems.tab3:
        return Container(
          color: Colors.blue,
          child: Center(
            child: Text('Tab3'),
          ),
        );
    }
  }
}
