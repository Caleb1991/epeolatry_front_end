class BookPoro
  attr_reader :title,
              :author,
              :genre,
              :summary,
              :id

  def initialize(json)
    @title = json
    @author = json
    @genre = json
    @summary = json
    @id = json
    #will need to acces the key of the json response for each attribute
  end
end
