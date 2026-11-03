import 'package:flutter/material.dart';

class Date extends StatefulWidget {
  final String hintText;

  const Date({super.key, required this.hintText});

  @override
  State<Date> createState() => _DateState();
}

class _DateState extends State<Date> {
  final TextEditingController _controller = TextEditingController();

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      final String day = picked.day.toString().padLeft(2, '0');
      final String month = picked.month.toString().padLeft(2, '0');
      setState(() {
        _controller.text = '$day/$month/${picked.year}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      readOnly: true,
      onTap: _pickDate,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(
            color: Color.fromARGB(255, 148, 147, 147),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            color: Color.fromARGB(255, 88, 88, 88),
          ),
        ),
        labelText: widget.hintText,
        labelStyle: const TextStyle(
          color: Color.fromARGB(255, 148, 147, 147),
          fontSize: 14,
        ),
        suffixIcon: const Icon(
          Icons.calendar_month_outlined,
          color: Colors.grey,
          size: 22,
        ),
      ),
    );
  }
}
