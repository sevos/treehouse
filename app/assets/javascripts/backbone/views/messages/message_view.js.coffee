Treehouse.Views.Messages ||= {}

class Treehouse.Views.Messages.MessageView extends Backbone.View
  template: JST["backbone/templates/messages/message"]
  
  events: {}
      
  tagName: "div"
  
  destroy: () ->
    @model.destroy()
    this.remove()
    
    return false
    
  render: ->
    $(this.el).html(@template(@model.toJSON() ))    
    return this