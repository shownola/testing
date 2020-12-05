require 'rails_helper'

RSpec.feature 'Show an article' do
  before do
    @john = User.create(email: 'john@example.com', password: 'password')
    @fred = User.create(email: 'fred@example.com', password: 'password')
    @article = Article.create(title: 'First Article', body: 'Lorem Ipsum', user: @john)
  end

  scenario 'to non-signed in user hide the edit and delete button' do
    visit "/"
    click_link @article.title

    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)
    expect(current_path).to eq(article_path(@article))

    expect(page).not_to have_link('Edit Article')
    expect(page).not_to have_link('Delete Article')
  end

  scenario 'to non-owner hide the edit and delete button' do
    login_as(@fred)
    visit "/"
    click_link @article.title

    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)
    expect(current_path).to eq(article_path(@article))

    expect(page).not_to have_link('Edit Article')
    expect(page).not_to have_link('Delete Article')
  end

  scenario 'to signed in owner sees the edit and delete button' do
    login_as(@john)
    visit "/"
    click_link @article.title

    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)
    expect(current_path).to eq(article_path(@article))

    expect(page).to have_link('Edit Article')
    expect(page).to have_link('Delete Article')
  end


end
