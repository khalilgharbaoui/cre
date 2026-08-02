# frozen_string_literal: true

# These run `ruby` in a clean subprocess (no bundler, no Rails) to prove the
# gem loads and fails gracefully outside a Rails application.
RSpec.describe 'Cre without Rails' do
  let(:lib_path) { File.expand_path('../lib', __dir__) }

  def run_ruby(script)
    system(RbConfig.ruby, '-I', lib_path, '-e', script,
           exception: false, out: File::NULL, err: File::NULL)
  end

  it 'can be required without Rails being loaded' do
    expect(run_ruby('require "cre"')).to be(true)
  end

  it 'raises Cre::Error when dig is called outside a Rails app' do
    script = <<~RUBY
      require "cre"
      begin
        Cre.dig(:password)
        exit 1
      rescue Cre::Error
        exit 0
      end
    RUBY
    expect(run_ruby(script)).to be(true)
  end
end
