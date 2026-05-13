import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:car_helper/features/profile/domain/models/user_profile.dart';
import 'package:car_helper/features/profile/presentation/controllers/profile_view_model.dart';
import 'package:car_helper/features/profile/presentation/controllers/profile_cubit.dart';
import 'package:car_helper/features/settings/presentation/controllers/settings_view_model.dart';
import 'package:car_helper/features/settings/presentation/controllers/settings_cubit.dart';
import 'package:car_helper/shared/ui_kit/app_colors.dart';
import 'package:car_helper/shared/ui_utils/l10n_extension.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBackground,
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<ProfileCubit, ProfileViewModel>(
              builder: (_, profileState) => _ProfileCard(profile: profileState),
            ),
            const SizedBox(height: 24),
            _sectionLabel('ЗАГАЛЬНІ НАЛАШТУВАННЯ'),
            const SizedBox(height: 8),
            BlocBuilder<ProfileCubit, ProfileViewModel>(
              builder: (ctx, profileState) => _GeneralSection(profileState: profileState),
            ),
            const SizedBox(height: 24),
            _sectionLabel('СПОВІЩЕННЯ'),
            const SizedBox(height: 8),
            BlocBuilder<SettingsCubit, SettingsViewModel>(
              builder: (_, settings) => _NotificationsSection(settings: settings),
            ),
            const SizedBox(height: 24),
            _sectionLabel('ДАНІ ТА СИНХРОНІЗАЦІЯ'),
            const SizedBox(height: 8),
            const _DataSyncSection(),
            const SizedBox(height: 40),
            const _Footer(),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(64),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(color: AppColors.borderLighter, width: 1),
          ),
          boxShadow: [
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
                  onTap: () => context.pop(),
                  child: const Icon(
                    Icons.arrow_back_rounded,
                    size: 22,
                    color: AppColors.cardDark,
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  'Налаштування',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: AppColors.textHeader,
                  ),
                ),
                const Spacer(),
                BlocBuilder<ProfileCubit, ProfileViewModel>(
                  builder: (_, state) => _SmallAvatar(
                    avatarUrl: state.profile?.avatarUrl,
                    name: state.profile?.displayName ?? state.profile?.email ?? '',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _sectionLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: Text(
        text,
        style: GoogleFonts.inter(
          fontWeight: FontWeight.w700,
          fontSize: 12,
          color: const Color(0xFF516072),
          letterSpacing: 0.6,
        ),
      ),
    );
  }
}

// ─── Profile anchor card ───────────────────────────────────────────────────────

class _ProfileCard extends StatelessWidget {
  const _ProfileCard({required this.profile});
  final ProfileViewModel profile;

  @override
  Widget build(BuildContext context) {
    final name = profile.profile?.displayName ?? profile.profile?.email ?? '—';
    final email = profile.profile?.email ?? '';
    final avatarUrl = profile.profile?.avatarUrl;

    return GestureDetector(
      onTap: () => context.push('/profile'),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.borderLighter),
          boxShadow: const [
            BoxShadow(
              color: Color(0x0D000000),
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            _Avatar(avatarUrl: avatarUrl, name: name, size: 48),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.manrope(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: AppColors.textHeader,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (email.isNotEmpty) ...[
                    const SizedBox(height: 2),
                    Text(
                      email,
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        color: AppColors.textSecondary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ],
              ),
            ),
            const Icon(
              Icons.chevron_right_rounded,
              size: 22,
              color: AppColors.textInactive,
            ),
          ],
        ),
      ),
    );
  }
}

// ─── General settings section ──────────────────────────────────────────────────

class _GeneralSection extends StatelessWidget {
  const _GeneralSection({required this.profileState});
  final ProfileViewModel profileState;

