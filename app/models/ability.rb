# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new 
    alias_action :create, :read, :update, :destroy, to: :crud

    can(:crud, Post) do |post|
      post.user == user
    end
  end
end
