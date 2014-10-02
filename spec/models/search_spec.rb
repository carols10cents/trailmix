require "rails_helper"

describe Search do
  describe "#entries" do
    it "returns entries whose bodies match the search term" do
      user = create(:user)
      matched_entry = create(:entry, user: user, body: "I like cats")
      non_matched_entry = create(:entry, user: user, body: "I like dogs")
      other_user_entry = create(:entry, body: "This guy likes cats too")
      search = Search.new(term: "cats", user: user)

      result = search.entries.map(&:body)

      expect(result).to eq([matched_entry.body])
    end
  end
end
