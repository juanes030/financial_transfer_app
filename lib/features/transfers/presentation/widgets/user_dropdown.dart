import 'package:financial_transfer_app/features/users/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';

class UserDropdown extends StatelessWidget {
  const UserDropdown({
    super.key,
    required this.label,
    required this.users,
    required this.selectedUserId,
    required this.onChanged,
    this.excludedUserId,
  });

  final String label;
  final List<UserEntity> users;
  final String? selectedUserId;
  final String? excludedUserId;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    final availableUsers = users
        .where((user) => user.id != excludedUserId)
        .toList();

    return DropdownButtonFormField<String>(
      value: selectedUserId,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      items: availableUsers.map((user) {
        return DropdownMenuItem<String>(
          value: user.id,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                user.name,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                'Saldo: \$${user.balance}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        );
      }).toList(),
      onChanged: onChanged,
      validator: (value) {
        if (value == null) {
          return 'Seleccione un usuario';
        }

        return null;
      },
    );
  }
}