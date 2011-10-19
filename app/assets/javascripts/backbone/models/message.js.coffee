class Treehouse.Models.Message extends Backbone.Model
  paramRoot: 'message'

  defaults:
    body: null
    author: null
  
class Treehouse.Collections.MessagesCollection extends Backbone.Collection
  model: Treehouse.Models.Message
  url: '/messages'