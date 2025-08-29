import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? titleWidget;
  final bool centerTitle;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? elevation;
  final Widget? leading;
  final bool automaticallyImplyLeading;
  final List<Widget>? actions;
  final VoidCallback? onLeadingPressed;
  final IconData? leadingIcon;
  final double? leadingWidth;
  final PreferredSizeWidget? bottom;
  final bool? primary;
  final double? titleSpacing;
  final double? toolbarOpacity;
  final double? bottomOpacity;
  final double? toolbarHeight;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final ShapeBorder? shape;
  final IconThemeData? iconTheme;
  final IconThemeData? actionsIconTheme;
  final TextStyle? titleTextStyle;
  final bool forceMaterialTransparency;
  final Clip? clipBehavior;
  final SystemUiOverlayStyle? systemOverlayStyle;

  const CustomAppBar({
    super.key,
    this.title,
    this.titleWidget,
    this.centerTitle = true,
    this.backgroundColor,
    this.foregroundColor,
    this.elevation,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.actions,
    this.onLeadingPressed,
    this.leadingIcon,
    this.leadingWidth,
    this.bottom,
    this.primary,
    this.titleSpacing,
    this.toolbarOpacity = 1.0,
    this.bottomOpacity = 1.0,
    this.toolbarHeight,
    this.shadowColor,
    this.surfaceTintColor,
    this.shape,
    this.iconTheme,
    this.actionsIconTheme,
    this.titleTextStyle,
    this.forceMaterialTransparency = false,
    this.clipBehavior,
    this.systemOverlayStyle,
  }) : assert(title == null || titleWidget == null, 
              'Cannot provide both title and titleWidget');

  @override
  Widget build(BuildContext context) {
    Widget? leadingWidget;
    
    if (leading != null) {
      leadingWidget = leading;
    } else if (onLeadingPressed != null || leadingIcon != null) {
      leadingWidget = IconButton(
        icon: Icon(leadingIcon ?? Icons.arrow_back),
        onPressed: onLeadingPressed ?? () => Navigator.of(context).pop(),
      );
    }

    return AppBar(
      title: titleWidget ?? (title != null ? Text(title!) : null),
      centerTitle: centerTitle,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      elevation: elevation,
      leading: leadingWidget,
      automaticallyImplyLeading: automaticallyImplyLeading && leadingWidget == null,
      actions: actions,
      leadingWidth: leadingWidth,
      bottom: bottom,
      primary: primary ?? true,
      titleSpacing: titleSpacing,
      toolbarOpacity: toolbarOpacity ?? 1.0,
      bottomOpacity: bottomOpacity ?? 1.0,
      toolbarHeight: toolbarHeight,
      shadowColor: shadowColor,
      surfaceTintColor: surfaceTintColor,
      shape: shape,
      iconTheme: iconTheme,
      actionsIconTheme: actionsIconTheme,
      titleTextStyle: titleTextStyle,
      forceMaterialTransparency: forceMaterialTransparency,
      clipBehavior: clipBehavior,
      systemOverlayStyle: systemOverlayStyle,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
    (toolbarHeight ?? kToolbarHeight) + (bottom?.preferredSize.height ?? 0.0)
  );
}
