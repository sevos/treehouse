class Treehouse.Routers.MessagesRouter extends Backbone.Router
  initialize: (options) ->
    @messages = new Treehouse.Collections.MessagesCollection()
    @messages.reset options.messages

  routes:
    "/index"    : "index"
    ".*"        : "index"

  index: ->
    view = new Treehouse.Views.Messages.IndexView(collection: @messages)
    $("#messages").html(view.render().el)

    view = new Treehouse.Views.Messages.NewView(collection: @messages)
    $("#messages").append(view.render().el)
    view.focus()
  