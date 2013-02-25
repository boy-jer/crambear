## In a real app you will probably want to separate components into different files
## They are grouped together here for ease of exposition

App.NavbarController = Ember.ObjectController.extend
  authStateBinding: Ember.Binding.oneWay 'App.LoginStateManager.currentState'
  authState: null,
  authenticated: (->
    log.info "NavbarController authent"
    @.get("authState") == App.LoginStateManager.authenticated
  ).property("authState")
  #logout event can be captured here, but seems recommended thing is to
  #capture events in routes.  also not obvious how to change pages from controllers
  logout: ->
    log.info "NavbarController handling logout event..."
    me = @
    App.logout -> me.transitionToRoute "home"


App.WelcomeMsgController = Ember.ObjectController.extend
  authStateBinding: Ember.Binding.oneWay 'App.LoginStateManager.currentState'
  authState: null,
  user: (->
    if @.get("authState") == App.LoginStateManager.authenticated
      App.currentUser
    else
      null
  ).property("authState")

#App.SetController = Ember.ObjectController.extend {}


App.StudyController = Ember.ArrayController.extend
  setupController: ->
    controller.set 'content', set.get('cards')
    #get study order
      # filter cards
      # randomize cards
  order: []
  currentCard: null