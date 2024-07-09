import 'package:card_generator/Classes/badge.dart';
import 'package:card_generator/Utils/extensions.dart';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

Future<List<BadgeEJC>> pickerExcelFile() async {
  FilePickerResult? pickedFile = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['xlsx'],
    allowMultiple: false,
  );

  Set<BadgeEJC> listBadges = {};
  
  if (pickedFile != null) {
    Uint8List? bytes = pickedFile.files.single.bytes;
    Excel excel = Excel.decodeBytes(bytes!);
    Sheet? table = excel.tables.values.first;
    int? qntRows = table?.maxRows;

    for (int x = 1; x<=(qntRows! - 1); x++){
      var squad = table!.row(x).elementAt(1)?.value.toString().removeSpecialCaracters();
      var name = table.row(x).elementAt(2)?.value.toString().split(" ").nameCaptalize();
      var nickname = table.row(x).elementAt(3)?.value.toString().toUpperCase();
      listBadges.add(BadgeEJC(name: name!, nickname: nickname!, squad: squad!));
    }
  }

  return listBadges.toList();
}

Future<void> printDoc(List<BadgeEJC> listBadges) async {
  final robotoBlack = await PdfGoogleFonts.robotoBlack();
  final robotoCondensed = await PdfGoogleFonts.robotoCondensedBold();
  final doc = pw.Document();
  Uint8List pdf;
  List<pw.Widget> badgesWidgets = [];
  
  for (var badgeInfo in listBadges) {
    double fontSize = badgeInfo.nickname.length <= 10 ? 32 : 24;
    ByteData img = await rootBundle.load("assets/${badgeInfo.squad}.png");
    Uint8List imageBytes = img.buffer.asUint8List();
    badgesWidgets.add(pw.Container(
      padding: const pw.EdgeInsetsDirectional.fromSTEB(0, 0, 0, 61),
      decoration: pw.BoxDecoration(
        image: pw.DecorationImage(
          image: pw.Image(pw.MemoryImage(imageBytes)).image,
          fit: pw.BoxFit.cover,
        ),
      ),
      child: pw.Column(
        mainAxisAlignment: pw.MainAxisAlignment.end,
        crossAxisAlignment: pw.CrossAxisAlignment.center,
        children: [
          pw.Text(badgeInfo.nickname, style: pw.TextStyle(fontSize: fontSize, font: robotoBlack)),
          pw.Text(badgeInfo.name, style: pw.TextStyle(fontSize: 10, font: robotoCondensed)),
        ],
      ),
    ));
  }

  doc.addPage(pw.MultiPage(
      maxPages: 500,
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return [
          pw.GridView(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1500 / 1000,
            children: badgesWidgets,
          )
        ];
      }));
  pdf = await doc.save();
  await Printing.layoutPdf(onLayout: (_) => pdf);
  //await Printing.sharePdf(bytes: pdf,filename: 'crachas.pdf',);
}
