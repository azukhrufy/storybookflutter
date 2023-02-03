import 'package:flutter/material.dart';

class RknTab extends StatefulWidget {
  const RknTab({Key? key, this.rounded, required this.tabs})
      : super(key: key);

  final List<Tab> tabs;

  final bool? rounded;

  static const routeName = '/Rukun-Tabss';

  @override
  _RknTabState createState() => _RknTabState();
}

class _RknTabState extends State<RknTab>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final _selectedColor = Color(0xff2BE2BF);
  final _unselectedColor = Color(0xffFAFAFA);

  @override
  void initState() {
    _tabController = TabController(length: widget.tabs.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.rounded != null
        ? Container(
            height: kToolbarHeight - 8.0,
            decoration: BoxDecoration(
              color: _unselectedColor,
              borderRadius: BorderRadius.circular(40.0),
            ),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.0),
                  color: _selectedColor),
              labelColor: Colors.white,
              indicatorPadding: const EdgeInsets.all(8),
              unselectedLabelColor: Color(0xffBFBFBF),
              tabs: widget.tabs,
            ))
        : Container(
            decoration: BoxDecoration(
              color: _unselectedColor,
            ),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      top: BorderSide(color: _selectedColor, width: 3.0),
                      left: BorderSide(color: _unselectedColor),
                      right: BorderSide(color: _unselectedColor))),
              tabs: widget.tabs,
              labelColor: Colors.black,
              indicatorColor: _selectedColor,
              unselectedLabelColor: Color(0xffBFBFBF),
            ),
          );
  }
}
