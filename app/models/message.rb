require "pg_search"

class Message < ActiveRecord::Base
  include PgSearch

  validates_presence_of :description, :language
  pg_search_scope :search, :against => [:description, :language]
end