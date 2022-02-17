import 'package:flutter/material.dart';
import 'package:flutter_social_ui/data/data.dart';
import 'package:flutter_social_ui/screens/home_screen.dart';
import 'package:flutter_social_ui/screens/login_screen.dart';
import 'package:flutter_social_ui/screens/profile_screen.dart';

class CUstomDrawer extends StatelessWidget {
  const CUstomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _buildDrawerOption(Icon icon, String title, Function() onTap) {
      return ListTile(
        leading: icon,
        title: Text(
          title,
          style: const TextStyle(fontSize: 20.0),
        ),
        onTap: onTap,
      );
    }

    return Drawer(
      child: Column(
        children: [
          Stack(
            children: [
              Image(
                height: 200.0,
                width: double.infinity,
                image: AssetImage(currentUser.backgroundImageUrl!),
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 20.0,
                left: 20.0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 3.0, color: Theme.of(context).primaryColor),
                        shape: BoxShape.circle,
                      ),
                      height: 100.0,
                      width: 100.0,
                      child: ClipOval(
                        child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage(currentUser.profileImageUrl!),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 7.0,
                    ),
                    const Text(
                      'User Profile',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          _buildDrawerOption(
            const Icon(Icons.dashboard),
            'Home',
            () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
            ),
          ),
          _buildDrawerOption(const Icon(Icons.chat), 'Chat', () => null),
          _buildDrawerOption(const Icon(Icons.location_on), 'Map', () => null),
          _buildDrawerOption(
            const Icon(Icons.account_circle),
            'Your Profile',
            () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ProfileScreen(user: currentUser),
              ),
            ),
          ),
          _buildDrawerOption(
              const Icon(Icons.settings), 'Settings', () => null),
          // SizedBox(
          //   height: 260,
          // ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: _buildDrawerOption(
                const Icon(Icons.logout),
                'LogOut',
                () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
