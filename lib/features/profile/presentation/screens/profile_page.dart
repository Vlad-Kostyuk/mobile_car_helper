import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:car_helper/features/auth/presentation/controllers/auth_cubit.dart';
import 'package:car_helper/features/profile/domain/models/user_profile.dart';
import 'package:car_helper/features/profile/presentation/controllers/profile_view_model.dart';
import 'package:car_helper/features/profile/presentation/controllers/profile_cubit.dart';
import 'package:car_helper/shared/ui_kit/app_colors.dart';
import 'package:car_helper/shared/ui_utils/l10n_extension.dart';
import 'package:car_helper/shared/ui_kit/auth_text_field.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _firstNameCtrl = TextEditingController();
  final _lastNameCtrl = TextEditingController();
  bool _isEditing = false;
  UnitSystem? _selectedUnit;

  @override
  void dispose() {
    _firstNameCtrl.dispose();
    _lastNameCtrl.dispose();
    super.dispose();
  }

  void _startEditing(UserProfile profile) {
    _firstNameCtrl.text = profile.displayName ?? '';
    _lastNameCtrl.text = profile.lastName ?? '';
    _selectedUnit = profile.unitSystem;
    setState(() => _isEditing = true);
  }

  void _cancelEditing() {
    setState(() => _isEditing = false);
  }

  void _save(BuildContext context, UserProfile profile) {
    final updated = profile.copyWith(
      displayName: _firstNameCtrl.text.trim().isNotEmpty
          ? _firstNameCtrl.text.trim()
          : null,
      lastName: _lastNameCtrl.text.trim().isNotEmpty
          ? _lastNameCtrl.text.trim()
          : null,
      unitSystem: _selectedUnit ?? profile.unitSystem,
    );
    context.read<ProfileCubit>().updateProfile(updated);
    setState(() => _isEditing = false);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileViewModel>(
      listener: (context, state) {
        if (state.error != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error!),
              backgroundColor: AppColors.urgentRed,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        final profile = state.profile;

        return Scaffold(
          backgroundColor: AppColors.pageBackground,
          body: Column(
            children: [
              _Header(
                profile: profile,
                isEditing: _isEditing,
                isLoading: state.isLoading,
                onEdit: profile != null ? () => _startEditing(profile) : null,
                onCancel: _cancelEditing,
                onSave: profile != null ? () => _save(context, profile) : null,
              ),
              Expanded(
                child: profile == null
                    ? const Center(child: CircularProgressIndicator())
                    : SingleChildScrollView(
                        padding: const EdgeInsets.fromLTRB(20, 24, 20, 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _SectionTitle('Особиста інформація'),
                            const SizedBox(height: 12),
                            _isEditing
                                ? _EditForm(
                                    firstNameCtrl: _firstNameCtrl,
                                    lastNameCtrl: _lastNameCtrl,
                                    email: profile.email,
                                  )
                                : _InfoCard(profile: profile),
                            const SizedBox(height: 24),
                            _SectionTitle('Налаштування'),
                            const SizedBox(height: 12),
                            _SettingsCard(
                              selectedUnit:
                                  _isEditing ? _selectedUnit ?? profile.unitSystem : profile.unitSystem,
                              isEditing: _isEditing,
                              onUnitChanged: (unit) =>
                                  setState(() => _selectedUnit = unit),
                            ),
                            const SizedBox(height: 24),
                            _SectionTitle('Акаунт'),
                            const SizedBox(height: 12),
                            _AccountCard(profile: profile),
                          ],
                        ),
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// ─── Header ───────────────────────────────────────────────────────────────────

class _Header extends StatelessWidget {
  const _Header({
    required this.profile,
    required this.isEditing,
    required this.isLoading,
    required this.onEdit,
    required this.onCancel,
    required this.onSave,
  });

  final UserProfile? profile;
  final bool isEditing;
  final bool isLoading;
  final VoidCallback? onEdit;
  final VoidCallback onCancel;
  final VoidCallback? onSave;

  @override
  Widget build(BuildContext context) {
    final name = profile?.displayName != null
        ? '${profile!.displayName}${profile!.lastName != null ? ' ${profile!.lastName}' : ''}'
        : profile?.email ?? '—';

    return Container(
      width: double.infinity,
      color: AppColors.cardDark,
      padding: EdgeInsets.fromLTRB(
        20,
        MediaQuery.of(context).padding.top + 12,
        20,
        28,
      ),
      child: Column(
        children: [
          // AppBar row
          Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.arrow_back_ios_new_rounded,
                    color: Colors.white, size: 20),
              ),
              const SizedBox(width: 12),
              Text(
                context.l10n.profileTitle,
                style: GoogleFonts.manrope(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: Colors.white,
                  letterSpacing: -0.3,
                ),
              ),
              const Spacer(),
              if (isLoading)
                const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                )
              else if (isEditing) ...[
                GestureDetector(
                  onTap: onCancel,
                  child: Text(
                    'Скасувати',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: Colors.white.withValues(alpha: 0.7),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                GestureDetector(
                  onTap: onSave,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Зберегти',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.cardDark,
                      ),
                    ),
                  ),
                ),
              ] else
                GestureDetector(
                  onTap: onEdit,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: Colors.white.withValues(alpha: 0.3)),
                    ),
                    child: Text(
                      'Редагувати',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 24),
          // Avatar
          _LargeAvatar(
            avatarUrl: profile?.avatarUrl,
            name: name,
          ),
          const SizedBox(height: 16),
          Text(
            name,
            style: GoogleFonts.manrope(
              fontWeight: FontWeight.w700,
              fontSize: 22,
              color: Colors.white,
              letterSpacing: -0.3,
            ),
          ),
          if (profile?.email != null) ...[
            const SizedBox(height: 4),
            Text(
              profile!.email,
              style: GoogleFonts.inter(
                fontSize: 14,
                color: Colors.white.withValues(alpha: 0.6),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

// ─── Large avatar ─────────────────────────────────────────────────────────────

class _LargeAvatar extends StatelessWidget {
  const _LargeAvatar({required this.avatarUrl, required this.name});

  final String? avatarUrl;
  final String name;

  String get _initials {
    final parts = name.trim().split(' ');
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    return name.isNotEmpty ? name[0].toUpperCase() : '?';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 96,
      height: 96,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withValues(alpha: 0.15),
        border: Border.all(color: Colors.white.withValues(alpha: 0.4), width: 3),
      ),
      child: ClipOval(
        child: avatarUrl != null && avatarUrl!.isNotEmpty
            ? CachedNetworkImage(
                imageUrl: avatarUrl!,
                fit: BoxFit.cover,
                placeholder: (context, url) => _Initials(initials: _initials),
                errorWidget: (context, url, error) =>
                    _Initials(initials: _initials),
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
          fontSize: 36,
          color: Colors.white,
        ),
      ),
    );
  }
}

// ─── Section title ────────────────────────────────────────────────────────────

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.inter(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: AppColors.textSecondary,
        letterSpacing: 0.3,
      ),
    );
  }
}

// ─── Info card (view mode) ────────────────────────────────────────────────────

class _InfoCard extends StatelessWidget {
  const _InfoCard({required this.profile});
  final UserProfile profile;

  @override
  Widget build(BuildContext context) {
    return _Card(
      children: [
        _InfoRow(label: "Ім'я", value: profile.displayName ?? '—'),
        _Divider(),
        _InfoRow(label: 'Прізвище', value: profile.lastName ?? '—'),
        _Divider(),
        _InfoRow(label: context.l10n.profileFieldEmail, value: profile.email, isReadOnly: true),
      ],
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.label,
    required this.value,
    this.isReadOnly = false,
  });

  final String label;
  final String value;
  final bool isReadOnly;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          SizedBox(
            width: 110,
            child: Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 14,
                color: AppColors.textSecondary,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: GoogleFonts.inter(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: isReadOnly
                    ? AppColors.textSecondary
                    : AppColors.textPrimary,
              ),
              textAlign: TextAlign.end,
            ),
          ),
          if (isReadOnly) ...[
            const SizedBox(width: 8),
            const Icon(Icons.lock_outline_rounded,
                size: 14, color: AppColors.textSecondary),
          ],
        ],
      ),
    );
  }
}

