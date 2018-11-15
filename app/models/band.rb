class Band < ApplicationRecord
  validates :name, presence: true

  def self.find_by_name(name)
    band = Band.find_by(name: name)
    if band
      return band
    else
      return nil
    end
  end


end
