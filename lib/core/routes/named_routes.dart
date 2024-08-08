enum NamedRoutes {
  welcome('/welcome'),
  signUp('/sign-up'),
  login('/login'),
  home('/home');

  final String route;

  const NamedRoutes(this.route);
}
