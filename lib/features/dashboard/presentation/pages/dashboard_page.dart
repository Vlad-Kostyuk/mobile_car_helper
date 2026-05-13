import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../shared/theme/app_colors.dart';
import '../../../../shared/widgets/app_drawer.dart';
import '../../../auth/presentation/auth_cubit.dart';
import '../../../profile/presentation/model/profile_view_model.dart';
import '../../../profile/presentation/profile_cubit.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  late final ProfileCubit _profileCubit;

  @override
  void initState() {
    super.initState();
    _profileCubit = GetIt.I<ProfileCubit>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final user = context.read<AuthCubit>().state.user;
      if (user != null) {
        _profileCubit.load(user.id, fallback: user);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _profileCubit,
      child: Builder(
        builder: (ctx) => Scaffold(
          key: _scaffoldKey,
          backgroundColor: AppColors.pageBackground,
          drawer: const AppDrawer(),
          appBar: _buildAppBar(ctx),
          body: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 24, 20, 120),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                _VehicleCard(),
                SizedBox(height: 24),
                _ActionButtons(),
                SizedBox(height: 24),
                _MetricsSection(),
                SizedBox(height: 24),
                _CarHealthSection(),
                SizedBox(height: 24),
                _ServiceHistorySection(),
              ],
            ),
          ),
          floatingActionButton: _buildFab(),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          bottomNavigationBar: const _BottomNavBar(),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(64),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(color: AppColors.borderLighter, width: 1),
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x0D000000),
              blurRadius: 1,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => _scaffoldKey.currentState?.openDrawer(),
                  child: const Icon(Icons.menu, size: 22, color: AppColors.cardDark),
                ),
                const SizedBox(width: 16),
                Text(
                  'Статус автомобіля',
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: AppColors.textHeader,
                    letterSpacing: -0.45,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () => _scaffoldKey.currentState?.openDrawer(),
                  child: BlocBuilder<ProfileCubit, ProfileViewModel>(
                    builder: (_, state) => AppBarAvatar(profile: state),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFab() {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        color: AppColors.cardDark,
        shape: BoxShape.circle,
        boxShadow: const [
          BoxShadow(
            color: Color(0x40000000),
            blurRadius: 50,
            offset: Offset(0, 25),
          ),
        ],
      ),
      child: const Icon(Icons.add, color: Colors.white, size: 24),
    );
  }
}

// ─── Vehicle card ────────────────────────────────────────────────────────────

