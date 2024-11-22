class ProjectUtils {
  final String image;
  final String title;
  final String subtitle;

  ProjectUtils({
    required this.image,
    required this.title,
    required this.subtitle,
  });
}

List<ProjectUtils> workProjectUtils = [
  ProjectUtils(
    image: 'assets/projects/w01.jpg',
    title: 'E-commerce application',
    subtitle: 'This is an e-commerce app for people to buy anything.',
  ),
  ProjectUtils(
    image: 'assets/projects/w03.jpg',
    title: 'Todo application',
    subtitle:
        'This is todo application in which you can add something, delete, update, read.',
  ),
  ProjectUtils(
    image: 'assets/projects/w02.jpg',
    title: 'Quiz app',
    subtitle:
        'This is a quiz app which have questions related to diff-diff categorys.',
  ),
];
