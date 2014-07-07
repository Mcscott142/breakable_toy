require "rails_helper"

RSpec.describe WelcomeMailer, type: :mailer do
  user = FactoryGirl.create(:user)

  describe "welcome mail" do
    let(:mail) { WelcomeMailer.welcome(user) }

    it "renders headers" do
      expect(mail.subject).to eq("Welcome #{user.first_name}!")
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders body" do
      expect(mail.body.encoded).to match("Hey #{user.first_name}, time to start trading.")
    end
  end
end