class _VehicleCard extends StatelessWidget {
  const _VehicleCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.cardDark,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A000000),
            blurRadius: 15,
            offset: Offset(0, 10),
          ),
          BoxShadow(
            color: Color(0x1A000000),
            blurRadius: 6,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'ОБРАНИЙ АВТОМОБІЛЬ',
            style: GoogleFonts.inter(
              fontSize: 12,
              color: AppColors.textOnDark.withValues(alpha: 0.8),
              letterSpacing: 0.3,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Tesla Model 3',
            style: GoogleFonts.manrope(
              fontWeight: FontWeight.w800,
              fontSize: 28,
              color: Colors.white,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.directions_car_outlined, size: 14, color: AppColors.textSubtleOnDark),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  'Сріблястий металік • 2023 • Синхронізовано',
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    color: AppColors.textSubtleOnDark,
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─── Action buttons ───────────────────────────────────────────────────────────

class _ActionButtons extends StatelessWidget {
  const _ActionButtons();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _ActionButton(
            label: 'ДОДАТИ СЕРВІС',
            icon: Icons.add_circle_outline,
            isPrimary: true,
            onTap: () {},
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _ActionButton(
            label: 'ЗАПИСАТИ РОБОТУ',
            icon: Icons.assignment_outlined,
            isPrimary: false,
            onTap: () {},
          ),
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.label,
    required this.icon,
    required this.isPrimary,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final bool isPrimary;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          color: isPrimary ? AppColors.cardDark : const Color(0xFFE4E2E4),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isPrimary ? AppColors.cardDark : AppColors.borderLight,
          ),
          boxShadow: isPrimary
              ? const [
                  BoxShadow(
                    color: Color(0x1A000000),
                    blurRadius: 6,
                    offset: Offset(0, 4),
                  ),
                ]
              : const [
                  BoxShadow(
                    color: Color(0x0D000000),
                    blurRadius: 1,
                    offset: Offset(0, 1),
                  ),
                ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 20,
              color: isPrimary ? Colors.white : AppColors.cardDark,
            ),
            const SizedBox(height: 6),
            Text(
              label,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: isPrimary ? 13 : 10,
                color: isPrimary ? Colors.white : AppColors.cardDark,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Metrics section ──────────────────────────────────────────────────────────

class _MetricsSection extends StatelessWidget {
  const _MetricsSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _MileageCard(),
        const SizedBox(height: 16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Expanded(
              child: _MaintenanceCard(
                icon: Icons.oil_barrel_outlined,
                title: 'ЗАМІНА\nМАСТИЛА',
                value: '500',
                unit: 'км',
                badge: 'СКОРО ТЕРМІН',
                isUrgent: true,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: _MaintenanceCard(
                icon: Icons.sync_rounded,
                title: 'РОТАЦІЯ ШИН',
                value: '2,140',
                unit: 'км',
                badge: 'ПЛАНОВО',
                isUrgent: false,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _MileageCard extends StatelessWidget {
  const _MileageCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.borderLight),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D000000),
            blurRadius: 1,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.speed_rounded, size: 20, color: AppColors.textSecondary),
                  const SizedBox(width: 8),
                  Text(
                    'ПОТОЧНИЙ ПРОБІГ',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '24,582 ',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w700,
                        fontSize: 22,
                        color: AppColors.cardDark,
                      ),
                    ),
                    TextSpan(
                      text: 'км',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: AppColors.cardDark,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(99),
            child: LinearProgressIndicator(
              value: 0.75,
              minHeight: 8,
              backgroundColor: AppColors.surfaceMuted,
              valueColor: const AlwaysStoppedAnimation<Color>(AppColors.cardDark),
            ),
          ),
        ],
      ),
    );
  }
}

class _MaintenanceCard extends StatelessWidget {
  const _MaintenanceCard({
    required this.icon,
    required this.title,
    required this.value,
    required this.unit,
    required this.badge,
    required this.isUrgent,
  });

  final IconData icon;
  final String title;
  final String value;
  final String unit;
  final String badge;
  final bool isUrgent;

  @override
  Widget build(BuildContext context) {
    final accentColor = isUrgent ? AppColors.urgentRed : AppColors.surfaceMuted;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.borderLight),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D000000),
            blurRadius: 1,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(7),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(width: 4, color: accentColor),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 17, 17, 17),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(icon, size: 18, color: AppColors.textPrimary),
                      const SizedBox(height: 8),
                      Text(
                        title,
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: AppColors.textPrimary,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 8),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: value,
                              style: GoogleFonts.manrope(
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            TextSpan(
                              text: ' $unit',
                              style: GoogleFonts.manrope(
                                fontSize: 13,
                                color: AppColors.textPrimary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: isUrgent ? AppColors.urgentRedBg : AppColors.surfaceMuted,
                          borderRadius: BorderRadius.circular(99),
                        ),
                        child: Text(
                          badge,
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w700,
                            fontSize: 10,
                            color: isUrgent ? AppColors.urgentRed : AppColors.textSecondary,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Car health section ───────────────────────────────────────────────────────

class _CarHealthSection extends StatelessWidget {
  const _CarHealthSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4),
          child: Text(
            'Стан автомобіля',
            style: GoogleFonts.manrope(
              fontWeight: FontWeight.w700,
              fontSize: 22,
              color: AppColors.textPrimary,
            ),
          ),
        ),
        const SizedBox(height: 16),
        const _HealthCard(
          icon: Icons.settings_suggest_rounded,
          title: 'Силова установка',
          subtitle: 'Працює оптимально',
          status: _HealthStatus.ok,
        ),
        const SizedBox(height: 16),
        const _HealthCard(
          icon: Icons.disc_full_rounded,
          title: 'Гальмівні колодки',
          subtitle: 'Залишилося 65%',
          status: _HealthStatus.warning,
        ),
        const SizedBox(height: 16),
        const _HealthCard(
          icon: Icons.battery_charging_full_rounded,
          title: 'Стан батареї',
          subtitle: "98% ЗОЗ (Здоров'я)",
          status: _HealthStatus.ok,
        ),
      ],
    );
  }
}

