JazzyTodo.Router.map(function() {
  this.resource('todos', { path: '/' }, function() {
    this.route('active');
    this.route('completed')
  });
});

JazzyTodo.TodosRoute = Ember.Route.extend({
   model: function() {
    return this.store.find('todo');
   }
});

JazzyTodo.TodosIndexRoute = Ember.Route.extend({
  model: function() {
    return this.modelFor('todos');
  }
});

JazzyTodo.TodosActiveRoute = Ember.Route.extend({
  model: function() {
    return this.store.filter('todo', function(todo) {
      return !todo.get('isCompleted');
    });
  },
  renderTemplate: function(controller) {
    this.render('todos/index', {controller: controller});
  }
});

JazzyTodo.TodosCompletedRoute = Ember.Route.extend({
  model: function() {
    return this.store.filter('todo', function(todo) {
      return todo.get('isCompleted');
    });
  },
  renderTemplate: function(controller) {
    this.render('todos/index', {controller: controller})
  }
});