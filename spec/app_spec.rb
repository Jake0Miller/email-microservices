require File.expand_path '../spec_helper.rb', __FILE__

RSpec.describe Mailer, type: :mailer do
  let(:email){ Capybara::Node::Simple.new(email.body.to_s)}

  it "Sends verification link" do
    params = {}
    params[:num_items] = 5
    params["MICRO_KEY"] = ENV["MICRO_KEY"]
    params[:email] = 'test@test.com'

    email = Mailer.verify(params)

    expect(['from@example.com']).to eq(email.from)
    expect(['test@test.com']).to eq(email.to)
    expect('You have pending reviews!').to eq(email.subject)
  end
end
