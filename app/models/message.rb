class Message
  include Mongoid::Document
  field :body, :type => String
  field :author, :type => String
end
