# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

# Seed 4 Customers into the system:
Customer.create(:first_name => "Johny", :last_name => "Flow")
Customer.create(:first_name => "Raj", :last_name => "Jamnis")
Customer.create(:first_name => "Andrew", :last_name => "Chung")
Customer.create(:first_name => "Mike", :last_name => "Smith")

# Seed 10 tractions (charges) into the system:
# Successful transactions
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

# Failed tractions
Charge.create(:paid => "1", :amount => "1", :currency => "USD", :refunded => "1", :customer_id => 3 )
Charge.create(:paid => "1", :amount => "20", :currency => "cents", :refunded => "1", :customer_id => 3 )
Charge.create(:paid => "1", :amount => "30", :currency => "cents", :refunded => "1", :customer_id => 3 )
Charge.create(:paid => "1", :amount => "40", :currency => "cents", :refunded => "1", :customer_id => 4 )
Charge.create(:paid => "1", :amount => "50", :currency => "cents", :refunded => "1", :customer_id => 4 )

# Disputed tractions
Charge.create(:paid => "0", :amount => "2", :currency => "USD", :refunded => "0", :customer_id => 1 )
Charge.create(:paid => "0", :amount => "3", :currency => "USD", :refunded => "0", :customer_id => 1 )
Charge.create(:paid => "0", :amount => "4", :currency => "USD", :refunded => "0", :customer_id => 1 )
Charge.create(:paid => "0", :amount => "5", :currency => "USD", :refunded => "0", :customer_id => 2 )
Charge.create(:paid => "0", :amount => "14", :currency => "cents", :refunded => "0", :customer_id => 2 )
