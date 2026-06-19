import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {

  final Map<String, dynamic> data;

  const ProfilePage({
    super.key,
    required this.data,
  });

  Widget info(
    IconData icon,
    String title,
    String value,
  ) {

    return Column(
      children: [

        ListTile(

          leading: Icon(
            icon,
            color: Colors.teal,
          ),

          title: Text(title),

          subtitle: Text(
            value,

            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        const Divider(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          'Profil Saya',
        ),

        backgroundColor: Colors.teal,
      ),

      body: Column(
        children: [

          Container(

            width: double.infinity,

            padding: const EdgeInsets.all(24),

            decoration: const BoxDecoration(
              color: Colors.teal,

              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),

            child: Column(
              children: [

                const CircleAvatar(
                  radius: 50,

                  child: Icon(
                    Icons.person,
                    size: 60,
                  ),
                ),

                const SizedBox(height: 12),

                Text(
                  data['nama'],

                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(
                  data['pendidikan'],

                  style: const TextStyle(
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),

              child: Card(
                child: ListView(
                  children: [

                    info(
                      Icons.calendar_month,
                      'Tempat/Tgl Lahir',
                      data['ttl'],
                    ),

                    info(
                      Icons.male,
                      'Jenis Kelamin',
                      data['gender'],
                    ),

                    info(
                      Icons.home,
                      'Alamat',
                      data['alamat'],
                    ),

                    info(
                      Icons.favorite,
                      'Agama',
                      data['agama'],
                    ),

                    info(
                      Icons.phone,
                      'No HP',
                      data['hp'],
                    ),

                    info(
                      Icons.email,
                      'Email',
                      data['email'],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}