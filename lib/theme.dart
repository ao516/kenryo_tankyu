import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff8e4953),
      surfaceTint: Color(0xff8e4953),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4294957532),
      onPrimaryContainer: Color(4282058515),
      secondary: Color(4285945433),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4294957532),
      onSecondaryContainer: Color(4281079064),
      tertiary: Color(4286076976),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4294958519),
      onTertiaryContainer: Color(4280948480),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      surface: Color(4294965495),
      onSurface: Color(4280424730),
      onSurfaceVariant: Color(4283581252),
      outline: Color(4286870388),
      outlineVariant: Color(4292329923),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281871919),
      inversePrimary: Color(4294947515),
      primaryFixed: Color(4294957532),
      onPrimaryFixed: Color(4282058515),
      primaryFixedDim: Color(4294947515),
      onPrimaryFixedVariant: Color(4285674301),
      secondaryFixed: Color(4294957532),
      onSecondaryFixed: Color(4281079064),
      secondaryFixedDim: Color(4293246400),
      onSecondaryFixedVariant: Color(4284235586),
      tertiaryFixed: Color(4294958519),
      onTertiaryFixed: Color(4280948480),
      tertiaryFixedDim: Color(4293509007),
      onTertiaryFixedVariant: Color(4284367131),
      surfaceDim: Color(4293383895),
      surfaceBright: Color(4294965495),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294963440),
      surfaceContainer: Color(4294765290),
      surfaceContainerHigh: Color(4294370533),
      surfaceContainerHighest: Color(4293975775),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4285345593),
      surfaceTint: Color(4287514963),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4289290089),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4283972414),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4287523951),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4284038424),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4287655492),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      surface: Color(4294965495),
      onSurface: Color(4280424730),
      onSurfaceVariant: Color(4283318080),
      outline: Color(4285225820),
      outlineVariant: Color(4287133304),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281871919),
      inversePrimary: Color(4294947515),
      primaryFixed: Color(4289290089),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4287383377),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4287523951),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4285748311),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4287655492),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4285879854),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4293383895),
      surfaceBright: Color(4294965495),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294963440),
      surfaceContainer: Color(4294765290),
      surfaceContainerHigh: Color(4294370533),
      surfaceContainerHighest: Color(4293975775),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4282650138),
      surfaceTint: Color(4287514963),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4285345593),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4281539358),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4283972414),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4281539840),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4284038424),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      surface: Color(4294965495),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(4281147682),
      outline: Color(4283318080),
      outlineVariant: Color(4283318080),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281871919),
      inversePrimary: Color(4294960872),
      primaryFixed: Color(4285345593),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4283504932),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4283972414),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4282328617),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4284038424),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4282394372),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4293383895),
      surfaceBright: Color(4294965495),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294963440),
      surfaceContainer: Color(4294765290),
      surfaceContainerHigh: Color(4294370533),
      surfaceContainerHighest: Color(4293975775),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294947515),
      surfaceTint: Color(4294947515),
      onPrimary: Color(4283833639),
      primaryContainer: Color(4285674301),
      onPrimaryContainer: Color(4294957532),
      secondary: Color(4293246400),
      onSecondary: Color(4282591532),
      secondaryContainer: Color(4284235586),
      onSecondaryContainer: Color(4294957532),
      tertiary: Color(4293509007),
      onTertiary: Color(4282657543),
      tertiaryContainer: Color(4284367131),
      onTertiaryContainer: Color(4294958519),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      surface: Color(4279898386),
      onSurface: Color(4293975775),
      onSurfaceVariant: Color(4292329923),
      outline: Color(4288646285),
      outlineVariant: Color(4283581252),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293975775),
      inversePrimary: Color(4287514963),
      primaryFixed: Color(4294957532),
      onPrimaryFixed: Color(4282058515),
      primaryFixedDim: Color(4294947515),
      onPrimaryFixedVariant: Color(4285674301),
      secondaryFixed: Color(4294957532),
      onSecondaryFixed: Color(4281079064),
      secondaryFixedDim: Color(4293246400),
      onSecondaryFixedVariant: Color(4284235586),
      tertiaryFixed: Color(4294958519),
      onTertiaryFixed: Color(4280948480),
      tertiaryFixedDim: Color(4293509007),
      onTertiaryFixedVariant: Color(4284367131),
      surfaceDim: Color(4279898386),
      surfaceBright: Color(4282464055),
      surfaceContainerLowest: Color(4279503885),
      surfaceContainerLow: Color(4280424730),
      surfaceContainer: Color(4280687902),
      surfaceContainerHigh: Color(4281411624),
      surfaceContainerHighest: Color(4282200627),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294949056),
      surfaceTint: Color(4294947515),
      onPrimary: Color(4281533198),
      primaryContainer: Color(4291394180),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4293575108),
      onSecondary: Color(4280684563),
      secondaryContainer: Color(4289497227),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4293837715),
      onTertiary: Color(4280488704),
      tertiaryContainer: Color(4289694302),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      surface: Color(4279898386),
      onSurface: Color(4294965753),
      onSurfaceVariant: Color(4292593351),
      outline: Color(4289896095),
      outlineVariant: Color(4287725440),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293975775),
      inversePrimary: Color(4285740094),
      primaryFixed: Color(4294957532),
      onPrimaryFixed: Color(4281073673),
      primaryFixedDim: Color(4294947515),
      onPrimaryFixedVariant: Color(4284293677),
      secondaryFixed: Color(4294957532),
      onSecondaryFixed: Color(4280290062),
      secondaryFixedDim: Color(4293246400),
      onSecondaryFixedVariant: Color(4283051826),
      tertiaryFixed: Color(4294958519),
      onTertiaryFixed: Color(4280028672),
      tertiaryFixedDim: Color(4293509007),
      onTertiaryFixedVariant: Color(4283117836),
      surfaceDim: Color(4279898386),
      surfaceBright: Color(4282464055),
      surfaceContainerLowest: Color(4279503885),
      surfaceContainerLow: Color(4280424730),
      surfaceContainer: Color(4280687902),
      surfaceContainerHigh: Color(4281411624),
      surfaceContainerHighest: Color(4282200627),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294965753),
      surfaceTint: Color(4294947515),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4294949056),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294965753),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4293575108),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294966007),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4293837715),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      surface: Color(4279898386),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4294965753),
      outline: Color(4292593351),
      outlineVariant: Color(4292593351),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293975775),
      inversePrimary: Color(4283307553),
      primaryFixed: Color(4294959073),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4294949056),
      onPrimaryFixedVariant: Color(4281533198),
      secondaryFixed: Color(4294959073),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4293575108),
      onSecondaryFixedVariant: Color(4280684563),
      tertiaryFixed: Color(4294959811),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4293837715),
      onTertiaryFixedVariant: Color(4280488704),
      surfaceDim: Color(4279898386),
      surfaceBright: Color(4282464055),
      surfaceContainerLowest: Color(4279503885),
      surfaceContainerLow: Color(4280424730),
      surfaceContainer: Color(4280687902),
      surfaceContainerHigh: Color(4281411624),
      surfaceContainerHighest: Color(4282200627),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
