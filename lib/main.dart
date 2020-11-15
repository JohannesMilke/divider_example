import 'package:divider_example/theme/basic_theme.dart';
import 'package:divider_example/theme/horizontal_theme.dart';
import 'package:divider_example/theme/vertical_theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static final String title = 'Divider Example';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          dividerTheme: DividerThemeData(
            color: Colors.red,
            space: 80,
            indent: 10,
            endIndent: 10,
            thickness: 1.2,
          ),
        ),
        home: MainPage(title: title),
      );
}

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({
    @required this.title,
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;
  final items = List.generate(70, (counter) => 'Item: $counter');

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: buildDividers(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          items: [
            BottomNavigationBarItem(
              icon: Text('Divider'),
              title: Text('Basic'),
            ),
            BottomNavigationBarItem(
              icon: Text('Divider'),
              title: Text('Vertical'),
            ),
            BottomNavigationBarItem(
              icon: Text('Divider'),
              title: Text('Horizontal'),
            ),
          ],
          onTap: (int index) => setState(() => this.index = index),
        ),
      );

  Widget buildDividers() {
    if (index == 0) {
      return buildBasicDivider();
    } else if (index == 1) {
      return buildVerticalDivider();
    } else if (index == 2) {
      return buildHorizontalDivider();
    } else {
      return Container();
    }
  }

  Widget buildBasicDivider() => Theme(
        data: BasicTheme.theme(context),
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            buildMonth(month: 'JANUARY', friends: 1.2, socialMedia: 5),
            buildMonth(month: 'FEBRUARY', friends: 2.3, socialMedia: 3.3),
            buildMonth(month: 'MARCH', friends: 3.2, socialMedia: 2.7),
            buildMonth(month: 'APRIL', friends: 3.0, socialMedia: 1.8),
          ],
        ),
      );

  Widget buildMonth({
    @required String month,
    @required double friends,
    @required double socialMedia,
  }) {
    final title = TextStyle(fontSize: 28, fontWeight: FontWeight.bold);
    final subtitle = TextStyle(fontSize: 20);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        Text(
          month,
          style: TextStyle(fontSize: 24),
        ),
        const SizedBox(height: 24),
        IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text('$friends h', style: title),
                    Text('Friends per day', style: subtitle),
                  ],
                ),
              ),
              VerticalDivider(),
              Expanded(
                child: Column(
                  children: [
                    Text('$socialMedia h', style: title),
                    Text('Online per day', style: subtitle),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildVerticalDivider() => Theme(
        data: VerticalTheme.theme(context),
        child: ListView.separated(
          separatorBuilder: (context, index) => Divider(),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];

            return ListTile(
              title: Text(item),
            );
          },
        ),
      );

  Widget buildHorizontalDivider() => Theme(
        data: HorizontalTheme.theme(context),
        child: Container(
          height: 100,
          child: ListView.separated(
            separatorBuilder: (context, index) => VerticalDivider(),
            padding: EdgeInsets.all(16),
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];

              return Container(
                alignment: Alignment.center,
                child: Text(item, style: TextStyle(fontSize: 24)),
              );
            },
          ),
        ),
      );
}
