import 'package:auto_route/auto_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_portfolio/core/constants/string_constants.dart';
import 'package:share_portfolio/core/theme/app_colors.dart';
import 'package:share_portfolio/core/theme/theme_data.dart';
import 'package:share_portfolio/core/widgets/custom_button.dart';
import 'package:share_portfolio/features/portfolio/blocs/import_stock/import_stock_cubit.dart';

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
                  withData: true,
                );
                if (pickedFile != null) {
                  context.read<ImportStockCubit>().importStocks(pickedFile);
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
