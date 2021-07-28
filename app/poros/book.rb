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
  end
end
