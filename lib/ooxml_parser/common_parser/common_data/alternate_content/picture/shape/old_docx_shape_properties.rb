# Fallback DOCX Shape Properties
module OoxmlParser
  class OldDocxShapeProperties
    attr_accessor :fill_color, :opacity, :stroke_color, :stroke_weight

    def self.parse(shape_node)
      properties = OldDocxShapeProperties.new
      shape_node.attributes.each do |key, value|
        case key
        when 'fillcolor'
          properties.fill_color = Color.from_int16(value.value.delete('#'))
        when 'opacity'
          properties.opacity = value.value.to_f
        when 'strokecolor'
          properties.stroke_color = Color.from_int16(value.value.delete('#'))
        when 'strokeweight'
          properties.stroke_weight = value.value.to_f
        when ''
        end
      end
      properties
    end
  end
end
