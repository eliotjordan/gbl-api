require "swagger_helper"

RSpec.describe "api/search", type: :request do
  path "/api/v1/search" do
    get "Searches records" do
      tags "Search"
      produces "application/json"
      parameter name: :keyword, in: :query, type: :string,
        description: "Search by keyword"
      parameter name: :page, in: :query, type: :integer,
        description: "Page of records to return"
      parameter name: :per_page, in: :query, type: :integer,
        description: "Max records per page"
      parameter name: :bbox, in: :query, type: :string,
        description: "Bounding box to search: west+south+east+north"

      request_body_example value: {some_field: "Foo"}, name: "basic", summary: "Request example description"

      let(:keyword) { "map" }
      let(:page) { 1 }
      let(:per_page) { 10 }
      let(:bbox) { "-74.823074+40.232888+-74.483185+40.442244" }

      response "200", "search results" do
        schema type: :object,
          properties: {
            records: {
              type: :array,
              items: {
                type: :object,
                properties: {
                  id: {type: :string},
                  title: {type: :string}
                },
                required: ["id", "title"]
              }
            }
          }
        # let(:id) { Blog.create(title: "foo", content: "bar").id }
        run_test!
      end
    end
  end
end
