import 'package:flutter/material.dart';


class RolePermissionScreen extends StatefulWidget {
  const RolePermissionScreen({super.key});

  @override
  State<RolePermissionScreen> createState() => _RolePermissionScreenState();
}

class _RolePermissionScreenState extends State<RolePermissionScreen> {
  final TextEditingController roleController = TextEditingController();

  bool isLoading = false;

  final Map<String, List<String>> permissionGroups = {
    "Posts": [
      "post:create",
      "post:read",
      "post:update",
      "post:delete",
    ],
    "Users": [
      "user:create",
      "user:view",
      "user:ban",
    ],
    "Admin": [
      "admin:access",
      "admin:settings",
    ],
  };

  Map<String, bool> selectedPermissions = {};

  @override
  void initState() {
    super.initState();

    for (var group in permissionGroups.values) {
      for (var perm in group) {
        selectedPermissions[perm] = false;
      }
    }
  }

  void toggleGroup(String group, bool value) {
    setState(() {
      for (var perm in permissionGroups[group]!) {
        selectedPermissions[perm] = value;
      }
    });
  }

  void submit() {
    final roleName = roleController.text.trim();

    final selected = selectedPermissions.entries
        .where((e) => e.value)
        .map((e) => e.key)
        .toList();

    print("ROLE: $roleName");
    print("PERMISSIONS: $selected");

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Role created")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Role Management"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Role Input
            TextField(
              controller: roleController,
              decoration: InputDecoration(
                labelText: "Role Name",
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Permission Groups
            Expanded(
              child: ListView(
                children: permissionGroups.keys.map((group) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    margin: const EdgeInsets.only(bottom: 16),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          // Group Header
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                group,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextButton(
                                onPressed: () => toggleGroup(group, true),
                                child: const Text("Select All"),
                              )
                            ],
                          ),

                          const Divider(),

                          // Permissions
                          ...permissionGroups[group]!.map((perm) {
                            return SwitchListTile(
                              title: Text(perm),
                              value: selectedPermissions[perm] ?? false,
                              onChanged: (val) {
                                setState(() {
                                  selectedPermissions[perm] = val;
                                });
                              },
                            );
                          })
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),

            // Create Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: submit,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text("Create Role"),
              ),
            )
          ],
        ),
      ),
    );
  }
}