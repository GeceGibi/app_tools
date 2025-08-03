String jsonToYaml(Map<String, dynamic> data) {
  final buffer = StringBuffer();

  void writeYaml(Object? value, int deep) {
    final indentStr = '  ' * deep;

    switch (value) {
      case Map<String, dynamic>():
        for (final entry in value.entries) {
          if (entry.value is Map || entry.value is List) {
            buffer.writeln('$indentStr${entry.key}:');
            writeYaml(entry.value, deep + 1);
          } else {
            buffer.writeln(
              '$indentStr${entry.key}: ${_formatYamlValue(entry.value)}',
            );
          }

          if (deep == 0) {
            buffer.writeln();
          }
        }

      case List():
        for (final item in value) {
          if (item is Map || item is List) {
            buffer.writeln('$indentStr-');
            writeYaml(item, deep + 1);
          } else {
            buffer.writeln('$indentStr- ${_formatYamlValue(item)}');
          }
        }
    }
  }

  writeYaml(data, 0);
  return buffer.toString();
}

String _formatYamlValue(Object? value) {
  switch (value) {
    case String():
      if (value.contains(':') ||
          value.contains('-') ||
          value.contains('\n') ||
          value.contains('"')) {
        return '"${value.replaceAll('"', '\\"')}"';
      }
      return value;
    case null:
      return 'null';
    default:
      return value.toString();
  }
}
