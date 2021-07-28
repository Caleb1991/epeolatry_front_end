class Book
  attr_reader :title,
              :author,
              :genre,
              :summary,

  def initialize(json)
    @title = json
    @author = json
    @genre = json
    @summary = json
    #will need to acces the key of the json response for each attribute
  end
end
