import 'package:flutter/material.dart';
import 'package:patients/core/style/color/colors.dart';

class RoundTextField extends StatefulWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String hitText;
  final Widget icon;
  final Widget? rigtIcon;
  final bool obscureText;
  final bool isError;
  final bool? isEnable;
  final EdgeInsets? margin;
  final String? errorText;
  final bool isHintColor;

  final String? Function(String?)? validator;
  const RoundTextField({
    super.key,
    required this.hitText,
    required this.icon,
    this.controller,
    this.margin,
    this.keyboardType,
    this.obscureText = false,
    this.rigtIcon,
    this.isError = false,
    this.isEnable = true,
    this.errorText,
    this.validator,
    this.isHintColor = true,
  });

  @override
  State<RoundTextField> createState() => _RoundTextFieldState();
}

class _RoundTextFieldState extends State<RoundTextField> {
  final focusNode = FocusNode();
  bool stateIsError = false;
  String? _errorText;
  // bool isHintColor = true;

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      setState(() {
        if (focusNode.hasFocus) {
          stateIsError = false;
        }
      });
    });
  }

  @override
  void didUpdateWidget(covariant RoundTextField oldWidget) {
    super.didUpdateWidget(oldWidget);

    stateIsError = focusNode.hasFocus ? false : widget.isError;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          TextFormField(
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            obscureText: widget.obscureText,
            enabled: widget.isEnable,
            onChanged: (value) {
              setState(() {
                _errorText =
                    widget.validator != null ? widget.validator!(value) : null;
              });
            },
            validator: widget.validator,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 20,
              ),
              errorText: _errorText,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: widget.isHintColor ? kPrimary : Colors.white,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: widget.isHintColor
                    ? BorderSide.none
                    : const BorderSide(color: Colors.white),
              ),
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none),
              hintText: widget.hitText,
              suffixIcon: widget.rigtIcon,
              filled: true,
              fillColor: widget.isHintColor
                  ? Colors.grey.shade200
                  : Colors.transparent,
              prefixIcon: Container(
                alignment: Alignment.center,
                width: 30,
                height: 30,
                child: widget.icon,
              ),
              hintStyle: TextStyle(
                color: widget.isHintColor ? Colors.black : Colors.white38,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
