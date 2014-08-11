require "susy"
require "breakpoint"
require "tzinfo"
require 'middleman-thumbnailer'

Time.zone = "Asia/Tokyo"
set :markdown_engine, :redcarpet
set :markdown, fenced_code_blocks: true, tables: true, smartypants: true
activate :i18n, :path => "/:locale/", :mount_at_root => :ja
set :relative_links, true
set :slim, :pretty => true, :sort_attrs => false, :format => :html5, :streaming => false

# Use relative URLs
activate :relative_assets

activate :thumbnailer,
  :dimensions => {
    :small_icon => '48x48',
    :icon       => '64x64',
    :large_icon => '128x128',
    :small      => '128x72',
    :medium     => '512x288',
    :large      => '1024x576',
    :hd         => '1920x1080',
    :xlarge     => '2048x1152'
  },
  :include_data_thumbnails => false

###
# Compass
###

# Change Compass configuration
compass_config do |config|
  config.output_style = :expanded
  config.line_comments = false
end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

activate :blog do |blog|
  blog.name = "blog"
  blog.layout = "blog"
  blog.sources   = "{year}-{month}-{day}-{title}.html"
  blog.prefix    = "articles"
  blog.permalink = "/:year/:month/:day/:title.html"
  blog.summary_separator = /!READMORE/
end

activate :blog do |blog|
  blog.name = "booth"
  blog.layout = "blog"
  blog.sources   = "{title}.html"
  blog.prefix    = "booth"
  blog.permalink = "/:title.html"
  blog.summary_separator = /!READMORE/
end

activate :blog do |blog|
  blog.name = "stage"
  blog.layout = "blog"
  blog.sources   = "{title}.html"
  blog.prefix    = "stage"
  blog.permalink = "/:title.html"
  blog.summary_separator = /!READMORE/
end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
  #ignore /^bower_components\/(?!(normalize-css|jquery|moment|fontawesome|html5shiv|respond|selectivizr))/
end

after_configuration do
  if ENV['MM_ENV'] == 'development'
    set :environment, :development
  end
end
