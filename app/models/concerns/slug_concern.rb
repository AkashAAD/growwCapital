module SlugConcern
  extend ActiveSupport::Concern
  included do
    before_save :generate_slug
  end

  def generate_slug
    write_attribute(:slug, name.parameterize)
  end
end
