import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matgar/theme/theme.dart';

Widget buttonText({
  required String txt,
  required Function() onPressed,
}) {
  return Container(
    height: 60,
    width: 110,
    child: ElevatedButton(
      onPressed: onPressed,
      child: Text(
        txt,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      style: ElevatedButton.styleFrom(
        elevation: 0,
        primary: mainColor,
      ),
    ),
  );
}

Widget formField({
  required TextInputType type,
  required TextEditingController controller,
  required String hint,
  required String label,
  required Function validate,
  Function()? suffixPress,
  required IconData icon,
  IconData? suffixIcon,
  bool obscure = false,
}) {
  return Container(
    height: 50,
    child: TextFormField(
      keyboardType: type,
      controller: controller,
      validator: (val) {
        validate(val);
      },
      obscureText: obscure,
      decoration: InputDecoration(
        suffix: IconButton(onPressed: suffixPress, icon: Icon(suffixIcon)),
        hintText: hint,
        label: Text(label),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        prefixIcon: Icon(icon),
        filled: true,
        fillColor: Colors.grey.shade200,
      ),
    ),
  );
}

Widget customText({
  required String txt,
  required double fontSize,
  required FontWeight fontWeight,
  Color color = Colors.black,
}) {
  return Text(
    txt,
    style: GoogleFonts.pacifico(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    ),
  );
}

nextPage({
  required BuildContext context,
  required Widget page,
}) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
}

nextPageUntil({
  required BuildContext context,
  required Widget page,
}) {
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => page), (route) => false);
}

pop(context) {
  Navigator.pop(context);
}
