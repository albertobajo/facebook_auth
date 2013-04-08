class DummyController < ApplicationController
  before_filter :authenticate!, only: [:protected]
  
  def protected
  end

  def unprotected
  end
end
