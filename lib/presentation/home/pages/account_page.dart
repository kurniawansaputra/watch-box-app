import 'package:flutter/material.dart';

import '../../../core/components/circle_avatar_section.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/logo.png',
          height: 28.0,
          fit: BoxFit.contain,
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 24.0,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Subcribe to enjoy premium Watch Box'),
                          SizedBox(height: 8.0),
                          Text(
                            '+62 8*********3',
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 24.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FilledButton(
                          onPressed: () {},
                          child: const Text(
                            'Subscribe',
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                        const Text(
                          'Plans start at Rp45000',
                          style: TextStyle(
                            fontSize: 10.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 16.0,
                ),
                const Divider(),
                const SizedBox(
                  height: 16.0,
                ),
                const Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Profiles',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.edit,
                          size: 14.0,
                          color: Colors.white,
                        ),
                        SizedBox(width: 4.0),
                        Text(
                          'Edit',
                          style: TextStyle(
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12.0,
                ),
                const Row(
                  children: [
                    CircleAvatarSection(
                      imagePath: 'assets/images/current_user.png',
                      title: 'knight27',
                      radius: 28.0,
                    ),
                    SizedBox(width: 16.0),
                    CircleAvatarSection(
                      imagePath: 'assets/images/user_2.png',
                      title: 'fox82',
                      radius: 28.0,
                    ),
                    SizedBox(width: 16.0),
                    CircleAvatarSection(
                      icon: Icons.add,
                      radius: 28.0,
                    ),
                    SizedBox(width: 16.0),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
