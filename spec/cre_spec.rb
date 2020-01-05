RSpec.describe Cre do
  pp 'Dummy Encrypted Credentials Data:'
  pp 'ℹ️ ' * 25
  ap Rails.application.credentials.config
  pp 'ℹ️ ' * 25
  ap 'Master key: ' << Rails.application.credentials.key_path.to_s
  ap 'Credentials: ' << Rails.application.credentials.content_path.to_s
  pp 'ℹ️ ' * 25

  it 'digs the :password out of the encrypted credentials' do
    password = Cre.dig(:password)
    expect(password).to eq(Rails.application.credentials.dig(Rails.env.to_sym, :password))
  end
  it 'digs the :password out of the dummy data when in production' do
    # Arrange that the current Rails environment is production.
    Rails.env = 'production'
    # Act by assigning the production password to a local variable.
    production_password = Cre.dig(:password)
    # Assert that it really gets it out of the encrypted credentials.
    expect(production_password).to eq('fakeproductionpassword')
    expect(production_password).to eq(Rails.application.credentials.dig(Rails.env.to_sym, :password))
  end
  it 'digs the :password when the current env. is development' do
    Rails.env = 'development'
    development_password = Cre.dig(:password)
    expect(development_password).to eq('fakedevelopmentpassword')
    expect(development_password).to eq(Rails.application.credentials.dig(Rails.env.to_sym, :password))
  end
  it 'digs the :password out when env. is manually overwritten' do
    expect(Cre.dig(:test, :password)).to eq('faketestpassword')
    expect(Cre.dig(:test, :password)).to eq(Rails.application.credentials.dig(:test, :password))
    expect(Cre.dig(:development, :password)).to eq('fakedevelopmentpassword')
    expect(Cre.dig(:development, :password)).to eq(Rails.application.credentials.dig(:development, :password))
    expect(Cre.dig(:production, :password)).to eq('fakeproductionpassword')
    expect(Cre.dig(:production, :password)).to eq(Rails.application.credentials.dig(:production, :password))
  end
  it 'returs nil when a credential does not exist' do
    expect(Cre.dig(:nonexistent)).to be_nil
    expect(Rails.application.credentials.dig(Rails.env.to_sym, :nonexistent)).to be_nil
  end
end
