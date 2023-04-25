--Run these commands in the .sqlite3 terminal.
--.mode "csv"
--.separator ","
--.headers off
--replace the file path with your path
--.import '| tail -n +2 cal_cities_lat_long.csv' Cities_Loc
--.import '| tail -n +2 cal_populations_city.csv' Cities_Population
--.import csv_file table_name

.mode "csv"
.separator "|"
.headers off

.import 'data/customer.tbl' customer
.import 'data/lineitem.tbl' lineitem
.import 'data/nation.tbl' nation
.import 'data/orders.tbl' orders
.import 'data/part.tbl' part 
.import 'data/partsupp.tbl' partsupp
.import 'data/region.tbl' region
.import 'data/supplier.tbl' supplier





