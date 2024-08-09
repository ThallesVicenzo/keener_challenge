enum NamedRoutes {
  welcome('/welcome'),
  signUp('/sign-up'),
  login('/login'),
  home('/home'),

  defaultError('/error');

  final String route;

  const NamedRoutes(this.route);
}
