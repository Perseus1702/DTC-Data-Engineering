## Module 1 Homework

## Docker & SQL

In this homework we'll prepare the environment 
and practice with Docker and SQL


## Question 1. Knowing docker tags

Run the command to get information on Docker 

```docker --help```

Now run the command to get help on the "docker build" command:

```docker build --help```

Do the same for "docker run".

Which tag has the following text? - *Automatically remove the container when it exits* 

- `--delete`
- `--rc`
- `--rmc`
- ***`--rm`***

In: ```docker run --help```

Out: ```--rm    Automatically remove the container when it exits```

## Question 2. Understanding docker first run 

Run docker with the python:3.9 image in an interactive mode and the entrypoint of bash.
Now check the python modules that are installed ( use ```pip list``` ). 

What is version of the package *wheel* ?

- ***0.42.0***
- 1.0.0
- 23.0.1
- 58.1.0

In: ``` docker run -it python:3.9 bash```

Out:
```
root@f025007d18e4:/# pip list
Package    Version
---------- -------
pip        23.0.1
setuptools 58.1.0
wheel      0.42.0
```

# Prepare Postgres

Run Postgres and load data as shown in the videos
We'll use the green taxi trips from September 2019:

```wget https://github.com/DataTalksClub/nyc-tlc-data/releases/download/green/green_tripdata_2019-09.csv.gz```

You will also need the dataset with zones:

```wget https://s3.amazonaws.com/nyc-tlc/misc/taxi+_zone_lookup.csv```

Download this data and put it into Postgres (with jupyter notebooks or with a pipeline)


## Question 3. Count records 

How many taxi trips were totally made on September 18th 2019?

Tip: started and finished on 2019-09-18. 

Remember that `lpep_pickup_datetime` and `lpep_dropoff_datetime` columns are in the format timestamp (date and hour+min+sec) and not in date.

- 15767
- ***15612***
- 15859
- 89009

In (SQL):
```
SELECT COUNT(*)

FROM green_taxi_data

WHERE lpep_pickup_datetime >= '2019-09-18 00:00:00'

AND lpep_dropoff_datetime <= '2019-09-18 23:59:59'
```
Out:
||count|
|-|-|
|1|15612|
## Question 4. Largest trip for each day

Which was the pick up day with the largest trip distance
Use the pick up time for your calculations.

- 2019-09-18
- 2019-09-16
- ***2019-09-26***
- 2019-09-21

In (SQL):

```
SELECT lpep_pickup_datetime
FROM green_taxi_data
ORDER BY trip_distance DESC
LIMIT 1
```
Out:
||lpep_pickup_datetime|
|-|-|
|1|2019-09-26 19:32:52|

## Question 5. Three biggest pick up Boroughs

Consider lpep_pickup_datetime in '2019-09-18' and ignoring Borough has Unknown

Which were the 3 pick up Boroughs that had a sum of total_amount superior to 50000?
 
- ***"Brooklyn" "Manhattan" "Queens"***
- "Bronx" "Brooklyn" "Manhattan"
- "Bronx" "Manhattan" "Queens" 
- "Brooklyn" "Queens" "Staten Island"

In (SQL):
```
WITH t AS 
(
	SELECT z."LocationID", z."Borough", g."PULocationID", g."total_amount", g."lpep_pickup_datetime"
	FROM public.green_taxi_data g
	INNER JOIN public.zones z
	ON z."LocationID" = g."PULocationID"
	AND DATE(g."lpep_pickup_datetime") = '2019-09-18'
)
SELECT t."Borough", SUM(t."total_amount")
FROM t
GROUP BY t."Borough"
ORDER BY SUM(t."total_amount") DESC
LIMIT 3
```
Out:

||Borough | sum  |
|-|:---|:---|
|1|Brooklyn|96333.23999999934|
|2|Manhattan|92271.2999999985|
|3|Queens|78671.70999999883|

## Question 6. Largest tip

For the passengers picked up in September 2019 in the zone name Astoria which was the drop off zone that had the largest tip?
We want the name of the zone, not the id.

Note: it's not a typo, it's `tip` , not `trip`

- Central Park
- Jamaica
- ***JFK Airport***
- Long Island City/Queens Plaza

In (SQL):
```
WITH t AS 
(
	SELECT z."LocationID", z."Zone", g."DOLocationID",g."PULocationID", g."tip_amount", g."lpep_pickup_datetime"
	FROM public.green_taxi_data g
	INNER JOIN public.zones z
	ON z."LocationID" = g."DOLocationID"
	WHERE g."PULocationID"=7
	
)
SELECT t."Zone",MAX(t."tip_amount")
FROM t
GROUP BY t."Zone"
ORDER BY MAX(t."tip_amount") DESC
LIMIT 1
```
Out:

||Zone|max|
|-|-|-|
|1|JFK Airport|62.31|

## Terraform

In this section homework we'll prepare the environment by creating resources in GCP with Terraform.

In your VM on GCP/Laptop/GitHub Codespace install Terraform. 
Copy the files from the course repo
[here](https://github.com/DataTalksClub/data-engineering-zoomcamp/tree/main/01-docker-terraform/1_terraform_gcp/terraform) to your VM/Laptop/GitHub Codespace.

Modify the files as necessary to create a GCP Bucket and Big Query Dataset.


## Question 7. Creating Resources

After updating the main.tf and variable.tf files run:

```
terraform apply
```

Paste the output of this command into the homework submission form.


## Submitting the solutions

* Form for submitting: https://courses.datatalks.club/de-zoomcamp-2024/homework/hw01
* You can submit your homework multiple times. In this case, only the last submission will be used. 

Deadline: 29 January, 23:00 CET