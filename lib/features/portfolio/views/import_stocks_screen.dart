import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:excel/excel.dart' as ex;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_portfolio/core/constants/string_constants.dart';
import 'package:share_portfolio/core/theme/app_colors.dart';
import 'package:share_portfolio/core/theme/theme_data.dart';
import 'package:share_portfolio/core/widgets/custom_button.dart';

@RoutePage()
class ImportStocksScreen extends StatelessWidget {
  const ImportStocksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackground,
      appBar: AppBar(
        title: const Text(AppStrings.importStocks),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        child: Column(
          children: [
            InkWell(
              onTap: () async {
                FilePickerResult? pickedFile =
                    await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['xlsx'],
                  allowMultiple: false,
                );
                if (pickedFile != null) {
                  var bytes = pickedFile.files.single.bytes;
                  var excel = ex.Excel.decodeBytes(bytes!);
                  for (var table in excel.tables.keys) {
                    print(table); //sheet Name
                    print(excel.tables[table]?.maxColumns);
                    print(excel.tables[table]?.maxRows);
                    for (var row in excel.tables[table]!.rows) {
                      print('$row');
                    }
                  }
                }
              },
              child: Container(
                width: double.maxFinite,
                height: 200.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: AppColors.primary, width: 2.w),
                ),
                child: Center(
                  child: Text(
                    AppStrings.clickToImportExcelFile,
                    style: PortfolioTheme.textTheme.bodyMedium!
                        .copyWith(color: AppColors.primary),
                  ),
                ),
              ),
            ),
            const Spacer(),
            CustomButton(
              onPressed: () {},
              text: 'Import',
              color: AppColors.primary,
              textColor: AppColors.white,
            ),
          ],
        ),
      ),
    );
  }
}
