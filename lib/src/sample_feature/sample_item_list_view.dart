import 'package:flutter/material.dart';
import 'package:rukun_ui/src/CheckboxRukun/checkbox_rukun_stories.dart';
import 'package:rukun_ui/src/RukunTabs/rukun_tab_stories.dart';
import '../RukunCheckbox/rukun_checkbox_stories.dart';
import '../settings/settings_view.dart';
import 'sample_item.dart';
import 'sample_item_details_view.dart';

/// Displays a list of SampleItems.
class SampleItemListView extends StatelessWidget {
  const SampleItemListView({
    super.key,
    this.items = const [
      SampleItem(
          id: 'Checkbox Rukun', routeName: RknCheckboxStories.routeName),
      SampleItem(
          id: 'Rukun Checkbox', routeName: RukunCheckboxStories.routeName),
      SampleItem(
          id: 'Rukun Tab', routeName: RknTabStories.routeName)
    ],
  });

  static const routeName = '/';

  final List<SampleItem> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor : Colors.white,
      appBar: AppBar(
        title: Image.asset(
          'assets/images/storybook.png',
          fit: BoxFit.contain,
          height: 32,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to the settings page. If the user leaves and returns
              // to the app after it has been killed while running in the
              // background, the navigation stack is restored.
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),

      // To work with lists that may contain a large number of items, it’s best
      // to use the ListView.builder constructor.
      //
      // In contrast to the default ListView constructor, which requires
      // building all Widgets up front, the ListView.builder constructor lazily
      // builds Widgets as they’re scrolled into view.
      body: ListView.builder(
        // Providing a restorationId allows the ListView to restore the
        // scroll position when a user leaves and returns to the app after it
        // has been killed while running in the background.
        restorationId: 'sampleItemListView',
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];
          return ListTile(
              title: Text(item.id),
              leading: const CircleAvatar(
                // Display the Flutter Logo image asset.
                foregroundImage: AssetImage('assets/images/flutter_logo.png'),
              ),
              onTap: () {
                // Navigate to the details page. If the user leaves and returns to
                // the app after it has been killed while running in the
                // background, the navigation stack is restored.
                Navigator.restorablePushNamed(
                  context,
                  item.routeName,
                );
              });
        },
      ),
    );
  }
}
