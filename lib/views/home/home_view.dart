import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../player/player_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.black,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.black.withOpacity(0.92),
        border: null,
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 8),
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                color: Color(0xFF8B46FF),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                CupertinoIcons.music_note,
                color: CupertinoColors.white,
                size: 18,
              ),
            ),
            const SizedBox(width: 8),
            const Text(
              'Music',
              style: TextStyle(
                color: CupertinoColors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        trailing: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CupertinoButton(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                onPressed: () {},
                child: const Icon(
                  CupertinoIcons.bell,
                  color: CupertinoColors.white,
                  size: 24,
                ),
              ),
              CupertinoButton(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                onPressed: () {},
                child: const Icon(
                  CupertinoIcons.search,
                  color: CupertinoColors.white,
                  size: 24,
                ),
              ),
              const SizedBox(width: 4),
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: const Color(0xFF8B46FF).withOpacity(0.9),
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Text(
                    'G',
                    style: TextStyle(
                      color: CupertinoColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              CupertinoColors.black,
              const Color(0xFF1C1C1E).withOpacity(0.98),
              const Color(0xFF1C1C1E),
            ],
            stops: const [0.0, 0.5, 1.0],
          ),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xFF8B46FF).withOpacity(0.02),
                    const Color(0xFF8B46FF).withOpacity(0.01),
                    CupertinoColors.black.withOpacity(0),
                  ],
                  stops: const [0.0, 0.3, 0.6],
                ),
              ),
            ),
            const SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: CustomScrollView(
                      slivers: [
                        SliverPadding(
                          padding: EdgeInsets.only(top: 16),
                          sliver: SliverToBoxAdapter(
                            child: CategoryTabs(),
                          ),
                        ),
                        SliverPadding(
                          padding: EdgeInsets.only(top: 32),
                          sliver: SliverToBoxAdapter(
                            child: PlaylistSection(
                              title: '인기 플레이리스트',
                              showMoreText: '모두 보기',
                            ),
                          ),
                        ),
                        SliverPadding(
                          padding: EdgeInsets.only(top: 40),
                          sliver: SliverToBoxAdapter(
                            child: PlaylistSection(
                              title: '추천 플레이리스트',
                              showMoreText: '모두 보기',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  MiniPlayer(),
                  CustomNavigationBar(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryTabs extends StatefulWidget {
  const CategoryTabs({super.key});

  @override
  State<CategoryTabs> createState() => _CategoryTabsState();
}

class _CategoryTabsState extends State<CategoryTabs> {
  final List<String> _tabs = ['운동', '에너지 충전', '팟캐스트', '행복한 기분'];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: _tabs.asMap().entries.map((entry) {
          final index = entry.key;
          final tab = entry.value;
          final isSelected = _selectedIndex == index;
          
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: CupertinoButton(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              color: isSelected 
                  ? const Color(0xFF8B46FF).withOpacity(0.15)
                  : CupertinoColors.systemGrey6.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
              onPressed: () => setState(() => _selectedIndex = index),
              child: Text(
                tab,
                style: TextStyle(
                  color: isSelected 
                      ? CupertinoColors.white
                      : CupertinoColors.white.withOpacity(0.5),
                  fontSize: 15,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class PlaylistSection extends StatefulWidget {
  final String title;
  final String showMoreText;

  const PlaylistSection({
    super.key,
    required this.title,
    required this.showMoreText,
  });

  @override
  State<PlaylistSection> createState() => _PlaylistSectionState();
}

class _PlaylistSectionState extends State<PlaylistSection> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Track> _playlists = [
    Track(
      id: '1',
      title: 'APT.',
      artist: 'ROSÉ',
      albumName: 'APT.',
      albumArt: 'https://i.ytimg.com/vi/Ws5rz3-AvBU/maxresdefault.jpg',
      url: 'https://music.youtube.com/watch?v=Ws5rz3-AvBU',
    ),
    Track(
      id: '2',
      title: 'I AM',
      artist: 'IVE',
      albumName: 'I AM',
      albumArt: 'https://i.ytimg.com/vi/F0B7HDiY-10/maxresdefault.jpg',
      url: 'https://music.youtube.com/watch?v=F0B7HDiY-10',
    ),
    Track(
      id: '3',
      title: 'Ditto',
      artist: 'NewJeans',
      albumName: 'Ditto',
      albumArt: 'https://i.ytimg.com/vi/Km71Rr9K-Bw/maxresdefault.jpg',
      url: 'https://music.youtube.com/watch?v=Km71Rr9K-Bw',
    ),
    Track(
      id: '4',
      title: 'UNFORGIVEN',
      artist: 'LE SSERAFIM',
      albumName: 'UNFORGIVEN',
      albumArt: 'https://i.ytimg.com/vi/UBURTj20HXI/maxresdefault.jpg',
      url: 'https://music.youtube.com/watch?v=UBURTj20HXI',
    ),
    Track(
      id: '5',
      title: 'Spicy',
      artist: 'aespa',
      albumName: 'Spicy',
      albumArt: 'https://i.ytimg.com/vi/Os_heh8vPfs/maxresdefault.jpg',
      url: 'https://music.youtube.com/watch?v=Os_heh8vPfs',
    ),
    Track(
      id: '6',
      title: 'Cupid',
      artist: 'FIFTY FIFTY',
      albumName: 'Cupid',
      albumArt: 'https://i.ytimg.com/vi/Qc7_zRjH808/maxresdefault.jpg',
      url: 'https://music.youtube.com/watch?v=Qc7_zRjH808',
    ),
    Track(
      id: '7',
      title: 'Queencard',
      artist: '(G)I-DLE',
      albumName: 'Queencard',
      albumArt: 'https://i.ytimg.com/vi/7HDeem-JaSY/maxresdefault.jpg',
      url: 'https://music.youtube.com/watch?v=7HDeem-JaSY',
    ),
    Track(
      id: '8',
      title: 'Shut Down',
      artist: 'BLACKPINK',
      albumName: 'Shut Down',
      albumArt: 'https://i.ytimg.com/vi/POe9SOEKotk/maxresdefault.jpg',
      url: 'https://music.youtube.com/watch?v=POe9SOEKotk',
    ),
    Track(
      id: '9',
      title: 'SET ME FREE',
      artist: 'TWICE',
      albumName: 'SET ME FREE',
      albumArt: 'https://i.ytimg.com/vi/w4cTYnOPdNk/maxresdefault.jpg',
      url: 'https://music.youtube.com/watch?v=w4cTYnOPdNk',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // Calculate grid item size based on screen width
    final screenWidth = MediaQuery.of(context).size.width;
    final gridItemSize = (screenWidth - (32 + 32)) / 3; // Account for padding and spacing
    final gridHeight = gridItemSize * 3 + 32; // 3 rows + spacing

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                  color: CupertinoColors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              widget.title == '인기 플레이리스트'
                  ? CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      child: const Icon(
                        CupertinoIcons.chevron_right,
                        color: CupertinoColors.systemGrey,
                        size: 20,
                      ),
                    )
                  : Container(
                      margin: const EdgeInsets.only(right: 4.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFF8B46FF).withOpacity(0.12),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: CupertinoButton(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 2,
                        ),
                        onPressed: () {},
                        child: const Text(
                          '모두듣기',
                          style: TextStyle(
                            color: CupertinoColors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: gridHeight,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _currentPage = index);
            },
            itemCount: (_playlists.length / 9).ceil(),
            itemBuilder: (context, pageIndex) {
              return GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 1, // Perfect square
                ),
                itemCount: 9,
                itemBuilder: (context, index) {
                  final itemIndex = pageIndex * 9 + index;
                  if (itemIndex >= _playlists.length) {
                    return const SizedBox.shrink();
                  }
                  return PlaylistCard(track: _playlists[itemIndex]);
                },
              );
            },
          ),
        ),
        if (_playlists.length > 9) // Only show dots if there are multiple pages
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                (_playlists.length / 9).ceil(),
                (index) => _buildPageDot(index),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildPageDot(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: 6,
      height: 6,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentPage == index
            ? CupertinoColors.white
            : CupertinoColors.systemGrey.withOpacity(0.5),
      ),
    );
  }
}

class Track {
  final String id;
  final String title;
  final String artist;
  final String albumName;
  final String albumArt;
  final String url;

  Track({
    required this.id,
    required this.title,
    required this.artist,
    required this.albumName,
    required this.albumArt,
    required this.url,
  });
}

class PlaylistCard extends StatelessWidget {
  final Track track;

  const PlaylistCard({
    super.key,
    required this.track,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Full Album Cover
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: CupertinoColors.systemGrey6,
          ),
          clipBehavior: Clip.antiAlias,
          child: CachedNetworkImage(
            imageUrl: track.albumArt,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            placeholder: (context, url) => const Center(
              child: CupertinoActivityIndicator(),
            ),
            errorWidget: (context, url, error) => const Icon(
              CupertinoIcons.music_note,
              color: CupertinoColors.white,
              size: 30,
            ),
          ),
        ),
        // Gradient Overlay
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                CupertinoColors.black.withOpacity(0),
                CupertinoColors.black.withOpacity(0.7),
              ],
              stops: const [0.0, 1.0],
            ),
          ),
        ),
        // Text Overlay
        Positioned(
          left: 8,
          right: 8,
          bottom: 8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                track.title,
                style: const TextStyle(
                  color: CupertinoColors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 2),
              Text(
                track.artist,
                style: TextStyle(
                  color: CupertinoColors.white.withOpacity(0.7),
                  fontSize: 12,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class MiniPlayer extends StatelessWidget {
  const MiniPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          CupertinoPageRoute(
            fullscreenDialog: true,
            builder: (context) => const PlayerView(),
          ),
        );
      },
      child: Container(
        height: 64,
        decoration: const BoxDecoration(
          color: Color(0xFF282828),
          border: Border(
            top: BorderSide(
              color: CupertinoColors.systemGrey6,
              width: 0.2,
            ),
          ),
        ),
        child: const Row(
          children: [
            SizedBox(width: 16),
            _AlbumArt(),
            Expanded(child: _TrackInfo()),
            _Controls(),
            SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}

class _AlbumArt extends StatelessWidget {
  const _AlbumArt();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: CachedNetworkImage(
        imageUrl: 'https://example.com/path/to/adam_levine_album.jpg', // Replace with actual URL
        width: 48,
        height: 48,
        fit: BoxFit.cover,
        placeholder: (context, url) => Container(
          color: CupertinoColors.systemGrey6,
          child: const CupertinoActivityIndicator(),
        ),
        errorWidget: (context, url, error) => Container(
          color: CupertinoColors.systemGrey6,
          child: const Icon(
            CupertinoIcons.music_note,
            color: CupertinoColors.white,
            size: 24,
          ),
        ),
      ),
    );
  }
}

class _TrackInfo extends StatelessWidget {
  const _TrackInfo();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'No One Else Like You',
            style: TextStyle(
              color: CupertinoColors.white.withOpacity(0.9),
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 2),
          Text(
            'Adam Levine',
            style: TextStyle(
              color: CupertinoColors.white.withOpacity(0.6),
              fontSize: 13,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class _Controls extends StatelessWidget {
  const _Controls();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {},
          child: const Icon(
            CupertinoIcons.tv,
            color: CupertinoColors.white,
            size: 24,
          ),
        ),
        const SizedBox(width: 8),
        CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {},
          child: const Icon(
            CupertinoIcons.play_fill,
            color: CupertinoColors.white,
            size: 28,
          ),
        ),
      ],
    );
  }
}

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      decoration: const BoxDecoration(
        color: CupertinoColors.black,
        border: Border(
          top: BorderSide(
            color: CupertinoColors.systemGrey6,
            width: 0.2,
          ),
        ),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _NavBarItem(
            icon: CupertinoIcons.house_fill,
            label: '홈',
            isSelected: true,
          ),
          _NavBarItem(
            icon: CupertinoIcons.play_circle,
            label: '실행',
          ),
          _NavBarItem(
            icon: CupertinoIcons.compass,
            label: '둘러보기',
          ),
          _NavBarItem(
            icon: CupertinoIcons.arrow_down_circle,
            label: '보관함',
          ),
        ],
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;

  const _NavBarItem({
    required this.icon,
    required this.label,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      onPressed: () {},
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected 
                ? const Color(0xFF8B46FF)
                : CupertinoColors.white.withOpacity(0.4),
            size: 26,
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: TextStyle(
              color: isSelected 
                  ? const Color(0xFF8B46FF)
                  : CupertinoColors.white.withOpacity(0.4),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
} 