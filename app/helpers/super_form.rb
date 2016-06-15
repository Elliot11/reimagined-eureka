class SuperForm < ActionView::Helpers::FormBuilder
  def text_field(attribute, options={})
    label(attribute) + super
  end


  def configuration
    YAML.load(File.read(File.join(Rails.root, 'app', 'helpers', 'superform', 'bootstrap.yml')))
  end
end