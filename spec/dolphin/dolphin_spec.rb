require 'spec_helper'
require 'active_support/core_ext/hash/indifferent_access'

describe 'Dolphin' do
  let(:experimental) do
    klass  = Class.new { include Dolphin::Helper }
    klass.new
  end

  describe ".features" do

    it "may have indifferent access" do
      Dolphin.features = {:blog => :on, 'issues' => :on, :wiki => :off, 'comments' => :off}.with_indifferent_access
      Dolphin.flipper(:on) {true}
      Dolphin.flipper(:off){false}

      [:blog, 'blog', :issues, 'issues'].each do |f|
        experimental.feature?(f).should be_true
      end

      [:wiki, 'wiki', :comments, 'comments'].each do |f|
        experimental.feature?(f).should be_false
      end
    end
  end

  describe ".flipper" do
    it "has indifferent access" do
      Dolphin.features = {:blog => :on, :issues => 'on', :wiki => :off, :comments => 'off', :gallery => :active, :calendar => :inactive}
      Dolphin.flipper(:on) {true}
      Dolphin.flipper('active'){true}
      Dolphin.flipper(:off) {false}
      Dolphin.flipper('inactive'){false}

      [:blog, :issues, :gallery].each {|f| experimental.feature?(f).should be_true }
      [:wiki, :comments, :calendar].each {|f| experimental.feature?(f).should be_false }
    end
  end

  describe '.clear!' do
    before do
      Dolphin.features = {:blog => :on, 'issues' => :on, :wiki => :off, 'comments' => :off}.with_indifferent_access
      Dolphin.flipper(:on) {true}
    end

    it "should clear both features and flippers" do
      Dolphin.features.should_not be_empty
      Dolphin.flippers.should_not be_empty
      Dolphin.clear!
      Dolphin.features.should be_empty
      Dolphin.flippers.should be_empty
    end
  end
end