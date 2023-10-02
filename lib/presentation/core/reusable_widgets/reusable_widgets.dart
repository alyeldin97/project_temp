import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_template/presentation/core/reusable_widgets/padding.dart';
import 'package:project_template/presentation/utils/colors.dart';

import '../../utils/navigators.dart';
import '../../utils/routes.dart';
import '../../utils/textstyles.dart';
import '../../utils/validators.dart';

class HeightBox extends StatelessWidget {
  final double number;
  const HeightBox(this.number, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: number.h);
  }
}

class WidthBox extends StatelessWidget {
  final double number;
  const WidthBox(this.number, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: number.w);
  }
}

class AppScaffold extends StatelessWidget {
  final Widget body;
  final Widget? bottomNavigationBar;
  final String title;
  final bool hasBackButton;
  final bool resizeToAvoidBottomInset;
  final bool hasAppBar;
  final bool hasCart;

  const AppScaffold(
      {super.key,
      required this.body,
      this.hasBackButton = false,
      this.resizeToAvoidBottomInset = false,
      this.hasAppBar = false,
      this.hasCart = false,
      required this.title,
      this.bottomNavigationBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      appBar: AppBar(
        elevation: 0,
        leading: hasBackButton
            ? IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: AppColors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            : Container(),
        backgroundColor: Colors.transparent,
        title: PrimaryTextSemiBold(
          text: title,
          fontSize: 20,
          color: AppColors.black,
        ),
        centerTitle: true,
      ),
      backgroundColor: AppColors.backGroundColor,
      body: body,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}

class AppScaffoldNavBar extends StatelessWidget {
  final Widget body;
  const AppScaffoldNavBar({
    super.key,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: body,
    );
  }
}

class AppColumn extends StatelessWidget {
  List<Widget> children;
  final double? top;
  final double? bottom;
  final double? start;
  final double? end;
  AppColumn({
    Key? key,
    required this.children,
    this.top = 0.0,
    this.bottom = 0.0,
    this.start = 0.0,
    this.end = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PaddingDynamic(
      start: start,
      bottom: bottom,
      top: top,
      end: end,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}

class AppSeparator extends StatelessWidget {
  final double width;
  final double bottomPadding;
  final Color? color;
  final double topPadding;
  final double startPadding;
  final double endPadding;
  final double thickness;

  const AppSeparator({
    Key? key,
    required this.width,
    this.bottomPadding = 0.0,
    this.topPadding = 0.0,
    this.startPadding = 0.0,
    this.endPadding = 0.0,
    this.thickness = 0.5,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PaddingDynamic(
      bottom: bottomPadding,
      top: topPadding,
      start: startPadding,
      end: endPadding,
      child: Container(
        color: color ?? AppColors.mainColor,
        height: thickness.h,
        width: width,
      ),
    );
  }
}

class AppFormField extends StatefulWidget {
  final String text;
  final String hintext;
  final double width;
  final int height;
  final bool hasTitle;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final bool enabled;
  final bool isPassword;
  bool isValid;
  final dynamic onChanged;
  final TextInputType keyboardType;
  final Widget prefix;
  final bool hintDisabled;
  final EdgeInsetsGeometry? contentPadding;
  final bool required;
  final bool hasShadow;
  final bool center;
  final bool isPhone;
  final bool isDatePicker;

  final TextStyle? textStyle;
  final Color? color;
  final Widget? icon;
  final Widget? suffixIcon;

  AppFormField({
    Key? key,
    required this.text,
    this.textStyle,
    this.hintext = '',
    required this.controller,
    this.isPassword = false,
    this.isPhone = false,
    this.height = 53,
    this.width = 335,
    this.hasTitle = false,
    this.validator = AppValidators.defaultValidator,
    this.enabled = true,
    this.onChanged,
    this.isValid = true,
    this.contentPadding,
    this.hintDisabled = false,
    this.keyboardType = TextInputType.text,
    this.prefix = const SizedBox(),
    this.suffixIcon,
    this.required = true,
    this.center = false,
    this.hasShadow = true,
    this.color,
    this.icon,
    this.isDatePicker = false,
  }) : super(key: key);

  @override
  State<AppFormField> createState() => _AppFormFieldState();
}

class _AppFormFieldState extends State<AppFormField> {
  late bool isVisible;
  String? errorText;
  @override
  void initState() {
    isVisible = !widget.isPassword;
    widget.isValid = errorText == null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MarginDynamic(
      bottom: 5,
      child: Column(
        crossAxisAlignment: widget.center
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: [
          widget.hasTitle
              ? PrimaryTextLight(text: widget.text, fontSize: 12)
              : Container(),
          const HeightBox(3),
          Stack(
            children: [
              // widget.hasShadow
              //     ? AppContainer(
              //         color: AppColors.black.withOpacity(0.1),
              //         height: 5.h,
              //         width: double.infinity,
              //         borderRadius: 3,
              //         startMargin: 3,
              //         topMargin: 49,
              //       )
              //     : Container(),
              widget.isValid
                  ? Container(
                      // height: 10,
                      // width: 10,
                      // color: Colors.amber,
                      )
                  : Container(
                      // height: 100,
                      // width: 100,
                      // color: Colors.amber,
                      child: Row(
                        children: [
                          const Spacer(),
                          PrimaryTextMedium(
                            top: 55,
                            text: errorText ?? widget.validator!("")!,
                            fontSize: 14,
                            color: AppColors.error,
                          ),
                          const WidthBox(10),
                        ],
                      ),
                    ),
              TextFormField(
                onTap: widget.isDatePicker
                    ? () async {
                        DateTime? date = DateTime(1900);
                        FocusScope.of(context).requestFocus(new FocusNode());

                        date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100));
                        widget.controller.text =
                            date.toString().substring(0, 10);
                      }
                    : null,
                style: widget.textStyle ??
                    primaryFontBoldTextStyle(12, color: AppColors.black),
                keyboardType: widget.keyboardType,
                onChanged: (value) {
                  setState(() {
                    errorText = widget.validator!(value);
                    widget.isValid = errorText == null;
                  });
                  // widget.onChanged(value);
                },
                obscureText: !isVisible,
                enabled: widget.enabled,
                controller: widget.controller,
                validator: widget.required ? widget.validator : null,
                decoration: InputDecoration(
                  isDense: false,
                  fillColor: widget.color,
                  filled: widget.color != null ? true : false,
                  prefixIcon: widget.icon,
                  suffixIcon: !widget.isPassword
                      ? widget.suffixIcon
                      : GestureDetector(
                          onTap: () {
                            setState(() {
                              isVisible = !isVisible;
                            });
                          },
                          child: Icon(
                            isVisible ? Icons.visibility : Icons.visibility_off,
                            color: AppColors.black,
                          ),
                        ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.r),
                    borderSide:
                        const BorderSide(color: AppColors.secondaryColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.r),
                    borderSide:
                        const BorderSide(color: AppColors.secondaryColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.r),
                    borderSide:
                        const BorderSide(color: AppColors.secondaryColor),
                  ),
                  contentPadding: widget.contentPadding ??
                      EdgeInsetsDirectional.only(top: 30.h, start: 13.w),
                  hintText:
                      widget.hintext.isEmpty ? widget.text : widget.hintext,
                  hintStyle: primaryFontLightTextStyle(12,
                      color: AppColors.secondaryColor),
                  errorStyle:
                      const TextStyle(height: 0, color: Colors.transparent),
                  prefix: widget.prefix,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AppDropdownFormField extends StatelessWidget {
  final String text;
  final int width;
  final int height;
  final bool hasTitle;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final bool enabled;
  final bool isPassword;
  final dynamic onChanged;
  final TextInputType keyboardType;
  final Widget prefix;
  final bool hintDisabled;
  final EdgeInsetsGeometry? contentPadding;
  final bool required;
  final void Function()? onVisibilityChanged;
  final bool isPasswordVisibile;
  final bool center;
  const AppDropdownFormField(
      {Key? key,
      required this.text,
      required this.controller,
      this.isPassword = false,
      this.height = 50,
      this.width = 310,
      this.hasTitle = true,
      this.validator = AppValidators.defaultValidator,
      this.enabled = true,
      this.onChanged,
      this.contentPadding,
      this.hintDisabled = false,
      this.keyboardType = TextInputType.text,
      this.prefix = const SizedBox(),
      this.required = true,
      this.onVisibilityChanged,
      this.isPasswordVisibile = false,
      this.center = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          center ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        hasTitle
            ? PrimaryTextMedium(
                text: required ? '$text *' : text,
                fontSize: 16,
                // color: AppColors.textFormFieldColor,
              )
            : Container(),
        const HeightBox(5),
        Container(
          width: width.w,
          height: height.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              color: AppColors.mainColor),
          child: Center(
              child: DropdownButtonFormField(
            icon: Icon(
              Icons.keyboard_arrow_down_outlined,
              color: AppColors.secondaryColor,
            ),
            onChanged: onChanged,
            decoration: InputDecoration(
                suffixIcon: !isPassword
                    ? null
                    : IconButton(
                        onPressed: onVisibilityChanged,
                        icon: Icon(isPasswordVisibile
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                contentPadding: contentPadding ?? EdgeInsets.all(15.w),
                hintText: hintDisabled ? null : text,
                hintStyle:
                    primaryFontLightTextStyle(12, color: AppColors.mainColor),
                prefix: prefix),
            items: [],
          )),
        ),
      ],
    );
  }
}

class AppFormFieldWithIcon extends StatelessWidget {
  final String text;
  final int width;
  final int height;
  final bool hasTitle;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final bool enabled;
  final bool isPassword;
  final dynamic onChanged;
  final TextInputType keyboardType;
  final Widget prefix;
  final bool hintDisabled;
  final EdgeInsetsGeometry? contentPadding;
  final bool required;
  final void Function()? onVisibilityChanged;
  final bool isPasswordVisibile;
  final bool center;
  final TextStyle? textStyle;
  final Widget icon;
  final String hintText;
  final int? maxLength;
  const AppFormFieldWithIcon(
      {Key? key,
      required this.text,
      this.textStyle,
      required this.controller,
      this.isPassword = false,
      this.height = 50,
      this.width = 120,
      this.hasTitle = true,
      this.validator = AppValidators.defaultValidator,
      this.enabled = true,
      this.onChanged,
      this.contentPadding,
      this.hintDisabled = false,
      this.keyboardType = TextInputType.text,
      this.prefix = const SizedBox(),
      this.required = true,
      this.onVisibilityChanged,
      this.isPasswordVisibile = false,
      this.center = false,
      required this.icon,
      this.hintText = '',
      this.maxLength})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          center ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        hasTitle
            ? Text(
                required ? '$text *' : text,
                style: textStyle ??
                    primaryFontMediumTextStyle(16,
                        color: AppColors.secondaryColor),
              )
            : Container(),
        const HeightBox(5),
        Container(
          width: width.w,
          height: height.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              // color: AppColors.secondaryColor,
              border: Border.all(color: AppColors.mainColor)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(width: width / 3, child: icon),
              Flexible(
                // width: (width),
                child: TextFormField(
                  maxLength: maxLength,
                  keyboardType: keyboardType,
                  onChanged: onChanged,
                  obscureText: isPassword,
                  enabled: enabled,
                  controller: controller,
                  validator: required ? validator : null,
                  decoration: InputDecoration(
                      counterText: '',
                      suffixIcon: !isPassword
                          ? null
                          : IconButton(
                              onPressed: onVisibilityChanged,
                              icon: Icon(isPasswordVisibile
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            ),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding:
                          EdgeInsetsDirectional.only(start: 10.w, top: 5.h),
                      // contentPadding: contentPadding ?? EdgeInsets.all(15.w),
                      hintText: hintText != ''
                          ? hintText
                          : hintDisabled
                              ? null
                              : text,
                      hintStyle: primaryFontLightTextStyle(12,
                          color: AppColors.mainColor),
                      prefix: prefix),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
