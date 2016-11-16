require "csv"

# Open a csv file so we can put information in it
csv = CSV.open("accounts.csv", "w")

# Write a header
csv.add_row ["Name", "Pin", "Balance"]

# write a row
csv.add_row ["Gavin", "1234", "1000000"]

# write a row
csv.add_row ["Jason", "5678", "2000000"]

# write a row
csv.add_row ["Toni", "0000", "3000000"]

# close the file
csv.close

CSV.foreach("accounts.csv", headers:true) do |account|
  puts "#{account["Name"]} has an account here with a balance of #{account["Balance"]}"
end
