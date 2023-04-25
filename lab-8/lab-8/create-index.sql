--1.sql
DROP INDEX IF EXISTS customer_idx_c_name;
CREATE INDEX customer_idx_c_name
    ON customer(c_name);

--2.sql
DROP INDEX IF EXISTS supplier_idx_s_nationkey_s_acctbal;
CREATE INDEX supplier_idx_s_nationkey_s_acctbal
    ON supplier(s_acctbal);

--3.sql
DROP INDEX IF EXISTS lineitem_idx_l_returnflag_l_receiptdate;
CREATE INDEX lineitem_idx_l_returnflag_l_receiptdate
    ON lineitem(l_returnflag, l_receiptdate);

--4.sql
--none needed

--5.sql
DROP INDEX IF EXISTS customer_idx_c_mktsegment;
CREATE INDEX customer_idx_c_mktsegment
    ON customer(c_mktsegment);

--6.sql
DROP INDEX IF EXISTS orders_idx_o_orderdate;
DROP INDEX IF EXISTS customer_idx_c_custkey;
DROP INDEX IF EXISTS nation_idx_n_nationkey_n_name;

CREATE INDEX nation_idx_n_nationkey_n_name
    ON nation(n_nationkey, n_name);
CREATE INDEX customer_idx_c_custkey
    ON customer(c_custkey);
CREATE INDEX orders_idx_o_orderdate
    ON orders(o_orderdate);

--7.sql
DROP INDEX IF EXISTS lineitem_idx_l_orderkey_l_suppkey;
DROP INDEX IF EXISTS orders_idx_o_custkey_o_orderkey;
DROP INDEX IF EXISTS customer_idx_c_name_c_custkey;

CREATE INDEX lineitem_idx_l_orderkey_l_suppkey
    ON lineitem(l_orderkey);
CREATE INDEX orders_idx_o_custkey_o_orderkey
    ON orders(o_custkey, o_orderkey);
CREATE INDEX customer_idx_c_name_c_custkey
    ON customer(c_name, c_custkey);

--8.sql
DROP INDEX IF EXISTS supplier_idx_s_nationkey_s_acctbal;
DROP INDEX IF EXISTS nation_idx_n_regionkey_n_nationkey;
DROP INDEX IF EXISTS region_idx_r_name_r_regionkey;

CREATE INDEX supplier_idx_s_nationkey_s_acctbal
    ON supplier(s_nationkey, s_acctbal);
CREATE INDEX nation_idx_n_regionkey_n_nationkey
    ON nation(n_regionkey, n_nationkey);
CREATE INDEX region_idx_r_name_r_regionkey 
    ON region(r_name, r_regionkey);

--9.sql
DROP INDEX IF EXISTS nation_idx_n_name;

CREATE INDEX nation_idx_n_name 
    ON nation(n_name);

--10.sql
DROP INDEX IF EXISTS orders_idx_o_custkey_o_orderdate;
DROP INDEX IF EXISTS customer_idx_c_nationkey_c_custkey;

CREATE INDEX orders_idx_o_custkey_o_orderdate
    ON orders(o_custkey, o_orderdate);
CREATE INDEX customer_idx_c_nationkey_c_custkey
    ON customer(c_nationkey, c_custkey);

--11.sql
DROP INDEX IF EXISTS orders_idx_o_orderkey;
DROP INDEX IF EXISTS lineitem_idx_l_discount;

CREATE INDEX orders_idx_o_orderkey
    ON orders(o_orderkey);
CREATE INDEX lineitem_idx_l_discount
    ON lineitem(l_discount);

--12.sql
DROP INDEX IF EXISTS region_idx_r_regionkey_r_name;
DROP INDEX IF EXISTS orders_idx_o_orderstatus;

CREATE INDEX region_idx_r_regionkey_r_name
    ON region(r_regionkey, r_name);
CREATE INDEX orders_idx_o_orderstatus
    ON orders(o_orderstatus);

--13.sql
--none needed

--14.sql
DROP INDEX IF EXISTS orders_idx_o_orderpriority_o_orderdate;

CREATE INDEX orders_idx_o_orderpriority_o_orderdate
    ON orders(o_orderpriority, o_orderdate);

--15.sql
DROP INDEX IF EXISTS lineitem_idx_l_orderkey_l_suppkey;
DROP INDEX IF EXISTS supplier_idx_s_nationkey_s_suppkey;
DROP INDEX IF EXISTS orders_idx_o_orderpriority_o_orderkey;

CREATE INDEX lineitem_idx_l_orderkey_l_suppkey
    ON lineitem(l_orderkey, l_suppkey);
CREATE INDEX supplier_idx_s_nationkey_s_suppkey 
    ON supplier(s_nationkey, s_suppkey);
CREATE INDEX orders_idx_o_orderpriority_o_orderkey
    ON orders(o_orderpriority, o_orderkey);