// ─── Edit form ────────────────────────────────────────────────────────────────

class _EditForm extends StatelessWidget {
  const _EditForm({
    required this.firstNameCtrl,
    required this.lastNameCtrl,
    required this.email,
  });

  final TextEditingController firstNameCtrl;
  final TextEditingController lastNameCtrl;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AuthTextField(
          controller: firstNameCtrl,
          label: "Ім'я",
          hint: 'Іван',
          textInputAction: TextInputAction.next,
        ),
        const SizedBox(height: 12),
        AuthTextField(
          controller: lastNameCtrl,
          label: 'Прізвище',
          hint: 'Іванов',
          textInputAction: TextInputAction.done,
        ),
        const SizedBox(height: 12),
        Container(
          height: 58,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: AppColors.surfaceMuted,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.borderLight),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Email',
                      style: GoogleFonts.inter(
                        fontSize: 11,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    Text(
                      email,
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.lock_outline_rounded,
                  size: 16, color: AppColors.textSecondary),
            ],
          ),
        ),
      ],
    );
  }
}

// ─── Settings card ────────────────────────────────────────────────────────────

class _SettingsCard extends StatelessWidget {
  const _SettingsCard({
    required this.selectedUnit,
    required this.isEditing,
    required this.onUnitChanged,
  });

