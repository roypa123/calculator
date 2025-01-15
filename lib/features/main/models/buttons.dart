  final List<String> buttons = [
    'C', '%', '÷', '⌫',
    '7', '8', '9', '×',
    '4', '5', '6', '-',
    '1', '2', '3', '+',
    '0', '.',  '', '='
  ];

    bool isTopSection(String button) {
    return ['C', '%', '÷'].contains(button);
    }

    bool isSideSection(String button) {
    return ['⌫', '×', '-','+'].contains(button);
    }

    bool isEqualToButton(String button) {
    return ['='].contains(button);
    }