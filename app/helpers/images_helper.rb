module ImagesHelper
  def previous_image(image_rel)
    image = Image.preview(image_rel.category, image_rel.created_at)
    result(image, 'fas fa-chevron-left fa', 'previous')
  end

  def next_image(image_rel)
    image = Image.next(image_rel.category, image_rel.created_at)
    result(image, 'fas fa-chevron-right fa', 'next')
  end

  private

  def result(image, icon, alt)
    a = image.nil? ? %w(# invisible) : [category_image_path(category_id: image.category.slug, id: image.slug), 'visible']
    link_to(a[0], id: alt, class: "text-white #{a[1]}") { "<i class=\"#{icon}\"></i>".html_safe }
  end
end
