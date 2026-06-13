import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pocky/constants/app_spacing.dart';
import 'package:pocky/presentation/pachin_navi/pages/pachin_navi_home_page.dart';

class PachinatorPage extends StatelessWidget {
  const PachinatorPage({super.key});

  static const routeName = 'pachinator';
  static const routePath = '/pachinator';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.goNamed(PachinNaviHomePage.routeName),
          tooltip: 'Back home',
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text('Private circle'),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.md,
            AppSpacing.sm,
            AppSpacing.md,
            AppSpacing.lg,
          ),
          children: const [
            _CircleHealthCard(),
            SizedBox(height: AppSpacing.md),
            _InviteCard(),
            SizedBox(height: AppSpacing.lg),
            _MemberTile(
              name: 'Linh',
              status: 'Dinner moment posted 12m ago',
              amount: 'Owes you 210,000d',
              color: Color(0xFF06D6A0),
            ),
            _MemberTile(
              name: 'An',
              status: 'Coffee receipt pending',
              amount: 'You owe 45,000d',
              color: Color(0xFFEF476F),
            ),
            _MemberTile(
              name: 'Minh',
              status: 'Rent settled',
              amount: 'All square',
              color: Color(0xFF118AB2),
            ),
          ],
        ),
      ),
    );
  }
}

class _CircleHealthCard extends StatelessWidget {
  const _CircleHealthCard();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF14213D),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.verified_user_outlined, color: Colors.white),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: Text(
                    'Circle privacy',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            const Text(
              'Only approved friends can see moments, receipts, balances, and settle-up notes.',
              style: TextStyle(color: Colors.white, height: 1.4),
            ),
            const SizedBox(height: AppSpacing.md),
            Wrap(
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.sm,
              children: const [
                _PrivacyChip(label: '4 members'),
                _PrivacyChip(label: 'No public profile'),
                _PrivacyChip(label: 'Receipts hidden by default'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _PrivacyChip extends StatelessWidget {
  const _PrivacyChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      labelStyle: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      backgroundColor: Colors.white.withValues(alpha: 0.14),
      side: BorderSide(color: Colors.white.withValues(alpha: 0.18)),
    );
  }
}

class _InviteCard extends StatelessWidget {
  const _InviteCard();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Row(
          children: [
            const CircleAvatar(
              backgroundColor: Color(0xFFFFC857),
              foregroundColor: Color(0xFF14213D),
              child: Icon(Icons.person_add_alt_1),
            ),
            const SizedBox(width: AppSpacing.md),
            const Expanded(
              child: Text(
                'Invite a close friend and start a shared wallet together.',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
            IconButton.filled(
              onPressed: () {},
              tooltip: 'Invite friend',
              icon: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}

class _MemberTile extends StatelessWidget {
  const _MemberTile({
    required this.name,
    required this.status,
    required this.amount,
    required this.color,
  });

  final String name;
  final String status;
  final String amount;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
          child: Text(
            name.characters.first,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.w800)),
        subtitle: Text(status),
        trailing: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 112),
          child: Text(
            amount,
            textAlign: TextAlign.end,
            style: const TextStyle(fontWeight: FontWeight.w800),
          ),
        ),
      ),
    );
  }
}
