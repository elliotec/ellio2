# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions
activate :autoprefixer do |prefix|
  prefix.browsers = 'last 2 versions'
end

activate :sprockets

configure :build do
  activate :minify_css, inline: true
  activate :minify_javascript, inline: true
  activate :minify_html
  activate :gzip
  activate :imageoptim
  activate :asset_hash
end

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'
set :build_dir, 'build'
set :markdown_engine, :redcarpet
set :markdown, fenced_code_blocks: true, smartypants: true, tables: true

Time.zone = 'America/Denver'
activate :blog do |blog|
  blog.permalink = ':title.html'
  blog.name = 'elliotec'
  blog.sources = 'posts/{year}-{month}-{day}-{title}.html'
  blog.layout = 'post'

  # Enable pagination
  # blog.paginate = true
  # blog.per_page = 10
  # blog.page_link = 'page/{num}'
end
activate :livereload
activate :directory_indexes
activate :syntax

activate :deploy do |deploy|
  deploy.deploy_method = :git
  deploy.remote = 'https://github.com/elliotec/ellio2.git'
  deploy.branch = 'master'
end

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false
