import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../features/auth/presentation/controllers/auth_cubit.dart';
import '../../shared/ui_utils/l10n_extension.dart';
import '../../features/profile/presentation/controllers/profile_cubit.dart';
import '../../features/profile/presentation/controllers/profile_view_model.dart';
import './app_colors.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          BlocBuilder<ProfileCubit, ProfileViewModel>(
            builder: (context, state) => _DrawerHeader(profile: state),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const SizedBox(height: 8),
                _DrawerItem(
                  icon: Icons.person_outline_rounded,
                  label: context.l10n.drawerMyProfile,
                  onTap: () {
                    Navigator.pop(context);
                    context.push('/profile');
                  },
                ),
                _DrawerItem(
                  icon: Icons.directions_car_outlined,
                  label: context.l10n.drawerMyCars,
                  onTap: () => Navigator.pop(context),
                ),
                _DrawerItem(
                  icon: Icons.notifications_outlined,
                  label: context.l10n.drawerReminders,
                  onTap: () => Navigator.pop(context),
                ),
                _DrawerItem(
                  icon: Icons.settings_outlined,
                  label: context.l10n.drawerSettings,
                  onTap: () {
                    Navigator.pop(context);
                    context.push('/settings');
                  },
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: Divider(height: 1),
                ),
                _DrawerItem(
                  icon: Icons.logout_rounded,
                  label: context.l10n.drawerSignOut,
                  iconColor: AppColors.urgentRed,
                  labelColor: AppColors.urgentRed,
                  onTap: () {
                    Navigator.pop(context);
                    GetIt.I<ProfileCubit>().clear();
                    context.read<AuthCubit>().signOut();
                  },
                ),
              ],
            ),
          ),
          _DrawerFooter(),
        ],
      ),
    );
  }
}

// ─── Header ───────────────────────────────────────────────────────────────────

class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader({required this.profile});
  final ProfileViewModel profile;

  @override
  Widget build(BuildContext context) {
    final name = profile.profile?.displayName ?? profile.profile?.email ?? '—';
    final email = profile.profile?.email ?? '';
    final avatarUrl = profile.profile?.avatarUrl;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(
        20,
        MediaQuery.of(context).padding.top + 24,
        20,
        24,
      ),
      decoration: BoxDecoration(
        color: AppColors.cardDark,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Avatar(avatarUrl: avatarUrl, name: name, size: 64),
          const SizedBox(height: 16),
          Text(
            name,
            style: GoogleFonts.manrope(
              fontWeight: FontWeight.w700,
              fontSize: 18,
              color: Colors.white,
              letterSpacing: -0.3,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          if (email.isNotEmpty) ...[
            const SizedBox(height: 4),
            Text(
              email,
              style: GoogleFonts.inter(
                fontSize: 13,
                color: Colors.white.withValues(alpha: 0.6),
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ],
      ),
    );
  }
}

// ─── Avatar ───────────────────────────────────────────────────────────────────

class _Avatar extends StatelessWidget {
  const _Avatar({required this.avatarUrl, required this.name, required this.size});

  final String? avatarUrl;
  final String name;
  final double size;

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
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withValues(alpha: 0.15),
        border: Border.all(color: Colors.white.withValues(alpha: 0.3), width: 2),
      ),
      child: ClipOval(
        child: avatarUrl != null && avatarUrl!.isNotEmpty
            ? CachedNetworkImage(
                imageUrl: avatarUrl!,
                fit: BoxFit.cover,
                placeholder: (context, url) => _InitialsWidget(initials: _initials, size: size),
                errorWidget: (context, url, error) => _InitialsWidget(initials: _initials, size: size),
              )
            : _InitialsWidget(initials: _initials, size: size),
      ),
    );
  }
}

class _InitialsWidget extends StatelessWidget {
  const _InitialsWidget({required this.initials, required this.size});
  final String initials;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        initials,
        style: GoogleFonts.manrope(
          fontWeight: FontWeight.w700,
          fontSize: size * 0.33,
          color: Colors.white,
        ),
      ),
    );
  }
}

// ─── Drawer item ──────────────────────────────────────────────────────────────

class _DrawerItem extends StatelessWidget {
  const _DrawerItem({
    required this.icon,
    required this.label,
    required this.onTap,
    this.iconColor,
    this.labelColor,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color? iconColor;
  final Color? labelColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        child: Row(
          children: [
            Icon(
              icon,
              size: 22,
              color: iconColor ?? AppColors.textSecondary,
            ),
            const SizedBox(width: 16),
            Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: labelColor ?? AppColors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Footer ───────────────────────────────────────────────────────────────────

class _DrawerFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 8, 20, MediaQuery.of(context).padding.bottom + 16),
      child: Text(
        context.l10n.drawerVersion,
        style: GoogleFonts.inter(
          fontSize: 12,
          color: AppColors.textSecondary.withValues(alpha: 0.5),
        ),
      ),
    );
  }
}

// ─── Small avatar for AppBar ──────────────────────────────────────────────────

class AppBarAvatar extends StatelessWidget {
  const AppBarAvatar({super.key, required this.profile});
  final ProfileViewModel profile;

  @override
  Widget build(BuildContext context) {
    return _Avatar(
      avatarUrl: profile.profile?.avatarUrl,
      name: profile.profile?.displayName ?? profile.profile?.email ?? '',
      size: 40,
    );
  }
}
