import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/pertemuan05/pertemuan05_provider.dart';

class Pertemuan05Screen extends StatefulWidget {
  const Pertemuan05Screen({Key? key}) : super(key: key);

  @override
  State<Pertemuan05Screen> createState() => _Pertemuan05ScreenState();
}

class _Pertemuan05ScreenState extends State<Pertemuan05Screen> {
  // Status Soal 1
  bool? soal1a = false;
  bool? soal1b = false;

  // Status Soal 2
  String soal2 = 'answ';

  // Kunci jawaban
  String jawaban2 = 'topologi';

  // Widget untuk menampilkan teks jawaban
  Widget jawabanText(no) {
    if (no == 2) {
      if (soal2 == jawaban2) {
        return const Text(
          'Benar!',
          style: TextStyle(color: Colors.green),
        );
      } else if (soal2 == "answ") {
        return const SizedBox.shrink();
      } else {
        return const Text('Jawaban salah!',
            style: TextStyle(color: Colors.red));
      }
    } else {
      return const SizedBox.shrink();
    }
  }

  // Status Soal 3
  bool kelasPagi = false;
  bool kelasSiang = false;

  void clearPeminatan() {}

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Pertemuan05Provider>(context);
    final prov2 = Provider.of<Pertemuan05Provider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Pertemuan 05"),
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Soal 1
            const Text(
                "1. Memori yang berfungsi untuk tempat penyimpanan data sementara disebut..."),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  const Text("a."),
                  const SizedBox(width: 5),
                  Checkbox(
                      value: soal1a,
                      onChanged: (val) {
                        setState(() {
                          soal1a = val;
                        });
                      }),
                  const Text("RAM")
                ],
              ),
              Row(
                children: [
                  const Text("b."),
                  const SizedBox(width: 5),
                  Checkbox(
                      value: soal1b,
                      onChanged: (val) {
                        setState(() {
                          soal1b = val;
                        });
                      }),
                  const Text("Random Access Memory")
                ],
              ),
              jawabanText(1)
            ]),

            const Divider(),
            const Text("2. Skema desain pembangunan jaringan disebut..."),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  const Text("a."),
                  const SizedBox(width: 5),
                  Radio(
                      value: "topologi",
                      groupValue: soal2,
                      onChanged: (val) {
                        setState(() {
                          soal2 = 'topologi';
                        });
                      }),
                  const Text("Topologi")
                ],
              ),
              Row(
                children: [
                  const Text("b."),
                  const SizedBox(width: 5),
                  Radio(
                      value: "desain jaringan",
                      groupValue: soal2,
                      onChanged: (val) {
                        setState(() {
                          soal2 = 'desain jaringan';
                        });
                      }),
                  const Text("Desain Jaringan")
                ],
              ),
              jawabanText(2)
            ]),

            const Divider(),
            const Text(
              "Feedback Soal",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Text("Kelas"),
            const SizedBox(height: 5),
            Row(
              children: [
                ChoiceChip(
                  label: const Text("Pagi"),
                  selectedColor: Colors.blue[200],
                  selected: kelasPagi,
                  onSelected: (val) {
                    setState(() {
                      if (val) {
                        kelasPagi = val;
                        kelasSiang = !val;
                      } else {
                        kelasPagi = false;
                        kelasSiang = false;
                      }
                    });
                  },
                ),
                const SizedBox(width: 5),
                ChoiceChip(
                  label: const Text("Siang"),
                  selectedColor: Colors.blue[200],
                  selected: kelasSiang,
                  onSelected: (val) {
                    setState(() {
                      if (val) {
                        kelasSiang = val;
                        kelasPagi = !val;
                      } else {
                        kelasSiang = false;
                        kelasPagi = false;
                      }
                    });
                  },
                )
              ],
            ),
            const SizedBox(height: 5),
            const Text("Soal di atas telah dipelajari saat?..."),
            const SizedBox(height: 5),
            Row(
              children: [
                FilterChip(
                    label: const Text("Sekolah"),
                    selectedColor: Colors.blue[200],
                    selected: prov.statusSekolah,
                    onSelected: (val) {
                      prov.setSekolah = val;
                    }),
                const SizedBox(width: 5),
                FilterChip(
                    label: const Text("Praktikum"),
                    selectedColor: Colors.blue[200],
                    selected: prov.statusPraktik,
                    onSelected: (val) {
                      prov.setPraktik = val;
                    }),
                const SizedBox(width: 5),
                FilterChip(
                    label: const Text("Kursus"),
                    selectedColor: Colors.blue[200],
                    selected: prov.statusKursus,
                    onSelected: (val) {
                      prov.setKursus = val;
                    }),
              ],
            ),
            const SizedBox(height: 5),
            const Text("Peminatan saat sekolah?"),
            const SizedBox(height: 5),

            Consumer<Pertemuan05Provider>(
              builder: (context, provider, child) {
                List<Widget> selectedChips = [];

                if (provider.statusTKJ) {
                  selectedChips.add(const Chip(
                    label: Text('TKJ'),
                    backgroundColor: Colors.blue,
                  ));
                } else if (provider.statusRPL) {
                  selectedChips.add(const Chip(
                    label: Text('RPL'),
                    backgroundColor: Colors.blue,
                  ));
                } else if (provider.statusSMA) {
                  selectedChips.add(const Chip(
                    label: Text('SMA'),
                    backgroundColor: Colors.blue,
                  ));
                }

                return Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      child: Row(
                        children: [...selectedChips],
                      ),
                    )
                  ],
                );
              },
            ),

            Row(
              children: [
                InputChip(
                    label: const Text("TKJ"),
                    selectedColor: Colors.blue[200],
                    selected: prov.statusTKJ,
                    onSelected: (val) {
                      if (val) {
                        prov.setTKJ = val;
                        prov.setRPL = !val;
                        prov.setSMA = !val;
                      } else {
                        prov.setTKJ = false;
                        prov.setRPL = false;
                        prov.setSMA = false;
                      }
                    }),
                const SizedBox(width: 5),
                InputChip(
                    label: const Text("RPL"),
                    selectedColor: Colors.blue[200],
                    selected: prov.statusRPL,
                    onSelected: (val) {
                      if (val) {
                        prov.setRPL = val;
                        prov.setTKJ = !val;
                        prov.setSMA = !val;
                      } else {
                        prov.setTKJ = false;
                        prov.setRPL = false;
                        prov.setSMA = false;
                      }
                    }),
                const SizedBox(width: 5),
                InputChip(
                  label: const Text("SMA"),
                  selectedColor: Colors.blue[200],
                  selected: prov.statusSMA,
                  onSelected: (val) {
                    if (val) {
                      prov.setSMA = val;
                      prov.setTKJ = !val;
                      prov.setRPL = !val;
                    } else {
                      prov.setTKJ = false;
                      prov.setRPL = false;
                      prov.setSMA = false;
                    }
                  },
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
