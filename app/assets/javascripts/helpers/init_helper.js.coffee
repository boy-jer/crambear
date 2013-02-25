App.initApp = (currentUser) ->
  initConsts()
  initHelperMethods()
  App.initCurrentUser currentUser
  App.LoginStateManager.transitionTo 'authenticated' if App.currentUser


App.initCurrentUser = (currentUser) ->
  log.info "current user: ", currentUser
  App.currentUser =  currentUser if currentUser?.email

initConsts = ->
  App.urls ||= {}
  App.urls.login = "/users/sign_in.json"
  App.urls.register = "/users.json"
  App.urls.logout = "/users/sign_out.json"

initHelperMethods = ->
  App.authenticated = ->
    App.LoginStateManager.get('currentState') == App.LoginStateManager.authenticated
