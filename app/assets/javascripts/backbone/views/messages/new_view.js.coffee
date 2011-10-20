Treehouse.Views.Messages ||= {}

class Treehouse.Views.Messages.NewView extends Backbone.View
  template: JST["backbone/templates/messages/new"]
  
  events:
    "change input": "update_model"
    "submit #new-message": "save"

  tagName: "div"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", @render)

  update_model: (e) ->
    $field = $(e.currentTarget)
    data = {}
    data[$field.attr('name')] = $field.val()
    @model.set(data)

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")
    @collection.create(@model.toJSON(),
      success: =>
        @model.set(body: null)
        this.render()
    )
    
  render: ->
    $(this.el).html(@template(@model.toJSON()))
    this.focus()
    return this

  focus: ->
    @$('#message-body').focus()
