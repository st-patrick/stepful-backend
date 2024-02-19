# README

Some basic info to get the API backend up and running quickly

* Ruby version ruby 3.2.3 (2024-01-18 revision 52bb2ac0a6) [x64-mingw-ucrt]

* System dependencies sqlite3

* Configuration: normal stuff... db:create db:migrate db:seed

* Deployment instructions: run with "rails s" in default configuration at localhost:3000

* ...


# Qs:
+ should there be a selection screen for Coaches?
+ what should the process be when the coach skipped reviewing a lesson or accidentally closed the tab?
+ does the API have any requirements? Middle ware, ...
+ can a 2h coach slot start at any time or only at a full / half hour? How fine-grained can the start time be?
+ are there any specific endpoints the API should have?
+ should the coaches be able to undo making a slot available and how long before the start of a slot?
+ should there be a minimum time before a slot starts when booking, so that a student can't book a slot that starts in 5m?
+ should it be allowed for two timeslots to overlap?
+ should it be possible for two timeslots to "merge" into one timeslot area? Like if 10-12 and 12-2 are available, a student could book 11 to 1.


# next steps ideas / upcoming todos:
+ slots of varying length
+ generally make the design less shitty
+ implement sensible steps for start_time (5m or 15m or 30m)
+ mount review view in same page as overview
+ better / airtight validation
+ coaches id 
+ the usual auth stuff (coaches can only review their own session, etc...)
+ optimize bandwidth / reduce request amount and size
+ the usual validation and injection issues esp with freeform notes
+ ...


## some more info on my work style that I call "handwriting"

... which you can think of as an extension of pseudo code, meaning writing down what I want the software to do in some type of human-readable pseudo-code style. Advantage being that it can always remain a source of truth, no matter what updates are applied, which versions of what and what programming language or framework are in use. Here's what that looks like when getting started:

```
saveDate()
setSlotAvailableAt(Time)
pickDate()
pickCoach()
renderAllAvailableSlots()
getAllAvailableSlots()

bookSlot(slot id) or (coach id, time)
renderMySlots()
reviewSlot(score, notes)
renderPastReviews()
```

now I didn't end up using any of these method names but it helps me get a first "shape" what the code does.
Here's the same thing but with API endpoints

```
GET	/coaches		all coaches sorted by id		
PATCH   /slots/:id 		book slot identified by slot id	
POST	/slots/:id/review	create a review consisting of score and notes
GET 	/slots all 		slots sorted by time					
GET     /coach/:id/slots 	all slots made available by this coach
GET	/coach/:id/slots/past	all previous slots and reviews
POST	/slot			create a new slot					
GET	/student/:id/slots	all slots booked by this student
```

again, some endpoints are now named differently but it's my way of getting a first grasp on the specifics.

And finally, a basic pseudo code style overview of the data models:

```
Slot
	belongs to Coach coach
	has one Time start_time
	has one Student booked_by // has a default value if not yet booked, like "null" or so
	has one Review review

Review
	belongs to Slot
	has one integer score
	has one text notes

Coach
	has one String name
	has many Slots
	has many Students

Student
	has one String name
	has many Slots
```









