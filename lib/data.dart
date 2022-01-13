class User {
  final String username;
  final String profileImageUrl;
  final String subscribers;

  const User({
    required this.username,
    required this.profileImageUrl,
    required this.subscribers,
  });
}

const User currentUser = User(
  username: 'Motasim Fuad',
  profileImageUrl: 'https://avatars.githubusercontent.com/u/72114794?v=4',
  subscribers: '100K',
);

class Video {
  final String id;
  final User author;
  final String title;
  final String thumbnailUrl;
  final String duration;
  final DateTime timestamp;
  final String viewCount;
  final String likes;
  final String dislikes;

  const Video({
    required this.id,
    required this.author,
    required this.title,
    required this.thumbnailUrl,
    required this.duration,
    required this.timestamp,
    required this.viewCount,
    required this.likes,
    required this.dislikes,
  });
}

final List<Video> videos = [
  Video(
    id: 'x606y4QWrxo',
    author: currentUser,
    title: 'Hello from Fuad!  | Web and App developer!',
    thumbnailUrl:
        'https://camo.githubusercontent.com/f6ff07466c61cb8bea52b1752b692e23a249d819c59607d419b535015e66637d/68747470733a2f2f36342e6d656469612e74756d626c722e636f6d2f32643061663963393064316231313037333133636332306264613031353438612f74756d626c725f6f757477786e616e7070317537396f326c6f315f313238302e67696676',
    duration: '8:20',
    timestamp: DateTime(2020, 11, 20),
    viewCount: '10K',
    likes: '958',
    dislikes: '4',
  ),
  Video(
    author: currentUser,
    id: 'vrPk6LB9bjo',
    title: 'Food delivery app with flutter | UI challange',
    thumbnailUrl:
        'https://camo.githubusercontent.com/b0417ca4688736e7a70fcb0c840bc6f891b4ca6aecbf8725a4d01ff72e2f385a/68747470733a2f2f63646e2e6472696262626c652e636f6d2f75736572732f313338373832372f73637265656e73686f74732f31343735343932392f6d656469612f38353539343633646139326633396462653866373763393030636130336530302e706e67',
    duration: '22:06',
    timestamp: DateTime(2021, 2, 26),
    viewCount: '8K',
    likes: '485',
    dislikes: '8',
  ),
  Video(
    id: 'ilX5hnH8XoI',
    author: currentUser,
    title: 'Flutter project with the implementation of GetX state management',
    thumbnailUrl:
        'https://camo.githubusercontent.com/aca1a12fe4ffde72cc7265f4e8b198f35dade7fa786a4502d341349376efb4b7/68747470733a2f2f63646e2e6472696262626c652e636f6d2f75736572732f323434363735362f73637265656e73686f74732f353039373136342f6d656469612f34613437383932356636313535666665363139393334393039653130363634392e706e67',
    duration: '10:53',
    timestamp: DateTime(2020, 7, 12),
    viewCount: '18K',
    likes: '1k',
    dislikes: '4',
  ),
];

final List<Video> suggestedVideos = [
  Video(
    id: 'rJKN_880b-M',
    author: currentUser,
    title: 'Flutter Game Store | UI Project',
    thumbnailUrl:
        'https://camo.githubusercontent.com/ae838e8baf9de4af9e8952425d47a90514954674197cd42a25ca4d3b61c90f8c/68747470733a2f2f63646e2e6472696262626c652e636f6d2f75736572732f343630313333372f73637265656e73686f74732f31343933303331392f6d656469612f65363736306139323138333931616130346130366231613838633263623037382e706e673f636f6d70726573733d3126726573697a653d313230307839303026766572746963616c3d746f70',
    duration: '1:13:15',
    timestamp: DateTime(2021, 8, 22),
    viewCount: '32K',
    likes: '1.9k',
    dislikes: '7',
  ),
  Video(
    id: 'HvLb5gdUfDE',
    author: currentUser,
    title: 'Flutter Job Finder | github/motasimfuad',
    thumbnailUrl:
        'https://camo.githubusercontent.com/d237d1ce684f30f5492f829c078665da820c245c057c355c232bd05869123705/68747470733a2f2f63646e2e6472696262626c652e636f6d2f75736572732f323039303633382f73637265656e73686f74732f31313837333839342f6d656469612f63363566363032393130393131343034663331386238626664346566633263662e706e67',
    duration: '1:52:12',
    timestamp: DateTime(2020, 8, 7),
    viewCount: '190K',
    likes: '9.3K',
    dislikes: '45',
  ),
  Video(
    id: 'h-igXZCCrrc',
    author: currentUser,
    title: 'Flutter travel app UI | Apps From Scratch',
    thumbnailUrl:
        'https://camo.githubusercontent.com/b7e8487b04974971682dce87157ea9eff71616cfa455d797a120ff10dc4d0d7a/68747470733a2f2f63646e2e6472696262626c652e636f6d2f75736572732f323133373635322f73637265656e73686f74732f363531303532312f74726176656c5f6170705f5f6261636b67726f756e645f2e706e67',
    duration: '1:03:58',
    timestamp: DateTime(2019, 10, 17),
    viewCount: '3K',
    likes: '2k',
    dislikes: '85',
  ),
];
