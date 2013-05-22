class Todo < ActiveRecord::Base
  attr_accessible :title, :body, :status, :list_id
  belongs_to :list

  STATUS_KEYS = {incomplete: 0, complete: 1, in_progress: 2, moved: 3, deleted: 4, postponed: 5, important: 6}

  def update_status arg
    self.status = STATUS_KEYS[arg.to_sym]
  end

  def self.translate_status number
    STATUS_KEYS.key(number)
  end

  class << self

    def all arg 
      self.where STATUS_KEYS[arg.to_sym]
    end

    def create_by arg 
      self.create STATUS_KEYS[arg.to_sym]
    end
  end
end
