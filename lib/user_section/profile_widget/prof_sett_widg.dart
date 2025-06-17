import 'package:flutter/material.dart';

// Settings Menu Card Widget
class SettingsMenuCard extends StatelessWidget {
  const SettingsMenuCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            SettingsMenuItem(
              icon: Icons.security_outlined,
              title: 'Password & Security',
              onTap: () {},
            ),
            SettingsMenuItem(
              icon: Icons.language_outlined,
              title: 'Language',
              trailing: 'English',
              onTap: () {},
            ),
            SettingsMenuItem(
              icon: Icons.help_outline,
              title: 'Help & Support',
              onTap: () {},
            ),
            SettingsMenuItem(
              icon: Icons.description_outlined,
              title: 'Terms & Privacy Policy',
              onTap: () {},
            ),
            SettingsMenuItem(
              icon: Icons.logout_outlined,
              title: 'Sign Out',
              titleColor: Colors.red,
              showArrow: false,
              isCentered: true, // Custom flag to center this item
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

// Settings Menu Item Widget
class SettingsMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? trailing;
  final Color? titleColor;
  final bool showArrow;
  final bool isCentered;
  final VoidCallback onTap;

  const SettingsMenuItem({
    Key? key,
    required this.icon,
    required this.title,
    this.trailing,
    this.titleColor,
    this.showArrow = true,
    this.isCentered = false, // default to false
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: isCentered
            ? Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      icon,
                      color: titleColor ?? Colors.grey[600],
                      size: 24,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        color: titleColor ?? Colors.black87,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              )
            : Row(
                children: [
                  Icon(
                    icon,
                    color: titleColor ?? Colors.grey[600],
                    size: 24,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        color: titleColor ?? Colors.black87,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  if (trailing != null) ...[
                    Text(
                      trailing!,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 8),
                  ],
                  if (showArrow)
                    Icon(
                      Icons.chevron_right,
                      color: Colors.grey[400],
                      size: 24,
                    ),
                ],
              ),
      ),
    );
  }
}
