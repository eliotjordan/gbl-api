class ApiController < ApplicationController
  def search
    render json: {
      records: [
        {
          id: "princeton-123124",
          title: "a map or dataset"
        }
      ]
    }
  end
end
