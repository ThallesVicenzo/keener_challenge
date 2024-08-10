enum NamedRoutes {
  welcome('/welcome'),
  signUp('/sign-up'),
  login('/login'),
  home('/home'),
  addTask('/add-task'),
  editTask('/edit-task'),

  defaultError('/error');

  final String route;

  const NamedRoutes(this.route);
}
