import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gooabb/core/constants/colorsConstants.dart';

class DatePickerTextField extends StatefulWidget {
  const DatePickerTextField({
    super.key,
    this.labelText = 'Date (D/M/Y)',
    this.hintText = 'Select date',
    this.initialDate,
    this.minYear = 1900,
    this.maxYear = 2100,
    required this.onChanged,
  });

  final String labelText;
  final String hintText;
  final DateTime? initialDate;
  final int minYear;
  final int maxYear;
  final ValueChanged<DateTime> onChanged;

  @override
  State<DatePickerTextField> createState() =>
      _DatePickerTextFieldState();
}

class _DatePickerTextFieldState extends State<DatePickerTextField> {
  late DateTime _selected;
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _selected = widget.initialDate ?? DateTime.now();
    _controller = TextEditingController(text: _formatDmy(_selected));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String _formatDmy(DateTime d) {
    String two(int n) => n.toString().padLeft(2, '0');
    return '${two(d.day)}/${two(d.month)}/${d.year}';
  }

  Future<void> _openPicker() async {
    DateTime temp = _selected;

    final result = await showModalBottomSheet<DateTime>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) {
        return _BottomSheetContainer(
          child: _DmyWheelPicker(
            minYear: widget.minYear,
            maxYear: widget.maxYear,
            initialDate: temp,
            onChanged: (d) => temp = d,
            onCancel: () => Navigator.pop(ctx),
            onConfirm: () => Navigator.pop(ctx, temp),
          ),
        );
      },
    );

    if (result == null) return;

    setState(() {
      _selected = result;
      _controller.text = _formatDmy(result);
    });

    widget.onChanged(result);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: TextFormField(
        controller: _controller,
        readOnly: true,
        onTap: _openPicker,
        decoration: InputDecoration(
          errorBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(19),
            borderSide: BorderSide.none,
          ),

          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}

/// Simple rounded container like iOS/modern bottom sheet
class _BottomSheetContainer extends StatelessWidget {
  const _BottomSheetContainer({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Padding(
      padding: EdgeInsets.only(bottom: bottomInset),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(24),
          ),
        ),
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
        child: child,
      ),
    );
  }
}

class _DmyWheelPicker extends StatefulWidget {
  const _DmyWheelPicker({
    required this.onChanged,
    required this.onCancel,
    required this.onConfirm,
    required this.initialDate,
    required this.minYear,
    required this.maxYear,
  });

  final ValueChanged<DateTime> onChanged;
  final VoidCallback onCancel;
  final VoidCallback onConfirm;
  final DateTime initialDate;
  final int minYear;
  final int maxYear;

  @override
  State<_DmyWheelPicker> createState() => _DmyWheelPickerState();
}

class _DmyWheelPickerState extends State<_DmyWheelPicker> {
  late int _day;
  late int _month;
  late int _year;

  late FixedExtentScrollController _dayCtrl;
  late FixedExtentScrollController _monthCtrl;
  late FixedExtentScrollController _yearCtrl;

  @override
  void initState() {
    super.initState();

    _year = widget.initialDate.year.clamp(
      widget.minYear,
      widget.maxYear,
    );
    _month = widget.initialDate.month;
    _day = widget.initialDate.day.clamp(
      1,
      _daysInMonth(_year, _month),
    );

    _dayCtrl = FixedExtentScrollController(initialItem: _day - 1);
    _monthCtrl = FixedExtentScrollController(initialItem: _month - 1);
    _yearCtrl = FixedExtentScrollController(
      initialItem: _year - widget.minYear,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => _emit());
  }

  @override
  void dispose() {
    _dayCtrl.dispose();
    _monthCtrl.dispose();
    _yearCtrl.dispose();
    super.dispose();
  }

  int _daysInMonth(int year, int month) =>
      DateTime(year, month + 1, 0).day;

  void _emit() {
    final d = DateTime(_year, _month, _day);
    widget.onChanged(d);
  }

  void _ensureValidDay() {
    final maxDay = _daysInMonth(_year, _month);
    if (_day > maxDay) {
      setState(() => _day = maxDay);
      _dayCtrl.jumpToItem(_day - 1);
    }
  }

  Widget _wheel({
    required FixedExtentScrollController controller,
    required int itemCount,
    required String Function(int index) label,
    required ValueChanged<int> onSelected,
    double width = 90,
  }) {
    return SizedBox(
      width: width,
      height: 180,
      child: CupertinoPicker(
        scrollController: controller,
        itemExtent: 44,
        selectionOverlay: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Theme.of(
              context,
            ).colorScheme.primary.withOpacity(0.08),
          ),
        ),
        onSelectedItemChanged: onSelected,
        children: List.generate(itemCount, (i) {
          return Center(
            child: Text(
              label(i),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          );
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final yearCount = (widget.maxYear - widget.minYear) + 1;
    final maxDay = _daysInMonth(_year, _month);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Header
        Row(
          children: [
            TextButton(
              onPressed: widget.onCancel,
              child: const Text('Cancel'),
            ),
            const Spacer(),
            const Text(
              'Select Date',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: widget.onConfirm,
              child: const Text('Done'),
            ),
          ],
        ),
        const SizedBox(height: 8),

        // Wheels
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _wheel(
              controller: _dayCtrl,
              itemCount: maxDay,
              label: (i) => '${i + 1}',
              onSelected: (index) {
                setState(() => _day = index + 1);
                _emit();
              },
            ),
            const SizedBox(width: 10),
            _wheel(
              controller: _monthCtrl,
              itemCount: 12,
              label: (i) => '${i + 1}',
              onSelected: (index) {
                setState(() => _month = index + 1);
                _ensureValidDay();
                _emit();
              },
            ),
            const SizedBox(width: 10),
            _wheel(
              controller: _yearCtrl,
              itemCount: yearCount,
              width: 110,
              label: (i) => '${widget.minYear + i}',
              onSelected: (index) {
                setState(() => _year = widget.minYear + index);
                _ensureValidDay();
                _emit();
              },
            ),
          ],
        ),
      ],
    );
  }
}
