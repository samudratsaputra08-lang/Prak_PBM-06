import 'package:flutter/material.dart';

import '../database/db_helper.dart';
import 'tambah_page.dart';
import 'edit_page.dart';
import 'profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Map<String, dynamic>> mahasiswa = [];

  Future<void> getData() async {

    final data =
        await DBHelper.getMahasiswa();

    setState(() {
      mahasiswa = data;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  void hapusData(int id) async {

    await DBHelper.deleteMahasiswa(id);

    getData();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          'Daftar Mahasiswa',
        ),

        backgroundColor: Colors.teal,
      ),

      body: mahasiswa.isEmpty

          ? const Center(
              child: Text(
                'Belum ada data mahasiswa',
              ),
            )

          : ListView.builder(

              itemCount: mahasiswa.length,

              itemBuilder: (
                context,
                index,
              ) {

                final data =
                    mahasiswa[index];

                return Card(

                  margin:
                      const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),

                  child: ListTile(

                    title: Text(
                      data['nama'],
                    ),

                    subtitle: Text(
                      data['pendidikan'],
                    ),

                    onTap: () {

                      Navigator.push(
                        context,

                        MaterialPageRoute(
                          builder: (_) =>
                              ProfilePage(
                            data: data,
                          ),
                        ),
                      );
                    },

                    trailing: Row(

                      mainAxisSize:
                          MainAxisSize.min,

                      children: [

                        IconButton(

                          icon: const Icon(
                            Icons.edit,
                            color: Colors.orange,
                          ),

                          onPressed:
                              () async {

                            await Navigator.push(
                              context,

                              MaterialPageRoute(
                                builder: (_) =>
                                    EditPage(
                                  data: data,
                                ),
                              ),
                            );

                            getData();
                          },
                        ),

                        IconButton(

                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),

                          onPressed: () {

                            hapusData(
                              data['id'],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

      floatingActionButton:
          FloatingActionButton(

        backgroundColor: Colors.teal,

        child: const Icon(
          Icons.add,
        ),

        onPressed: () async {

          await Navigator.push(
            context,

            MaterialPageRoute(
              builder: (_) =>
                  const TambahPage(),
            ),
          );

          getData();
        },
      ),
    );
  }
} 