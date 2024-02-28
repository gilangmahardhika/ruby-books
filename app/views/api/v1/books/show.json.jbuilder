json.data do
  json.id     @book.id
  json.title  @book.title
  json.year   @book.year
  json.isbn   @book.isbn
  json.author @book.author_name
  json.author @book.description
end
