import 'package:button_variant/button_types.dart';
import 'package:button_variant/icon_placement.dart';
import 'package:flutter/material.dart';

/// Variante de Botão com customização mais intuitiva.
class ButtonVariant extends StatefulWidget {
  const ButtonVariant({
    super.key,
    this.icon,
    this.label,
    this.backgroundColor,
    this.foregroundColor,
    this.disabledBackgroundColor,
    this.disabledForegroundColor,
    this.iconColor,
    this.disabledIconColor,
    this.iconPlacement = IconPlacement.left,
    this.iconSize,
    this.disableLoadingAnimation = false,
    this.gap,
    this.loadingWidget,
    this.maxLines,
    this.overflow = TextOverflow.ellipsis,
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
  final Color? disabledBackgroundColor;
  final Color? disabledForegroundColor;

  /// Lacuna entre o rótulo e o ícone.
  final Color? iconColor;
  final Color? disabledIconColor;

  /// Onde o ícone deve ser posicionado em relação ao rótulo.
  final IconPlacement iconPlacement;
  final double? iconSize;
  final bool disableLoadingAnimation;
  final double? gap;
  final Widget? loadingWidget;
  final int? maxLines;
  final TextOverflow overflow;
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

  @override
  State<ButtonVariant> createState() => _ButtonVariantState();
}

class _ButtonVariantState extends State<ButtonVariant> {
  /// Tamanho padrão do tamanho da fonte de botões definido pelo Material Design 3.
  static const _defaultFontSize = 14.0;

  /// Opacidade padrão da cor de fundo de botões inativos no Material Design 3.
  static const _disabledBackgroundOpacity = 0.12;

  /// Opacidade padrão da cor de frente de botões inativos no Material Design 3.
  static const _disabledForegroundOpacity = 0.38;

  /// Lacuna horizontal padrão do Material Design 3 entre o ícone e o rótulo de um botão.
  static const _defaultHorizontalGap = 8.0;

  /// Tamanho padrão do ícone em um IconButton.
  static const _defaultIconSize = 24.0;

  /// Lacuna vertical padrão entre o ícone e o rótulo do botão.
  static const _defaultVerticalGap = 4.0;

  /// O tamanho padrão do ícone no Material Design 3 é de 18dp, o que é 4 a mais
  /// que o tamanho padrão da fonte. Isso mantém o comportamento consistente com
  /// diferentes tamanhos de fonte.
  static const _iconGain = 4;

  final _loading = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      enabled: widget.onPressed != null,
      child: Tooltip(message: widget.tooltip ?? '', child: _getButton(context)),
    );
  }

