require 'rails_helper'
describe 'Specific invoices for customer page' do
  it 'shows all items for specified merchants' do
    customer = create(:customer)
    invoice = create(:invoice, customer_id: customer.id)
    transaction = create(:transaction, invoice_id: invoice.id)

    get "/api/v1/customers/#{customer.id}/transactions"

    expect(response).to be_successful

    invoices = JSON.parse(response.body)

    expect(invoices['data'][0]['attributes']['id']).to eq(transaction.id)
  end
end
