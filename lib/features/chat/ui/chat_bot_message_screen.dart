import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  final List messages;
  final ScrollController scrollController;
  final ThemeData theme;

  const MessageScreen({
    super.key,
    required this.messages,
    required this.scrollController,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: scrollController,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Column(
            children: [
              Center(
                child: ClipOval(
                  child: Image.asset(
                    fit: BoxFit.cover,
                    'assets/images/assistant.jpg',
                    height: MediaQuery.of(context).size.height / 7.0,
                    width: MediaQuery.of(context).size.width / 3.5,
                  ),
                ),
              ),
              FadeInLeft(
                child: Align(
                  alignment: Alignment.centerLeft,
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
                      color: theme.colorScheme.primary,
                    ),
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 2 / 3),
                    child: Text(
                      'Hello! How may I help you?',
                      style: TextStyle(color: theme.colorScheme.tertiary),
                    ),
                  ),
                ),
              ),
            ],
          );
        }

        final messageTypeBool = messages[index - 1]['isUserMessage'];
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
                        messages[index - 1]['message'].text.text[0],
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
                        messages[index - 1]['message'].text.text[0],
                        style: TextStyle(color: theme.colorScheme.tertiary),
                      ),
                    ),
                  ),
          ],
        );
      },
      separatorBuilder: (_, i) => const Padding(padding: EdgeInsets.only(top: 10)),
      itemCount: messages.length + 1,
    );
  }
}
