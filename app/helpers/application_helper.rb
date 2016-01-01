module ApplicationHelper
  def articletypes
    Articletype.where(visible: true)
  end
end
