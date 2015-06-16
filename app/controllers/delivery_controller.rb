class DeliveryController < ApplicationController
  def posts
   @deliveryinfo = Deliveryinfo.all
  end

  def write
  end

  def write_complete
  end

  def edit
  end

  def edit_complete
  end
end
