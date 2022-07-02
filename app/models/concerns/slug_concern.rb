module SlugConcern
  extend ActiveSupport::Concern
  included do
    before_save :create_slug
  end

  def create_slug
    write_attribute(:slug, generate_slug)
  end

  private

  def generate_slug
    begin
      name&.parameterize
    rescue StandardError => e
      return title&.parameterize
    end
  end
end
