json.data do
  json.array! @books do |book|
    json.id     book.id
    json.title  book.title
    json.year   book.year
    json.isbn   book.isbn
    json.author book.author_name
  end
end
json.page        @page.to_i
json.total_pages @total_pages