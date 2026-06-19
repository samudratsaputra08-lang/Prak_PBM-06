import 'package:flutter/material.dart';
import '../database/db_helper.dart';

class TambahPage extends StatefulWidget {
  const TambahPage({super.key});

  @override
  State<TambahPage> createState() => _TambahPageState();
}

class _TambahPageState extends State<TambahPage> {

  final nama = TextEditingController();
  final ttl = TextEditingController();
  final gender = TextEditingController();
  final alamat = TextEditingController();
  final agama = TextEditingController();
  final pendidikan = TextEditingController();
  final hp = TextEditingController();
  final email = TextEditingController();

  Future<void> simpanData() async {

    if (
      nama.text.isEmpty ||
      ttl.text.isEmpty ||
      gender.text.isEmpty ||
      alamat.text.isEmpty ||
      agama.text.isEmpty ||
      pendidikan.text.isEmpty ||
      hp.text.isEmpty ||
      email.text.isEmpty
    ) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Semua data wajib diisi',
          ),
        ),
      );

      return;
    }

    try {

      await DBHelper.insertMahasiswa({

        'nama': nama.text,
        'ttl': ttl.text,
        'gender': gender.text,
        'alamat': alamat.text,
        'agama': agama.text,
        'pendidikan': pendidikan.text,
        'hp': hp.text,
        'email': email.text,
      });

      if (!mounted) return;

      Navigator.pop(context);

    } catch (e) {

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Error: $e',
          ),
        ),
      );
    }
  }

  Widget buildField(
    String label,
    TextEditingController controller,
  ) {

    return Padding(

      padding: const EdgeInsets.only(
        bottom: 16,
      ),

      child: TextField(

        controller: controller,

        decoration: InputDecoration(

          labelText: label,

          border: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      resizeToAvoidBottomInset: true,

      appBar: AppBar(

        title: const Text(
          'Tambah Mahasiswa',
        ),

        backgroundColor: Colors.teal,
      ),

      body: SafeArea(

        child: SingleChildScrollView(

          padding: const EdgeInsets.all(16),

          child: Column(

            children: [

              buildField(
                'Nama',
                nama,
              ),

              buildField(
                'Tempat, Tanggal Lahir',
                ttl,
              ),

              buildField(
                'Jenis Kelamin',
                gender,
              ),

              buildField(
                'Alamat',
                alamat,
              ),

              buildField(
                'Agama',
                agama,
              ),

              buildField(
                'Pendidikan',
                pendidikan,
              ),

              buildField(
                'Nomor HP',
                hp,
              ),

              buildField(
                'Email',
                email,
              ),

              const SizedBox(height: 20),

              SizedBox(

                width: double.infinity,
                height: 50,

                child: ElevatedButton(

                  style:
                      ElevatedButton.styleFrom(

                    backgroundColor:
                        Colors.teal,
                  ),

                  onPressed: () async {

                    await simpanData();
                  },

                  child: const Text(
                    'Tambah',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}