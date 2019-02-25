Rails.configuration.stripe = {
  :publishable_key => "pk_test_uDwPjtKkBkQ4bnUovqBMjfNF",
  :secret_key      => 'sk_test_hFFIXsNXk1MYJqu67ijgvISQ'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]