CREATE SCHEMA INSTANCE;

CREATE TABLE metrodb_lgl.INSTANCE.dim_date ( 
	date_id int64 NOT NULL  ,
	year int64  ,
	quarter int64  ,
	month int64  ,
	day int64  ,
	weekday string  
 );

ALTER TABLE metrodb_lgl.INSTANCE.dim_date ADD PRIMARY KEY ( date_id )  NOT ENFORCED;

CREATE TABLE metrodb_lgl.INSTANCE.dim_passholder ( 
	passholder_id string NOT NULL  
 );

ALTER TABLE metrodb_lgl.INSTANCE.dim_passholder ADD PRIMARY KEY ( passholder_id )  NOT ENFORCED;

CREATE TABLE metrodb_lgl.INSTANCE.dim_station ( 
	station_id int64 NOT NULL  ,
	stationname int64  ,
	latitude float  ,
	longitude float  
 );

ALTER TABLE metrodb_lgl.INSTANCE.dim_station ADD PRIMARY KEY ( station_id )  NOT ENFORCED;

CREATE TABLE metrodb_lgl.INSTANCE.dim_time ( 
	time_id int64 NOT NULL  ,
	start_time int64  ,
	end_time int64  
 );

ALTER TABLE metrodb_lgl.INSTANCE.dim_time ADD PRIMARY KEY ( time_id )  NOT ENFORCED;

CREATE TABLE metrodb_lgl.INSTANCE.fact_bike_trips ( 
	fact_id int64 NOT NULL  ,
	trip_id int64 NOT NULL  ,
	time_id int64 NOT NULL  ,
	station_id int64 NOT NULL  ,
	bike_id string NOT NULL  ,
	passholder_id int64 NOT NULL  ,
	trip_duration int64  ,
	trip_route_category string  ,
	bike_type string  ,
	data_id date NOT NULL  
 );

ALTER TABLE metrodb_lgl.INSTANCE.fact_bike_trips ADD PRIMARY KEY ( fact_id, time_id, data_id, station_id, passholder_id )  NOT ENFORCED;

ALTER TABLE metrodb_lgl.INSTANCE.fact_bike_trips ADD CONSTRAINT fk_fact_bike_trips_dim_time FOREIGN KEY ( time_id ) REFERENCES metrodb_lgl.INSTANCE.dim_time( time_id ) NOT ENFORCED;

ALTER TABLE metrodb_lgl.INSTANCE.fact_bike_trips ADD CONSTRAINT fk_fact_bike_trips_dim_date FOREIGN KEY ( data_id ) REFERENCES metrodb_lgl.INSTANCE.dim_date( date_id ) NOT ENFORCED;

ALTER TABLE metrodb_lgl.INSTANCE.fact_bike_trips ADD CONSTRAINT fk_fact_bike_trips_dim_station FOREIGN KEY ( station_id ) REFERENCES metrodb_lgl.INSTANCE.dim_station( station_id ) NOT ENFORCED;

ALTER TABLE metrodb_lgl.INSTANCE.fact_bike_trips ADD CONSTRAINT fk_fact_bike_trips_dim_passholder FOREIGN KEY ( passholder_id ) REFERENCES metrodb_lgl.INSTANCE.dim_passholder( passholder_id ) NOT ENFORCED;
