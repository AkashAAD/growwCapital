module ApplicationHelper
  def cities
    [['-Select City-','']] + CS.cities(:mh, :in).map{|val| [val, val.downcase]}
  end
end
