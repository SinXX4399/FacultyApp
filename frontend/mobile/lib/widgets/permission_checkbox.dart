import 'package:flutter/material.dart';

class PermissionCheckbox extends StatelessWidget {
  final String permission;
  final bool value;
  final Function(bool?) onChanged;

  const PermissionCheckbox({
    super.key,
    required this.permission,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(permission),
      value: value,
      onChanged: onChanged,
    );
  }
}