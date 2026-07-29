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
      isExpanded: true,
      itemHeight: null,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      items: availableUsers.map((user) {
        return DropdownMenuItem<String>(
          value: user.id,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Text(
              user.name,
              overflow: TextOverflow.ellipsis,
            )
          ),
        );
      }).toList(),
      selectedItemBuilder: (context) {
        return availableUsers.map((user) {
          return Align(
            alignment: Alignment.centerLeft,
            child: Text(
              user.name,
              overflow: TextOverflow.ellipsis,
            ),
          );
        }).toList();
      },
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