require 'spec_helper'

describe Charge do
   it "has one for successful charges" do   
    Charge.create!(:paid => "0", :amount => "400", :currency => "USD", :refunded => "1", :customer_id => 1 )
    expect(Charge.where("paid = 0 AND refunded = 1")).to have(1).record
    
   end 
   
   it "has one for failed charges" do
    Charge.create!(:paid => "1", :amount => "1", :currency => "USD", :refunded => "1", :customer_id => 3 ) 
    expect(Charge.where("paid = 1 AND refunded = 1")).to have(1).record
    
   end
   
   it "has one for disputed charges" do
    Charge.create!(:paid => "0", :amount => "2", :currency => "USD", :refunded => "0", :customer_id => 1 )
    expect(Charge.where("paid = 0 AND refunded = 0")).to have(1).record   
    
   end   
   
   it "verifies that in the successful charges list there are 10 line items" do
      Charge.create(:paid => "0", :amount => "400", :currency => "USD", :refunded => "1", :customer_id => 1 )
      Charge.create(:paid => "0", :amount => "10", :currency => "cents", :refunded => "1", :customer_id => 1 )
      Charge.create(:paid => "0", :amount => "5", :currency => "USD", :refunded => "1", :customer_id => 1 )
      Charge.create(:paid => "0", :amount => "100", :currency => "USD", :refunded => "1", :customer_id => 1 )
      Charge.create(:paid => "0", :amount => "100", :currency => "USD", :refunded => "1", :customer_id => 1 )
      Charge.create(:paid => "0", :amount => "300", :currency => "cents", :refunded => "1", :customer_id => 2 )
      Charge.create(:paid => "0", :amount => "40", :currency => "cents", :refunded => "1", :customer_id => 2 )
      Charge.create(:paid => "0", :amount => "23", :currency => "cents", :refunded => "1", :customer_id => 2 )
      Charge.create(:paid => "0", :amount => "5", :currency => "cents", :refunded => "1", :customer_id => 3 )
      Charge.create(:paid => "0", :amount => "6", :currency => "cents", :refunded => "1", :customer_id => 4 )
      
      expect(Charge.count).to eq 10
   end
   
   it "verifies that in the failed charges list there are 5 failed charges" do
     Charge.create(:paid => "1", :amount => "1", :currency => "USD", :refunded => "1", :customer_id => 3 )
    Charge.create(:paid => "1", :amount => "20", :currency => "cents", :refunded => "1", :customer_id => 3 )
    Charge.create(:paid => "1", :amount => "30", :currency => "cents", :refunded => "1", :customer_id => 3 )
    Charge.create(:paid => "1", :amount => "40", :currency => "cents", :refunded => "1", :customer_id => 4 )
    Charge.create(:paid => "1", :amount => "50", :currency => "cents", :refunded => "1", :customer_id => 4 )
    
    expect(Charge.count).to eq 5
   end
   
   it "verifies that in the disputed charges list there are failed charges" do
     Charge.create(:paid => "0", :amount => "2", :currency => "USD", :refunded => "0", :customer_id => 1 )
      Charge.create(:paid => "0", :amount => "3", :currency => "USD", :refunded => "0", :customer_id => 1 )
      Charge.create(:paid => "0", :amount => "4", :currency => "USD", :refunded => "0", :customer_id => 1 )
      Charge.create(:paid => "0", :amount => "5", :currency => "USD", :refunded => "0", :customer_id => 2 )
      Charge.create(:paid => "0", :amount => "14", :currency => "cents", :refunded => "0", :customer_id => 2 )
     expect(Charge.count).to eq 5
      end
end
