import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OurTeamPage extends StatelessWidget {
  const OurTeamPage({Key? key}) : super(key: key);

  final List<_TeamMember> teamMembers = const [
    _TeamMember(
      name: 'Qusai',
      imageUrl: 'assets/images/qusai.png',
      linkedInUrl: 'https://www.linkedin.com/in/qusai-shergardwala-8a6404259/',
      quote: 'Boss ka mood predict karna aur stock market dono equally risky hain!',
    ),
    _TeamMember(
      name: 'Aarya Deshpande',
      imageUrl: 'assets/images/deshpande.png',
      linkedInUrl: 'https://www.linkedin.com/in/aaryadeshpande',
      quote: 'Meeting chal rahi hai ya sapno ki duniya? Koi toh batao!',
    ),
    _TeamMember(
      name: 'Arya Manve',
      imageUrl: 'assets/images/manve.png',
      linkedInUrl: 'https://www.linkedin.com/in/arya-manve-56a352283/',
      quote: 'Kaam ka naam sunte hi inka system crash ho jata hai!',
    ),
    _TeamMember(
      name: 'Ayush Bora',
      imageUrl: 'assets/images/bora.png',
      linkedInUrl: 'https://www.linkedin.com/in/ayushbora/',
      quote: 'Eh banda apni hi team ke WhatsApp group ka ‘forwarded many times’ hai!',
    ),
    _TeamMember(
      name: 'Vaibhav',
      imageUrl: 'assets/images/vaibhav.png',
      linkedInUrl: 'https://www.linkedin.com/in/vaibhavpujari',
      quote: 'Code likhne se zyada debugging aur gaaliyan likhne mein mahir!',
    ),
    _TeamMember(
      name: 'Vansh Bhatt',
      imageUrl: 'assets/images/vansh.png',
      linkedInUrl: 'https://www.linkedin.com/in/vansh-bhatt-aa9681300/',
      quote: 'Shakal se baccha, dimaag se bhi baccha, par galtiyan bade wali karta hai!',
    ),
    _TeamMember(
      name: 'Rushikesh ',
      imageUrl: 'assets/images/gaiker.png',
      linkedInUrl: 'https://www.linkedin.com/in/rushikeshgaikar444/',
      quote: 'Yeh insaan kaam se nahi, kaam ke vichar se hi thak jata hai!',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Developers',
          style: GoogleFonts.slackey(
            fontSize: 21,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  childAspectRatio: 0.8,
                ),
                itemCount: teamMembers.length,
                itemBuilder: (context, index) {
                  return _TeamMemberCard(member: teamMembers[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TeamMember {
  final String name;
  final String imageUrl;
  final String linkedInUrl;
  final String quote;

  const _TeamMember({
    required this.name,
    required this.imageUrl,
    required this.linkedInUrl,
    required this.quote,
  });
}

class _TeamMemberCard extends StatelessWidget {
  final _TeamMember member;

  const _TeamMemberCard({Key? key, required this.member}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: const Color.fromARGB(255, 5, 35, 78),
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 10,
              offset: Offset(2, 5),
            ),
          ],
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                member.imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 120,
              ),
              const SizedBox(height: 10),
              Text(
                member.name,
                style: GoogleFonts.slackey(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 6),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  member.quote,
                  style: GoogleFonts.afacad(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 10),
              IconButton(
                icon: Icon(FontAwesomeIcons.linkedin),
                color: Colors.white,
                onPressed: () async {
                  final url = member.linkedInUrl;
                  if (await canLaunchUrl(Uri.parse(url))) {
                    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}