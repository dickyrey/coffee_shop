import 'package:coffee_shop/coffee.dart';
import 'package:coffee_shop/constants.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class CoffeeDetailPage extends StatefulWidget {
  final Coffee coffee;
  const CoffeeDetailPage({Key? key, required this.coffee}) : super(key: key);

  @override
  State<CoffeeDetailPage> createState() => _CoffeeDetailPageState();
}

class _CoffeeDetailPageState extends State<CoffeeDetailPage> {
  String _selectedSize = 'Small';
  final List<String> _coffeeSize = [
    'Small',
    'Medium',
    'Large',
  ];

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: screen.width,
            height: screen.height / 2,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.coffee.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 18,
            left: 18,
            child: SafeArea(
              child: InkWell(
                onTap: () => Navigator.of(context).pop(),
                child: const CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.55,
            minChildSize: 0.55,
            maxChildSize: 0.8,
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 15,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              widget.coffee.name,
                              style: kHeadline1Style,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: kCardColor,
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.white,
                                  size: 15,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  '4.7',
                                  style: kBodyText2Style.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 15),
                      Text(
                        'Coffee Size',
                        style: kHeadline3Style,
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: _coffeeSize
                            .map(
                              (e) => Expanded(
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(15),
                                  onTap: () {
                                    setState(() {
                                      _selectedSize = e;
                                    });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      right: e == _coffeeSize.last ? 0 : 12,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: (_selectedSize == e)
                                          ? kPrimaryColor
                                          : Colors.white,
                                    ),
                                    child: Center(
                                      child: Text(
                                        e,
                                        style: kBodyText1Style.copyWith(
                                          color: (_selectedSize == e)
                                              ? Colors.white
                                              : null,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        'About',
                        style: kHeadline3Style,
                      ),
                      const SizedBox(height: 12),
                      ReadMoreText(
                        widget.coffee.description,
                        trimLines: 3,
                        colorClickableText: kPrimaryColor,
                        trimMode: TrimMode.Line,
                        style: ksubtitle1Style,
                        trimCollapsedText: '...Expand',
                        trimExpandedText: ' Collapse ',
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        width: screen.width,
                        height: 45,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'Add to cart - \$${widget.coffee.price}',
                              style: kButtonStyle,
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: kPrimaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
