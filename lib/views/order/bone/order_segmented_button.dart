part of '../order_page.dart';

class OrderSegmentedButton extends StatelessWidget {
  final String? selectedGroup;
  final List<String> groups;
  final Function(String?) onValueChanged;

  const OrderSegmentedButton({
    super.key,
    this.selectedGroup,
    required this.groups,
    required this.onValueChanged,
  });

  @override
  Widget build(BuildContext context) {
    var map = Map.fromEntries(groups.map((e) => segmentText(context, e)).expand((map) => map.entries));
    return SizedBox(
      width: double.infinity,
      child: CupertinoSlidingSegmentedControl<String>(
        padding: const EdgeInsets.all(4),
        groupValue: selectedGroup,
        children: map,
        backgroundColor: AppColors.seashell,
        thumbColor: AppColors.orangeSalmon,
        onValueChanged: onValueChanged,
      ),
    );
  }

  Map<String, Widget> segmentText(BuildContext context, String text) {
    var isSelected = selectedGroup == text;
    return {
      text: SizedBox(
        height: 40,
        child: Center(
          child: Text(
            text,
            style: AppTextStyle.semiBold16(Colors.white).copyWith(
              color: isSelected ? Colors.white : AppColors.thunder,
              fontSize: 16,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
        ),
      )
    };
  }
}
