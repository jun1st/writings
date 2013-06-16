require 'test_helper'

class JekyllExporterTest < ActiveSupport::TestCase
  def setup
    @space = create :user
    2.times { create :article, :space => @space }
    @category = create :category, :space => @space
    2.times { create :article, :space => @space, :category => @category }

    @exporter = JekyllExporter.new(@space)
  end

  test "should export" do
    path = @exporter.export
    assert_equal "#{@exporter.tmp_path}/output.zip", path
    assert File.exists?(path)
  end
end
