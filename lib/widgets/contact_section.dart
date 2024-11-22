import 'package:flutter/material.dart';
import 'package:sami_4th_task/constants/size.dart';
import 'package:sami_4th_task/constants/sns_links.dart';
import 'package:sami_4th_task/constants/colors.dart';
import 'custom_text_field.dart';
import 'dart:js' as js;

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 40, 25, 60),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [CustomColor.bgLight1, CustomColor.bgLight2],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(35),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Contact Me",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
              color: CustomColor.whitePrimary,
            ),
          ),
          const SizedBox(height: 30),
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 700,
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth >= kMinDesktopWidth) {
                  return buildNameEmailFieldDesktop();
                }
                return buildNameEmailFieldMobile();
              },
            ),
          ),
          const SizedBox(height: 20),
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 700,
            ),
            child: CustomTextField(
              hintText: "Your message",
              maxLines: 8,
            ),
          ),
          const SizedBox(height: 20),
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 700,
            ),
            child: SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: CustomColor.yellowPrimary,
                  foregroundColor: CustomColor.bgLight1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 5,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Message sent!"),
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: CustomColor.yellowPrimary,
                    ),
                  );
                },
                child: const Text(
                  "Send Message",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 300,
            ),
            child: const Divider(
              color: CustomColor.whiteSecondary,
              thickness: 1.5,
            ),
          ),
          const SizedBox(height: 15),
          Wrap(
            spacing: 15,
            runSpacing: 15,
            alignment: WrapAlignment.center,
            children: [
              buildSNSIcon("assets/github.png", SnsLinks.github, "GitHub"),
              buildSNSIcon(
                  "assets/linkedin.png", SnsLinks.linkedIn, "LinkedIn"),
              buildSNSIcon(
                  "assets/instagram.png", SnsLinks.instagram, "Instagram"),
            ],
          ),
        ],
      ),
    );
  }

  Row buildNameEmailFieldDesktop() {
    return Row(
      children: [
        Flexible(
          child: CustomTextField(
            hintText: "Your name",
          ),
        ),
        const SizedBox(width: 20),
        Flexible(
          child: CustomTextField(
            hintText: "Your email",
          ),
        ),
      ],
    );
  }

  Column buildNameEmailFieldMobile() {
    return Column(
      children: [
        CustomTextField(
          hintText: "Your name",
        ),
        const SizedBox(height: 20),
        CustomTextField(
          hintText: "Your email",
        ),
      ],
    );
  }

  InkWell buildSNSIcon(String asset, String url, String tooltip) {
    return InkWell(
      onTap: () {
        js.context.callMethod('open', [url]);
      },
      child: Tooltip(
        message: tooltip,
        child: Image.asset(
          asset,
          width: 32,
        ),
      ),
    );
  }
}
