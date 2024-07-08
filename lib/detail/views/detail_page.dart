import 'package:coffeeshop/order/views/order_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/core.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int selectedSizeIndex = 1;
  List<String> coffeeSizeList = ['S', 'M', 'L'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 24),
        child: appBarr(context),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 28),
              coffeeImage(),
              const SizedBox(height: 20),
              coffeeStarPoint(context),
              const SizedBox(height: 28),
              Divider(
                height: 0,
                color: AppColors.greenWhite,
                thickness: 1,
              ),
              const SizedBox(height: 20),
              title('Description'),
              const SizedBox(height: 15),
              ReadMoreText(
                trimLines: 3,
                textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.starDust,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                showLessText: 'Show Less',
                readMoreText: 'Read More',
                readMoreStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.orangeSalmon,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                text:
                    'Yinelenen bir sayfa içeriğinin okuyuc unun dikka tini dağıttığı bilinen bir gerçektir. Lorem Ipsum kulla nman ın amacı, sürekli bura ya metin gelecek, buraya metin gelecek yazmaya kıyasla daha dengeli bir harf dağılımı sağlayarak okunurluğu artırmasıdır. Şu anda birçok masaüstü yayıncılık paketi ve web sayfa düzenleyicisi, varsayılan mıgır metinler olarak Lorem Ipsum kullanmaktadır. Ayrıca arama motorlarında lorem ipsum anahtar sözcükleri ile arama yapıldığında henüz tasarım aşamasında olan çok sayıda site listelenir. Yıllar içinde, bazen kazara, bazen bilinçli olarak (örneğin mizah katılarak), çeşitli sürümleri geliştiril  miştir.',
              ),
              const SizedBox(height: 22),
              title('Size'),
              const SizedBox(height: 12),
              coffeeSizeTileList()
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 110,
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 20,
        ),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
          border: Border(
            top: BorderSide(color: AppColors.seashell),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Price',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.starDust,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  r'$ 4.53',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.orangeSalmon,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
            const SizedBox(width: 45),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.orangeSalmon,
                  elevation: 0,
                  minimumSize: const Size(0, 55),
                  maximumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {
                  AppNavigator.instance.go(const OrderPage());
                },
                child: Text(
                  'Buy Now',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  GridView coffeeSizeTileList() {
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

  Text title(String text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.thunder,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
    );
  }

  Container coffeeImage() {
    return Container(
      height: 226,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Images.coffee.png),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }

  Row coffeeStarPoint(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Cappucino',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.thunder,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              'with Chocolate',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.starDust,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                SvgPicture.asset(
                  AppIcons.star.svg,
                  height: 20,
                ),
                const SizedBox(width: 4),
                RichText(
                  text: TextSpan(
                      text: '4.8',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: AppColors.thunder, fontSize: 16, fontWeight: FontWeight.w600, shadows: [
                        Shadow(
                          blurRadius: 4,
                          color: Colors.black.withOpacity(.25),
                          offset: const Offset(0, 4),
                        )
                      ]),
                      children: [
                        TextSpan(
                          text: ' (230)',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: AppColors.granite,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                        )
                      ]),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            Container(
              width: 44,
              height: 44,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.forgotMeNot,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Image.asset(
                Images.bean.png,
                height: 24,
              ),
            ),
            const SizedBox(width: 15),
            Container(
              width: 44,
              height: 44,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.forgotMeNot,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Image.asset(
                Images.milk.png,
                height: 24,
              ),
            ),
          ],
        ),
      ],
    );
  }

  SafeArea appBarr(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(AppIcons.arrowLeft.svg),
            Text(
              'Detail',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.thunder,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            SvgPicture.asset(AppIcons.lightHeart.svg),
          ],
        ),
      ),
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

class ReadMoreText extends StatefulWidget {
  final String text;
  final String readMoreText;
  final String showLessText;
  final TextStyle textStyle;
  final TextStyle readMoreStyle;

  final int trimLines;

  const ReadMoreText({
    super.key,
    required this.text,
    required this.trimLines,
    required this.readMoreText,
    required this.showLessText,
    required this.textStyle,
    required this.readMoreStyle,
  });

  @override
  ReadMoreTextState createState() => ReadMoreTextState();
}

class ReadMoreTextState extends State<ReadMoreText> {
  bool _readMore = true;

  @override
  Widget build(BuildContext context) {
    final text = widget.text;
    TextSpan link = TextSpan(
      text: _readMore ? widget.readMoreText : widget.showLessText,
      style: widget.readMoreStyle,
      recognizer: TapGestureRecognizer()
        ..onTap = () {
          setState(() {
            _readMore = !_readMore;
          });
        },
    );
    var ellipsis = '... ';
    return LayoutBuilder(
      builder: (context, size) {
        final TextSpan textSpan = TextSpan(
          text: text,
          style: widget.textStyle,
        );

        final TextPainter textPainter = TextPainter(
          text: textSpan,
          maxLines: _readMore ? widget.trimLines : null,
          textDirection: TextDirection.ltr,
        )..layout(minWidth: size.minWidth, maxWidth: size.maxWidth);

        final cutoffOffset = textPainter
            .getPositionForOffset(Offset(size.maxWidth, textPainter.preferredLineHeight * widget.trimLines))
            .offset;

        // Adjust the cutoff point to ensure it doesn't split words
        String truncatedText = text.substring(0, cutoffOffset);
        if (truncatedText.contains(" ")) {
          int lastSpaceIndex = truncatedText.lastIndexOf(" ");
          truncatedText = truncatedText.substring(0, lastSpaceIndex - (widget.readMoreText.length + ellipsis.length));
        }

        // Create text spans with "Read more" link
        final textWithLink = TextSpan(
          text: _readMore ? truncatedText + ellipsis : text,
          style: widget.textStyle,
          children: <TextSpan>[link],
        );

        return RichText(
          text: textWithLink,
        );
      },
    );
  }
}
