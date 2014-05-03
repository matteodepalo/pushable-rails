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
      Pusher.should_receive(:trigger).with('pusher', 'dummy_model.create', { dummy_model: { client_id: nil} }.to_json)
      dummy_model.save!
    end
  end

  describe 'after commit on update' do
    it 'triggers the corresponding Pusher notification' do
      dummy_model = DummyModel.new
      dummy_model.save
      Pusher.should_receive(:trigger).with('pusher', 'dummy_model.update', { dummy_model: { client_id: nil} }.to_json)
      dummy_model.update!({})
    end
  end

  describe 'after commit on destroy' do
    it 'triggers the corresponding Pusher notification' do
      dummy_model = DummyModel.new
      dummy_model.save
      Pusher.should_receive(:trigger).with('pusher', 'dummy_model.destroy', { dummy_model: { client_id: nil} }.to_json)
      dummy_model.destroy!
    end
  end
end
