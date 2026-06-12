import '../models/post_model.dart';
import '../models/user_model.dart';
import '../models/attachment_model.dart';

List<Post> mockPosts = [

  // =================================================
  // 🔥 INTERNSHIP REPORT
  // =================================================

  Post(
    id: 1,
    title: "📢 Internship Report",
    content: "Submit your report before May 15.",

    author: User(
      id: 1,
      name: "Teacher",
      surname: "A",
      userCode: "T001",
      role: UserRole.teacher,
      avatarUrl: "https://i.pravatar.cc/150?img=1",
    ),

    createdAt: DateTime.now().subtract(
      const Duration(hours: 2),
    ),

    deadline: DateTime.now().add(
      const Duration(days: 3),
    ),

    acknowledgedCount: 12,
    isAcknowledged: false,

    attachments: [
      Attachment(
        id: 1,
        url: "https://picsum.photos/400",
        type: "image",
      ),
    ],
  ),

  // =================================================
  // 🔥 MIDTERM
  // =================================================

  Post(
    id: 2,
    title: "📚 Midterm Schedule",

    content:
        "Midterm exams start next week. Check your timetable.",

    author: User(
      id: 2,
      name: "Admin",
      surname: "C",
      userCode: "A001",
      role: UserRole.admin,
      avatarUrl: "https://i.pravatar.cc/150?img=3",
    ),

    createdAt: DateTime.now().subtract(
      const Duration(hours: 5),
    ),

    deadline: DateTime.now().add(
      const Duration(days: 7),
    ),

    acknowledgedCount: 3,
    isAcknowledged: false,

    attachments: [],
  ),

  // =================================================
  // 🔥 SEMINAR
  // =================================================

  Post(
    id: 3,
    title: "🎓 Seminar Announcement",

    content:
        "Join our AI seminar this Friday at 10 AM.",

    author: User(
      id: 3,
      name: "Teacher",
      surname: "D",
      userCode: "T003",
      role: UserRole.teacher,
      avatarUrl: "https://i.pravatar.cc/150?img=4",
    ),

    createdAt: DateTime.now().subtract(
      const Duration(days: 1),
    ),

    deadline: DateTime.now().add(
      const Duration(hours: 18),
    ),

    acknowledgedCount: 7,
    isAcknowledged: false,

    attachments: [
      Attachment(
        id: 3,
        url: "https://picsum.photos/401",
        type: "image",
      ),
    ],
  ),

  // =================================================
  // 🔥 DOCUMENTS REQUIRED
  // =================================================

  Post(
    id: 4,
    title: "📄 Documents Required",

    content:
        "1. ID Card\n2. Transcript\n3. Resume",

    author: User(
      id: 4,
      name: "Teacher",
      surname: "B",
      userCode: "T002",
      role: UserRole.teacher,
      avatarUrl: "https://i.pravatar.cc/150?img=2",
    ),

    createdAt: DateTime.now().subtract(
      const Duration(days: 1),
    ),

    deadline: DateTime.now().subtract(
      const Duration(hours: 5),
    ),

    acknowledgedCount: 5,
    isAcknowledged: true,

    attachments: [
      Attachment(
        id: 4,
        url: "https://example.com/file.pdf",
        type: "file",
        name: "requirements.pdf",
        fileSize: 204800,
      ),
    ],
  ),

  // =================================================
  // 🔥 HOLIDAY NOTICE
  // =================================================

  Post(
    id: 5,
    title: "📢 Holiday Notice",

    content:
        "University will be closed next Monday.",

    author: User(
      id: 5,
      name: "Admin",
      surname: "E",
      userCode: "A002",
      role: UserRole.admin,
      avatarUrl: "https://i.pravatar.cc/150?img=5",
    ),

    createdAt: DateTime.now().subtract(
      const Duration(days: 2),
    ),

    deadline: DateTime.now().add(
      const Duration(days: 10),
    ),

    acknowledgedCount: 20,
    isAcknowledged: true,

    attachments: [],
  ),

  // =================================================
  // 🔥 LAB SCHEDULE
  // =================================================

  Post(
    id: 6,
    title: "🧪 Lab Schedule",

    content:
        "Lab sessions updated. Please check the new timetable.",

    author: User(
      id: 6,
      name: "Teacher",
      surname: "F",
      userCode: "T004",
      role: UserRole.teacher,
      avatarUrl: "https://i.pravatar.cc/150?img=6",
    ),

    createdAt: DateTime.now().subtract(
      const Duration(days: 3),
    ),

    deadline: DateTime.now().add(
      const Duration(days: 1),
    ),

    acknowledgedCount: 9,
    isAcknowledged: true,

    attachments: [
      Attachment(
        id: 6,
        url: "https://picsum.photos/402",
        type: "image",
      ),
    ],
  ),

  // =================================================
  // 🔥 LONG POST
  // =================================================

  Post(
    id: 7,
    title:
        "📢 Important Internship Guidelines",

    content: """
All students are required to strictly follow the internship guidelines provided by the faculty.

1. Attendance must be recorded daily.
2. Weekly reports must be submitted every Friday before 5 PM.
3. Students must dress professionally at all times.
4. Any absence must be reported in advance.

Failure to comply with these rules may result in grade penalties or disqualification from the internship program.

If you have any questions, please contact your assigned advisor immediately.

Thank you for your cooperation.
""",

    author: User(
      id: 7,
      name: "Admin",
      surname: "Long",
      userCode: "A003",
      role: UserRole.admin,
      avatarUrl: "https://i.pravatar.cc/150?img=7",
    ),

    createdAt: DateTime.now().subtract(
      const Duration(hours: 10),
    ),

    deadline: DateTime.now().add(
      const Duration(days: 5),
    ),

    acknowledgedCount: 2,
    isAcknowledged: false,

    attachments: [],
  ),

  // =================================================
  // 🔥 ROBOTICS WORKSHOP
  // =================================================

  Post(
    id: 8,
    title:
        "🤖 Robotics Workshop Highlights",

    content:
        "Thank you everyone for joining our Robotics Workshop 2026! Here are some event highlights.",

    author: User(
      id: 8,
      name: "Engineering",
      surname: "Faculty",
      userCode: "ENG001",
      role: UserRole.teacher,
      avatarUrl: "https://i.pravatar.cc/150?img=8",
    ),

    createdAt: DateTime.now().subtract(
      const Duration(hours: 1),
    ),

    deadline: DateTime.now().add(
      const Duration(days: 2),
    ),

    acknowledgedCount: 45,
    isAcknowledged: false,

    attachments: [
      Attachment(
        id: 81,
        url:
            "https://picsum.photos/id/1015/800/600",
        type: "image",
      ),

      Attachment(
        id: 82,
        url:
            "https://picsum.photos/id/1016/800/600",
        type: "image",
      ),

      Attachment(
        id: 83,
        url:
            "https://picsum.photos/id/1018/800/600",
        type: "image",
      ),

      Attachment(
        id: 84,
        url:
            "https://picsum.photos/id/1020/800/600",
        type: "image",
      ),

      Attachment(
        id: 85,
        url:
            "https://picsum.photos/id/1024/800/600",
        type: "image",
      ),
    ],
  ),

  // =================================================
  // 🔥 SPORTS DAY
  // =================================================

  Post(
    id: 9,
    title: "🏀 Sports Day 2026",

    content:
        "Sports day was amazing! Thank you all students and staff for participating 🎉",

    author: User(
      id: 9,
      name: "Student",
      surname: "Council",
      userCode: "SC001",
      role: UserRole.admin,
      avatarUrl: "https://i.pravatar.cc/150?img=9",
    ),

    createdAt: DateTime.now().subtract(
      const Duration(hours: 4),
    ),

    deadline: DateTime.now().add(
      const Duration(days: 4),
    ),

    acknowledgedCount: 120,
    isAcknowledged: false,

    attachments: [
      Attachment(
        id: 91,
        url:
            "https://picsum.photos/id/1031/800/600",
        type: "image",
      ),

      Attachment(
        id: 92,
        url:
            "https://picsum.photos/id/1032/800/600",
        type: "image",
      ),

      Attachment(
        id: 93,
        url:
            "https://picsum.photos/id/1033/800/600",
        type: "image",
      ),

      Attachment(
        id: 94,
        url:
            "https://picsum.photos/id/1035/800/600",
        type: "image",
      ),

      Attachment(
        id: 95,
        url:
            "https://picsum.photos/id/1037/800/600",
        type: "image",
      ),
    ],
  ),

  // =================================================
  // 🔥 GRADUATION
  // =================================================

  Post(
    id: 10,
    title: "🎓 Graduation Ceremony",

    content:
        "Congratulations to all graduates! 🎓 Here are memorable moments from the ceremony.",

    author: User(
      id: 10,
      name: "University",
      surname: "Media",
      userCode: "MEDIA01",
      role: UserRole.admin,
      avatarUrl: "https://i.pravatar.cc/150?img=10",
    ),

    createdAt: DateTime.now().subtract(
      const Duration(days: 1),
    ),

    deadline: DateTime.now().add(
      const Duration(days: 14),
    ),

    acknowledgedCount: 542,
    isAcknowledged: false,

    attachments: List.generate(
      15,
      (index) => Attachment(
        id: 100 + index,
        url:
            "https://picsum.photos/seed/graduation$index/800/600",
        type: "image",
      ),
    ),
  ),
];