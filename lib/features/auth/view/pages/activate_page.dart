import 'package:boa_clone/core/widgets/transparent_color_button.dart';
import 'package:boa_clone/features/auth/view/widgets/custom_text_form_field.dart';
import 'package:boa_clone/features/auth/view/widgets/scaffold_widget.dart';
import 'package:boa_clone/features/auth/viewmodel/activate_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ActivatePage extends StatefulWidget {
  const ActivatePage({super.key});

  @override
  State<ActivatePage> createState() => _ActivatePageState();
}

class _ActivatePageState extends State<ActivatePage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ActivateViewModel(),
      child: const ScaffoldWidget(
        top: 40,
        bottom: 125,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: _ActivateForm(),
          ),
        ],
      ),
    );
  }
}

class _ActivateForm extends StatelessWidget {
  const _ActivateForm();

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ActivateViewModel>();

    return Column(
      children: [
        const SizedBox(height: 30),
        const Text(
          'Enter Your Account Number and Phone Number to Continue',
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 40),
        CustomTextFormField(
          hintText: 'Account Number',
          errorText: vm.accountNumberError,
          onChanged: vm.setAccountNumber,
        ),
        const SizedBox(height: 40),
        CustomTextFormField(
          hintText: 'Phone Number',
          errorText: vm.phoneNumberError,
          onChanged: vm.setPhoneNumber,
        ),
        const SizedBox(height: 100),
        TransparentColorButton(
          text: 'Continue',
          onTap: vm.activateAccount,
        )
      ],
    );
  }
}