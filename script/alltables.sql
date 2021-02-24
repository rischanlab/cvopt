CREATE DATABASE IF NOT EXISTS ${hiveconf:DB};
USE ${hiveconf:DB};

DROP TABLE IF EXISTS call_center;

CREATE EXTERNAL TABLE call_center(
      cc_call_center_sk         BIGINT
,     cc_call_center_id         STRING
,     cc_rec_start_date        STRING
,     cc_rec_end_date          STRING
,     cc_closed_date_sk         BIGINT
,     cc_open_date_sk           BIGINT
,     cc_name                   STRING
,     cc_class                  STRING
,     cc_employees              INT
,     cc_sq_ft                  INT
,     cc_hours                  STRING
,     cc_manager                STRING
,     cc_mkt_id                 INT
,     cc_mkt_class              STRING
,     cc_mkt_desc               STRING
,     cc_market_manager         STRING
,     cc_division               INT
,     cc_division_name          STRING
,     cc_company                INT
,     cc_company_name           STRING
,     cc_street_number          STRING
,     cc_street_name            STRING
,     cc_street_type            STRING
,     cc_suite_number           STRING
,     cc_city                   STRING
,     cc_county                 STRING
,     cc_state                  STRING
,     cc_zip                    STRING
,     cc_country                STRING
,     cc_gmt_offset             DOUBLE
,     cc_tax_percentage         DOUBLE
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|';
LOAD DATA LOCAL INPATH '${hiveconf:LOCATION}/call_center.dat' INTO TABLE call_center;


DROP TABLE IF EXISTS catalog_page;

CREATE EXTERNAL TABLE catalog_page(
      cp_catalog_page_sk        BIGINT
,     cp_catalog_page_id        STRING
,     cp_start_date_sk          BIGINT
,     cp_end_date_sk            BIGINT
,     cp_department             STRING
,     cp_catalog_number         INT
,     cp_catalog_page_number    INT
,     cp_description            STRING
,     cp_type                   STRING
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|';
LOAD DATA LOCAL INPATH '${hiveconf:LOCATION}/catalog_page.dat' INTO TABLE catalog_page;


DROP TABLE IF EXISTS catalog_returns;

CREATE EXTERNAL TABLE catalog_returns
(
    cr_returned_date_sk       BIGINT,
    cr_returned_time_sk       BIGINT,
    cr_item_sk                BIGINT,
    cr_refunded_customer_sk   BIGINT,
    cr_refunded_cdemo_sk      BIGINT,
    cr_refunded_hdemo_sk      BIGINT,
    cr_refunded_addr_sk       BIGINT,
    cr_returning_customer_sk  BIGINT,
    cr_returning_cdemo_sk     BIGINT,
    cr_returning_hdemo_sk     BIGINT,
    cr_returning_addr_sk      BIGINT,
    cr_call_center_sk         BIGINT,
    cr_catalog_page_sk        BIGINT,
    cr_ship_mode_sk           BIGINT,
    cr_warehouse_sk           BIGINT,
    cr_reason_sk              BIGINT,
    cr_order_number           BIGINT,
    cr_return_quantity        INT,
    cr_return_amount          DOUBLE,
    cr_return_tax             DOUBLE,
    cr_return_amt_inc_tax     DOUBLE,
    cr_fee                    DOUBLE,
    cr_return_ship_cost       DOUBLE,
    cr_refunded_cash          DOUBLE,
    cr_reversed_charge        DOUBLE,
    cr_store_credit           DOUBLE,
    cr_net_loss               DOUBLE
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|';
LOAD DATA LOCAL INPATH '${hiveconf:LOCATION}/catalog_returns.dat' INTO TABLE catalog_returns;


DROP TABLE IF EXISTS catalog_sales;

CREATE EXTERNAL TABLE catalog_sales
(
    cs_sold_date_sk           BIGINT,
    cs_sold_time_sk           BIGINT,
    cs_ship_date_sk           BIGINT,
    cs_bill_customer_sk       BIGINT,
    cs_bill_cdemo_sk          BIGINT,
    cs_bill_hdemo_sk          BIGINT,
    cs_bill_addr_sk           BIGINT,
    cs_ship_customer_sk       BIGINT,
    cs_ship_cdemo_sk          BIGINT,
    cs_ship_hdemo_sk          BIGINT,
    cs_ship_addr_sk           BIGINT,
    cs_call_center_sk         BIGINT,
    cs_catalog_page_sk        BIGINT,
    cs_ship_mode_sk           BIGINT,
    cs_warehouse_sk           BIGINT,
    cs_item_sk                BIGINT,
    cs_promo_sk               BIGINT,
    cs_order_number           BIGINT,
    cs_quantity               INT,
    cs_wholesale_cost         DOUBLE,
    cs_list_price             DOUBLE,
    cs_sales_price            DOUBLE,
    cs_ext_discount_amt       DOUBLE,
    cs_ext_sales_price        DOUBLE,
    cs_ext_wholesale_cost     DOUBLE,
    cs_ext_list_price         DOUBLE,
    cs_ext_tax                DOUBLE,
    cs_coupon_amt             DOUBLE,
    cs_ext_ship_cost          DOUBLE,
    cs_net_paid               DOUBLE,
    cs_net_paid_inc_tax       DOUBLE,
    cs_net_paid_inc_ship      DOUBLE,
    cs_net_paid_inc_ship_tax  DOUBLE,
    cs_net_profit             DOUBLE
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|';
LOAD DATA LOCAL INPATH '${hiveconf:LOCATION}/catalog_sales.dat' INTO TABLE catalog_sales;


DROP TABLE IF EXISTS customer_address;

CREATE EXTERNAL TABLE customer_address
(
    ca_address_sk             BIGINT,
    ca_address_id             STRING,
    ca_street_number          STRING,
    ca_street_name            STRING,
    ca_street_type            STRING,
    ca_suite_number           STRING,
    ca_city                   STRING,
    ca_county                 STRING,
    ca_state                  STRING,
    ca_zip                    STRING,
    ca_country                STRING,
    ca_gmt_offset             DOUBLE,
    ca_location_type          STRING
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|';
LOAD DATA LOCAL INPATH '${hiveconf:LOCATION}/customer_address.dat' INTO TABLE customer_address;


DROP TABLE IF EXISTS customer_demographics;

CREATE EXTERNAL TABLE customer_demographics
(
    cd_demo_sk                BIGINT,
    cd_gender                 STRING,
    cd_marital_status         STRING,
    cd_education_status       STRING,
    cd_purchase_estimate      INT,
    cd_credit_rating          STRING,
    cd_dep_count              INT,
    cd_dep_employed_count     INT,
    cd_dep_college_count      INT
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|';
LOAD DATA LOCAL INPATH '${hiveconf:LOCATION}/customer_demographics.dat' INTO TABLE customer_demographics;


DROP TABLE IF EXISTS customer;

CREATE EXTERNAL TABLE customer
(
    c_customer_sk             BIGINT,
    c_customer_id             STRING,
    c_current_cdemo_sk        BIGINT,
    c_current_hdemo_sk        BIGINT,
    c_current_addr_sk         BIGINT,
    c_first_shipto_date_sk    BIGINT,
    c_first_sales_date_sk     BIGINT,
    c_salutation              STRING,
    c_first_name              STRING,
    c_last_name               STRING,
    c_preferred_cust_flag     STRING,
    c_birth_day               INT,
    c_birth_month             INT,
    c_birth_year              INT,
    c_birth_country           STRING,
    c_login                   STRING,
    c_email_address           STRING,
    c_last_review_date        STRING
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|';
LOAD DATA LOCAL INPATH '${hiveconf:LOCATION}/customer.dat' INTO TABLE customer;


DROP TABLE IF EXISTS date_dim;

CREATE EXTERNAL TABLE date_dim
(
    d_date_sk                 BIGINT,
    d_date_id                 STRING,
    d_date                    STRING,
    d_month_seq               INT,
    d_week_seq                INT,
    d_quarter_seq             INT,
    d_year                    INT,
    d_dow                     INT,
    d_moy                     INT,
    d_dom                     INT,
    d_qoy                     INT,
    d_fy_year                 INT,
    d_fy_quarter_seq          INT,
    d_fy_week_seq             INT,
    d_day_name                STRING,
    d_quarter_name            STRING,
    d_holiday                 STRING,
    d_weekend                 STRING,
    d_following_holiday       STRING,
    d_first_dom               INT,
    d_last_dom                INT,
    d_same_day_ly             INT,
    d_same_day_lq             INT,
    d_current_day             STRING,
    d_current_week            STRING,
    d_current_month           STRING,
    d_current_quarter         STRING,
    d_current_year            STRING
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|';
LOAD DATA LOCAL INPATH '${hiveconf:LOCATION}/date_dim.dat' INTO TABLE date_dim;


DROP TABLE IF EXISTS household_demographics;

CREATE EXTERNAL TABLE household_demographics
(
    hd_demo_sk                BIGINT,
    hd_income_band_sk         BIGINT,
    hd_buy_potential          STRING,
    hd_dep_count              INT,
    hd_vehicle_count          INT
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|';
LOAD DATA LOCAL INPATH '${hiveconf:LOCATION}/household_demographics.dat' INTO TABLE household_demographics;


DROP TABLE IF EXISTS income_band;

CREATE EXTERNAL TABLE income_band(
      ib_income_band_sk         BIGINT
,     ib_lower_bound            INT
,     ib_upper_bound            INT
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|';
LOAD DATA LOCAL INPATH '${hiveconf:LOCATION}/income_band.dat' INTO TABLE income_band;


DROP TABLE IF EXISTS inventory;

CREATE EXTERNAL TABLE inventory
(
    inv_date_sk			BIGINT,
    inv_item_sk			BIGINT,
    inv_warehouse_sk		BIGINT,
    inv_quantity_on_hand	INT
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|';
LOAD DATA LOCAL INPATH '${hiveconf:LOCATION}/inventory.dat' INTO TABLE inventory;


DROP TABLE IF EXISTS item;

CREATE EXTERNAL TABLE item
(
    i_item_sk                 BIGINT,
    i_item_id                 STRING,
    i_rec_start_date          STRING,
    i_rec_end_date            STRING,
    i_item_desc               STRING,
    i_current_price           DOUBLE,
    i_wholesale_cost          DOUBLE,
    i_brand_id                INT,
    i_brand                   STRING,
    i_class_id                INT,
    i_class                   STRING,
    i_category_id             INT,
    i_category                STRING,
    i_manufact_id             INT,
    i_manufact                STRING,
    i_size                    STRING,
    i_formulation             STRING,
    i_color                   STRING,
    i_units                   STRING,
    i_container               STRING,
    i_manager_id              INT,
    i_product_name            STRING
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|';
LOAD DATA LOCAL INPATH '${hiveconf:LOCATION}/item.dat' INTO TABLE item;


DROP TABLE IF EXISTS promotion;

CREATE EXTERNAL TABLE promotion
(
    p_promo_sk                BIGINT,
    p_promo_id                STRING,
    p_start_date_sk           BIGINT,
    p_end_date_sk             BIGINT,
    p_item_sk                 BIGINT,
    p_cost                    DOUBLE,
    p_response_target         INT,
    p_promo_name              STRING,
    p_channel_dmail           STRING,
    p_channel_email           STRING,
    p_channel_catalog         STRING,
    p_channel_tv              STRING,
    p_channel_radio           STRING,
    p_channel_press           STRING,
    p_channel_event           STRING,
    p_channel_demo            STRING,
    p_channel_details         STRING,
    p_purpose                 STRING,
    p_discount_active         STRING
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|';
LOAD DATA LOCAL INPATH '${hiveconf:LOCATION}/promotion.dat' INTO TABLE promotion;


DROP TABLE IF EXISTS reason;

CREATE EXTERNAL TABLE reason(
      r_reason_sk               BIGINT
,     r_reason_id               STRING
,     r_reason_desc             STRING
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|';
LOAD DATA LOCAL INPATH '${hiveconf:LOCATION}/reason.dat' INTO TABLE reason;


DROP TABLE IF EXISTS ship_mode;

CREATE EXTERNAL TABLE ship_mode(
      sm_ship_mode_sk           BIGINT
,     sm_ship_mode_id           STRING
,     sm_type                   STRING
,     sm_code                   STRING
,     sm_carrier                STRING
,     sm_contract               STRING
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|';
LOAD DATA LOCAL INPATH '${hiveconf:LOCATION}/ship_mode.dat' INTO TABLE ship_mode;


DROP TABLE IF EXISTS store_returns;

CREATE EXTERNAL TABLE store_returns
(
    sr_returned_date_sk       BIGINT,
    sr_return_time_sk         BIGINT,
    sr_item_sk                BIGINT,
    sr_customer_sk            BIGINT,
    sr_cdemo_sk               BIGINT,
    sr_hdemo_sk               BIGINT,
    sr_addr_sk                BIGINT,
    sr_store_sk               BIGINT,
    sr_reason_sk              BIGINT,
    sr_ticket_number          BIGINT,
    sr_return_quantity        INT,
    sr_return_amt             DOUBLE,
    sr_return_tax             DOUBLE,
    sr_return_amt_inc_tax     DOUBLE,
    sr_fee                    DOUBLE,
    sr_return_ship_cost       DOUBLE,
    sr_refunded_cash          DOUBLE,
    sr_reversed_charge        DOUBLE,
    sr_store_credit           DOUBLE,
    sr_net_loss               DOUBLE
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|';
LOAD DATA LOCAL INPATH '${hiveconf:LOCATION}/store_returns.dat' INTO TABLE store_returns;


DROP TABLE IF EXISTS store_sales;

CREATE EXTERNAL TABLE store_sales
(
    ss_sold_date_sk           BIGINT,
    ss_sold_time_sk           BIGINT,
    ss_item_sk                BIGINT,
    ss_customer_sk            BIGINT,
    ss_cdemo_sk               BIGINT,
    ss_hdemo_sk               BIGINT,
    ss_addr_sk                BIGINT,
    ss_store_sk               BIGINT,
    ss_promo_sk               BIGINT,
    ss_ticket_number          BIGINT,
    ss_quantity               INT,
    ss_wholesale_cost         DOUBLE,
    ss_list_price             DOUBLE,
    ss_sales_price            DOUBLE,
    ss_ext_discount_amt       DOUBLE,
    ss_ext_sales_price        DOUBLE,
    ss_ext_wholesale_cost     DOUBLE,
    ss_ext_list_price         DOUBLE,
    ss_ext_tax                DOUBLE,
    ss_coupon_amt             DOUBLE,
    ss_net_paid               DOUBLE,
    ss_net_paid_inc_tax       DOUBLE,
    ss_net_profit             DOUBLE
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|';
LOAD DATA LOCAL INPATH '${hiveconf:LOCATION}/store_sales.dat' INTO TABLE store_sales;


DROP TABLE IF EXISTS store;

CREATE EXTERNAL TABLE store
(
    s_store_sk                BIGINT,
    s_store_id                STRING,
    s_rec_start_date          STRING,
    s_rec_end_date            STRING,
    s_closed_date_sk          BIGINT,
    s_store_name              STRING,
    s_number_employees        INT,
    s_floor_space             INT,
    s_hours                   STRING,
    s_manager                 STRING,
    s_market_id               INT,
    s_geography_class         STRING,
    s_market_desc             STRING,
    s_market_manager          STRING,
    s_division_id             INT,
    s_division_name           STRING,
    s_company_id              INT,
    s_company_name            STRING,
    s_street_number           STRING,
    s_street_name             STRING,
    s_street_type             STRING,
    s_suite_number            STRING,
    s_city                    STRING,
    s_county                  STRING,
    s_state                   STRING,
    s_zip                     STRING,
    s_country                 STRING,
    s_gmt_offset              DOUBLE,
    s_tax_precentage          DOUBLE
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|';
LOAD DATA LOCAL INPATH '${hiveconf:LOCATION}/store.dat' INTO TABLE store;


DROP TABLE IF EXISTS time_dim;

CREATE EXTERNAL TABLE time_dim
(
    t_time_sk                 BIGINT,
    t_time_id                 STRING,
    t_time                    INT,
    t_hour                    INT,
    t_minute                  INT,
    t_second                  INT,
    t_am_pm                   STRING,
    t_shift                   STRING,
    t_sub_shift               STRING,
    t_meal_time               STRING
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|';
LOAD DATA LOCAL INPATH '${hiveconf:LOCATION}/time_dim.dat' INTO TABLE time_dim;


DROP TABLE IF EXISTS warehouse;

CREATE EXTERNAL TABLE warehouse(
      w_warehouse_sk            BIGINT
,     w_warehouse_id            STRING
,     w_warehouse_name          STRING
,     w_warehouse_sq_ft         INT
,     w_street_number           STRING
,     w_street_name             STRING
,     w_street_type             STRING
,     w_suite_number            STRING
,     w_city                    STRING
,     w_county                  STRING
,     w_state                   STRING
,     w_zip                     STRING
,     w_country                 STRING
,     w_gmt_offset              DOUBLE
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|';
LOAD DATA LOCAL INPATH '${hiveconf:LOCATION}/warehouse.dat' INTO TABLE warehouse;


DROP TABLE IF EXISTS web_page;

CREATE EXTERNAL TABLE web_page(
      wp_web_page_sk            BIGINT
,     wp_web_page_id            STRING
,     wp_rec_start_date        STRING
,     wp_rec_end_date          STRING
,     wp_creation_date_sk       BIGINT
,     wp_access_date_sk         BIGINT
,     wp_autogen_flag           STRING
,     wp_customer_sk            BIGINT
,     wp_url                    STRING
,     wp_type                   STRING
,     wp_char_count             INT
,     wp_link_count             INT
,     wp_image_count            INT
,     wp_max_ad_count           INT
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|';
LOAD DATA LOCAL INPATH '${hiveconf:LOCATION}/web_page.dat' INTO TABLE web_page;


DROP TABLE IF EXISTS web_returns;

CREATE EXTERNAL TABLE web_returns
(
    wr_returned_date_sk       BIGINT,
    wr_returned_time_sk       BIGINT,
    wr_item_sk                BIGINT,
    wr_refunded_customer_sk   BIGINT,
    wr_refunded_cdemo_sk      BIGINT,
    wr_refunded_hdemo_sk      BIGINT,
    wr_refunded_addr_sk       BIGINT,
    wr_returning_customer_sk  BIGINT,
    wr_returning_cdemo_sk     BIGINT,
    wr_returning_hdemo_sk     BIGINT,
    wr_returning_addr_sk      BIGINT,
    wr_web_page_sk            BIGINT,
    wr_reason_sk              BIGINT,
    wr_order_number           BIGINT,
    wr_return_quantity        INT,
    wr_return_amt             DOUBLE,
    wr_return_tax             DOUBLE,
    wr_return_amt_inc_tax     DOUBLE,
    wr_fee                    DOUBLE,
    wr_return_ship_cost       DOUBLE,
    wr_refunded_cash          DOUBLE,
    wr_reversed_charge        DOUBLE,
    wr_account_credit         DOUBLE,
    wr_net_loss               DOUBLE
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|';
LOAD DATA LOCAL INPATH '${hiveconf:LOCATION}/web_returns.dat' INTO TABLE web_returns;


DROP TABLE IF EXISTS web_sales;

CREATE EXTERNAL TABLE web_sales
(
    ws_sold_date_sk           BIGINT,
    ws_sold_time_sk           BIGINT,
    ws_ship_date_sk           BIGINT,
    ws_item_sk                BIGINT,
    ws_bill_customer_sk       BIGINT,
    ws_bill_cdemo_sk          BIGINT,
    ws_bill_hdemo_sk          BIGINT,
    ws_bill_addr_sk           BIGINT,
    ws_ship_customer_sk       BIGINT,
    ws_ship_cdemo_sk          BIGINT,
    ws_ship_hdemo_sk          BIGINT,
    ws_ship_addr_sk           BIGINT,
    ws_web_page_sk            BIGINT,
    ws_web_site_sk            BIGINT,
    ws_ship_mode_sk           BIGINT,
    ws_warehouse_sk           BIGINT,
    ws_promo_sk               BIGINT,
    ws_order_number           BIGINT,
    ws_quantity               INT,
    ws_wholesale_cost         DOUBLE,
    ws_list_price             DOUBLE,
    ws_sales_price            DOUBLE,
    ws_ext_discount_amt       DOUBLE,
    ws_ext_sales_price        DOUBLE,
    ws_ext_wholesale_cost     DOUBLE,
    ws_ext_list_price         DOUBLE,
    ws_ext_tax                DOUBLE,
    ws_coupon_amt             DOUBLE,
    ws_ext_ship_cost          DOUBLE,
    ws_net_paid               DOUBLE,
    ws_net_paid_inc_tax       DOUBLE,
    ws_net_paid_inc_ship      DOUBLE,
    ws_net_paid_inc_ship_tax  DOUBLE,
    ws_net_profit             DOUBLE
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|';
LOAD DATA LOCAL INPATH '${hiveconf:LOCATION}/web_sales.dat' INTO TABLE web_sales;


DROP TABLE IF EXISTS web_site;

CREATE EXTERNAL TABLE web_site
(
    web_site_sk           BIGINT,
    web_site_id           STRING,
    web_rec_start_date    STRING,
    web_rec_end_date      STRING,
    web_name              STRING,
    web_open_date_sk      BIGINT,
    web_close_date_sk     BIGINT,
    web_class             STRING,
    web_manager           STRING,
    web_mkt_id            INT,
    web_mkt_class         STRING,
    web_mkt_desc          STRING,
    web_market_manager    STRING,
    web_company_id        INT,
    web_company_name      STRING,
    web_street_number     STRING,
    web_street_name       STRING,
    web_street_type       STRING,
    web_suite_number      STRING,
    web_city              STRING,
    web_county            STRING,
    web_state             STRING,
    web_zip               STRING,
    web_country           STRING,
    web_gmt_offset        DOUBLE,
    web_tax_percentage    DOUBLE
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|';
LOAD DATA LOCAL INPATH '${hiveconf:LOCATION}/web_site.dat' INTO TABLE web_site;
