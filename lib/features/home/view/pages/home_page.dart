import 'package:boa_clone/core/assets/consts.dart';
import 'package:boa_clone/core/auth_state.dart';
import 'package:boa_clone/core/widgets/primary_color_button.dart';
import 'package:boa_clone/core/themes/app_palette.dart';
import 'package:boa_clone/features/home/view/pages/setting_page.dart';
import 'package:boa_clone/features/home/view/pages/transfer_type_page.dart';
import 'package:boa_clone/features/home/view/widgets/home_page_container.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isVisible = false;
  int _selectedIndex = 0;
  final List<String> _routes = [
    '/home', // Main Home Dashboard route
    '/home/transfer', // Transfer route
    '/home/utilities', // Utilities route
    '/home/transaction'
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    context.go(_routes[index]); // Navigate to the selected route
  }

  @override
  Widget build(BuildContext context) {
    final authState = Provider.of<AuthState>(context, listen: false);
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80), // Set AppBar height
          child: AppBar(
            iconTheme: const IconThemeData(
              size: 40, // Increase size of the Drawer icon
            ),
            backgroundColor: Palette.primaryColor,
            centerTitle: true,
            title: Image.asset(
              Consts.abyssiniaBankLogo,
              width: 180,
              height: 50,
            ),
            actions: [
              IconButton(
                onPressed: () {
                  authState.logout();
                },
                icon: const Icon(
                  Icons.logout,
                  size: 35,
                ), // Normal-sized icon
              ),
            ],
          ),
        ),
        drawer: Drawer(
          backgroundColor: Palette.whiteColor,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 120, // Background color
                child: Row(
                  crossAxisAlignment:
                      CrossAxisAlignment.center, // Vertically center content
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 15), // Space around the avatar
                      child: CircleAvatar(
                        radius: 25, // Adjust avatar size
                        backgroundImage: NetworkImage(
                          'https://via.placeholder.com/150', // Replace with actual image URL
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment:
                          MainAxisAlignment.center, // Align text vertically
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'SALMAN', // User's name
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          'Last Sign in: 03/27/2025, 10:42 AM',
                          style: TextStyle(
                            fontSize: 10, // Subtle text color
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Main Menu Items (Scrollable Section)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: ListView(
                    padding: EdgeInsets.zero, // No padding
                    children: [
                      ListTile(
                        leading: const Icon(
                          Icons.account_balance_wallet_outlined,
                          color: Palette.primaryColor,
                          size: 25,
                        ),
                        title: const Text('Account',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16)),
                        onTap: () {
                          // Handle Account
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.wallet_outlined,
                            color: Palette.primaryColor, size: 25),
                        title: const Text('Card Management',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16)),
                        onTap: () {
                          // Handle Card Management
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.lock_open_outlined,
                            color: Palette.primaryColor, size: 25),
                        title: const Text('Locked Amount',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16)),
                        onTap: () {
                          // Handle Locked Amount
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.settings_outlined,
                            color: Palette.primaryColor, size: 25),
                        title: const Text('Settings',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16)),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SettingPage()));
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.location_on_outlined,
                            color: Palette.primaryColor, size: 25),
                        title: const Text('Locate Us',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16)),
                        onTap: () {
                          // Handle Locate Us
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.feedback_outlined,
                            color: Palette.primaryColor, size: 25),
                        title: const Text('Feedback',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16)),
                        onTap: () {
                          // Handle Feedback
                        },
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 30.0, vertical: 50.0),
                child: PrimaryColorButton(
                    text: 'Log Out',
                    onTap: () {
                      authState.logout();
                    }),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            // Top Container for Balance Details
            Container(
              height: 280,
              color: Palette.primaryColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Total Balance',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment:
                        CrossAxisAlignment.center, // Ensures vertical alignment
                    children: [
                      // ETB is always visible
                      const Text(
                        'ETB',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20),
                      ),
                      const SizedBox(width: 10),
                      // Amount toggled visibility
                      Text(
                        _isVisible
                            ? '1000'
                            : '******', // Toggle number visibility
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20),
                      ),

                      // Add spacing between text and the eye icon
                      const SizedBox(width: 5),

                      // Eye icon for toggling visibility
                      IconButton(
                        icon: Icon(
                          _isVisible
                              ? Icons.visibility
                              : Icons.visibility_off, // Toggle icons
                          color: Colors.black, // Icon color
                        ),
                        onPressed: () {
                          setState(() {
                            _isVisible = !_isVisible; // Toggle visibility state
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 140,
                    width: 320,
                    decoration: BoxDecoration(
                      color: Palette.whiteColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 16),
                        const Text(
                          'Account Balance',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'ETB',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 18),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              _isVisible ? '1000' : '******',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 18),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          _isVisible
                              ? 'Fitayah Savings 912345678'
                              : 'Fitayah Savings 9*****567',
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // GridView for HomePageContainer Widgets
            Expanded(
              child: Container(
                color: Palette.whiteColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 40), // Adds padding around the grid
                  child: GridView.count(
                    childAspectRatio: 0.86,
                    crossAxisCount: 3, // Create 3 items per row
                    crossAxisSpacing: 26, // Space between columns
                    mainAxisSpacing: 30, // Space between rows
                    children: [
                      const HomePageContainer(
                        text: 'Transfer to BOA Customer',
                        iconData: Icon(
                          Icons.swap_horiz, // Icon widget wrapping IconData
                          color:
                              Palette.primaryColor, // Customize the icon color
                          size: 60, // Customize the icon size
                        ),
                      ),
                      HomePageContainer(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const TransferTypePage()));
                        },
                          text: 'Transfer to other Bank',
                          iconData: const FaIcon(
                            FontAwesomeIcons
                                .moneyBillTransfer, // Bank transfer icon
                            size: 40,
                            color: Palette.primaryColor,
                          )),
                      HomePageContainer(
                        text: 'Transfer to telebirr',
                        iconData: Image.asset(
                          Consts.telebirrLogo,
                          width: 60,
                          height: 50,
                        ),
                      ),
                      HomePageContainer(
                        text: 'Ethiopian Airlines',
                        iconData: Image.asset(
                          Consts.ethiopianAirlinesLogo,
                          width: 60,
                          height: 50,
                        ),
                      ),
                      const HomePageContainer(
                        text: 'Airtime Top-up',
                        iconData: FaIcon(
                          FontAwesomeIcons
                              .simCard, // Bank transfer icon
                          size: 50,
                          color:Palette.primaryColor,
                        ),
                      ),
                      const HomePageContainer(
                        text: 'ATM Withdrawal',
                        iconData: FaIcon(
                          FontAwesomeIcons.moneyCheck, // Bank transfer icon
                          size: 40,
                          color: Palette.primaryColor,
                        )
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3), // Subtle shadow
                spreadRadius: 2,
                blurRadius: 4,
                offset: const Offset(0, -3),
              ),
            ],
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType
                .fixed, // Prevent height or space changes
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.swap_horiz),
                label: 'Transfer',
              ),
              BottomNavigationBarItem(
                icon: FaIcon(
                  FontAwesomeIcons.clipboard,
                ),
                label: 'Utilities',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.receipt),
                label: 'Transaction',
              ),
            ],
            currentIndex: _selectedIndex,
            iconSize: 35,
            onTap: _onItemTapped,
            selectedItemColor: Palette.primaryColor,
            unselectedItemColor: Palette.primaryColor,
            selectedLabelStyle: const TextStyle(
              color: Colors.black, // Forces the label color to black
              fontWeight: FontWeight.bold,
            ),
            unselectedLabelStyle: const TextStyle(
              color: Colors.grey,
            ),
            backgroundColor: Palette.whiteColor,
            showUnselectedLabels: true,
          ),
        ));
  }
}
