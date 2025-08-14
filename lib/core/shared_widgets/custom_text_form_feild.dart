import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../features/bottom_nav_bar/settings/dark_or_light_mode/dark_or_light_mode_cubit.dart';
import '../../features/bottom_nav_bar/settings/dark_or_light_mode/dark_or_light_mode_state.dart';
import '../theming/colors.dart';

class CustomTextFormFeild extends StatefulWidget {
  final String? hint;
  final String? Function(String?)? validator;
  final VoidCallback? onPressed;
  final bool secure;
  final bool isNumber;
  final Function(String?)? onSave;
  final int maxLines;
  final bool autoFocus;
  final double? height;
  final Widget? suffixIcon;
  final Widget? prefix, prefixIcon;
  final Function(String)? onChanged;
  final VoidCallback? onTap;
  final bool isNext;
  final bool isReadOnly;
  final int? maxLength;
  final String? upperText;
  final String? lableText;
  final String? errorText;
  final String? suffixText;
  final bool hasLabel;
  final Color? hintColor;
  final bool isLTR;
  final double horizontalMargin;
  final double verticalMargin;
  final bool multiLine;
  final Color? fillColor;
  final Color? textColor;
  final Color? labelColor;
  final double radius;
  final String? initialValue;
  final TextInputType keyboardType;
  final FocusNode? focusNode;
  final String? initialText;
  final TextEditingController? controller;
  final double? prefixWidth;

  final bool applyShadow;
final Color colorText;
  final String? prefixSvgAsset;

  final List<TextInputFormatter>? inputFormatters;

  const CustomTextFormFeild({
    super.key,
    this.prefix,
    this.isNumber = false,
    this.maxLines = 1,
    this.onPressed,
    this.onSave,
    this.secure = false,
    this.hint,
    this.validator,
    this.onChanged,
    this.suffixIcon,
    this.onTap,
    this.isNext = true,
    this.maxLength,
    this.upperText,
    this.hasLabel = false,
    this.isLTR = false,
    this.hintColor = const Color(0xffB8B8B8),
    this.horizontalMargin = 0,
    this.multiLine = false,
    this.fillColor,
    this.textColor,
    this.labelColor,
    this.radius = 10,
    this.verticalMargin = 5,
    this.lableText,
    this.initialValue,
    this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.focusNode,
    this.errorText,
    this.isReadOnly = false,
    this.initialText,
    this.suffixText,
    this.applyShadow = false,
    this.controller,
    this.prefixSvgAsset,
    this.prefixWidth,
    this.inputFormatters,
    this.autoFocus = false,
    this.height, required this.colorText,
  });

  @override
  _CustomTextFormFeildState createState() => _CustomTextFormFeildState();
}

class _CustomTextFormFeildState extends State<CustomTextFormFeild> {
  final BorderRadius borderRadius = BorderRadius.circular(25);
  late bool _showPassword;
  late bool _isFocused;

