import 'package:flutter/material.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';
import 'login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  Offset? _glassPosition;
  bool _showGlass = false;

  final List<Map<String, dynamic>> _stockItems = [
    {
      'symbol': 'AAPL',
      'name': 'Apple Inc.',
      'price': '\$178.45',
      'change': '+2.34',
      'percentage': '+1.33%',
      'isPositive': true,
    },
    {
      'symbol': 'TSLA',
      'name': 'Tesla Inc.',
      'price': '\$238.72',
      'change': '-5.28',
      'percentage': '-2.16%',
      'isPositive': false,
    },
    {
      'symbol': 'GOOGL',
      'name': 'Alphabet Inc.',
      'price': '\$142.58',
      'change': '+3.87',
      'percentage': '+2.79%',
      'isPositive': true,
    },
    {
      'symbol': 'MSFT',
      'name': 'Microsoft Corp.',
      'price': '\$378.91',
      'change': '+1.45',
      'percentage': '+0.38%',
      'isPositive': true,
    },
  ];

  final List<Map<String, dynamic>> _portfolioStats = [
    {
      'title': 'Portfolio Value',
      'value': '\$124,580',
      'change': '+\$8,240',
      'percentage': '+7.08%',
      'icon': Icons.account_balance_wallet_outlined,
    },
    {
      'title': 'Today\'s Gain',
      'value': '+\$2,458',
      'change': '+1.98%',
      'percentage': '',
      'icon': Icons.trending_up,
    },
  ];

  void _handleLogout() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E27),
      body: Stack(
        children: [
          // Dark background gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF0A0E27),
                  Color(0xFF1A1F3A),
                  Color(0xFF0F1419),
                ],
              ),
            ),
          ),
          // Background decorative circles
          Positioned(
            top: -100,
            right: -100,
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    const Color(0xFF4A5FFF).withOpacity(0.1),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -150,
            left: -150,
            child: Container(
              width: 500,
              height: 500,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    const Color(0xFF00D4FF).withOpacity(0.08),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          // Main content
          SafeArea(
            child: Column(
              children: [
                // Top App Bar
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Portfolio',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.6),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Market Overview',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              letterSpacing: -0.5,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.05),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.1),
                              ),
                            ),
                            child: IconButton(
                              icon: Icon(
                                Icons.notifications_outlined,
                                color: Colors.white.withOpacity(0.8),
                                size: 20,
                              ),
                              onPressed: () {},
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.05),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.1),
                              ),
                            ),
                            child: IconButton(
                              icon: Icon(
                                Icons.logout,
                                color: Colors.white.withOpacity(0.8),
                                size: 20,
                              ),
                              onPressed: _handleLogout,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Main Content
                Expanded(
                  child: LiquidGlassLayer(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 100),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Portfolio Stats Cards
                          ...List.generate(_portfolioStats.length, (index) {
                            final stat = _portfolioStats[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: _buildPortfolioCard(
                                title: stat['title'],
                                value: stat['value'],
                                change: stat['change'],
                                percentage: stat['percentage'],
                                icon: stat['icon'],
                              ),
                            );
                          }),
                          const SizedBox(height: 24),
                          // My Stocks Section
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'My Stocks',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'See All',
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.5),
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          // Stock List
                          ...List.generate(_stockItems.length, (index) {
                            final stock = _stockItems[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: _buildStockCard(
                                symbol: stock['symbol'],
                                name: stock['name'],
                                price: stock['price'],
                                change: stock['change'],
                                percentage: stock['percentage'],
                                isPositive: stock['isPositive'],
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      // Apple-style Bottom Navigation
      bottomNavigationBar: _buildAppleBottomNav(),
    );
  }

  Widget _buildPortfolioCard({
    required String title,
    required String value,
    required String change,
    required String percentage,
    required IconData icon,
  }) {
    return LiquidGlass(
      shape: LiquidRoundedSuperellipse(borderRadius: 20),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white.withOpacity(0.08),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF4A5FFF),
                    Color(0xFF00D4FF),
                  ],
                ),
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF4A5FFF).withOpacity(0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.5,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  change,
                  style: const TextStyle(
                    color: Color(0xFF4ADE80),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (percentage.isNotEmpty)
                  Text(
                    percentage,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 12,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStockCard({
    required String symbol,
    required String name,
    required String price,
    required String change,
    required String percentage,
    required bool isPositive,
  }) {
    return LiquidGlass(
      shape: LiquidRoundedSuperellipse(borderRadius: 16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white.withOpacity(0.05),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            // Stock Icon
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.05),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  symbol[0],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            // Stock Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    symbol,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    name,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            // Price and Change
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  price,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: isPositive
                        ? const Color(0xFF4ADE80).withOpacity(0.15)
                        : const Color(0xFFEF4444).withOpacity(0.15),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        isPositive ? Icons.arrow_upward : Icons.arrow_downward,
                        color: isPositive
                            ? const Color(0xFF4ADE80)
                            : const Color(0xFFEF4444),
                        size: 10,
                      ),
                      const SizedBox(width: 2),
                      Text(
                        percentage,
                        style: TextStyle(
                          color: isPositive
                              ? const Color(0xFF4ADE80)
                              : const Color(0xFFEF4444),
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppleBottomNav() {
    return Container(
      margin: const EdgeInsets.fromLTRB(24, 0, 24, 24),
      height: 72,
      child: GestureDetector(
        onPanStart: (details) {
          setState(() {
            _showGlass = true;
            _glassPosition = details.localPosition;
          });
        },
        onPanUpdate: (details) {
          setState(() {
            _glassPosition = details.localPosition;
          });
        },
        onPanEnd: (details) {
          setState(() {
            _showGlass = false;
          });
        },
        onLongPressStart: (details) {
          setState(() {
            _showGlass = true;
            _glassPosition = details.localPosition;
          });
        },
        onLongPressMoveUpdate: (details) {
          setState(() {
            _glassPosition = details.localPosition;
          });
        },
        onLongPressEnd: (details) {
          setState(() {
            _showGlass = false;
          });
        },
        child: LiquidGlassLayer(
          child: Stack(
            children: [
              // Main navigation bar
              LiquidGlass(
                shape: LiquidRoundedSuperellipse(borderRadius: 24),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white.withOpacity(0.1),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 30,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildNavIcon(
                        icon: Icons.home_filled,
                        isSelected: _selectedIndex == 0,
                        onTap: () => setState(() => _selectedIndex = 0),
                      ),
                      _buildNavIcon(
                        icon: Icons.trending_up,
                        isSelected: _selectedIndex == 1,
                        onTap: () => setState(() => _selectedIndex = 1),
                      ),
                      _buildNavIcon(
                        icon: Icons.explore_outlined,
                        isSelected: _selectedIndex == 2,
                        onTap: () => setState(() => _selectedIndex = 2),
                      ),
                      _buildNavIcon(
                        icon: Icons.person_outline,
                        isSelected: _selectedIndex == 3,
                        onTap: () => setState(() => _selectedIndex = 3),
                      ),
                    ],
                  ),
                ),
              ),
              // Interactive glass blob effect
              if (_showGlass && _glassPosition != null)
                Positioned(
                  left: _glassPosition!.dx - 50,
                  top: _glassPosition!.dy - 50,
                  child: IgnorePointer(
                    child: AnimatedOpacity(
                      opacity: _showGlass ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 100),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // Outer glow
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: RadialGradient(
                                colors: [
                                  const Color(0xFF4A5FFF).withOpacity(0.3),
                                  const Color(0xFF00D4FF).withOpacity(0.15),
                                  Colors.transparent,
                                ],
                                stops: const [0.0, 0.6, 1.0],
                              ),
                            ),
                          ),
                          // Glass blob with blur
                          LiquidGlass(
                            shape: LiquidRoundedSuperellipse(borderRadius: 35),
                            child: Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: RadialGradient(
                                  colors: [
                                    Colors.white.withOpacity(0.3),
                                    Colors.white.withOpacity(0.1),
                                    Colors.transparent,
                                  ],
                                  stops: const [0.0, 0.5, 1.0],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xFF4A5FFF).withOpacity(0.5),
                                    blurRadius: 25,
                                    spreadRadius: 5,
                                  ),
                                  BoxShadow(
                                    color: const Color(0xFF00D4FF).withOpacity(0.3),
                                    blurRadius: 35,
                                    spreadRadius: 10,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavIcon({
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.white.withOpacity(0.15)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Icon(
          icon,
          color: isSelected ? Colors.white : Colors.white.withOpacity(0.5),
          size: 26,
        ),
      ),
    );
  }
}
