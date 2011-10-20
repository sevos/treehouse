Treehouse.Views.Messages ||= {}

class Treehouse.Views.Messages.IndexView extends Backbone.View
  template: JST["backbone/templates/messages/index"]
    
  constructor: (options) ->
    super(options)

    @collection.bind('reset', @render)
    @collection.bind('add', @render)

  render: =>
    $(@el).html(@template())

    $messages = @$('#messages-index')
    @collection.each((message) =>
      view = new Treehouse.Views.Messages.MessageView({
        model : message
        collection: @collection
      })
      $messages.append(view.render().el)
    )

    # scroll down
    $messages.scrollTop($messages[0].scrollHeight)
    return this