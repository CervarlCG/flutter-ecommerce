import 'package:ecommerce/models/theme/spacing.dart';
import 'package:flutter/material.dart';

class TabsContainer extends StatefulWidget {
  const TabsContainer(
      {required this.tabs, required this.getTabView, super.key});

  final List<Tab> tabs;
  final Widget Function(int index) getTabView;

  @override
  State<TabsContainer> createState() => _TabsContainerState();
}

class _TabsContainerState extends State<TabsContainer>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  int _tabIndex = 0;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: widget.tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabChange(int index) {
    setState(() {
      _tabIndex = index;
    });
  }

  Widget? _getTabView() {
    if (widget.tabs.isEmpty ||
        _tabIndex < 0 ||
        _tabIndex > widget.tabs.length) {
      return null;
    }
    return widget.getTabView(_tabIndex);
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Column(children: [
      TabBar(
        controller: _tabController,
        tabs: widget.tabs.map((item) {
          return item;
        }).toList(),
        indicator: BoxDecoration(
            color: theme.colorScheme.surface,
            boxShadow: const <BoxShadow>[
              BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 1,
                  blurRadius: 20,
                  offset: Offset(0, 3))
            ],
            borderRadius: BorderRadius.circular(Spacings.normal)),
        indicatorPadding: EdgeInsets.symmetric(
            vertical: Spacings.sm, horizontal: -Spacings.md),
        indicatorSize: TabBarIndicatorSize.label,
        overlayColor: WidgetStateColor.transparent,
        dividerColor: Colors.transparent,
        unselectedLabelColor: theme.colorScheme.secondary,
        onTap: _handleTabChange,
      ),
      Container(
        child: _getTabView(),
      )
    ]);
  }
}
