import 'package:flutter/material.dart';

class DaysButtonsWidget extends StatefulWidget {
  const DaysButtonsWidget({super.key});

  @override
  State<DaysButtonsWidget> createState() => _DaysButtonsWidgetState();
}

class _DaysButtonsWidgetState extends State<DaysButtonsWidget> {

  final DateTime _today = DateTime.now();
  final List<String> _weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      _scrollToIndex(14);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          getRelativeDay(_today),
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(
          height: 70,
          child: ListView.builder(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: 30,
            itemBuilder: (context, index) {
              final date = _today.add(Duration(days:index - 3));
              return Padding(
                padding: const EdgeInsets.only(left: 2, right: 2),
                child: DayButton(
                  text: getRelativeDay(date),
                  number: date.day,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  getRelativeDay(DateTime date) {
      if (date.day == _today.day) return 'Today';
      return _weekdays[date.weekday - 1];
  }

  void _scrollToIndex(int index) {
    _scrollController.animateTo(
      index * 42.0,
      duration: Duration(microseconds: 1 ),
      curve: Curves.fastEaseInToSlowEaseOut,
    );
  }
}

class DayButton extends StatelessWidget {
  final String text;
  final int number;

  const DayButton({required this.text, required this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text),
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
                child: Text('$number')
            ),
          ),
        ],
      ),
    );
  }


}
