class OnboardingContents {
  final int page;
  final String title;
  final String desc;
  final String image;

  OnboardingContents({
    required this.page,
    this.image = 'images/onboarding.jpg',
    this.title = 'Lorem Ipsum Kip Antares Lorem',
    this.desc = 'Lorem ipsum dolor sit amet consectetur. '
        'Congue eget aliquet nullam velit volutpat in viverra. '
        'Amet integer urna ornare congue ultrices at.',
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(page: 1),
  OnboardingContents(page: 2),
  OnboardingContents(page: 3),
];
