import 'package:chat_app/screens/all%20page%20use%20components/app_bar_method.dart';
import 'package:flutter/material.dart';

import '../../utiitsl/my_color.dart';

class VoiceAndVideoCall extends StatelessWidget {
  const VoiceAndVideoCall({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: appBarMethod(
        text: "Calls",
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: callLogs.length,
          itemBuilder: (context, index) {
            final call = callLogs[index];
            return Card(
              color: primaryColor,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: bgColor,
                  child: const Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  call['name'],
                  style: const TextStyle(color: Colors.white70),
                ),
                subtitle: Row(
                  children: [
                    Icon(
                      call['incoming'] ? Icons.call_received : Icons.call_made,
                      color: call['incoming'] ? Colors.red : Colors.green,
                      size: 16,
                    ),
                    const SizedBox(width: 5),
                    Text(call['time']),
                  ],
                ),
                trailing: const Icon(Icons.call, color: Colors.white70),
                onTap: () {},
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: primaryColor,
        child: const Icon(
          Icons.add_call,
          color: Colors.white70,
        ),
      ),
    );
  }
}

final List<Map<String, dynamic>> callLogs = [
  {'name': 'Rahul', 'time': 'Today, 10:30 AM', 'incoming': true},
  {'name': 'Priya', 'time': 'Yesterday, 5:45 PM', 'incoming': false},
  {'name': 'Amit', 'time': 'Yesterday, 2:15 PM', 'incoming': true},
  {'name': 'Suresh', 'time': '2 days ago, 6:00 PM', 'incoming': false},
];
