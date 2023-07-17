import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mapping/generated/l10n.dart';

@RoutePage()
class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).chat),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.8,
          child: ListView.separated(
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return Expanded(
                child: ListTile(
                  leading: CircleAvatar(
                    child: ColoredBox(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  title: const Text('Some Text'),
                  trailing: IconButton(
                    icon: const Icon(Icons.arrow_forward_ios),
                    onPressed: () {},
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 15);
            },
          ),
        ),
      ),
    );
  }
}
