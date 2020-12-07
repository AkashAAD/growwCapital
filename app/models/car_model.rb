class CarModel < ApplicationRecord
  belongs_to :car_manufacturer, optional: true
end
