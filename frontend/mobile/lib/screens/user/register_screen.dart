import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final snameController = TextEditingController();
  final studentIdController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();

  bool isPasswordHidden = true;
  bool isLoading = false;

  int step = 1;

  String? selectedFaculty;
  String? selectedBranch;
  String? selectedYear;

  final Map<String, List<String>> facultyBranches = {
    "Engineering": ["Computer Science", "Mechanical", "Electrical"],
    "Business": ["Finance", "Marketing", "Management"],
    "Arts": ["History", "Literature", "Philosophy"],
  };

  final List<String> years = ["1", "2", "3", "4", "5", "6"];

  InputDecoration inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: Colors.grey[100],
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    );
  }

  void nextStep() {
    if (step == 1) {
      if (!_formKey.currentState!.validate()) return;
    }
    setState(() => step = 2);
  }

  void register() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => isLoading = true);

    await Future.delayed(const Duration(seconds: 2));

    setState(() => isLoading = false);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Registration successful!")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 40),

              const Text(
                "FacultyApp",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 30),

              Form(
                key: _formKey,
                child: Column(
                  children: [
                    if (step == 1) ...[
                      TextFormField(
                        controller: nameController,
                        decoration: inputDecoration("First name"),
                        validator: (v) =>
                            v!.isEmpty ? "Enter first name" : null,
                      ),
                      const SizedBox(height: 16),

                      TextFormField(
                        controller: snameController,
                        decoration: inputDecoration("Surname"),
                        validator: (v) =>
                            v!.isEmpty ? "Enter surname" : null,
                      ),
                      const SizedBox(height: 16),

                      TextFormField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        decoration:
                            inputDecoration("Phone").copyWith(prefixText: "+66 "),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        validator: (v) =>
                            v!.isEmpty ? "Enter phone number" : null,
                      ),
                      const SizedBox(height: 16),

                      DropdownButtonFormField<String>(
                        initialValue: selectedFaculty,
                        decoration: inputDecoration("Faculty"),
                        items: facultyBranches.keys.map((faculty) {
                          return DropdownMenuItem(
                            value: faculty,
                            child: Text(faculty),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedFaculty = value;
                            selectedBranch = null;
                          });
                        },
                        validator: (value) =>
                            value == null ? "Select faculty" : null,
                      ),
                      const SizedBox(height: 16),

                      DropdownButtonFormField<String>(
                        initialValue: selectedBranch,
                        decoration: inputDecoration("Branch"),
                        items: selectedFaculty == null
                            ? []
                            : facultyBranches[selectedFaculty!]!
                                .map((branch) {
                                return DropdownMenuItem(
                                  value: branch,
                                  child: Text(branch),
                                );
                              }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedBranch = value;
                          });
                        },
                        validator: (value) =>
                            value == null ? "Select branch" : null,
                      ),
                      const SizedBox(height: 16),

                      DropdownButtonFormField<String>(
                        initialValue: selectedYear,
                        decoration: inputDecoration("Year"),
                        items: years.map((year) {
                          return DropdownMenuItem(
                            value: year,
                            child: Text("Year $year"),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedYear = value;
                          });
                        },
                        validator: (value) =>
                            value == null ? "Select year" : null,
                      ),
                      const SizedBox(height: 24),

                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: nextStep,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            "Next",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],

                    if (step == 2) ...[
                      TextFormField(
                        controller: studentIdController,
                        keyboardType: TextInputType.number,
                        decoration: inputDecoration("Student ID"),
                        validator: (v) =>
                            v!.isEmpty ? "Enter student ID" : null,
                      ),
                      const SizedBox(height: 16),

                      TextFormField(
                        controller: passwordController,
                        obscureText: isPasswordHidden,
                        decoration: inputDecoration("Password").copyWith(
                          suffixIcon: IconButton(
                            icon: Icon(isPasswordHidden
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                isPasswordHidden = !isPasswordHidden;
                              });
                            },
                          ),
                        ),
                        validator: (value) {
                          if (value!.length < 6) {
                            return "Min 6 characters";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 24),

                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: isLoading ? null : register,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: isLoading
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : const Text(
                                  "Sign up",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold),
                                ),
                        ),
                      ),

                      TextButton(
                        onPressed: () => setState(() => step = 1),
                        child: const Text("Back"),
                      ),
                    ],
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account? "),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Text(
                      "Log in",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}