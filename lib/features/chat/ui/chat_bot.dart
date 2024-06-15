import 'package:animate_do/animate_do.dart';
import 'package:carhelp/features/chat/ui/chat_bot_message_screen.dart';
import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';

class Chatbot extends StatefulWidget {
  const Chatbot({super.key});

  @override
  State<Chatbot> createState() => _ChatbotState();
}

class _ChatbotState extends State<Chatbot> {
  late DialogFlowtter dialogFlowtter;
  final TextEditingController textcontroller = TextEditingController();

  List<Map<String, dynamic>> messages = [];

  @override
  void initState() {
    DialogFlowtter.fromFile().then((instance) => dialogFlowtter = instance);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: MaterialButton(
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 16,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: const Text(
          'Moto-Assistant',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
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
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
                decoration: BoxDecoration(
                    border:
                        Border.all(width: 2, color: theme.colorScheme.tertiary),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(
                        10,
                      ),
                      bottomRight: Radius.circular(10),
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(0),
                    ),
                    color: theme.colorScheme.primary),
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 2 / 3),
                child: Text('Hello! How may I help you?',
                    style: TextStyle(color: theme.colorScheme.tertiary)),
              ),
            ),
          ),
          Expanded(
            child: MessageScreen(
              messages: messages,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: theme.colorScheme.tertiary,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 48,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      style: TextStyle(color: theme.colorScheme.primary),
                      controller: textcontroller,
                      cursorColor: theme.colorScheme.primary,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (textcontroller.text.isEmpty) {
                      return;
                    }
                    sendMessage(textcontroller.text);
                    textcontroller.clear();
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                  child: Container(
                    padding: const EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.send,
                      color: theme.colorScheme.primary,
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void sendMessage(String text) async {
    if (text.isEmpty) {
      return; //message is empty
    }
    setState(() {
      addMessage(
        Message(text: DialogText(text: [text])),
        true,
      );
    });

    DetectIntentResponse response = await dialogFlowtter.detectIntent(
      queryInput: QueryInput(text: TextInput(text: text)),
    );

    if (response.message == null) {
      return; //response is null
    }

    setState(() {
      addMessage(response.message!);
    });
  }

  void addMessage(Message message, [bool isUserMessage = false]) {
    messages.add({
      'message': message,
      'isUserMessage': isUserMessage,
    });
  }

  @override
  void dispose() {
    dialogFlowtter.dispose();
    super.dispose();
  }
}
