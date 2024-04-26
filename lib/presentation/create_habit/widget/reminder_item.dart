import 'package:flutter/material.dart';

import '../../../common/constant/constant.dart';
import 'custom_switch.dart';

class ReminderItem extends StatefulWidget {
  final String time;
  final bool isOn;

  const ReminderItem({
    super.key,
    required this.time,
    this.isOn = false,
  });

  @override
  State<ReminderItem> createState() => _ReminderItemState();
}

class _ReminderItemState extends State<ReminderItem> {
  final ValueNotifier<bool> _controller = ValueNotifier<bool>(false);
  bool value = false;

  @override
  void initState() {
    super.initState();
    value = widget.isOn;
    _controller.addListener(() {
      if (_controller.value) {
        value = true;
      } else {
        value = false;
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(Constant.spaceSmall),
      padding: const EdgeInsets.all(Constant.spaceMedium),
      decoration: BoxDecoration(
        color: widget.isOn ? const Color(0xffFDA758) : const Color(0xffC8C1C8),
        borderRadius: BorderRadius.circular(Constant.spaceMedium),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.time,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
          const SizedBox(height: Constant.spaceMedium),
          CustomSwitch(
            isOn: value,
            controller: _controller,
          )
        ],
      ),
    );
  }
}
