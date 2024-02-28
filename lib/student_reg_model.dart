class UserData {
  final String name;
  final String course;
  final int age;
  final int pincode;

  const UserData({
    required this.name,
    required this.course,
    required this.age,
    required this.pincode,
  });
}













//   factory UserData.fromForm(
//       String name, String course, String age, String pincode) {
//     return UserData(
//       name: name,
//       course: course,
//       age: int.tryParse(age) ?? 0,
//       pincode: int.tryParse(pincode) ?? 0,
//     );
//   }
// }
