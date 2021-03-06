App.CardSetsNewController = Em.ObjectController.extend

  startEditing: ->
    #create a new record on a local transaction
    @transaction = @get('store').transaction();
    @set 'content', @transaction.createRecord(App.CardSet, {})

  stopEditing: ->
    #rollback the local transaction if it hasn't already been cleared
    if @transaction
      @transaction.rollback()
      @transaction = null

  save: ->
    log.log "save"
    @transaction.commit();
    @transaction = null;

  transitionAfterSave: ->
    log.log "trans after save"
    @transitionToRoute 'card_sets'  #TODO

  cancel: ->
    log.log "cancel"
    @stopEditing()
    @transitionToRoute 'card_sets'

