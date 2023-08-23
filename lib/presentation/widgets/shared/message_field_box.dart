import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;

  const MessageFieldBox({
    super.key, 
    required this.onValue
  });
  
  @override
  Widget build(BuildContext context) {
    //Nos da control del input asociado
    final textControl = TextEditingController();
    final focusNode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
      borderRadius: BorderRadius.circular(40),
      borderSide: const BorderSide(color: Colors.transparent),
    );

    final inputDecoration = InputDecoration(
      hintText: 'End your message with a "?"',
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      filled: true,
      suffixIcon: IconButton(
        icon: const Icon(Icons.send_outlined),
        onPressed: () {
          final textValue = textControl.text;
          onValue(textValue);
          textControl.clear();
        },
      ),
    );

    return TextFormField(
      onTapOutside: (event) => focusNode.unfocus(),
      focusNode: focusNode,
      controller: textControl,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        onValue(value);
        textControl.clear();
        focusNode.requestFocus();
      },
    );
  }
}
