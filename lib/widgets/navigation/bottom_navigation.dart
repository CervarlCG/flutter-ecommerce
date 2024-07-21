import 'package:ecommerce/models/theme/border_radius.dart';
import 'package:ecommerce/models/theme/spacing.dart';
import 'package:ecommerce/utils/list.dart';
import 'package:flutter/material.dart';

class BottomNavigationView extends StatefulWidget {
  const BottomNavigationView(
      {this.backgroundColor = Colors.black,
      this.color = Colors.white,
      this.selectedBackgroundColor = Colors.white,
      this.selectedColor = Colors.black,
      required this.items,
      super.key});

  final Color backgroundColor;
  final Color color;
  final Color selectedBackgroundColor;
  final Color selectedColor;
  final List<BottomNavigationViewItem> items;

  @override
  State<BottomNavigationView> createState() => _BottomNavigationViewState();
}

class _BottomNavigationViewState extends State<BottomNavigationView>
    with TickerProviderStateMixin {
  int _navIndex = 0;
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: widget.items.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _handleTapOnNavigationItem(int index) {
    setState(() {
      _navIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
            left: Spacings.normal,
            right: Spacings.normal,
            top: Spacings.normal,
            bottom: MediaQuery.of(context).padding.bottom),
        decoration: BoxDecoration(
          color: widget.backgroundColor,
        ),
        child: TabBar(
          onTap: _handleTapOnNavigationItem,
          controller: _tabController,
          padding: const EdgeInsets.all(0),
          labelPadding: const EdgeInsets.all(0),
          tabs: mapWithIndex(widget.items, (item, index) {
            bool isActive = index == _navIndex;
            return Tab(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    item.icon,
                    color: isActive
                        ? widget.selectedColor
                        : widget.color.withOpacity(0.7),
                    size: Spacings.normal,
                  ),
                  Text(
                    item.label,
                    style: TextStyle(
                        color: isActive
                            ? widget.selectedColor
                            : widget.color.withOpacity(0.7)),
                  ),
                ],
              ),
            );
          }).toList(),
          indicator: BoxDecoration(
              color: widget.selectedBackgroundColor,
              borderRadius: BorderRadius.circular(BorderRadiusSizes.rounded)),
          indicatorPadding: EdgeInsets.symmetric(
              vertical: Spacings.none, horizontal: -Spacings.lg),
          indicatorSize: TabBarIndicatorSize.label,
          overlayColor: WidgetStateColor.transparent,
          dividerColor: Colors.transparent,
          labelColor: widget.selectedColor,
          unselectedLabelColor: widget.color,
        ));
  }
}

class BottomNavigationViewItem {
  BottomNavigationViewItem({required this.icon, required this.label});

  final IconData icon;
  final String label;
}
