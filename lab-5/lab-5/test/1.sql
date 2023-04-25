SELECT COUNT(c_name)
FROM customer
INNER JOIN nation ON c_nationkey = n_nationkey
INNER JOIN region ON n_regionkey = r_regionkey
WHERE r_name != 'EUROPE' AND r_name != 'AFRICA' AND r_name != 'ASIA';