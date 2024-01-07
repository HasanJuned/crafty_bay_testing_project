import 'package:flutter/material.dart';

import '../utility/app_colors.dart';
class SizePicker extends StatefulWidget {
  const SizePicker(
      {Key? key,
        required this.sizes,
        required this.onSelected,
        required this.initialSelected})
      : super(key: key);
  final List<String> sizes;
  final Function(int selectedIndex) onSelected;
  final int initialSelected;

  @override
  State<SizePicker> createState() => _SizePickerState();
}

class _SizePickerState extends State<SizePicker> {
  int _selectedSize = 0;

  @override
  void initState() {
    super.initState();
    _selectedSize = widget.initialSelected;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: widget.sizes.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            _selectedSize = index;
            widget.onSelected(index);
            if (mounted) {
              setState(() {});
            }
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(4),
                color: _selectedSize == index ? AppColors.primaryColor : null),
            alignment: Alignment.center,
            child: Text(widget.sizes[index]),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(
          width: 8,
        );
      },
    );
  }
}
