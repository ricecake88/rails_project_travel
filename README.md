# Travel - Start to Finish

## Description
 
The Travel Start to Finish application is a travel planning application for users that like to plan out more details of their itinerary. Users can create any vacation and plan out their days by specifying attractions of places they have listed where they will go. (Eventually, food, hotels and transport will be included). If a vacation has multiple legs (meaning point A to point B, but then point B to C, before going back to A), this application will support it. It is the planner for people who love to have a solid plan as they outline their vacations.

## How to Install from the repo

In the command line to start up the application:

* `git clone https://github.com/ricecake88/rails_project_travel <folder_you_would_like_to_call_it>`
* `bundle install`
* `rake db:migrate RAILS_ENV=test`
* If you want some initial data, please run:
  `rake db:seed`
* `thin start --ssl`

## How to use the application

From the main page, you can view the list of destinations, and browse the available attractions currently listed for each destination.

### Destinations

You can view the list of destinations here, and the associated attractions per destination.
Each attraction has a name and an admission price. The user also has the option to view attractions for a destination that are less than 20.

## Login

User can sign in to their account to plan their vacation, create a new account, or use Google to sign in.

## User Homepage

Here is where the list of vacations created by you will be displayed.

## Vacation

Once signed in, you can create a new vacation by selecting "New Vacation" from the Dashboard. You can name the trip to be anything.

For the dates, as long as the first day of the trip is before or equal to the last day of the trip, a vacation can be created. If you would like to recreate old vacations as a way to archive that information, you have the option to do that here.

Once created, you have the option to edit the times and the name, or delete the vacation altogether.

## Leg

This is where you want to create the legs of your trip, namely, city to city.

Example A: If you are visiting just one city, say, Seattle, you can list your departure city as your home city (if it is listed) and your Destination as Seattle. Since it is only one leg, it will just be 1 for "Which Leg", and it will be associated with the vacation that you have just created.

Example B: If you are visiting multiple cities, you will want to create multiple legs. For example, if you are traveling from San Diego to Seattle, then from Seattle to Banff, you would want to create two legs. 
A = San Diego
B = Seattle
C = Banff

Leg \#1 with the departure city as San Diego, the Destination as Seattle
Leg \#2 with the departure city as Seattle, and your destination as Banff.

One could create a third leg for the travel back from Banff to San Diego, or just add it to the itinerary of the leg from Seattle to Banff. 

You cannot create legs where the departure city and the destination city are the same.

## Itinerary Item

Whenever viewing a leg of a vacation, you can add an itinerary item.

An Itinerary Item denotes whether or not it will be a transport item, and event (meaning an attraction), or a food itinerary item. 

Currently the application only supports events or, attraction itinerary items. You will have to specify which day of the trip the itinerary item occurs on, as well as the time of the activity. You cannot select an attraction unless the type of activity is set to "Event".

Also the time is not checked against whether or not it is within the vacation time window, but this is is a future to-do.


