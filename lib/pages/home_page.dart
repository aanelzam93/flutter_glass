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
                    settings: const LiquidGlassSettings(
                      thickness: 18,
                      blur: 10,
                    ),
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 100),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Portfolio Stats Cards with Blend Group
                          LiquidGlassBlendGroup(
                            blend: 18.0,
                            child: Column(
                              children: [
                                ...List.generate(_portfolioStats.length, (index) {
                                  final stat = _portfolioStats[index];
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 12),
                                    child: _buildPortfolioCardBlended(
                                      title: stat['title'],
                                      value: stat['value'],
                                      change: stat['change'],
                                      percentage: stat['percentage'],
                                      icon: stat['icon'],
                                    ),
                                  );
                                }),
                              ],
                            ),
                          ),
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
                          // Stock List with Blend Group
                          LiquidGlassBlendGroup(
                            blend: 15.0,
                            child: Column(
                              children: [
                                ...List.generate(_stockItems.length, (index) {
                                  final stock = _stockItems[index];
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 12),
                                    child: _buildStockCardBlended(
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
    return LiquidStretch(
      stretch: 0.2,
      interactionScale: 1.01,
      child: LiquidGlass(
        shape: LiquidRoundedSuperellipse(borderRadius: 20),
        child: GlassGlow(
          glowColor: const Color(0xFF4A5FFF).withOpacity(0.2),
          glowRadius: 1.0,
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
    return LiquidStretch(
      stretch: 0.15,
      interactionScale: 1.008,
      child: LiquidGlass(
        shape: LiquidRoundedSuperellipse(borderRadius: 16),
        child: GlassGlow(
          glowColor: isPositive
              ? const Color(0xFF4ADE80).withOpacity(0.15)
              : const Color(0xFFEF4444).withOpacity(0.15),
          glowRadius: 0.8,
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
        ),
      ),
    );
  }

  Widget _buildPortfolioCardBlended({
    required String title,
    required String value,
    required String change,
    required String percentage,
    required IconData icon,
  }) {
    return LiquidStretch(
      stretch: 0.2,
      interactionScale: 1.01,
      child: LiquidGlass.grouped(
        shape: LiquidRoundedSuperellipse(borderRadius: 20),
        child: GlassGlow(
          glowColor: const Color(0xFF4A5FFF).withOpacity(0.2),
          glowRadius: 1.0,
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
        ),
      ),
    );
  }

  Widget _buildStockCardBlended({
    required String symbol,
    required String name,
    required String price,
    required String change,
    required String percentage,
    required bool isPositive,
  }) {
    return LiquidStretch(
      stretch: 0.15,
      interactionScale: 1.008,
      child: LiquidGlass.grouped(
        shape: LiquidRoundedSuperellipse(borderRadius: 16),
        child: GlassGlow(
          glowColor: isPositive
              ? const Color(0xFF4ADE80).withOpacity(0.15)
              : const Color(0xFFEF4444).withOpacity(0.15),
          glowRadius: 0.8,
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
        ),
      ),
    );
  }

  Widget _buildAppleBottomNav() {
    return Container(
      margin: const EdgeInsets.fromLTRB(24, 0, 24, 24),
      height: 72,
      child: LiquidGlassLayer(
        settings: const LiquidGlassSettings(
          thickness: 20,
          blur: 12,
        ),
        child: LiquidGlassBlendGroup(
          blend: 25.0,
          child: Stack(
            children: [
              // Main navigation bar background
              LiquidStretch(
                stretch: 0.3,
                interactionScale: 1.02,
                child: LiquidGlass.grouped(
                  shape: LiquidRoundedSuperellipse(borderRadius: 24),
                  child: GlassGlow(
                    glowColor: const Color(0xFF4A5FFF).withOpacity(0.3),
                    glowRadius: 1.5,
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
                          _buildNavIconBlended(
                            icon: Icons.home_filled,
                            index: 0,
                          ),
                          _buildNavIconBlended(
                            icon: Icons.trending_up,
                            index: 1,
                          ),
                          _buildNavIconBlended(
                            icon: Icons.explore_outlined,
                            index: 2,
                          ),
                          _buildNavIconBlended(
                            icon: Icons.person_outline,
                            index: 3,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // Active indicator with blended glass
              if (_selectedIndex >= 0)
                Positioned(
                  left: 24 + (_selectedIndex * (MediaQuery.of(context).size.width - 48 - 48) / 4),
                  top: 8,
                  child: LiquidGlass.grouped(
                    shape: LiquidRoundedSuperellipse(borderRadius: 18),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOutCubic,
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        gradient: RadialGradient(
                          colors: [
                            const Color(0xFF4A5FFF).withOpacity(0.4),
                            const Color(0xFF00D4FF).withOpacity(0.2),
                            Colors.transparent,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(18),
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

  Widget _buildNavIconBlended({
    required IconData icon,
    required int index,
  }) {
    final isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedIndex = index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Icon(
          icon,
          color: isSelected ? Colors.white : Colors.white.withOpacity(0.5),
          size: 26,
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
