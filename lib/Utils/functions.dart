import 'package:card_generator/Classes/badge.dart';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

pickerExcelFile() async {
  // Lets the user pick one file, but only files with the extensions `svg` and `pdf` can be selected
  FilePickerResult? pickedFile = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['xlsx'],
    allowMultiple: false,
  );

  if (pickedFile != null) {
    var bytes = pickedFile.files.single.bytes;
    var excel = Excel.decodeBytes(bytes!);
    for (var table in excel.tables.keys) {
      print(table); //sheet Name
      print(excel.tables[table]?.maxColumns);
      print(excel.tables[table]?.maxRows);
      for (var row in excel.tables[table]!.rows) {
        for (var cell in row) {
          print(cell?.value);
        }
      }
    }
  }
}

Future<void> printDoc(List<BadgeEJC> listBadges) async {
  final img = await rootBundle.load("lib/Assets/testCard.jpg");
  final imageBytes = img.buffer.asUint8List();
  final doc = pw.Document();
  Uint8List pdf;
  List<pw.Widget> badgesWidgets = [];

  for (var badgeInfo in listBadges) {
    badgesWidgets.add(pw.Container(
      width: 378,
      height: 265,
      decoration: pw.BoxDecoration(
        image: pw.DecorationImage(
          image: pw.Image(pw.MemoryImage(imageBytes)).image,
          fit: pw.BoxFit.cover,
        ),
      ),
      child: pw.Column(children: [
        pw.Text(badgeInfo.name),
        pw.Text(badgeInfo.nickname),
        pw.Text(badgeInfo.squad),
      ]),
    ));
  }

  doc.addPage(pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return [
          pw.GridView(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 2480/3508,
            children: badgesWidgets,
          )
        ];
      }));
  pdf = await doc.save();
  await Printing.layoutPdf(onLayout: (_) => pdf);
  //await Printing.sharePdf(bytes: pdf,filename: 'crachas.pdf',);
}
