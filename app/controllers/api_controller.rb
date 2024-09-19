class ApiController < ApplicationController
  include Blacklight::Catalog

  def search
    query_params = {
      "q" => params[:keyword]
    }

    @search_state = Blacklight::SearchState.new(query_params, CatalogController.blacklight_config, nil)

    if params[:bbox]
      filter_query = Geoblacklight::BboxFilterQuery.call(nil, geometry_filter(params[:bbox]), {})[1]
      builder.merge(filter_query)
    end

    builder.page = params[:page] if params[:page]
    builder.rows = params[:per_page] if params[:per_page]
    response = repository.search(builder)

    render json: {
      records: response.documents.map { |d| crosswalk_gbl(d) }
    }
  end

  private

  def crosswalk_gbl(doc)
    {
      id: doc[:id],
      title: doc[:dct_title_s]
    }
  end

  def repository
    search_service.repository
  end

  def builder
    @builder ||= search_service.search_builder.with(@search_state)
  end

  def geometry_filter(bbox)
    rectangle = bbox.tr("+", " ")
    values = [Geoblacklight::BoundingBox.from_rectangle(rectangle)]
    filter_struct.new(Settings.FIELDS.GEOMETRY, values, bbox_facet_field)
  end

  def filter_struct
    Struct.new(:key, :values, :config)
  end

  def bbox_facet_field
    CatalogController.blacklight_config.facet_fields.find { |f| f[0] == Settings.FIELDS.GEOMETRY }[1]
  end
end
