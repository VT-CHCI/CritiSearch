# CritiSearch Models #

## School ##
### Attributes ###
* Name
* TimeZone

### Scaffold Generation statement ###
    rails g scaffold School name:string time_zone:timestamp

## Course ##
### Attributes ###
* Name
* Identifier

### Scaffold Generation statement ###
    rails g scaffold Course name:string identifier:string

## Section (of a class) ##
### Attributes ###
* teacher (will have to add this later, don't know how to add with scaffold generator)
* course
* meeting times (added on meetingtime generator)
* students (will have to add this later, don't know how to add with scaffold generator)
* school

### Scaffold Generation statement ###
    rails g scaffold Section course:belongs_to school:belongs_to

## MeetingTime ##
### Attributes ###
* description
* Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday
* period
* start_time
* end_time
* section
* start_date
* end_date

### Scaffold Generation statement ###
    rails generate scaffold MeetingTime description:string monday:boolean tuesday:boolean wednesday:boolean thursday:boolean friday:boolean saturday:boolean sunday:boolean period:string startTime:time endTime:time section:belongs_to startDate:date endDate:date

## RatingValue ##
### Attributes ###
* Name

### Scaffold Generation statement ###
    rails generate scaffold RatingValue name:string

## Rating ##
### Attributes ###
* Search_Item_ID
* URL
* Value

### Scaffold Generation statement ###
    rails generate scaffold Rating search_item:belongs_to url:string rating_value:belongs_to
#### Backbone Scaffolding ####
    rails g backbone:scaffold Rating search_item:belongs_to url:string rating_value:belongs_to


## Follow ##
### Attributes ###
* Search_Item_ID
* URL
* the rails create date will tell us when the person went to this link

### Scaffold Generation statement ###
    rails generate scaffold Follow search_item:belongs_to url:string


## Reflection ##
### Attributes ###
* Search_Item_ID
* reflection
* the rails create date will tell us when the person went to this link

### Scaffold Generation statement ###
    rails generate scaffold Reflection search_item:belongs_to reflection:text --no-stylesheets

## Seeding ##
### Sections ###
Science:
  id: 1
  course_id: 1
  school_id: 
  teacher_id: 

Math:
  id: 2
  course_id: 2
  school_id: 
  teacher_id: 

Social-Studies:
  id: 3
  course_id: 3
  school_id: 
  teacher_id: 

Language-Arts:
  id: 4
  course_id: 4
  school_id: 
  teacher_id: 

