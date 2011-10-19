Treehouse.Views.Messages ||= {}

class Treehouse.Views.Messages.IndexView extends Backbone.View
  template: JST["backbone/templates/messages/index"]
    
  initialize: () ->
    _.bindAll(this, 'addOne', 'addAll', 'render')
    
    @options.messages.bind('reset', @addAll)
   
  addAll: () ->
    @options.messages.each(@addOne)
  
  addOne: (message) ->
    view = new Treehouse.Views.Messages.MessageView({model : message})
    @$("#messages-index").append(view.render().el)
       
  render: ->
    $(@el).html(@template(messages: @options.messages.toJSON() ))
    @addAll()
    
    return this