import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PROFILE'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/images/avatar.jpg'), // Replace with your image asset path
                ),
                const SizedBox(height: 10),
                const Text(
                  'User 1',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  '+91 9876543210',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 5),
                const Text(
                  'user1@gmail.com',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                children: [
                  ProfileMenuItem(
                    icon: Icons.person,
                    text: 'Edit Profile',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EditProfilePage()),
                      );
                    },
                  ),
                  ProfileMenuItem(
                    icon: Icons.credit_card,
                    text: 'Payment Option',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PaymentOptionPage()),
                      );
                    },
                  ),
                  ProfileMenuItem(
                    icon: Icons.description,
                    text: 'Terms & Conditions',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TermsAndConditionsPage()),
                      );
                    },
                  ),
                  ProfileMenuItem(
                    icon: Icons.help,
                    text: 'Help Center',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HelpCenterPage()),
                      );
                    },
                  ),
                  ProfileMenuItem(
                    icon: Icons.group,
                    text: 'Invite Friends',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => InviteFriendsPage()),
                      );
                    },
                  ),
                  ProfileMenuItem(
                    icon: Icons.logout,
                    text: 'Logout',
                    onTap: () {
                      // Handle logout action
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  ProfileMenuItem({
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(text),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.blue),
      onTap: onTap,
    );
  }
}

class EditProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Center(
        child: Text('Edit Profile Page'),
      ),
    );
  }
}

class PaymentOptionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Option'),
      ),
      body: Center(
        child: Text('Payment Option Page'),
      ),
    );
  }
}


class TermsAndConditionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms & Conditions'),
      ),
      body: Center(
        child: Text('Terms & Conditions Page'),
      ),
    );
  }
}


class HelpCenterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help Center'),
      ),
      body: Center(
        child: Text('Help Center Page'),
      ),
    );
  }
}


class InviteFriendsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Invite Friends'),
      ),
      body: Center(
        child: Text('Invite Friends Page'),
      ),
    );
  }
}

