import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../home/home_view.dart';

class PlayerView extends StatelessWidget {
  const PlayerView({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.black,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              CupertinoColors.black,
              Color(0xFF1C1C1E),
              Color(0xFF1C1C1E),
            ],
            stops: const [0.0, 0.3, 1.0],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header with back button and title
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Icon(
                        CupertinoIcons.chevron_left,
                        color: CupertinoColors.white,
                        size: 28,
                      ),
                    ),
                    const Expanded(
                      child: Center(
                        child: Text(
                          '재생 중',
                          style: TextStyle(
                            color: CupertinoColors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 44), // Balance with back button
                  ],
                ),
              ),
              
              // Album Art
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      height: MediaQuery.of(context).size.width * 0.85,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: CupertinoColors.black.withOpacity(0.3),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: CachedNetworkImage(
                        imageUrl: 'https://i.ytimg.com/vi/Ws5rz3-AvBU/hqdefault.jpg',
                        fit: BoxFit.cover,
                        placeholder: (context, url) => const Center(
                          child: CupertinoActivityIndicator(
                            color: CupertinoColors.white,
                          ),
                        ),
                        errorWidget: (context, url, error) => Container(
                          color: CupertinoColors.systemGrey6,
                          child: const Center(
                            child: Icon(
                              CupertinoIcons.music_note,
                              color: CupertinoColors.white,
                              size: 64,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Column(
                      children: [
                        const Text(
                          'APT.',
                          style: TextStyle(
                            color: CupertinoColors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'ROSÉ',
                          style: TextStyle(
                            color: CupertinoColors.white.withOpacity(0.6),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              
              // Progress Bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    Container(
                      height: 2,
                      decoration: BoxDecoration(
                        color: CupertinoColors.systemGrey6,
                        borderRadius: BorderRadius.circular(1),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            decoration: BoxDecoration(
                              color: CupertinoColors.white,
                              borderRadius: BorderRadius.circular(1),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '00:00',
                          style: TextStyle(
                            color: CupertinoColors.white.withOpacity(0.6),
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          '03:30',
                          style: TextStyle(
                            color: CupertinoColors.white.withOpacity(0.6),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              
              // Controls
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        child: const Icon(
                          CupertinoIcons.backward_fill,
                          color: Color(0xFF8B46FF),
                          size: 35,
                        ),
                      ),
                      Container(
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(
                          color: const Color(0xFF8B46FF),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF8B46FF).withOpacity(0.3),
                              blurRadius: 12,
                              spreadRadius: 2,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Center(
                          child: CupertinoButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            child: const Padding(
                              padding: EdgeInsets.only(left: 2),
                              child: Icon(
                                CupertinoIcons.play_fill,
                                color: CupertinoColors.white,
                                size: 42,
                              ),
                            ),
                          ),
                        ),
                      ),
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        child: const Icon(
                          CupertinoIcons.forward_fill,
                          color: Color(0xFF8B46FF),
                          size: 35,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              // Add CustomNavigationBar
              const CustomNavigationBar(),
            ],
          ),
        ),
      ),
    );
  }
} 