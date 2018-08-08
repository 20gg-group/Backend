class Admin < ApplicationRecord
  def valid_password?(pass)
    self.password == pass
  end
end
