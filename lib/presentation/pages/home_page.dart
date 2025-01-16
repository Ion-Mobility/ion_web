import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ion_web/common/extensions/context_extension.dart';
import 'package:ion_web/presentation/providers/home_video_provider.dart';
import 'package:ion_web/presentation/widgets/hover_text_button.dart';
import 'package:video_player/video_player.dart';

import '../../common/consts/dimension.dart';
import '../providers/home_scroll_provider.dart';
import '../widgets/section_indicators.dart';

class HomePage extends ConsumerWidget {
  static const routeName = '/home';

  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollProvider = ref.watch<HomeScrollProvider>(
      homeScrollProvider(
        MediaQuery.of(context).size.height,
      ),
    );

    final videoProvider = ref.watch(
      homeVideoProvider,
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(double.maxFinite, 104),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Dimension.xxl,
            vertical: Dimension.l,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.network(
                'https://ionmobility.com/images/navigation/ion_logo_white.svg',
                height: 26.66,
                width: 250,
                colorFilter: ColorFilter.mode(
                  Colors.white,
                  BlendMode.clear,
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  spacing: Dimension.m,
                  children: [
                    OutlinedButton(
                      onPressed: () {},
                      style: context.theme.outlinedButtonTheme.style,
                      child: Text(
                        'Join The Waitlist',
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      color: context.colorScheme.onSurface,
                      icon: Icon(
                        Icons.language,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      color: context.colorScheme.onSurface,
                      icon: Icon(
                        Icons.menu,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: (videoProvider?.value.isInitialized ?? false)
          ? GestureDetector(
              onPanUpdate: (details) {},
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  ListView(
                    physics: scrollProvider.isScrolling.value
                        ? NeverScrollableScrollPhysics()
                        : AlwaysScrollableScrollPhysics(),
                    controller: scrollProvider.controller,
                    scrollDirection: Axis.vertical,
                    padding: EdgeInsets.zero,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: double.maxFinite,
                        child: Stack(
                          children: [
                            SizedBox(
                              width: double.maxFinite,
                              child: AspectRatio(
                                aspectRatio: videoProvider?.value.aspectRatio ??
                                    MediaQuery.of(context).size.aspectRatio,
                                child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: SizedBox(
                                    width: videoProvider?.value.size.width,
                                    height: videoProvider?.value.size.height,
                                    child: (videoProvider != null)
                                        ? VideoPlayer(videoProvider)
                                        : SizedBox.shrink(),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: Dimension.xl + Dimension.m,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: Dimension.xl,
                                children: [
                                  Image.network(
                                    'https://ionmobility.com/_next/image?url=%2Fimages%2Fm1slogo.png&w=384&q=75',
                                    height: 52,
                                    width: 367,
                                  ),
                                  Text(
                                    'REFINING THE ART OF MOBILITY',
                                    style: context.textTheme.displayMedium
                                        ?.copyWith(
                                      color: context.colorScheme.surface,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      HoverTextButton(
                                        label: 'DISCOVER',
                                        onTap: () {},
                                      ),
                                      SizedBox(
                                        height: Dimension.xl,
                                        width: Dimension.xxl,
                                        child: VerticalDivider(
                                          thickness: 1,
                                          width: 10,
                                          indent: 0,
                                          endIndent: 0,
                                          color: context.colorScheme.surface,
                                        ),
                                      ),
                                      HoverTextButton(
                                        label: 'BOOK A TEST RIDE',
                                        onTap: () {},
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: double.maxFinite,
                        child: Stack(
                          children: [
                            Image.asset(
                              'assets/images/backgrounds/m1s-6.png',
                              fit: BoxFit.fitWidth,
                              width: double.maxFinite,
                              height: MediaQuery.of(context).size.height,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: Dimension.xxl,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: Dimension.xl,
                                children: [
                                  Text(
                                    'Feel Electric',
                                    style: context.textTheme.displayMedium
                                        ?.copyWith(
                                      color: context.colorScheme.surface,
                                    ),
                                  ),
                                  Text(
                                    'Electrify your riding experience with the M1-S.\n'
                                    '#madetomove',
                                    style:
                                        context.textTheme.bodyLarge?.copyWith(
                                      color: context.colorScheme.surface,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: double.maxFinite,
                        child: Stack(
                          children: [
                            Image.asset(
                              'assets/images/backgrounds/m1s-2.png',
                              fit: BoxFit.fitWidth,
                              width: double.maxFinite,
                              height: MediaQuery.of(context).size.height,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: Dimension.xxl,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: Dimension.xl,
                                children: [
                                  Text(
                                    'LOOK GOOD, FEEL GOOD',
                                    style: context.textTheme.displayMedium
                                        ?.copyWith(
                                      color: context.colorScheme.surface,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: double.maxFinite,
                        child: Stack(
                          children: [
                            Image.asset(
                              'assets/images/backgrounds/m1s-4.png',
                              fit: BoxFit.fitWidth,
                              width: double.maxFinite,
                              height: MediaQuery.of(context).size.height,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: Dimension.xxl,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: Dimension.xl,
                                children: [
                                  Text(
                                    'BUILD FOR THE CITY.\nMADE FOR THE PLANET.',
                                    style: context.textTheme.displayMedium
                                        ?.copyWith(
                                      color: context.colorScheme.surface,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(
                          Dimension.xl + Dimension.l,
                        ),
                        height: MediaQuery.of(context).size.height,
                        width: double.maxFinite,
                        color: Colors.white,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Latest news',
                                  style:
                                      context.textTheme.displaySmall?.copyWith(
                                    color: context.colorScheme.onSurface,
                                  ),
                                ),
                                Text('VIEW MORE'),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 700,
                                  child: ListView.separated(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    separatorBuilder: (context, index) =>
                                        Divider(),
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: Dimension.l,
                                        ),
                                        child: Column(
                                          spacing: Dimension.m,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Thursday, February 2 2023',
                                            ),
                                            Text(
                                              'ION Mobility closes US\$18.7m in Series A funding',
                                            ),
                                            Text(
                                              'Brings TVS Motor Company on board as strategic investor for ecosystem support and mutual development opportunities',
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    itemCount: 4,
                                  ),
                                ),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: Dimension.l + Dimension.xs,
                                  ),
                                  child: Image.network(
                                    'https://ionmobility.com/images/latest-news/default_latest_news_img.jpg',
                                    height: 600,
                                    width: 416,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: double.maxFinite,
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(
                                Dimension.xl + Dimension.l,
                              ),
                              color: Colors.grey[800],
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      'Subscribe to learn about our latest news, updates and adventures.',
                                      style: context.textTheme.displaySmall,
                                    ),
                                  ),
                                  Flexible(
                                    flex: 2,
                                    child: Container(
                                      padding: EdgeInsets.only(
                                        left: Dimension.xl + Dimension.l,
                                      ),
                                      width: 500,
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          border: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  context.colorScheme.surface,
                                            ),
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  context.colorScheme.surface,
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  context.colorScheme.surface,
                                            ),
                                          ),
                                          hintText: 'Enter your email*',
                                          hintStyle: context.textTheme.bodyLarge
                                              ?.copyWith(
                                            color: context.colorScheme.surface,
                                          ),
                                          suffixIcon: Icon(
                                            Icons.arrow_right_alt,
                                            color: context.colorScheme.surface,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: double.maxFinite,
                              padding: EdgeInsets.all(
                                Dimension.xl + Dimension.l,
                              ),
                              color: Colors.grey[900],
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset(
                                        'assets/images/icons/ion_logo_white.png',
                                        width: 225,
                                        height: 24,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        spacing: Dimension.xl + Dimension.xl,
                                        children: [
                                          Text(
                                            'M1-S',
                                            style: context.textTheme.titleLarge
                                                ?.copyWith(
                                              color:
                                                  context.colorScheme.surface,
                                            ),
                                          ),
                                          Column(
                                            spacing: Dimension.m + Dimension.m,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Home',
                                                style: context
                                                    .textTheme.titleLarge
                                                    ?.copyWith(
                                                  color: context
                                                      .colorScheme.surface,
                                                ),
                                              ),
                                              Text(
                                                'About Us',
                                                style: context
                                                    .textTheme.titleLarge
                                                    ?.copyWith(
                                                  color: context
                                                      .colorScheme.surface,
                                                ),
                                              ),
                                              Text(
                                                'Blog',
                                                style: context
                                                    .textTheme.titleLarge
                                                    ?.copyWith(
                                                  color: context
                                                      .colorScheme.surface,
                                                ),
                                              ),
                                              Text(
                                                'News',
                                                style: context
                                                    .textTheme.titleLarge
                                                    ?.copyWith(
                                                  color: context
                                                      .colorScheme.surface,
                                                ),
                                              ),
                                              Text(
                                                'Media Kit',
                                                style: context
                                                    .textTheme.titleLarge
                                                    ?.copyWith(
                                                  color: context
                                                      .colorScheme.surface,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            spacing: Dimension.m,
                                            children: [
                                              Text(
                                                'Contact Us',
                                                style: context
                                                    .textTheme.titleLarge
                                                    ?.copyWith(
                                                  color: context
                                                      .colorScheme.surface,
                                                ),
                                              ),
                                              Text(
                                                'hello@ionmobility.com',
                                                style: context
                                                    .textTheme.bodyLarge
                                                    ?.copyWith(
                                                  color: context
                                                      .colorScheme.surface,
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                spacing: Dimension.xl,
                                                children: [
                                                  Icon(
                                                    Icons.facebook,
                                                    color: context
                                                        .colorScheme.surface,
                                                  ),
                                                  Icon(
                                                    Icons.facebook,
                                                    color: context
                                                        .colorScheme.surface,
                                                  ),
                                                  Icon(
                                                    Icons.facebook,
                                                    color: context
                                                        .colorScheme.surface,
                                                  ),
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  ListenableBuilder(
                    listenable: scrollProvider.controller,
                    builder: (ctx, child) {
                      final height = MediaQuery.of(context).size.height;
                      final offset = scrollProvider.controller.offset;
                      final page = (offset / height).round();
                      return SectionIndicators(
                        index: page,
                        selectedPage: page,
                        activeColor: context.colorScheme.primary,
                      );
                    },
                  )
                ],
              ),
            )
          : Container(),
    );
  }
}
