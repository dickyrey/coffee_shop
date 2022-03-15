import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class CoffeeDetailPage extends StatefulWidget {
  const CoffeeDetailPage({Key? key}) : super(key: key);

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
    final theme = Theme.of(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: screen.width,
            height: screen.height / 2,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://i.pinimg.com/564x/73/66/99/73669966e2e099dfd95786ae2eba089c.jpg'),
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
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Cappuccino',
                                  style: theme.textTheme.headline1,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  'with Chocolate',
                                  style: theme.textTheme.subtitle1,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: theme.cardColor,
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
                                  style: theme.textTheme.bodyText2?.copyWith(
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
                        style: theme.textTheme.headline3,
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
                                          ? theme.primaryColor
                                          : Colors.white,
                                    ),
                                    child: Center(
                                      child: Text(
                                        e,
                                        style:
                                            theme.textTheme.bodyText1?.copyWith(
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
                        style: theme.textTheme.headline3,
                      ),
                      const SizedBox(height: 12),
                      ReadMoreText(
                        'Kapucino is a typical Italian drink made from espresso and milk, but other references also mention that capuccino originated from the coffee beans of the Turkish army left behind after the war led by Kara Mustapha Pasha in Vienna, Austria against the combined Polish-German army.',
                        trimLines: 3,
                        colorClickableText: theme.primaryColor,
                        trimMode: TrimMode.Line,
                        style: theme.textTheme.subtitle1,
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
                              'Add to cart -- \$4.99',
                              style: theme.textTheme.button,
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: theme.primaryColor,
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
