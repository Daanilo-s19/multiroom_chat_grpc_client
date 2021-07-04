import 'package:aplication_flutter_grpc/app/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class UserModal extends StatefulWidget {
  const UserModal({Key key}) : super(key: key);

  @override
  _UserModalState createState() => _UserModalState();
}

class _UserModalState extends State<UserModal> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.25,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              autofocus: true,
              controller: _nameController,
              validator: (value) {
                if ((value ?? '').isEmpty) {
                  return 'Insira seu nome';
                }

                return null;
              },
            ),
            SizedBox(height: 16),
            OutlinedButton(
              onPressed: _validateAndGoBack,
              child: Text('Salvar'),
            )
          ],
        ),
      ),
    );
  }

  void _validateAndGoBack() {
    if (!_formKey.currentState.validate()) {
      return;
    }

    return Navigator.pop<User>(
      context,
      User(
        id: Uuid().v4(),
        name: _nameController.text,
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
}
