part of '../detail_page.dart';

class DetailCoffeeSizeList extends StatelessWidget {
  final List<String> coffeeSizeList;
  final int selectedSizeIndex;
  const DetailCoffeeSizeList({
    super.key,
    required this.coffeeSizeList,
    required this.selectedSizeIndex,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: coffeeSizeList.length,
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 14,
        mainAxisExtent: 43,
      ),
      itemBuilder: (context, index) {
        if (selectedSizeIndex == index) {
          return CoffeeSizeTile.selected(text: coffeeSizeList[index]);
        }
        return CoffeeSizeTile.unselected(text: coffeeSizeList[index]);
      },
    );
  }
}

class CoffeeSizeTile extends StatelessWidget {
  final Color borderColor;
  final Color color;
  final Color textColor;
  final String text;

  factory CoffeeSizeTile.selected({required String text}) {
    return CoffeeSizeTile(
      borderColor: AppColors.orangeSalmon,
      textColor: AppColors.orangeSalmon,
      color: AppColors.veryLightPink,
      text: text,
    );
  }

  factory CoffeeSizeTile.unselected({required String text}) {
    return CoffeeSizeTile(
      borderColor: AppColors.gainsboro,
      textColor: AppColors.thunder,
      color: Colors.white,
      text: text,
    );
  }

  const CoffeeSizeTile({
    super.key,
    required this.borderColor,
    required this.color,
    required this.textColor,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: textColor,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
        ),
      ),
    );
  }
}
