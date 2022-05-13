# Set the host name for URL creation
if Rails.env == 'development'
  default_host = "http://localhost:3000"
elsif Rails.env == 'production'
  default_host = "https://growwcapital.com"
end


sitemap_opts = {
  create_index: false,
  default_host: default_host,
  compress: false,
  sitemaps_path: '',
  namer: SitemapGenerator::SimpleNamer.new(:sitemap)
}

SitemapGenerator::Sitemap.create sitemap_opts do
  add '/home/credit_card', changefreq: 'weekly', priority: 0.5
  add '/home/credit_card', changefreq: 'weekly', priority: 0.5
  add '/home/credit_card', changefreq: 'weekly', priority: 0.5
  add '/home/personal_loan', changefreq: 'weekly', priority: 0.5
  add '/home/transfer_personal_loan', changefreq: 'weekly', priority: 0.5
  add '/home/business_loan', changefreq: 'weekly', priority: 0.5
  add '/home/professional_loan', changefreq: 'weekly', priority: 0.5
  add '/home/home_loan', changefreq: 'weekly', priority: 0.5
  add '/home/transfer_home_loan', changefreq: 'weekly', priority: 0.5
  add '/home/loan_against_property', changefreq: 'weekly', priority: 0.5
  add '/home/new_car_loan', changefreq: 'weekly', priority: 0.5
  add '/home/used_car_loan', changefreq: 'weekly', priority: 0.5
  add '/home/gold_loan', changefreq: 'weekly', priority: 0.5

  add '/contact_us', changefreq: 'weekly', priority: 0.5
  add '/pre_approved', changefreq: 'weekly', priority: 0.5
  add '/about_us', changefreq: 'weekly', priority: 0.5
  add '/emi_calculator', changefreq: 'weekly', priority: 0.5
  add '/career', changefreq: 'weekly', priority: 0.5
  add '/channel_partner', changefreq: 'weekly', priority: 0.5

  add_to_index "sitemap.xml", host: default_host
end
