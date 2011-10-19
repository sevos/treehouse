class Treehouse.Routers.MessagesRouter extends Backbone.Router
  initialize: (options) ->
    @messages = new Treehouse.Collections.MessagesCollection()
    @messages.reset options.messages

  routes:
    "/new"      : "newMessage"
    "/index"    : "index"
    ".*"        : "index"

  newMessage: ->
    @view = new Treehouse.Views.Messages.NewView(collection: @messages)
    $("#messages").html(@view.render().el)

  index: ->
    @view = new Treehouse.Views.Messages.IndexView(messages: @messages)
    $("#messages").html(@view.render().el)

  