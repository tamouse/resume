###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

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

# Proxy pages (http://middlemanapp.com/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
# activate :livereload

# Methods defined in the helpers block are available in templates
helpers do
  def full_name
    %w[given middle family].map{|np| data.resume.name[np]}.join(" ")
  end
  def humanize(s)
    s.gsub(/_+/,' ')
  end
  def titlecase(s)
    s.split(/\W+/).map{|w| w.capitalize}.join(" ")
  end
end


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

  # Use relative URLs
  activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end

## Extensions

# Sadly, it looks like the middleman-deploy gem is not being worked on
# and is no longer compatible.
# # Deploy
#
# activate :deploy do |deploy|
#   deploy.build_before = true    # always make sure we've built before we deploy

#   deploy.method = :rsync
#   deploy.host   = 'tamouse.org'
#   deploy.path   = 'Sites/tamouse.org/resume'
#   deploy.clean  = true
# end

# Create the PDF and RTF versions after_build

class CreatePDFandRTF < Middleman::Extension

  def initialize(app, options_hash={}, &block)
    super
    app.after_build do |builder|
      Dir.chdir "build" do |builddir|
        builder.thor.run "pdflatex resume.tex"
        builder.thor.run "pandoc -s docx.html -o resume.rtf"
      end
    end
  end

  # alias :included :registered
end

::Middleman::Extensions.register(:create_pdf_and_rtf, CreatePDFandRTF)
activate :create_pdf_and_rtf
