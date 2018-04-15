require "rails_helper"

RSpec.describe "routing to Articles::CommentsController", type: :routing do
  it "routes articles/{:article_id}/comments to Articles::CommentsController#index" do
    expect(get: "/articles/100/comments").to route_to(
      controller: "articles/comments",
      action: "index",
      article_id: "100"
    )
  end

  # it "does not expose a list of profiles" do
  #  expect(:get => "/profiles").not_to be_routable
  # end
end
