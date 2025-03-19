import 'package:button_variant/button_types.dart';
import 'package:button_variant/icon_placement.dart';
import 'package:flutter/material.dart';

/// Variante de Botão com customização mais intuitiva.
class ButtonVariant extends StatelessWidget {
  const ButtonVariant({
    super.key,
    this.icon,
    this.label,
    this.backgroundColor,
    this.foregroundColor,
    this.gap,
    this.iconColor,
    this.iconPlacement = IconPlacement.left,
    this.iconSize,
    this.padding,
    this.scaler = 1.0,
    this.textStyle,
    this.tooltip,
    this.type = ButtonTypes.filled,
    required this.onPressed,
  });

  final IconData? icon;
  final String? label;
  final Color? backgroundColor;
  final Color? foregroundColor;

  /// Lacuna entre o rótulo e o ícone.
  final double? gap;
  final Color? iconColor;

  /// Onde o ícone deve ser posicionado em relação ao rótulo.
  final IconPlacement iconPlacement;
  final double? iconSize;
  final EdgeInsetsGeometry? padding;

  /// Escalador de tamanho do botão. Altera o tamanho da fonte em [scaler]x.
  /// O tamanho do ícone é calculado a partir do tamanho da fonte, efetivamente
  /// escalando o componente por completo.
  ///
  /// OBS.: Se [iconSize] não for nulo, [scaler] não terá efeito no tamanho do
  /// ícone.
  final double scaler;
  final TextStyle? textStyle;
  final String? tooltip;
  final ButtonTypes type;
  final void Function()? onPressed;

  /// Tamanho padrão do tamanho da fonte de botões definido pelo Material Design 3.
  static const _defaultFontSize = 14.0;

  /// Opacidade padrão da cor de fundo de botões inativos no Material Design 3.
  static const _disabledBackgroundOpacity = 0.12;

  /// Opacidade padrão da cor de frente de botões inativos no Material Design 3.
  static const _disabledForegroundOpacity = 0.38;

  /// Lacuna horizontal padrão do Material Design 3 entre o ícone e o rótulo de um botão.
  static const _defaultHorizontalGap = 8.0;

  /// Lacuna vertical padrão entre o ícone e o rótulo do botão.
  static const _defaultVerticalGap = 4.0;

  /// O tamanho padrão do ícone no Material Design 3 é de 18dp, o que é 4 a mais
  /// que o tamanho padrão da fonte. Isso mantém o comportamento consistente com
  /// diferentes tamanhos de fonte.
  static const _iconGain = 4;

  @override
  Widget build(BuildContext context) {
    return Tooltip(message: tooltip ?? '', child: _getButton(context));
  }

  Color _getBackgroundColor(BuildContext context) {
    // Retorna a cor padrão para botões desabilitados do Material Design 3 se este for o caso.
    if (onPressed == null) {
      if (type == ButtonTypes.text || type == ButtonTypes.outlined) {
        return Colors.transparent;
      }
      return Theme.of(context)
          .colorScheme
          .onSurface
          .withAlpha((255 * _disabledBackgroundOpacity).round());
    }
    // Retorna a cor definida pelo usuário caso tenha sido fornecida.
    if (backgroundColor != null) return backgroundColor!;
    // Retorna a cor de fundo padrão do Material Design 3 para cada caso de botão
    // caso esteja habilitado e o usuário não tenha fornecido uma cor específica.
    switch (type) {
      case ButtonTypes.elevated:
        return Theme.of(context).colorScheme.surfaceContainerLow;
      case ButtonTypes.filled:
        return Theme.of(context).colorScheme.primary;
      case ButtonTypes.outlined:
      case ButtonTypes.text:
        return Colors.transparent;
      case ButtonTypes.tonal:
        return Theme.of(context).colorScheme.secondaryContainer;
    }
  }

  Color _getForegroundColor(BuildContext context) {
    // Retorna a cor padrão para botões desabilitados do Material Design 3 se este for o caso.
    if (onPressed == null) {
      return Theme.of(context)
          .colorScheme
          .onSurface
          .withAlpha((255 * _disabledForegroundOpacity).round());
    }
    // Retorna a cor definida pelo usuário caso tenha sido fornecida.
    if (foregroundColor != null) return foregroundColor!;
    // Retorna a cor de frente padrão do Material Design 3 para cada caso de botão
    // caso esteja habilitado e o usuário não tenha fornecido uma cor específica.
    switch (type) {
      case ButtonTypes.elevated:
      case ButtonTypes.outlined:
      case ButtonTypes.text:
        return Theme.of(context).colorScheme.primary;
      case ButtonTypes.filled:
        return Theme.of(context).colorScheme.onPrimary;
      case ButtonTypes.tonal:
        return Theme.of(context).colorScheme.onSecondaryContainer;
    }
  }

