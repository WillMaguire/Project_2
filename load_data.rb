require 'pg'

db_conn = PG.connect(:dbname => 'share_aupair')

file = IO.read("Victoria-Postcodes.csv")

file.split("\r").each do |line|
  location = line.split(",")
  postcode = location[0]
  suburb = location[1]
  region = location[2]

  sql  = "INSERT INTO locations (postcode, suburb, region)"
  sql += "VALUES ( '#{postcode}', '#{suburb}', '#{region}');"

  db_conn.exec(sql)

end

file.close

db_conn.close
