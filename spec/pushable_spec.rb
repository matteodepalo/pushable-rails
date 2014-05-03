require 'spec_helper'

class DummyModel < ActiveRecord::Base
  include Pushable
end

class DummyModelSerializer < ActiveModel::Serializer
  include PushableSerializer
end

describe Pushable do
  describe 'after commit on create' do
    it 'triggers the corresponding Pusher notification' do
      dummy_model = DummyModel.new
      Pusher.should_receive(:trigger).with('pusher', 'dummy_model.create', { 'client_id' => '' })
      dummy_model.save!
    end
  end

  describe 'after commit on update' do
    it 'triggers the corresponding Pusher notification' do
      dummy_model = DummyModel.new
      dummy_model.save
      Pusher.should_receive(:trigger).with('pusher', 'dummy_model.update', { 'client_id' => '' })
      dummy_model.update!({})
    end
  end

  describe 'after commit on destroy' do
    it 'triggers the corresponding Pusher notification' do
      dummy_model = DummyModel.new
      dummy_model.save
      Pusher.should_receive(:trigger).with('pusher', 'dummy_model.destroy', { 'client_id' => '' })
      dummy_model.destroy!
    end
  end
end
