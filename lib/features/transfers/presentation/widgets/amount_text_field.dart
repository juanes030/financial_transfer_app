import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AmountTextField extends StatelessWidget {
  const AmountTextField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      decoration: const InputDecoration(
        labelText: 'Monto',
        hintText: 'Ingrese el monto a transferir',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.attach_money),
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Ingrese un monto';
        }

        final amount = int.tryParse(value);

        if (amount == null || amount <= 0) {
          return 'Ingrese un monto válido';
        }

        return null;
      },
    );
  }
}