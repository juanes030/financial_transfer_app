import 'package:financial_transfer_app/features/transfers/domain/entities/transfer_entity.dart';
import 'package:flutter/material.dart';

class TransferSuccessDialog extends StatelessWidget {
  const TransferSuccessDialog({
    super.key,
    required this.transfer,
  });

  final TransferEntity transfer;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: const Icon(
        Icons.check_circle,
        color: Colors.green,
        size: 48,
      ),
      title: const Text(
        'Transferencia realizada',
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Comprobante',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Text(
            transfer.receiptNumber,
          ),
          const Divider(height: 24),
          Text(
            'Origen: ${transfer.sourceUserName}',
          ),
          const SizedBox(height: 8),
          Text(
            'Destino: ${transfer.destinationUserName}',
          ),
          const SizedBox(height: 8),
          Text(
            'Monto: \$${transfer.amount}',
          ),
        ],
      ),
      actions: [
        FilledButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'Aceptar',
          ),
        ),
      ],
    );
  }
}