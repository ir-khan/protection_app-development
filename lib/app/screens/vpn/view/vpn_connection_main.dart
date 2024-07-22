import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:protection_app/app/core/constants/colors.dart';
import 'package:protection_app/app/core/constants/strings.dart';
import 'package:protection_app/app/core/custom/custom_appbar.dart';
import 'package:protection_app/app/core/navigation_helper/navigation_helper.dart';

class VpnConnectionMain extends StatelessWidget {
  const VpnConnectionMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(AppStrings.serverLocations),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Image(image: AssetImage('assets/images/vpn.png')),
              const SizedBox(height: 20),
              const Text(
                  'Ensure your browsing remains private with VPN Secure Connection',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: TextColors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  )),
              const SizedBox(height: 20),
              const Text(
                  "A VPN creates a secure, private tunnel between your phone and the internet, making data interception highly difficult.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: TextColors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  )),
              const Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  fixedSize: Size(MediaQuery.of(context).size.width * 0.8, 60),
                ),
                onPressed: () {
                  Navigation.push(page: const VpnConnectionEnable());
                },
                child: const Text(
                  'Next',
                  style: TextStyle(
                    color: TextColors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class VpnConnectionEnable extends StatelessWidget {
  const VpnConnectionEnable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(AppStrings.serverLocations),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Image(image: AssetImage('assets/images/enable.png')),
              const SizedBox(height: 20),
              const Text("Enable VPN Secure Connection",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: TextColors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  )),
              const SizedBox(height: 20),
              const Text(
                  "Utilize your new VPN for confident banking and shopping.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: TextColors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  )),
              const Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  fixedSize: Size(MediaQuery.of(context).size.width * 0.8, 60),
                ),
                onPressed: () {
                  Navigation.push(page: const VpnConnectionActive());
                },
                child: const Text(
                  'Active',
                  style: TextStyle(
                    color: TextColors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class VpnConnectionActive extends StatelessWidget {
  const VpnConnectionActive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(AppStrings.serverLocations),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Image(image: AssetImage('assets/images/vpn.png')),
              const SizedBox(height: 20),
              // const Text("VPN Secure Connection is active",
              //     textAlign: TextAlign.center,
              //     style: TextStyle(
              //       color: TextColors.white,
              //       fontSize: 24,
              //       fontWeight: FontWeight.w700,
              //     )),
              const SizedBox(height: 20),

              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  text: 'VPN Secure Connection is ',
                  style: TextStyle(
                    color: TextColors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'active',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        )),
                  ],
                ),
              ),

              const SizedBox(height: 20),
              const Text(
                  "Enjoy enhanced privacy and a secure connection for your banking and shopping activities.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: TextColors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  )),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigation.push(page: const VpnConnectionSelectServer());
                },
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: const Card(
                    color: AppColors.darkGrey,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Your current location seems to others as:',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: TextColors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: const CircleAvatar(
                                backgroundImage: NetworkImage(
                                  "https://media.istockphoto.com/id/1144879597/tr/vektör/türkiye-kare-bayrağı-simgesi.jpg?s=612x612&w=0&k=20&c=6ycOo2BEMYlE2d9PmRq_ovviOd1XBxHkuqUEvo-kTnc=",
                                ),
                              ),
                              title: const Text(
                                'South Africa, Johannesburg',
                                style: TextStyle(
                                  color: TextColors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              subtitle: Text(
                                'Fastest Location',
                                style: TextStyle(
                                  color: TextColors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: const Card(
                  color: AppColors.darkGrey,
                  child: Padding(
                    padding: EdgeInsets.only(top: 10, left: 20.0, bottom: 10),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'IP Adress:',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: TextColors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Virtual IP Adress: 93.38.152.125',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: TextColors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Your real location is hidden.',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.secondary,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  fixedSize: Size(MediaQuery.of(context).size.width * 0.8, 60),
                ),
                onPressed: () {},
                child: const Text(
                  'Disable',
                  style: TextStyle(
                    color: TextColors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class VpnConnectionSelectServer extends StatelessWidget {
  const VpnConnectionSelectServer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Server Location'),
      body: Expanded(
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Card(
              color: AppColors.darkGrey,
              child: ListTile(
                leading: CircleAvatar(),
                title: Text(
                  'Server $index',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
