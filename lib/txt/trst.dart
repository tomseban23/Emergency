import 'package:flutter/material.dart';


class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCF8F8),
      body: Column(
        children: [
          _buildAppBar(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0, bottom: 8.0),
                    child: Text(
                      'Appetizers',
                      style: TextStyle(
                        color: Color(0xFF1B0E0E),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -0.015,
                      ),
                    ),
                  ),
                  _buildMenuItem(
                    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAG30mRGwNTn0KeZBCWqTh4axYd1FSfIf_oE0pzp8m-ZWxaXQbKratJtOqy5-cp2q9Tq3B8EkZxtwEi4aoLP0mytDT3AzctHiGNFYMIQvU9Yzx-M0YRifFVKJffyfo7M8-Fi8ZG7SIWgWtttVPojOJRbbqmdsAF4oavwzjIrOausuaNcESUO8TpQwhSOqbSWeX9IDuly9HPNSG3iHgtN366EKodwlD0t40RBN7Wm1KoREEdepkfpiZgo1tRbU7l2LOVBgt8tj6zNBQ',
                    name: 'Crispy Calamari',
                    price: '\$12.99',
                  ),
                  _buildMenuItem(
                    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBlu16P3j0REEc8ItX_Pka__PiXd0TLHbO3_2AYOqOuWxs1WaORu0GpP6M3KCK83g37ug0_q1yn-WyO6tNnYaVHQK3nR7R_G5cnkGMj3CsIHRlJu1yZhYcIx9GtRtM9wEKPDncWcg-rqXWcn5-DpJ8uN25znyuKaV-4kJSeGZ2a5k4A50hlhynRNn8OOXzCPh8vazkC9HEpcm2_CayMJezMZckJiKc_DjbFtQjZjBsV1lxEAE2kuKEaoofczzFP5wzz6H6supIFTkw',
                    name: 'Spinach Artichoke Dip',
                    price: '\$9.99',
                  ),
                  _buildMenuItem(
                    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuC74WWm0RqDoTmxfiYJIhKPbYl_fqinaHK1-ZqRzr9-USwmguKrKRZslhA7pfIarQKBQnE6YxrUz7wbfxQK5-axGqg3aFrP38_BY6oOoGKRk40sZXfzXewLbptqUulxipd8bcpyNhcpOwC46A7S8gz-EbFkzxGeZoz3yUfJC0KUY2vWwWTsQql0qfE7g3aMGsWSAXWrSLzgkHzERu1s3vIId_c-k37FeHAIIaZNjl5kvmgwlTL4Uj_BsA7rOwE8oOKUt4i9YK_fQgY',
                    name: 'Loaded Potato Skins',
                    price: '\$11.99',
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0, bottom: 8.0),
                    child: Text(
                      'Main Courses',
                      style: TextStyle(
                        color: Color(0xFF1B0E0E),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -0.015,
                      ),
                    ),
                  ),
                  _buildMenuItem(
                    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCA5N6Hi5ELUogqhSxVY-V8L65jIRWYOFtdU-oNJitVkg2ZD-plYMBy5vX0V7psIm365c2astfRGb-YGAIgGvUbYBvUUduL0nfwZgnVouo5bjLjBYgyG5GGN742JZvt2LVsxNC88Ehv75TARSo6nDcuFu44TcuGTl6B_4AZ9W2VyDNtNlaa4xjhPYnEfSU48w_-wHZvnbOPzEO2tvwexi2BeRZSnykyr-yi1aX_XjX1-3GJ2F7YYPuGajGPDZrLZNnMPupcL--yajg',
                    name: 'Grilled Salmon',
                    price: '\$18.99',
                  ),
                  _buildMenuItem(
                    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuASjs48jzbqRj2CzlUXxg2EpMcDPvBpei84pV40d2wb6vz_yacdDg3GPFGCn3RkP4h8jGuOzvR5WCYuCjz27jJrXWHnX11upXm_a5bzWMtTHgDELIgSp2nvka-YM4T3GAz6fBVgZdXmIZaadgyUNHpcEWlE2Oq3igC8FaAANo1tk0EHxzhOtgom7kZmzb-60WWJt8OC9BYxtDspG1pu8EUdUyQtcUNtv896CvSt-8QQxgMtBNN-8-Hmng07Jx5aBRujh0H-m-Mqr_Q',
                    name: 'Chicken Alfredo',
                    price: '\$16.99',
                  ),
                  _buildMenuItem(
                    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuB9d1Z8PrmNVkpRXGx1e6KLwpQonIVgy26Eudwjb2RdVXEUioRbrYhSvI-UB--aSeFPIT3PVxcIc0_x17CzoKRS2rFAhb19xP-XF3bOaGWB7ch1vSZj7vVmoLVSna5QXkUTXP-D_duQVZHJOfEpwoCqv0Gk1wU5l5MLSC68WUQJbxnxkdyxZ-4rraPv_ULtEBxxFbv8HpbxARcyEoZTv3aurTMP1Cqqs3P8m0mb2FZ_ve0K_0BPMJWN7olUmGIt-jOI9FOx2wka4mg',
                    name: 'Classic Cheeseburger',
                    price: '\$14.99',
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0, bottom: 8.0),
                    child: Text(
                      'Desserts',
                      style: TextStyle(
                        color: Color(0xFF1B0E0E),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -0.015,
                      ),
                    ),
                  ),
                  _buildMenuItem(
                    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAQQsUJr8FxK7zmGN0RRHLpRx65IGdOvl9KKO7aD-_GRz4jRNJL48aS5ZA1zCzfqHTVyvCCLNZoISXeLCyl93jRxbxhO3GHyZwXAbQ21YUyZpcvBHyLam5kDY1pdwTM9FYNyUOcTzEZyOhiHeRrENm5cdD15IINu1O3gvp7frRIPMdG5J79gHTmZZ2h4oxJxdqDoG4YwRSRyXMVW6Yvt2nRGLW01b5Du5aGzT1vAkQ33lTM1220HOnagg50WQqDo4blEi2losAtP9I',
                    name: 'Chocolate Lava Cake',
                    price: '\$7.99',
                  ),
                  _buildMenuItem(
                    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAES93PhTTNc8nl7PI92k12bcqa6afRYb8PORspV-8S0aUeGGZ4mO82q_LwBIIKWc9LMUJeLu7UbXfa3wyUt7W-B7j314cBnYBxhHRQRsXypBmjt9TPgaal_kNj00ZroePJTqszcV5o7xwTM-ZruMNOitUwLWnmrm26cG00Wf9qY2Gu1f4MMcs3RkfanP5DjJUsYSgIyI5GufIx_4mJaDra_ZRq5y0msLGODRLXDEuQi2-DoQ1FkKerL_snhlN8lWAR1XM_7WqFnFc',
                    name: 'New York Cheesecake',
                    price: '\$6.99',
                  ),
                  _buildMenuItem(
                    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCorgqnVjLDEniKrz9bQdqno2ZH8r2_8ySckenO-FgLwZcK1OPonHE4ogeaQsSiRNNIMTlaxI7Yv6t4UxHCI_hZuXvPnZCivJ4kvZ4doYbd-w2diuxReVpGvgwAWPguJRVRYltFUrn-Hn1Fk0UIgbKB0ERX0tke8M3KKG-BGoalfqR3L2CZffsNFR6SD-l9AAEV_foz3mwdSvEtnL-71bCz_I7EayR3DILhLGBHR8SisLV0L8hvSSvvqXX2gOza0x7HVmvcW47JvYw',
                    name: 'Apple Pie',
                    price: '\$8.99',
                  ),
                ],
              ),
            ),
          ),
          _buildBottomNavigationBar(),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return Container(
      color: const Color(0xFFFCF8F8),
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            alignment: Alignment.center,
            child: const Icon(
              Icons.arrow_back,
              color: Color(0xFF1B0E0E),
              size: 24,
            ),
          ),
          const Expanded(
            child: Text(
              'Menu',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF1B0E0E),
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: -0.015,
              ),
            ),
          ),
          const SizedBox(width: 48), // To balance the back arrow
        ],
      ),
    );
  }

  Widget _buildMenuItem({required String imageUrl, required String name, required String price}) {
    return Container(
      color: const Color(0xFFFCF8F8),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      constraints: const BoxConstraints(minHeight: 72),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: const TextStyle(
                  color: Color(0xFF1B0E0E),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 1,
              ),
              Text(
                price,
                style: const TextStyle(
                  color: Color(0xFF994D51),
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 2,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Column(
      children: [
        Container(
          height: 1,
          color: const Color(0xFFF3E7E8),
        ),
        Container(
          color: const Color(0xFFFCF8F8),
          padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildBottomNavItem(
                icon: Icons.home,
                label: 'Home',
                color: const Color(0xFF994D51),
              ),
              _buildBottomNavItem(
                icon: Icons.list,
                label: 'Menu',
                color: const Color(0xFF1B0E0E),
              ),
              _buildBottomNavItem(
                icon: Icons.shopping_cart,
                label: 'Cart',
                color: const Color(0xFF994D51),
              ),
              _buildBottomNavItem(
                icon: Icons.person,
                label: 'Profile',
                color: const Color(0xFF994D51),
              ),
            ],
          ),
        ),
        Container(
          height: 20, // Corresponds to h-5 bg-[#fcf8f8]
          color: const Color(0xFFFCF8F8),
        ),
      ],
    );
  }

  Widget _buildBottomNavItem({required IconData icon, required String label, required Color color}) {
    return Expanded(
      child: InkWell(
        onTap: () {
          // Handle navigation
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: 32,
              child: Icon(
                icon,
                color: color,
                size: 24,
              ),
            ),
            const SizedBox(height: 4), // Gap between icon and text
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 10,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.015,
              ),
            ),
          ],
        ),
      ),
    );
  }
}