  final UnitSystem selectedUnit;
  final bool isEditing;
  final ValueChanged<UnitSystem> onUnitChanged;

  @override
  Widget build(BuildContext context) {
    return _Card(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              Text(
                context.l10n.profileUnitsTitle,
                style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textPrimary,
                ),
              ),
              const Spacer(),
              _UnitToggle(
                selected: selectedUnit,
                enabled: isEditing,
                onChanged: onUnitChanged,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _UnitToggle extends StatelessWidget {
  const _UnitToggle({
    required this.selected,
    required this.enabled,
    required this.onChanged,
  });

  final UnitSystem selected;
  final bool enabled;
  final ValueChanged<UnitSystem> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34,
      decoration: BoxDecoration(
        color: AppColors.surfaceMuted,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          _UnitOption(
            label: context.l10n.profileUnitKm,
            isSelected: selected == UnitSystem.km,
            enabled: enabled,
            onTap: () => onChanged(UnitSystem.km),
          ),
          _UnitOption(
            label: context.l10n.profileUnitMi,
            isSelected: selected == UnitSystem.miles,
            enabled: enabled,
            onTap: () => onChanged(UnitSystem.miles),
          ),
        ],
      ),
    );
  }
}

class _UnitOption extends StatelessWidget {
  const _UnitOption({
    required this.label,
    required this.isSelected,
    required this.enabled,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final bool enabled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.cardDark : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: isSelected ? Colors.white : AppColors.textSecondary,
          ),
        ),
      ),
    );
  }
}

// ─── Account card ─────────────────────────────────────────────────────────────

class _AccountCard extends StatelessWidget {
  const _AccountCard({required this.profile});
  final UserProfile profile;

  @override
  Widget build(BuildContext context) {
    return _Card(
      children: [
        _AccountRow(
          icon: Icons.lock_outline_rounded,
          label: 'Змінити пароль',
          onTap: () => Navigator.pop(context),
        ),
        _Divider(),
        _AccountRow(
          icon: Icons.logout_rounded,
          label: 'Вийти з акаунту',
          color: AppColors.urgentRed,
          onTap: () {
            Navigator.pop(context);
            context.read<AuthCubit>().signOut();
          },
        ),
      ],
    );
  }
}

class _AccountRow extends StatelessWidget {
  const _AccountRow({
    required this.icon,
    required this.label,
    required this.onTap,
    this.color,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final c = color ?? AppColors.textPrimary;
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Icon(icon, size: 20, color: c),
            const SizedBox(width: 12),
            Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: c,
              ),
            ),
            const Spacer(),
            Icon(Icons.chevron_right_rounded, size: 20, color: c.withValues(alpha: 0.5)),
          ],
        ),
      ),
    );
  }
}

// ─── Shared ───────────────────────────────────────────────────────────────────

class _Card extends StatelessWidget {
  const _Card({required this.children});
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderLight),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D000000),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Column(children: children),
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 1,
      thickness: 1,
      indent: 16,
      endIndent: 16,
      color: AppColors.borderLighter,
    );
  }
}
