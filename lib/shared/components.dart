import 'package:flutter/material.dart';
import 'package:store_app/shared/consts.dart';

void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

// My TextFormField
class CustomFormField extends StatelessWidget {
  final double? radius;
  final TextEditingController? controller;
  final TextInputType type;
  final ValueChanged? onSubmit;
  final Function(String s)? onChange;
  final FormFieldValidator? validate;
  final String? label;
  final Color? labelColor ;
  final Color? hintColor ;
  final String? hintText;
  final IconData? prefix;
  final IconData? suffix;
  final VoidCallback? onPressed;
  final GestureTapCallback? onTap;
  final bool isPassword ;
  final bool? isClickable ;
  const CustomFormField(
      {super.key,
      required this.controller,
      required this.onChange,
      this.validate,
      required this.type,
      this.onSubmit,
      this.label,
      this.hintText,
      this.prefix,
      this.suffix,
      this.onPressed,
      this.onTap,
      this.hintColor= Colors.white,
      this.isClickable = true,
      this.isPassword = false,
      this.labelColor= Colors.white,
      this.radius= 5.0,
      });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      keyboardType: type,
      onChanged: onChange,
      onFieldSubmitted: onSubmit,
      onTap: onTap,
      enabled: isClickable,
      validator: validate,
      style: const TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: kWhite,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: kGovernorBay,
          ),
        ),
        border: const OutlineInputBorder(),
        labelText: label,
        labelStyle: TextStyle(color: labelColor, fontSize: 18),
        hintText: hintText,
        hintStyle: TextStyle(color: hintColor, fontSize: 18),
        prefixIcon: Icon(prefix),
        suffixIcon: IconButton(
          icon: Icon(suffix),
          onPressed: onPressed,
        ),
      ),
    );
  }
}

// My DefaultButton
class DefaultButton extends StatelessWidget {
 final double? width;
 final double? height;
 final Color? background;
 final   bool isUpperCase;
 final String buttonText;
 final double? textSize ;
 final    Color? textColor ;
 final VoidCallback onPressed;
 final double radius;
   const DefaultButton({
    super.key,
     this.width = double.infinity,
     this.height = 50,
     this.background = kRoyalBlue,
     this.isUpperCase = false,
     required this.buttonText,
     this.textSize= 24.0,
     this.textColor= Colors.white,
     required this.onPressed,
     this.radius = 5,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(radius),
      ),
      width: width,
      height: height,
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          isUpperCase ? buttonText.toUpperCase() : buttonText,
          style: TextStyle(fontSize: textSize, color: textColor),
        ),
      ),
    );
  }
}



void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
    ),
  );
}
