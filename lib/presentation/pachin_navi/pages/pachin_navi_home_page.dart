import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pocky/constants/app_spacing.dart';
import 'package:pocky/presentation/pachinator/pages/pachinator_page.dart';

class PachinNaviHomePage extends StatelessWidget {
  const PachinNaviHomePage({super.key});

  static const routeName = 'pachin-navi';
  static const routePath = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const _AppTitle(),
        actions: [
          IconButton.filledTonal(
            onPressed: () => context.goNamed(PachinatorPage.routeName),
            tooltip: 'Open private circle',
            icon: const Icon(Icons.group_outlined),
          ),
          const SizedBox(width: AppSpacing.md),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.md,
            AppSpacing.sm,
            AppSpacing.md,
            96,
          ),
          children: const [
            _TodayMomentCard(),
            SizedBox(height: AppSpacing.md),
            _BudgetSummaryCard(),
            SizedBox(height: AppSpacing.md),
            _QuickActions(),
            SizedBox(height: AppSpacing.lg),
            _SectionHeader(title: 'Private circle', action: '4 friends'),
            SizedBox(height: AppSpacing.sm),
            _CircleStrip(),
            SizedBox(height: AppSpacing.lg),
            _SectionHeader(title: 'Shared spending', action: 'This week'),
            SizedBox(height: AppSpacing.sm),
            _TransactionList(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {},
        tooltip: 'Capture moment',
        child: const Icon(Icons.camera_alt_rounded),
      ),
      bottomNavigationBar: const _PockyNavigationBar(),
    );
  }
}

class _AppTitle extends StatelessWidget {
  const _AppTitle();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pocky',
          style: textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w800,
            color: const Color(0xFF14213D),
          ),
        ),
        Text(
          'Private moments, honest money',
          style: textTheme.bodySmall?.copyWith(color: const Color(0xFF697386)),
        ),
      ],
    );
  }
}

class _TodayMomentCard extends StatelessWidget {
  const _TodayMomentCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF143642), Color(0xFF0F8B8D), Color(0xFFFFC857)],
          stops: [0, 0.68, 1],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            right: 18,
            top: 18,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.sm,
                vertical: AppSpacing.xs,
              ),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.18),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.white.withValues(alpha: 0.28)),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.lock_outline, size: 16, color: Colors.white),
                  SizedBox(width: AppSpacing.xs),
                  Text(
                    'Close friends only',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Positioned(
            left: 22,
            bottom: 24,
            right: 22,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tonight with Linh',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: AppSpacing.xs),
                Text(
                  'Dinner photo saved with the split bill attached.',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BudgetSummaryCard extends StatelessWidget {
  const _BudgetSummaryCard();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Group wallet',
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const Icon(Icons.visibility_off_outlined, size: 20),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '2,450,000d',
                  style: textTheme.headlineSmall?.copyWith(
                    color: const Color(0xFF14213D),
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                const Padding(
                  padding: EdgeInsets.only(bottom: 4),
                  child: Text('left this month'),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: const LinearProgressIndicator(
                minHeight: 10,
                value: 0.62,
                backgroundColor: Color(0xFFE7EFEA),
                valueColor: AlwaysStoppedAnimation(Color(0xFF0E7C7B)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _QuickActions extends StatelessWidget {
  const _QuickActions();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: _ActionButton(icon: Icons.add_card_outlined, label: 'Expense'),
        ),
        SizedBox(width: AppSpacing.sm),
        Expanded(
          child: _ActionButton(
            icon: Icons.photo_camera_outlined,
            label: 'Post',
          ),
        ),
        SizedBox(width: AppSpacing.sm),
        Expanded(
          child: _ActionButton(
            icon: Icons.receipt_long_outlined,
            label: 'Split',
          ),
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonalIcon(
      onPressed: () {},
      icon: Icon(icon, size: 20),
      label: Text(label, overflow: TextOverflow.ellipsis),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title, required this.action});

  final String title;
  final String action;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
          ),
        ),
        Text(
          action,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: const Color(0xFF697386),
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _CircleStrip extends StatelessWidget {
  const _CircleStrip();

  static const _friends = [
    ('An', 'Coffee run', Color(0xFFEF476F)),
    ('Minh', 'Paid rent', Color(0xFF118AB2)),
    ('Linh', 'Dinner snap', Color(0xFF06D6A0)),
    ('Bao', 'Movie night', Color(0xFFFFC857)),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 108,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _friends.length,
        separatorBuilder: (_, _) => const SizedBox(width: AppSpacing.sm),
        itemBuilder: (context, index) {
          final friend = _friends[index];

          return SizedBox(
            width: 86,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: friend.$3,
                  child: Text(
                    friend.$1.characters.first,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  friend.$1,
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
                Text(
                  friend.$2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: const Color(0xFF697386),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _TransactionList extends StatelessWidget {
  const _TransactionList();

  static const _items = [
    ('Dinner split', 'Linh added a receipt', '-420,000d', Icons.restaurant),
    ('Coffee fund', 'An paid for everyone', '-180,000d', Icons.coffee),
    ('Movie tickets', 'Bao settled up', '+250,000d', Icons.movie_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          for (final item in _items)
            ListTile(
              leading: CircleAvatar(
                backgroundColor: const Color(0xFFE7EFEA),
                foregroundColor: const Color(0xFF0E7C7B),
                child: Icon(item.$4),
              ),
              title: Text(
                item.$1,
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
              subtitle: Text(item.$2),
              trailing: Text(
                item.$3,
                style: TextStyle(
                  color: item.$3.startsWith('+')
                      ? const Color(0xFF0E7C7B)
                      : const Color(0xFFB23A48),
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _PockyNavigationBar extends StatelessWidget {
  const _PockyNavigationBar();

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: 0,
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.auto_awesome_mosaic_outlined),
          selectedIcon: Icon(Icons.auto_awesome_mosaic),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Icon(Icons.camera_alt_outlined),
          selectedIcon: Icon(Icons.camera_alt),
          label: 'Moments',
        ),
        NavigationDestination(
          icon: Icon(Icons.account_balance_wallet_outlined),
          selectedIcon: Icon(Icons.account_balance_wallet),
          label: 'Wallet',
        ),
      ],
    );
  }
}