  Color _getBackgroundColor(BuildContext context) {
    // Retorna a cor padrão para botões desabilitados do Material Design 3 se este for o caso.
    if (widget.onPressed == null) {
      if (widget.disabledBackgroundColor != null) {
        return widget.disabledBackgroundColor!;
      }
      if (widget.type == ButtonTypes.text ||
          widget.type == ButtonTypes.outlined) {
        return Colors.transparent;
      }
      return Theme.of(context)
          .colorScheme
          .onSurface
          .withAlpha((255 * _disabledBackgroundOpacity).round());
    }
    // Retorna a cor definida pelo usuário caso tenha sido fornecida.
    if (widget.backgroundColor != null) return widget.backgroundColor!;
    // Retorna a cor de fundo padrão do Material Design 3 para cada caso de botão
    // caso esteja habilitado e o usuário não tenha fornecido uma cor específica.
    switch (widget.type) {
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
    if (widget.onPressed == null) {
      if (widget.disabledForegroundColor != null) {
        return widget.disabledForegroundColor!;
      }
      return Theme.of(context)
          .colorScheme
          .onSurface
          .withAlpha((255 * _disabledForegroundOpacity).round());
    }
    // Retorna a cor definida pelo usuário caso tenha sido fornecida.
    if (widget.foregroundColor != null) return widget.foregroundColor!;
    // Retorna a cor de frente padrão do Material Design 3 para cada caso de botão
    // caso esteja habilitado e o usuário não tenha fornecido uma cor específica.
    switch (widget.type) {
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
    final label_ = widget.label ?? '';

    if (label_.isEmpty) {
      switch (widget.type) {
        case ButtonTypes.elevated:
        case ButtonTypes.text:
          return IconButton(style: style, onPressed: _onPressed, icon: child);
        case ButtonTypes.filled:
          return IconButton.filled(
              style: style, onPressed: _onPressed, icon: child);
        case ButtonTypes.outlined:
          return IconButton.outlined(
              style: style, onPressed: _onPressed, icon: child);
        case ButtonTypes.tonal:
          return IconButton.filledTonal(
              style: style, onPressed: _onPressed, icon: child);
      }
    }
    return switch (widget.type) {
      ButtonTypes.elevated =>
        ElevatedButton(style: style, onPressed: _onPressed, child: child),
      ButtonTypes.filled =>
        FilledButton(style: style, onPressed: _onPressed, child: child),
      ButtonTypes.outlined =>
        OutlinedButton(style: style, onPressed: _onPressed, child: child),
      ButtonTypes.text =>
        TextButton(style: style, onPressed: _onPressed, child: child),
      ButtonTypes.tonal =>
        FilledButton.tonal(style: style, onPressed: _onPressed, child: child),
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
      padding: WidgetStateProperty.all(widget.padding),
    );

    if (widget.type == ButtonTypes.elevated) {
      return baseStyle.copyWith(
        // [shadowColor] e [elevation] são definidos para dar o efeito de elevação
        // simulando o [ElevatedButton].
        shadowColor:
            WidgetStateProperty.all(Theme.of(context).colorScheme.shadow),
        elevation: WidgetStateProperty.all(widget.onPressed == null ? 0 : 1),
      );
    }
    return baseStyle;
  }

  Widget _getChild(BuildContext context, {required Color foregroundColor}) {
    final label_ = widget.label ?? '';

    final style = _getTextStyle(foregroundColor);
    final icSize = widget.iconSize ??
        (label_.isEmpty ? _defaultIconSize : (style.fontSize! + _iconGain));
    final icColor = (widget.onPressed == null
            ? widget.disabledIconColor
            : widget.iconColor) ??
        foregroundColor;

    if (label_.isEmpty) {
      return _getIcon(widget.icon, icColor, icSize);
    }

    final axis = widget.iconPlacement == IconPlacement.left ||
            widget.iconPlacement == IconPlacement.right
        ? Axis.horizontal
        : Axis.vertical;

    final gap_ = widget.gap ??
        (axis == Axis.horizontal ? _defaultHorizontalGap : _defaultVerticalGap);

    return Flex(
      crossAxisAlignment: CrossAxisAlignment.center,
      direction: axis,
      mainAxisSize: MainAxisSize.min,
      textDirection: widget.iconPlacement == IconPlacement.left
          ? TextDirection.rtl
          : TextDirection.ltr,
      verticalDirection: widget.iconPlacement == IconPlacement.top
          ? VerticalDirection.up
          : VerticalDirection.down,
      children: [
        if (label_.isNotEmpty)
          Flexible(
            child: Text(
              label_,
              maxLines: widget.maxLines,
              overflow: widget.overflow,
              style: style,
              textAlign: TextAlign.center,
            ),
          ),
        if (label_.isNotEmpty && widget.icon != null)
          SizedBox(
            height: axis == Axis.vertical ? gap_ : null,
            width: axis == Axis.horizontal ? gap_ : null,
          ),
        if (widget.icon != null) _getIcon(widget.icon, icColor, icSize),
      ],
    );
  }

  Widget _getIcon(IconData? icon, Color color, double size) {
    return ValueListenableBuilder(
      valueListenable: _loading,
      builder: (context, loading, child) {
        if (loading) {
          return SizedBox.square(
            dimension: size,
            child: widget.loadingWidget ??
                Padding(
                  padding: const EdgeInsets.all(2),
                  child: CircularProgressIndicator(color: color),
                ),
          );
        }
        return child!;
      },
      child: Icon(widget.icon, color: color, size: size),
    );
  }

  TextStyle _getTextStyle(Color foregroundColor) {
    // Gera um estilo temporário com um tamanho de fonte não nulo.
    final temp = widget.textStyle?.copyWith(color: foregroundColor) ??
        TextStyle(color: foregroundColor, fontSize: _defaultFontSize);
    // Retorna o estilo com o multiplicador de escala aplicado.
    return temp.copyWith(
        fontSize: (temp.fontSize ?? _defaultFontSize) * widget.scaler);
  }

  Future<void> _onPressed() async {
    if (widget.onPressed == null) return;

    if (widget.disableLoadingAnimation) {
      widget.onPressed?.call();
      return;
    }

    _loading.value = true;
    try {
      final result = widget.onPressed?.call() as Future;
      await result;
    } catch (_) {
      // Catch apenas para evitar erros na aplicação quando onPressed não for Future.
    } finally {
      _loading.value = false;
    }
  }
}
