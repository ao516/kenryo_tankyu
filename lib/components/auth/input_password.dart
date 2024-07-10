import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart';

class InputPassword extends ConsumerStatefulWidget {
  const InputPassword({super.key});

  @override
  ConsumerState<InputPassword> createState() => _InputPasswordState();
}

class _InputPasswordState extends ConsumerState<InputPassword> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  String? _confirmPasswordError;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _passwordController,
            obscureText: _obscurePassword,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: _obscurePassword
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility),
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
              labelText: '新規パスワード',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            validator: _validatePassword,
          ),
          const SizedBox(height: 20),
          const Text('パスワードの条件',style: TextStyle(fontWeight: FontWeight.bold)),
          const Row(
            children: [
              Icon(Icons.check,color: Colors.grey),
              SizedBox(width: 10),
              Text('8文字以上',style: TextStyle(color: Colors.grey)),
            ],
          ),
          const Row(
            children: [
              Icon(Icons.check, color: Colors.grey),
              SizedBox(width: 10),
              Text('半角英数字(a-z,A-Z,0-9)のみ',style: TextStyle(color: Colors.grey)),
            ],
          ),
          const Row(
            children: [
              Icon(Icons.check,color: Colors.grey),
              SizedBox(width: 10),
              Text('英字と数字の組み合わせ',style: TextStyle(color: Colors.grey)),
            ],
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _confirmPasswordController,
            obscureText: _obscureConfirmPassword,
            decoration: InputDecoration(
              errorText: _confirmPasswordError,
              suffixIcon: IconButton(
                icon: _obscureConfirmPassword
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility),
                onPressed: () {
                  setState(() {
                    _obscureConfirmPassword = !_obscureConfirmPassword;
                  });
                },
              ),
              labelText: '新規パスワード（確認）',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            validator: _validateConfirmPassword,
            onChanged: _validateConfirmPassword,
          ),
        ],
      ),
    );
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'パスワードを入力してください';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'パスワードを入力してください';
    }
    if (value != _passwordController.text) {
      setState(() {
        _confirmPasswordError = 'パスワードが一致しません';
      });
      return 'パスワードが一致しません';
    } else {
      setState(() {
        _confirmPasswordError = null;
      });
    }
    return null;
  }
}
