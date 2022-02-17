require 'pg'

feature 'Test viewing bookmarks' do
  scenario 'should show list of bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    Bookmark.create(url: 'http://www.makersacademy.com', title:'Makers Academy')
    Bookmark.create(url: 'http://www.destroyallsoftware.com', title:'Destroy')
    Bookmark.create(url: 'http://www.google.com', title:'Google')

    visit('/bookmarks')

    expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com' )
    expect(page).to have_link('Destroy', href: 'http://www.destroyallsoftware.com' )
    expect(page).to have_link('Google', href: 'http://www.google.com' )
  end
end