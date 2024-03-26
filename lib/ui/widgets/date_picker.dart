import 'package:flutter/material.dart';

class DatePickerCustom extends StatefulWidget {
  const DatePickerCustom({
    Key? key,
    this.width,
    this.label,
    this.bottomPadding = true,
    required this.controller,
    this.dateTime,
    this.isBirthday = true,
  }) : super(key: key);

  final double? width;
  final String? label;
  final bool bottomPadding;
  final TextEditingController controller;
  final String? dateTime;
  final bool? isBirthday;

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePickerCustom> {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = widget.dateTime != null &&
            widget.dateTime!.isNotEmpty
        ? widget.dateTime!
        : '${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}-${now.year}';

    return Padding(
      padding: EdgeInsets.only(bottom: widget.bottomPadding ? 10 : 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.label != null) Text(widget.label!),
          const SizedBox(height: 10),
          Container(
            color: Colors.white,
            width: widget.width ?? double.infinity,
            child: TextField(
              decoration: InputDecoration(
                  errorText: widget.controller.text == ''
                      ? 'Seleccione una fecha'
                      : null,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  hintText: formattedDate,
                  filled: true,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  prefixIcon: const Icon(Icons.calendar_month_rounded),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(0),
                  )),
              readOnly: true,
              onTap: _selectDate,
              controller: widget.controller,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate() async {
    final date = DateTime.now();
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: widget.isBirthday!
          ? DateTime(date.year - 100)
          : DateTime(date.year - 5),
      lastDate: widget.isBirthday! ? date : DateTime(date.year + 5),
    );

    if (picked != null) {
      setState(() {
        String formattedDate =
            formatDate(picked); // Utilizar la función formatDate
        widget.controller.text = formattedDate;
      });
    }
  }

  String formatDate(DateTime date) {
    // Obtener el día, mes y año de la fecha
    String day = date.day.toString().padLeft(2, '0');
    String month = date.month.toString().padLeft(2, '0');
    String year = date.year.toString();

    // Construir la cadena de fecha en el formato día-mes-año
    return '$month-$day-$year';
  }
}
