class Charge < ActiveRecord::Base
  def self.get_successful
    Charge.connection.select("SELECT *  FROM charges ch LEFT JOIN customers cu ON ch.customer_id = cu.id WHERE
    paid = 0 AND refunded =1")    
  end
  
  def self.get_failed    
    Charge.connection.select("SELECT *  FROM charges ch LEFT JOIN customers cu ON ch.customer_id = cu.id WHERE
    paid = 1 AND refunded =1")
  end
  
  def self.get_disputed    
    Charge.connection.select("SELECT *  FROM charges ch LEFT JOIN customers cu ON ch.customer_id = cu.id WHERE
    paid = 0 AND refunded = 0")
  end   
end
