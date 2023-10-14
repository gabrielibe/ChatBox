import 'package:flutter/material.dart';


class CategorySelector extends StatefulWidget  {
  @override
  _CategorySelectorState createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> with TickerProviderStateMixin{


  @override
  Widget build(BuildContext context) {
int index = 0;
TabController tabController = new TabController(length: 3, vsync: this);
TabController jay(){
  return tabController;
}
    return Container(
      child:myTab(tabController: tabController),
    );
  }
}

class myTab extends StatelessWidget {
  const myTab({
    Key key,
    @required this.tabController,
  }) : super(key: key);


  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
                  shape: BoxShape.rectangle,
          color: Colors.lightBlue),
          indicatorSize: TabBarIndicatorSize.label,

          tabs: [
            Container(
              child: Align(
                  alignment: Alignment.center,
              child: Text('Messages',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700)
              ),
            )
            ),
            Align(
              child: Text('Status',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700)),
            ),
            Align(
              child: Text('Calls',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700)),
            ),
      ],
    );
  }
}
