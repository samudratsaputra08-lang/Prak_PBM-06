import 'package:flutter/material.dart';
import '../database/db_helper.dart';

class EditPage extends StatefulWidget {
  final Map<String, dynamic> data;

  const EditPage({
    super.key,
    required this.data,
  });

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {

  late TextEditingController nama;
  late TextEditingController ttl;
  late TextEditingController gender;
  late TextEditingController alamat;
  late TextEditingController agama;
  late TextEditingController pendidikan;
  late TextEditingController hp;
  late TextEditingController email;

  @override
  void initState() {
    super.initState();

    nama = TextEditingController(
      text: widget.data['nama'],
    );

    ttl = TextEditingController(
      text: widget.data['ttl'],
    );

    gender = TextEditingController(
      text: widget.data['gender'],
    );

    alamat = TextEditingController(
      text: widget.data['alamat'],
    );

    agama = TextEditingController(
      text: widget.data['agama'],
    );

    pendidikan = TextEditingController(
      text: widget.data['pendidikan'],
    );

    hp = TextEditingController(
      text: widget.data['hp'],
    );

    email = TextEditingController(
      text: widget.data['email'],
    );
  }

  void updateData() async {

    await DBHelper.updateMahasiswa(
      widget.data['id'],
      {
        'nama': nama.text,
        'ttl': ttl.text,
        'gender': gender.text,
        'alamat': alamat.text,
        'agama': agama.text,
        'pendidikan': pendidikan.text,
        'hp': hp.text,
        'email': email.text,
      },
    );

    Navigator.pop(context);
  }

  Widget field(
    String label,
    TextEditingController controller,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),

      child: TextField(
        controller: controller,

        decoration: InputDecoration(
          labelText: label,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Mahasiswa'),
        backgroundColor: Colors.teal,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: SingleChildScrollView(
          child: Column(
            children: [

              field('Nama', nama),

              field(
                'Tempat, Tanggal Lahir',
                ttl,
              ),

              field(
                'Jenis Kelamin',
                gender,
              ),

              field('Alamat', alamat),

              field('Agama', agama),

              field(
                'Pendidikan',
                pendidikan,
              ),

              field('Nomor HP', hp),

              field('Email', email),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,

                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                  ),

                  onPressed: updateData,

                  child: const Text(
                    'Simpan',
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}