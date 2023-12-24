import 'package:flutter/material.dart';
// import 'package:psite/home.dart';
import 'package:psite/portfolio_scroll.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const ExampleStaggerAnimation(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ExampleStaggerAnimation extends StatefulWidget {
  const ExampleStaggerAnimation({
    super.key,
  });

  @override
  State<ExampleStaggerAnimation> createState() =>
      _ExampleStaggeredAnimationState();
}

class _ExampleStaggeredAnimationState extends State<ExampleStaggerAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _drawerSlideController;

  @override
  void initState() {
    super.initState();

    _drawerSlideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
  }

  @override
  void dispose() {
    _drawerSlideController.dispose();
    super.dispose();
  }

  bool _isDrawerOpen() {
    return _drawerSlideController.value == 1.0;
  }

  bool _isDrawerOpening() {
    return _drawerSlideController.status == AnimationStatus.forward;
  }

  bool _isDrawerClosed() {
    return _drawerSlideController.value == 0.0;
  }

  void _toggleDrawer() {
    if (_isDrawerOpen() || _isDrawerOpening()) {
      _drawerSlideController.reverse();
    } else {
      _drawerSlideController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: _buildAppBar(),
        body: Stack(
          children: [
            const PortfolioPage(),
            _buildContent(),
            _buildDrawer(),
          ],
        ));
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
        title: const Text(
          'Welcome',
          style: TextStyle(
            color: Colors.indigo,
          ),
        ),
        backgroundColor: Colors.indigo,
        elevation: 0.5,
        automaticallyImplyLeading: false,
        actions: [
          AnimatedBuilder(
              animation: _drawerSlideController,
              builder: (context, child) {
                return IconButton(
                    onPressed: _toggleDrawer,
                    icon: _isDrawerOpen() || _isDrawerOpening()
                        ? const Icon(
                            Icons.clear,
                            color: Colors.white,
                          )
                        : const Icon(
                            Icons.menu,
                            color: Colors.white,
                          ));
              })
        ]);
  }

  Widget _buildContent() {
    return const SizedBox();
  }

  Widget _buildDrawer() {
    return AnimatedBuilder(
        animation: _drawerSlideController,
        builder: (context, child) {
          return FractionalTranslation(
            translation: Offset(1.0 - _drawerSlideController.value, 0.0),
            child: _isDrawerClosed() ? const SizedBox() : const Menu(),
          );
        });
  }
}

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> with SingleTickerProviderStateMixin {
  static const _menuTitles = ['About Me', 'Hello 2', 'Hello 3'];

  static const _initialDelayTime = Duration(milliseconds: 50);
  static const _itemsSlideTime = Duration(milliseconds: 250);
  static const _staggerTime = Duration(milliseconds: 50);
  static const _buttonDelayTime = Duration(milliseconds: 150);
  static const _buttonTime = Duration(milliseconds: 500);
  final _animationDuration = _initialDelayTime +
      (_staggerTime * _menuTitles.length) +
      _buttonDelayTime +
      _buttonTime;

  late AnimationController _staggeredController;
  final List<Interval> _itemSlideIntervals = [];
  late Interval _buttonInterval;

  @override
  void initState() {
    super.initState();

    _createAnimationIntervals();

    _staggeredController = AnimationController(
      vsync: this,
      duration: _animationDuration,
    )..forward();
  }

  void _createAnimationIntervals() {
    for (var i = 0; i < _menuTitles.length; ++i) {
      final startTime = _initialDelayTime + (_staggerTime * i);
      final endTime = startTime + _itemsSlideTime;
      _itemSlideIntervals.add(Interval(
        startTime.inMilliseconds / _animationDuration.inMilliseconds,
        endTime.inMilliseconds / _animationDuration.inMilliseconds,
      ));
    }
    final buttonStartTime =
        Duration(milliseconds: (_menuTitles.length * 50)) + _buttonDelayTime;
    final buttonEndTime = buttonStartTime + _buttonTime;
    _buttonInterval = Interval(
      buttonStartTime.inMilliseconds / _animationDuration.inMilliseconds,
      buttonEndTime.inMilliseconds / _animationDuration.inMilliseconds,
    );
  }

  @override
  void dispose() {
    _staggeredController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(fit: StackFit.expand, children: [
        _buildFlutterLogo(),
        _buildContent(),
      ]),
    );
  }

  Widget _buildFlutterLogo() {
    return const Positioned(
        right: -100,
        bottom: -30,
        child: Opacity(
            opacity: 0.2,
            child: FlutterLogo(
              size: 400,
            )));
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        ..._buildListItems(),
        const Spacer(),
        _buildGetStartedButton(),
      ],
    );
  }

  List<Widget> _buildListItems() {
    final listItems = <Widget>[];
    for (var i = 0; i < _menuTitles.length; ++i) {
      listItems.add(
        AnimatedBuilder(
          animation: _staggeredController,
          builder: (context, child) {
            final animationPercent = Curves.easeOut.transform(
              _itemSlideIntervals[i].transform(_staggeredController.value),
            );
            final opacity = animationPercent;
            final slideDistance = (1.0 - animationPercent) * 150;

            return Opacity(
              opacity: opacity,
              child: Transform.translate(
                offset: Offset(slideDistance, 0),
                child: child,
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 16),
            child: Text(
              _menuTitles[i],
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      );
    }
    return listItems;
  }

  Widget _buildGetStartedButton() {
    return SizedBox(
        width: double.infinity,
        child: Padding(
            padding: const EdgeInsets.all(24),
            child: AnimatedBuilder(
                animation: _staggeredController,
                builder: (context, child) {
                  final animationPercent = Curves.elasticOut.transform(
                      _buttonInterval.transform(_staggeredController.value));
                  final opacity = animationPercent.clamp(0.0, 1.0);
                  final scale = (animationPercent * 0.5) + 0.5;

                  return Opacity(
                    opacity: opacity,
                    child: Transform.scale(
                      scale: scale,
                      child: child,
                    ),
                  );
                },
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      backgroundColor: Colors.indigo,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 48, vertical: 14),
                    ),
                    onPressed: () {},
                    child: const Text('Get in Touch',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                        ))))));
  }
}
