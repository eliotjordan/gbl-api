require "swagger_helper"

RSpec.describe "api/search", type: :request do
  path "/api/seach/{id}" do
    get "Retrieves a blog" do
      tags "Blogs", "Another Tag"
      produces "application/json", "application/xml"
      parameter name: :id, in: :path, type: :string
      request_body_example value: {some_field: "Foo"}, name: "basic", summary: "Request example description"

      response "200", "blog found" do
        schema type: :object,
          properties: {
            id: {type: :integer},
            title: {type: :string},
            content: {type: :string}
          },
          required: ["id", "title", "content"]

        let(:id) { Blog.create(title: "foo", content: "bar").id }
        run_test!
      end

      response "404", "blog not found" do
        let(:id) { "invalid" }
        run_test!
      end

      response "406", "unsupported accept header" do
        let(:Accept) { "application/foo" }
        run_test!
      end
    end
  end
end
