module ApplicationHelper
  include Pagy::Frontend
  
  def toastr_flash
    flash.each_with_object([]) do |(type, message), flash_messages|
      type = 'success' if type == 'notice'
      type = 'error' if type == 'alert'
      text = "<script>toastr.#{type}('#{message}', '', { closeButton: true, progressBar: true })</script>"
      flash_messages << text.html_safe if message
    end.join("\n").html_safe
  end

  def active_link(link_path)
    current_page?(link_path) ? "active" : ""
  end

  def enum_to_human(enum)
    enum.gsub("_", " ")
  end

  def zero_to_human(number)
    number == 0 ? "Nothing to show" : number
  end

  def boolean_to_human(boolean)
    boolean ? "Yes" : "No"
  end

  def format_date(date)
    date.strftime("%b %-d, %Y")
  end

  def format_time(time)
    time.strftime("%l:%M %p")
  end

  def extract_integer(string)
    string.scan(/\d/).join('').to_i
  end

  def link_to_add_card(name, f, association, type, **args)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.simple_fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize, f: builder)
    end

    link_to(name, '#', class: "add_permissions " + args[:class], data: {id: id, fields: fields.gsub("\n", "")})
  end
end
