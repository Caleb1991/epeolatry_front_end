module ApplicationHelper

  def self.shelf_name_to_id(shelf_name)
    dictionary = { "To Read" => 2, "Currently Reading" => 3, "Read" => 4 }
    dictionary[shelf_name]
  end
end
