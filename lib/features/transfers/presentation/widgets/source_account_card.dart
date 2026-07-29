import 'package:financial_transfer_app/core/utils/currency_formatter.dart';
import 'package:financial_transfer_app/features/users/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';

class SourceAccountCard extends StatelessWidget {
  const SourceAccountCard({
    super.key,
    required this.user,
  });

  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: const InputDecoration(
        labelText: 'Cuenta origen',
        border: OutlineInputBorder(),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            user.name,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 4),
          Text(
            'Saldo disponible: \$${CurrencyFormatter.money.format(user.balance)}',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}