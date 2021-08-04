class User::Books::WordController < ApplicationController
  def show # Need to spruce up to work correctly for this route
    @word = WordPoro.new(word: 'blah', definition: 'other blah',
    phonetic: 'funny letters',
    phonetic_link: 'link',
    part_of_speech: 'part',
    synonyms: 'same',
    example: 'blah blah')
    @book_id = 'B4d1swEACAAJ'
    # @word = current_user.get_words_for_given_book(params[:user_id], params[:word])
  end

  def new
    UserFacade.create_glossary_response(params[:word], current_user.uid, params[:book_id])
    redirect_to "/user/books/:book_id"
  end
  #create glossary action with glossary facade
  #create cancel button to redirect if no save wanted
end
