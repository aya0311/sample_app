ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # 指定のワーカー数でテストを並列実行する
  parallelize(workers: :number_of_processors)
  # test/fixtures/*.ymlのfixtureをすべてセットアップする
  fixtures :all
  include ApplicationHelper

  # Add more helper methods to be used by all tests here...
end