  @override
  void initState() {
    _showPassword = widget.secure;
    _isFocused = widget.autoFocus;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: widget.verticalMargin,
        horizontal: widget.horizontalMargin,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.upperText != null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text(
                widget.upperText!,
                style: TextStyle(
                  color: widget.colorText,
                  fontSize: 14,
                  fontFamily: 'DIN',
                  fontWeight: FontWeight.w400,
                  height: 2,
                ),
              ),
            ),
          GestureDetector(
            onTap: () {
              widget.onTap!();
            },
            child: Directionality(
              textDirection: TextDirection.ltr,
              // textDirection: widget.isLTR
              //     ? TextDirection.ltr
              //     : context.locale == const Locale('ar')
              //     ? TextDirection.rtl
              //     : TextDirection.ltr,
              child: Container(
                height: widget.height,
                // decoration: widget.applyShadow
                //     ? BoxDecoration(
                //         boxShadow: [
                //           BoxShadow(
                //             color: ColorsManager.lightgrey.withOpacity(0.1),
                //             blurRadius: 6,
                //             spreadRadius: 4,
                //             offset: const Offset(1, 1),
                //           ),
                //         ],
                //       )
                //     : null,
                child: Focus(
                  onFocusChange: (hasFocus) {
                    setState(() {
                      _isFocused = hasFocus;
                    });
                  },
                  child: Builder(
                    builder: (context) {
                      return TextFormField(
                        autofocus: widget.autoFocus,
                        focusNode: widget.focusNode,
                        controller:
                            widget.controller ??
                            (widget.initialText != null
                                ? TextEditingController(
                                  text: widget.initialText,
                                )
                                : null),
                        readOnly: widget.isReadOnly,
                        initialValue: widget.initialValue,
                        obscureText: widget.secure,
                        onSaved: widget.onSave,
                        onChanged: widget.onChanged,
                        onTapOutside: (event) {
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        inputFormatters:
                            widget.inputFormatters ??
                            [EnglishArabicTextInputFormatter()],
                        textDirection: TextDirection.ltr,
                        maxLength: widget.maxLength,
                        textInputAction:
                            widget.multiLine
                                ? TextInputAction.newline
                                : widget.isNext
                                ? TextInputAction.next
                                : TextInputAction.done,
                        keyboardType:
                            widget.multiLine
                                ? TextInputType.multiline
                                : widget.isNumber
                                ? TextInputType.number
                                : widget.keyboardType,
                        cursorColor: Color(0xff020659),
                        validator: widget.validator,
                        onTap: () {
                          if (widget.isReadOnly) {
                            widget.onTap;
                          }
                        },
                        maxLines: widget.maxLines,
                        enabled: widget.onTap == null,
                        buildCounter:
                            (
                              context, {
                              required currentLength,
                              required isFocused,
                              maxLength,
                            }) => null,
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          filled: true,
                          errorStyle: const TextStyle(
                            height: 0,
                            color: Colors.red,
                          ),
                          errorText: widget.errorText,
                          hintStyle: TextStyle(
                            color:
                                _isFocused
                                    ? Colors.transparent
                                    : widget.hintColor,
                            fontSize: 12,
                            fontFamily: 'DIN',
                          ),
                          labelStyle: const TextStyle(color: Color(0xFF9c9c9c)),

                          fillColor:
                              widget.fillColor ?? ColorsManager.lightgrey,
                          counterStyle: const TextStyle(
                            fontSize: 0,
                            color: Colors.transparent,
                          ),
                          prefix: widget.prefix,
                          prefixIcon:
                              widget.prefixSvgAsset != null
                                  ? SvgPicture.asset(
                                    widget.prefixSvgAsset!,
                                    color:
                                        _isFocused
                                            ? Color(0xff020659)
                                            : widget.hintColor,
                                  )
                                  : widget.prefixIcon,
                          prefixIconConstraints: BoxConstraints.tightFor(
                            width: widget.prefixWidth ?? 60,
                          ),
                          suffixText: widget.suffixText,
                          suffixStyle: const TextStyle(color: Color(0xff)),
                          suffixIcon:
                              widget.suffixIcon ??
                              (widget.secure
                                  ? IconButton(
                                    padding: const EdgeInsets.all(0),
                                    icon:
                                        !_showPassword
                                            ? const Icon(
                                              Icons.visibility,
                                              color: Colors.grey,
                                            )
                                            : const Icon(
                                              Icons.visibility_off,
                                              color: Colors.grey,
                                            ),
                                    onPressed:
                                        () => setState(
                                          () => _showPassword = !_showPassword,
                                        ),
                                  )
                                  : widget.suffixIcon),
                          hintText: widget.hint,
                          labelText: widget.lableText,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: widget.maxLines == 1 ? (10) : (18),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(widget.radius),
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(widget.radius),
                            borderSide: const BorderSide(color: Colors.blue),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(widget.radius),
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(widget.radius),
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(widget.radius),
                            borderSide: const BorderSide(color: Colors.blue),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(widget.radius),
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EnglishArabicTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final englishPattern = RegExp(
      r'[a-zA-Z]+',
    ); // pattern to match English text
    final arabicPattern = RegExp(
      r'[\u0600-\u06FF]+',
    ); // pattern to match Arabic text
    final hasEnglishText = englishPattern.hasMatch(newValue.text);
    final hasArabicText = arabicPattern.hasMatch(newValue.text);

    if (hasEnglishText && hasArabicText) {
      // if the text contains both English and Arabic text, format it using RichText
      final englishMatches = englishPattern.allMatches(newValue.text);
      final arabicMatches = arabicPattern.allMatches(newValue.text);

      var children = <TextSpan>[];

      int index = 0;
      for (var match in arabicMatches) {
        // add Arabic text to children
        children.add(
          TextSpan(
            text: newValue.text.substring(match.start, match.end),
            style: const TextStyle(),
          ),
        );

        // add English text to children
        if (index < englishMatches.length) {
          var englishMatch = englishMatches.elementAt(index);
          children.add(
            TextSpan(
              text: newValue.text.substring(
                englishMatch.start,
                englishMatch.end,
              ),
              style: const TextStyle(),
            ),
          );
          index++;
        }
      }

      return TextEditingValue(
        text: newValue.text,
        selection: newValue.selection,
        composing: TextRange.empty,
      ).copyWith(
        text:
            children.isNotEmpty
                ? TextSpan(children: children).toPlainText()
                : '',
      );
    } else {
      // otherwise, just return the new value as is
      return newValue;
    }
  }
}
