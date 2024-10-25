import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/components/circle_avatar_section.dart';

class ChooseAccountPage extends StatelessWidget {
  const ChooseAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                top: 16.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox.shrink(),
                  Text(
                    'Who\'s watching?',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.edit,
                        size: 14.0,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 4.0),
                      Text(
                        'Edit',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24.0),
            Expanded(
              child: SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height - 100,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatarSection(
                              imagePath: 'assets/images/user.png',
                              title: 'knight27',
                              radius: 38.0,
                              onTap: () {
                                GoRouter.of(context).go('/dashboard');
                              },
                            ),
                            const CircleAvatarSection(
                              imagePath: 'assets/images/user_2.png',
                              title: 'fox82',
                              radius: 38.0,
                            ),
                          ],
                        ),
                        const SizedBox(height: 24.0),
                        const CircleAvatarSection(
                          icon: Icons.add,
                          radius: 38.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