  @override
  Widget build(BuildContext context) {
    final isKm = profileState.profile?.unitSystem != UnitSystem.miles;

    return _SettingsCard(
      children: [
        _SettingsRow(
          title: 'Мова інтерфейсу',
          subtitle: 'Українська',
          trailing: const Icon(
            Icons.chevron_right_rounded,
            size: 22,
            color: AppColors.textInactive,
          ),
          onTap: () {},
        ),
        const _RowDivider(),
        _SettingsRow(
          title: 'Одиниці вимірювання',
          subtitle: isKm ? 'Кілометри, Літри' : 'Милі, Галони',
          trailing: _UnitPillToggle(
            isKm: isKm,
            onToggle: (val) {
              final profile = profileState.profile;
              if (profile == null) return;
              context.read<ProfileCubit>().updateProfile(
                profile.copyWith(
                  unitSystem: val ? UnitSystem.km : UnitSystem.miles,
                ),
              );
            },
          ),
        ),
        const _RowDivider(),
        BlocBuilder<SettingsCubit, SettingsViewModel>(
          builder: (ctx, settings) => _SettingsRow(
            title: 'Зовнішній вигляд',
            subtitle: settings.darkMode ? 'Темна тема' : 'Світла тема',
            trailing: CupertinoSwitch(
              value: settings.darkMode,
              onChanged: (_) => ctx.read<SettingsCubit>().toggleDarkMode(),
              activeTrackColor: AppColors.cardDark,
            ),
          ),
        ),
      ],
    );
  }
}

// ─── Notifications section ─────────────────────────────────────────────────────

class _NotificationsSection extends StatelessWidget {
  const _NotificationsSection({required this.settings});
  final SettingsViewModel settings;

  @override
  Widget build(BuildContext context) {
    return _SettingsCard(
      children: [
        _SettingsRow(
          title: 'Пуш-сповіщення',
          subtitle: 'Важливі сервісні нагадування',
          trailing: CupertinoSwitch(
            value: settings.pushNotifications,
            onChanged: (_) => context.read<SettingsCubit>().togglePushNotifications(),
            activeTrackColor: AppColors.cardDark,
          ),
        ),
        const _RowDivider(),
        _SettingsRow(
          title: 'Email-звіти',
          subtitle: 'Щомісячний аналіз витрат',
          trailing: CupertinoSwitch(
            value: settings.emailReports,
            onChanged: (_) => context.read<SettingsCubit>().toggleEmailReports(),
            activeTrackColor: AppColors.cardDark,
          ),
        ),
      ],
    );
  }
}

// ─── Data & sync section ───────────────────────────────────────────────────────

class _DataSyncSection extends StatelessWidget {
  const _DataSyncSection();

  @override
  Widget build(BuildContext context) {
    return _SettingsCard(
      children: [
        _SettingsRow(
          title: 'Хмарна синхронізація',
          subtitle: 'Остання синхронізація: Сьогодні, 10:45',
          trailing: const Icon(
            Icons.refresh_rounded,
            size: 22,
            color: AppColors.textSecondary,
          ),
          onTap: () {},
        ),
        const _RowDivider(),
        _SettingsRow(
          title: 'Експорт даних',
          subtitle: 'PDF або CSV формат',
          trailing: const Icon(
            Icons.file_download_outlined,
            size: 22,
            color: AppColors.textSecondary,
          ),
          onTap: () {},
        ),
      ],
    );
  }
}

// ─── Footer ────────────────────────────────────────────────────────────────────

class _Footer extends StatelessWidget {
  const _Footer();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          context.l10n.settingsFooterAppName,
          style: GoogleFonts.manrope(
            fontWeight: FontWeight.w800,
            fontSize: 16,
            color: AppColors.borderLighter,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'ВЕРСІЯ 1.0.0 (ЗБІРКА 1)',
          style: GoogleFonts.inter(
            fontSize: 11,
            color: AppColors.textInactive,
            letterSpacing: 0.4,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {},
              child: Text(
                'Конфіденційність',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  color: AppColors.textSecondary,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                '·',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  color: AppColors.textInactive,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                'Підтримка',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  color: AppColors.textSecondary,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// ─── Shared primitives ─────────────────────────────────────────────────────────

class _SettingsCard extends StatelessWidget {
  const _SettingsCard({required this.children});
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderLighter),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D000000),
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(children: children),
    );
  }
}

class _SettingsRow extends StatelessWidget {
  const _SettingsRow({
    required this.title,
    required this.subtitle,
    required this.trailing,
    this.onTap,
  });