enum _HealthStatus { ok, warning, urgent }

class _HealthCard extends StatelessWidget {
  const _HealthCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.status,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final _HealthStatus status;

  Color get _dotColor => switch (status) {
        _HealthStatus.ok => AppColors.statusGreen,
        _HealthStatus.warning => AppColors.statusYellow,
        _HealthStatus.urgent => AppColors.urgentRed,
      };

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.borderLight),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D000000),
            blurRadius: 1,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.iconBg,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, size: 22, color: AppColors.cardDark),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: _dotColor,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: _dotColor.withValues(alpha: 0.5),
                  blurRadius: 8,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Service history section ──────────────────────────────────────────────────

class _ServiceHistorySection extends StatelessWidget {
  const _ServiceHistorySection();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: AppColors.surfaceSection,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'ОСТАННІ СЕРВІСИ',
                style: GoogleFonts.inter(
                  fontSize: 13,
                  color: AppColors.textSecondary,
                  letterSpacing: 0.3,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'ПЕРЕГЛЯНУТИ ВСЕ',
                  style: GoogleFonts.inter(
                    fontSize: 11,
                    color: AppColors.cardDark,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const _ServiceItem(
            icon: Icons.filter_alt_outlined,
            title: 'Салонний фільтр',
            subtitle: 'Планове обслуговування',
            date: '15 Жовт 2023',
            isDone: true,
            hasDivider: true,
          ),
          const _ServiceItem(
            icon: Icons.auto_fix_high_rounded,
            title: 'Детейлінг та віск',
            subtitle: 'Повний комплекс',
            date: '02 Вер 2023',
            isDone: true,
            hasDivider: false,
          ),
        ],
      ),
    );
  }
}

class _ServiceItem extends StatelessWidget {
  const _ServiceItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.date,
    required this.isDone,
    required this.hasDivider,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final String date;
  final bool isDone;
  final bool hasDivider;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: hasDivider
          ? BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppColors.borderLight.withValues(alpha: 0.3),
                ),
              ),
            )
          : null,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: AppColors.textSecondary),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                date,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 4),
              if (isDone)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: AppColors.badgeGreenBg,
                    borderRadius: BorderRadius.circular(99),
                  ),
                  child: Text(
                    'ВИКОНАНО',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700,
                      fontSize: 10,
                      color: AppColors.badgeGreenText,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─── Bottom navigation bar ────────────────────────────────────────────────────

class _BottomNavBar extends StatelessWidget {
  const _BottomNavBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.9),
        border: Border(
          top: BorderSide(color: AppColors.borderLighter, width: 1),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D000000),
            blurRadius: 10,
            offset: Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 12, 8, 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              _NavItem(icon: Icons.directions_car_rounded, label: 'СТАТУС', isActive: true),
              _NavItem(icon: Icons.calendar_today_rounded, label: 'КАЛЕНДАР', isActive: false),
              _NavItem(icon: Icons.build_rounded, label: 'СЕРВІСИ', isActive: false),
              _NavItem(icon: Icons.notifications_outlined, label: 'СПОВІЩЕННЯ', isActive: false),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.label,
    required this.isActive,
  });

  final IconData icon;
  final String label;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: isActive
          ? BoxDecoration(
              color: AppColors.surfaceLight,
              borderRadius: BorderRadius.circular(8),
            )
          : null,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 20,
            color: isActive ? AppColors.cardDark : AppColors.textInactive,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: GoogleFonts.manrope(
              fontWeight: FontWeight.w700,
              fontSize: 10,
              color: isActive ? AppColors.cardDark : AppColors.textInactive,
              letterSpacing: 0.55,
            ),
          ),
        ],
      ),
    );
  }
}
