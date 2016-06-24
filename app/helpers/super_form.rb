class SuperForm < ActionView::Helpers::FormBuilder
  def configuration
    YAML.load(File.read(File.join(Rails.root, 'app', 'helpers', 'superform', 'bootstrap.yml')))
  end

  def label(method, options={})
    options[:class] ||= "inline-label"
    super
  end

  def email_field(method, options={})
    options[:class] ||= "inline-textbox"
    super
  end

  def text_field(method, options={})
    options[:class] ||= "form-control"
    label(method) + super
  end
  
  def select(method, choices = nil, options = {}, html_options = {})
    html_options[:class] ||= "inline-textbox"
    choices = choices.html_safe
    super
  end

  def method_missing(m, *args, &block)  
    if m.to_s.start_with? "l_" then
      "<div class=\"form-group\">".html_safe + label(args[0], args[1]) + eval("#{m[2..-1]}(*#{args[0..-1]})") + "</div>".html_safe
    else
      super
    end
  end 

end