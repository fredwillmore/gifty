module ActionView
  module Helpers
    class FormBuilder
      attr_accessor :display_level
      def field_wrapper(input_type, field_name, obj, options={} )
        #options = {display: self.display_level}.merge(options)
        case display_level
          when 2
            o = self.label I18n.t("models.company.labels.#{field_name}")
            o += eval("#{input_type} :#{field_name} #{options.blank? ? '' : 'options'}")
            o = "<div class=\"field\">#{o}</div>"
          when 1
            o = self.label I18n.t("models.company.labels.#{field_name}")
            o += obj.send(field_name)
            o = "<div class=\"field\">#{o}</div>"
          else
            o ="no trapasan"
        end
        o.html_safe
      end
    end
  end
end