  final String title;
  final String subtitle;
  final Widget trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 2),
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
            const SizedBox(width: 12),
            trailing,
          ],
        ),
      ),
    );
  }
}

class _RowDivider extends StatelessWidget {
  const _RowDivider();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Divider(height: 1, color: AppColors.borderLighter),
    );
  }
}

// ─── Unit pill toggle ──────────────────────────────────────────────────────────

class _UnitPillToggle extends StatelessWidget {
  const _UnitPillToggle({required this.isKm, required this.onToggle});

  final bool isKm;
  final ValueChanged<bool> onToggle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      decoration: BoxDecoration(
        color: AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(99),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _PillOption(label: 'КМ', isActive: isKm, onTap: () => onToggle(true)),
          _PillOption(label: 'МЛ', isActive: !isKm, onTap: () => onToggle(false)),
        ],
      ),
    );
  }
}

class _PillOption extends StatelessWidget {
  const _PillOption({
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  final String label;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        margin: const EdgeInsets.all(3),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
        decoration: BoxDecoration(
          color: isActive ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(99),
          boxShadow: isActive
              ? const [
                  BoxShadow(
                    color: Color(0x1A000000),
                    blurRadius: 4,
                    offset: Offset(0, 1),
                  ),
                ]
              : null,
        ),
        child: Text(
          label,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
            fontSize: 12,
            color: isActive ? AppColors.textHeader : AppColors.textSecondary,
          ),
        ),
      ),
    );
  }
}

// ─── Small avatar (AppBar) ─────────────────────────────────────────────────────

class _SmallAvatar extends StatelessWidget {
  const _SmallAvatar({required this.avatarUrl, required this.name});

  final String? avatarUrl;
  final String name;

  String get _initials {
    final parts = name.trim().split(' ');
    if (parts.length >= 2) return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    return name.isNotEmpty ? name[0].toUpperCase() : '?';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 38,
      height: 38,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.cardDark.withValues(alpha: 0.15),
        border: Border.all(color: AppColors.borderLighter, width: 1.5),
      ),
      child: ClipOval(
        child: avatarUrl != null && avatarUrl!.isNotEmpty
            ? CachedNetworkImage(
                imageUrl: avatarUrl!,
                fit: BoxFit.cover,
                placeholder: (context, url) => _Initials(initials: _initials),
                errorWidget: (context, url, error) => _Initials(initials: _initials),
              )
            : _Initials(initials: _initials),
      ),
    );
  }
}

class _Initials extends StatelessWidget {
  const _Initials({required this.initials});
  final String initials;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        initials,
        style: GoogleFonts.manrope(
          fontWeight: FontWeight.w700,
          fontSize: 13,
          color: AppColors.cardDark,
        ),
      ),
    );
  }
}

// ─── Avatar (profile card) ─────────────────────────────────────────────────────

class _Avatar extends StatelessWidget {
  const _Avatar({required this.avatarUrl, required this.name, required this.size});

  final String? avatarUrl;
  final String name;
  final double size;

  String get _initials {
    final parts = name.trim().split(' ');
    if (parts.length >= 2) return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    return name.isNotEmpty ? name[0].toUpperCase() : '?';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.surfaceLight,
        border: Border.all(color: AppColors.borderLighter, width: 1.5),
      ),
      child: ClipOval(
        child: avatarUrl != null && avatarUrl!.isNotEmpty
            ? CachedNetworkImage(
                imageUrl: avatarUrl!,
                fit: BoxFit.cover,
                placeholder: (context, url) => Center(
                  child: Text(
                    _initials,
                    style: GoogleFonts.manrope(
                      fontWeight: FontWeight.w700,
                      fontSize: size * 0.3,
                      color: AppColors.cardDark,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => Center(
                  child: Text(
                    _initials,
                    style: GoogleFonts.manrope(
                      fontWeight: FontWeight.w700,
                      fontSize: size * 0.3,
                      color: AppColors.cardDark,
                    ),
                  ),
                ),
              )
            : Center(
                child: Text(
                  _initials,
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w700,
                    fontSize: size * 0.3,
                    color: AppColors.cardDark,
                  ),
                ),
              ),
      ),
    );
  }
}
