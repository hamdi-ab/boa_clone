import 'package:boa_clone/core/transparent_color_button.dart';
import 'package:boa_clone/features/auth/view/widgets/custom_text_form_field.dart';
import 'package:boa_clone/features/auth/view/widgets/scaffold_widget.dart';
import 'package:flutter/material.dart';

class ActivatePage extends StatefulWidget {
  const ActivatePage({super.key});

  @override
  State<ActivatePage> createState() => _ActivatePageState();
}

class _ActivatePageState extends State<ActivatePage> {
  @override
  Widget build(BuildContext context) {
    return  ScaffoldWidget(
      top: 40,
      bottom: 125,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: [
              SizedBox(height: 30,),
              Text(
                'Enter Your Account Number and Phone Number to Continue',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 40.0,),
              CustomTextFormField(hintText: 'Account Number',),
              SizedBox(height: 40.0,),
              CustomTextFormField(hintText: 'Phone Number',)
            ],
          ),
        ),
        const SizedBox(height: 100.0,),
        TransparentColorButton(text: 'Continue',onTap: (){},)

      ],
    );
  }
}
