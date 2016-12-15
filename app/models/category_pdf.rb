require "render_anywhere"

class CategoryPdf
  include RenderAnywhere

  def initialize category
    @category = category
  end

  def to_pdf
    kit = PDFKit.new as_html, page_size: Settings.download_pdf.a4
    kit.to_file "#{Rails.root}/public/category.pdf"
  end

  def filename
    "Category #{category.id}.pdf"
  end

  private
  attr_reader :category

  def as_html
    render template: "admin/categories/pdf", layout: "category_pdf",
      locals: {category: category}
  end
end
