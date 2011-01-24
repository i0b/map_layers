class MapController < ApplicationController
  def index
    @map = MapLayers::Map.new("map") do |map, page|
      page << map.add_layer(MapLayers::YAHOO)
      
      page << map.add_layer(Layer::GML.new("Places KML", "/places/kml", {:format=> JsExpr.new("OpenLayers.Format.KML")}))
      
      page << map.add_control(Control::LayerSwitcher.new)
      page << map.add_control(Control::Permalink.new('permalink'))
      page << map.zoom_to_max_extent
    end
  end

end
