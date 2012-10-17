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