  Widget _getButton(BuildContext context) {
    final bgColor = _getBackgroundColor(context);
    final fgColor = _getForegroundColor(context);

    final child = _getChild(context, foregroundColor: fgColor);
    final style = _getButtonStyle(context, bgColor, fgColor);
    final label_ = label ?? '';

    if (label_.isEmpty) {
      switch (type) {
        case ButtonTypes.elevated:
        case ButtonTypes.text:
          return IconButton(style: style, onPressed: onPressed, icon: child);
        case ButtonTypes.filled:
          return IconButton.filled(
              style: style, onPressed: onPressed, icon: child);
        case ButtonTypes.outlined:
          return IconButton.outlined(
              style: style, onPressed: onPressed, icon: child);
        case ButtonTypes.tonal:
          return IconButton.filledTonal(
              style: style, onPressed: onPressed, icon: child);
      }
    }
    return switch (type) {
      ButtonTypes.elevated =>
        ElevatedButton(style: style, onPressed: onPressed, child: child),
      ButtonTypes.filled =>
        FilledButton(style: style, onPressed: onPressed, child: child),
      ButtonTypes.outlined =>
        OutlinedButton(style: style, onPressed: onPressed, child: child),
      ButtonTypes.text =>
        TextButton(style: style, onPressed: onPressed, child: child),
      ButtonTypes.tonal =>
        FilledButton.tonal(style: style, onPressed: onPressed, child: child),
    };
  }

  ButtonStyle _getButtonStyle(
    BuildContext context,
    Color backgroundColor,
    Color foregroundColor,
  ) {
    final baseStyle = ButtonStyle(
      backgroundColor: WidgetStateProperty.all(backgroundColor),
      foregroundColor: WidgetStateProperty.all(foregroundColor),
      padding: WidgetStateProperty.all(padding),
    );

    if (type == ButtonTypes.elevated) {
      return baseStyle.copyWith(
        // [shadowColor] e [elevation] são definidos para dar o efeito de elevação
        // simulando o [ElevatedButton].
        shadowColor:
            WidgetStateProperty.all(Theme.of(context).colorScheme.shadow),
        elevation: WidgetStateProperty.all(onPressed == null ? 0 : 1),
      );
    }
    return baseStyle;
  }

  Widget _getChild(BuildContext context, {required Color foregroundColor}) {
    final style = _getTextStyle(foregroundColor);
    final icSize = iconSize ?? (style.fontSize! + _iconGain);
    final icColor =
        onPressed == null ? foregroundColor : iconColor ?? foregroundColor;

    final label_ = label ?? '';

    if (label_.isEmpty) {
      return Icon(icon, color: icColor, size: icSize);
    }

    final axis = iconPlacement == IconPlacement.left ||
            iconPlacement == IconPlacement.right
        ? Axis.horizontal
        : Axis.vertical;

    final gap_ = gap ??
        (axis == Axis.horizontal ? _defaultHorizontalGap : _defaultVerticalGap);

    return Flex(
      crossAxisAlignment: CrossAxisAlignment.center,
      direction: axis,
      mainAxisSize: MainAxisSize.min,
      textDirection: iconPlacement == IconPlacement.left
          ? TextDirection.rtl
          : TextDirection.ltr,
      verticalDirection: iconPlacement == IconPlacement.top
          ? VerticalDirection.up
          : VerticalDirection.down,
      children: [
        if (label_.isNotEmpty) Flexible(child: Text(label_, style: style)),
        if (label_.isNotEmpty && icon != null)
          SizedBox(
            height: axis == Axis.vertical ? gap_ : null,
            width: axis == Axis.horizontal ? gap_ : null,
          ),
        if (icon != null) Icon(icon, color: icColor, size: icSize),
      ],
    );
  }

  TextStyle _getTextStyle(Color foregroundColor) {
    // Gera um estilo temporário com um tamanho de fonte não nulo.
    final temp = textStyle?.copyWith(color: foregroundColor) ??
        TextStyle(color: foregroundColor, fontSize: _defaultFontSize);
    // Retorna o estilo com o multiplicador de escala aplicado.
    return temp.copyWith(
        fontSize: (temp.fontSize ?? _defaultFontSize) * scaler);
  }
}
