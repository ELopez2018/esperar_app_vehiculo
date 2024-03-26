import 'package:flutter/material.dart';

class DropdownCustom extends StatefulWidget {
  const DropdownCustom({
    super.key,
    required this.items,
    this.width,
    this.label,
    this.bottomPadding = true,
    this.onChanged,
    this.error,
    this.required = true,
    this.isColor = false,
    this.color,
    this.value = "",
  });
  final List<DropdownMenuItem<String>> items;
  final double? width;
  final String? label;
  final bool bottomPadding;
  final ValueChanged<String?>? onChanged;
  final bool? error;
  final bool? required;
  final bool? isColor;
  final String? color;
  final String? value;

  @override
  State<DropdownCustom> createState() => _DropdownCustomState();
}

class _DropdownCustomState extends State<DropdownCustom> {
  String? driverState;

  @override
  void initState() {
    driverState = widget.items.isNotEmpty
        ? widget.value != null && widget.value!.isNotEmpty
            ? widget.items
                .where(
                    (element) => element.value == widget.value!)
                .first
                .value
            : widget.items[0].value
        : '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: widget.bottomPadding ? 10 : 0),
      child: SizedBox(
        width: widget.width ?? double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.label != null) Text(widget.label!),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    items: widget.items,
                    onChanged: (String? value) {
                      driverState = value!;
                      widget.onChanged!(value);
                    },
                    value: driverState,
                    style: TextStyle(overflow: TextOverflow.ellipsis),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    validator: (value) {
                      if (widget.required!) {
                        if (value == widget.items[0].value) {
                          return 'Este campo es requerido';
                        }
                      }
                      return null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    isExpanded: true,
                    key: Key(widget.items.toString()), // Agrega una clave única
                  ),
                ),
                if (widget.isColor!) const SizedBox(width: 10),
                if (widget.isColor!)
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: widget.color != null
                            ? Color(int.parse(widget.color!, radix: 16) +
                                0xFF000000)
                            : Colors.white,
                        border: Border.all(color: Colors.black)),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
