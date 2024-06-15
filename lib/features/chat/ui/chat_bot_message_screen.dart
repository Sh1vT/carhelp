import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class MessageScreen extends StatefulWidget {
  final List messages;
  const MessageScreen({super.key, required this.messages});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListView.separated(
        itemBuilder: (context, index) {
          final messageTypeBool = widget.messages[index]['isUserMessage'];
          return Row(
            mainAxisAlignment: messageTypeBool
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            children: [
              messageTypeBool
                  ? FadeInRight(
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.symmetric(
                            vertical: 14, horizontal: 14),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 2, color: theme.colorScheme.tertiary),
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                              topRight: Radius.circular(0),
                              topLeft: Radius.circular(10),
                            ),
                            color: theme.colorScheme.primary),
                        constraints: BoxConstraints(
                            maxWidth:
                                MediaQuery.of(context).size.width * 2 / 3),
                        child: Text(
                          widget.messages[index]['message'].text.text[0],
                          style: TextStyle(color: theme.colorScheme.tertiary),
                        ),
                      ),
                    )
                  : FadeInLeft(
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.symmetric(
                            vertical: 14, horizontal: 14),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 2, color: theme.colorScheme.tertiary),
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                              topRight: Radius.circular(10),
                              topLeft: Radius.circular(0),
                            ),
                            color: theme.colorScheme.primary),
                        constraints: BoxConstraints(
                            maxWidth:
                                MediaQuery.of(context).size.width * 2 / 3),
                        child: Text(
                          widget.messages[index]['message'].text.text[0],
                          style: TextStyle(color: theme.colorScheme.tertiary),
                        ),
                      ),
                    ),
            ],
          );
        },
        separatorBuilder: (_, i) =>
            const Padding(padding: EdgeInsets.only(top: 10)),
        itemCount: widget.messages.length);
  }
}
