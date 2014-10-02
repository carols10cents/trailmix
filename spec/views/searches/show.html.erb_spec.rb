require "rails_helper"

describe "searches/show" do
  context "when no entries are found" do
    it "informs the user" do
      search = double("search", term: "cat", entries: [])
      assign(:search, search)

      render template: "searches/show"

      expect(rendered).to(
        include("We couldn't find any entries that include 'cat'")
      )
    end
  end
end
