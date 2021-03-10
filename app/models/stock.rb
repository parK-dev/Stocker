class Stock < ApplicationRecord

  def self.new_lookup(ticker_symbol)
    client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.iex[:sandbox_publishable_token],
      secret_token: Rails.application.credentials.iex[:sandbox_secret_token],
      endpoint: 'https://sandbox.iexapis.com/v1'
    )
    begin
      new(ticker: ticker_symbol, name:client.company(ticker_symbol).company_name,
          price: client.price(ticker_symbol))
    rescue => exception
      return nil
    end
  end
end
