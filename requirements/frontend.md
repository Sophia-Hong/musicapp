# Frontend Development Plan

## 현재 파일 구조

lib/
├── main.dart                 # 앱 진입점
├── app.dart                  # 앱 설정 및 라우팅
├── core/                     # 핵심 유틸리티 및 상수
│   ├── constants/
│   │   ├── app_colors.dart      # 앱 전역 색상
│   │   └── app_typography.dart  # 텍스트 스타일
│   └── utils/
│       └── duration_formatter.dart  # 시간 포맷 유틸리티
├── models/                   # 데이터 모델
│   ├── track.dart              # 음악 트랙 모델
│   ├── playlist.dart           # 플레이리스트 모델
│   └── artist.dart             # 아티스트 모델
├── services/                 # 비즈니스 로직 서비스
│   └── audio_service.dart      # 오디오 재생 서비스
├── views/                    # UI 화면
│   ├── home/
│   │   ├── home_view.dart         # 홈 화면
│   │   └── widgets/
│   │       ├── playlist_section.dart  # 플레이리스트 섹션
│   │       ├── genre_section.dart     # 장르 섹션
│   │       └── mini_player.dart       # 미니 플레이어
│   └── player/
│       ├── player_view.dart        # 음악 재생 화면
│       └── widgets/
│           ├── player_controls.dart   # 재생 컨트롤
│           └── track_progress.dart    # 진행바
└── viewmodels/              # 뷰모델 (상태 관리)
    ├── home_viewmodel.dart     # 홈 화면 뷰모델
    └── player_viewmodel.dart   # 플레이어 뷰모델

## 개발 단계별 작업 계획

### 1단계: 프로젝트 초기 설정 ✅
- Flutter 프로젝트 생성 및 기본 구조 설정 ✅
- 필요한 패키지 추가 ✅
  - just_audio: 오디오 재생
  - provider: 상태 관리
  - cached_network_image: 이미지 캐싱
- 기본 테마 및 색상 설정 (Cupertino 스타일) ✅
- MVVM 아키텍처 기본 구조 구현 ✅

### 2단계: 데이터 모델 구현 ✅
- Track 모델 구현 ✅
- Playlist 및 Artist 모델 구현 ✅
- 오디오 서비스 인터페이스 정의 ✅
- 테스트용 더미 데이터 생성 ✅

### 3단계: 홈 화면 구현 ✅
- HomeViewModel 구현 ✅
  - 플레이리스트 및 장르 데이터 관리 ✅
  - 현재 재생 중인 트랙 상태 관리 ✅
- HomeView 구현 ✅
  - CupertinoScrollbar 적용 ✅
  - 플레이리스트 섹션 위젯 ✅
  - 장르별 분류 섹션 위젯 ✅
- 미니 플레이어 구현 ✅
  - 하단 고정 위치 ✅
  - 현재 재생 트랙 정보 표시 ✅
  - 기본 컨트롤 버튼 ✅

### 4단계: 음악 재생 화면 구현 ✅
- PlayerViewModel 구현 ✅
  - 재생 상태 관리 ✅
  - 트랙 진행 상태 관리 ✅
  - 반복/셔플 모드 관리 ✅
- PlayerView 구현 ✅
  - 앨범 커버 이미지 표시 ✅
  - CupertinoSlider 진행 바 ✅
  - 재생 컨트롤 버튼 ✅
  - 트랙 정보 표시 ✅

### 5단계: 상태 관리 및 통합 ✅
- ViewModel 간 상태 동기화 ✅
  - AudioStateManager 구현 ✅
  - HomeViewModel 수정 ✅
  - PlayerViewModel 수정 ✅
- 화면 전환 애니메이션 ✅
- 전역 상태 관리 최적화 ✅

### 6단계: UI 폴리싱 및 테스트 ✅
- 디자인 일관성 검토 ✅
- 애니메이션 개선 ✅
- 사용성 테스트 ✅
- 성능 최적화 ✅

## 성능 최적화 전략
- 이미지 캐싱 구현  ```dart
  CachedNetworkImage(
    imageUrl: track.albumArtUrl,
    placeholder: (context, url) => CupertinoActivityIndicator(),
  )  ```
- ListView.builder 활용
- 상태 관리 최적화
- dispose 처리

## 테스트 계획
- 단위 테스트: ViewModel 로직
- 위젯 테스트: UI 컴포트
- 통합 테스트: 전체 플로우