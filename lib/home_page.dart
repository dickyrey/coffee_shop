import 'package:coffee_shop/category.dart';
import 'package:coffee_shop/coffee_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(
                        'https://i.pinimg.com/564x/36/2d/40/362d4083943521caa39a18de0e962f19.jpg'),
                  ),
                  Row(
                    children: [
                      Icon(
                        IconlyBold.location,
                        color: theme.primaryColor,
                      ),
                      const SizedBox(width: 5),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'New York, ',
                              style: theme.textTheme.headline4,
                            ),
                            TextSpan(
                              text: 'USA',
                              style: theme.textTheme.bodyText2,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      IconlyLight.notification,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Text(
                        'Good morning, Alex',
                        style: theme.textTheme.headline2,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      width: double.infinity,
                      height: 50,
                      margin: const EdgeInsets.symmetric(horizontal: 18),
                      decoration: BoxDecoration(
                        color: theme.dividerColor,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(IconlyLight.search),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              style: theme.textTheme.bodyText2,
                              decoration: const InputDecoration(
                                hintText: 'Search Coffee...',
                                enabledBorder: InputBorder.none,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundColor: theme.cardColor,
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(IconlyLight.filter),
                                color: Colors.white,
                                iconSize: 17,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Text(
                        'Categories',
                        style: theme.textTheme.headline3,
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: ListView.builder(
                        itemCount: allCategory.length,
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        itemBuilder: (context, index) {
                          final category = allCategory[index];
                          return Container(
                            margin: const EdgeInsets.only(right: 15),
                            height: 45,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  category.icon,
                                  width: 25,
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  category.name,
                                  style: theme.textTheme.bodyText2,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Text(
                        'Popular this week',
                        style: theme.textTheme.headline3,
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      height: 250,
                      child: ListView.builder(
                        itemCount: 5,
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CoffeeDetailPage(),
                              ),
                            ),
                            child: Container(
                              width: 150,
                              margin: const EdgeInsets.only(right: 15),
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 150,
                                    height: 135,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.white,
                                      image: const DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                          'https://i.pinimg.com/564x/73/66/99/73669966e2e099dfd95786ae2eba089c.jpg',
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    'Cuppa Coffee',
                                    style: theme.textTheme.headline4,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'with Chocolate',
                                    style: theme.textTheme.subtitle2,
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      RichText(
                                        text: TextSpan(children: [
                                          TextSpan(
                                              text: '\$',
                                              style: theme.textTheme.subtitle1),
                                          TextSpan(
                                              text: ' 5.12',
                                              style: theme.textTheme.bodyText2),
                                        ]),
                                      ),
                                      CircleAvatar(
                                        radius: 15,
                                        backgroundColor: theme.primaryColor,
                                        child: const Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Text(
                        'Special Offer🔥',
                        style: theme.textTheme.headline3,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ListView.builder(
                      itemCount: 3,
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CoffeeDetailPage(),
                            ),
                          ),
                          child: Container(
                            margin: const EdgeInsets.fromLTRB(18, 0, 18, 15),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                            ),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    'https://i.pinimg.com/564x/40/b2/3f/40b23f1f176c4ff0a562a01845ad5f97.jpg',
                                    width: 80,
                                    height: 80,
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 2,
                                        ),
                                        decoration: BoxDecoration(
                                          color: theme.cardColor,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Text(
                                          'Discount Sales',
                                          style: theme.textTheme.subtitle2
                                              ?.copyWith(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        'Get three ice flavoured cappuccinos for only \$5.12',
                                        style: theme.textTheme.headline4,
                                      ),
                                    ],
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
