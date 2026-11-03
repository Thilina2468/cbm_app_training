import 'package:flutter/material.dart';

class VerificationTile extends StatelessWidget {
  final IconData icon;
  final String heading;
  final String description;
  final bool isComplete;

  const VerificationTile({
    super.key,
    required this.heading,
    required this.description,
    required this.icon,
    required this.isComplete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: const Color.fromARGB(255, 143, 142, 142),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(7),
        child: Stack(
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color:
                        const Color.fromARGB(255, 100, 99, 99).withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icon,
                    size: 22,
                    color: const Color.fromARGB(255, 69, 48, 137),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        heading,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        description,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 77, 76, 76),
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Color.fromARGB(255, 31, 31, 32),
                  size: 16,
                ),
              ],
            ),
            if (isComplete)
              const Positioned(
                top: 0,
                right: 0,
                child: Text(
                  'Completed',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color.fromARGB(255, 69, 48, 137),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
