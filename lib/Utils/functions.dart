import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';

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
      for(var cell in row){
        print(cell?.value);
      }
    }
  }
}
}

Future<void> printDoc() async {
    final doc = pw.Document();
    var pdf;
    doc.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Text('Hello World'),
          );
        }));
        pdf = await doc.save();
        await Printing.layoutPdf(onLayout: (_) => pdf);
        //await Printing.sharePdf(bytes: pdf,filename: 'crachas.pdf',);
  }