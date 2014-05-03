require 'pushable/version'
require 'active_support'
require 'pusher'

module Pushable
  extend ActiveSupport::Concern

  included do
    attr_accessor :client_id

    after_commit :pushable_trigger_create, on: :create
    after_commit :pushable_trigger_update, on: :update
    after_commit :pushable_trigger_destroy, on: :destroy

    private

    def pushable_class_name
      self.class.name.underscore
    end

    def serialized_model
      "#{self.class.name}Serializer".constantize.new(self).to_json
    rescue NameError
      to_json
    end

    %w(create update destroy).each do |action_name|
      define_method("pushable_trigger_#{action_name}") do
        Pusher.trigger('pusher', "#{pushable_class_name}.#{action_name}", serialized_model)
      end
    end
  end
end
