class Item < ApplicationRecord
    acts_as_paranoid
    has_and_belongs_to_many :users
    enum description_enum: [ :Action, :Adventure, :RPG, :Horror, :Shooter, :Strategy, :Simulation ]
    enum platform_enum: [ :PS4, :PC, :XBOX ]
end
