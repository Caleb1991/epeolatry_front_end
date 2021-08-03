class BookPoro
  attr_reader :title,
              :authors,
              :genres,
              :summary,
              :shelves,
              :id

  def initialize(attributes)
    @title = attributes[:title]
    @authors = attributes[:authors]
    @genres = attributes[:genres]
    @summary = attributes[:description]
    @id = attributes[:id]
    @shelves = attributes[:shelves]
  end
end
