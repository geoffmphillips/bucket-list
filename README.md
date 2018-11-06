# Bucket List

Save and share your bucket list with the world. Just type in where you want to go and Bucket List does the rest. Location data including coordinates and images are pulled from the Google Places API. Browse all posts if you're looking for inspiration.

## Final Product

![Home page](https://github.com/da-morgan/to-do-midterm/blob/master/img/todos.png)

Home page with all tasks. The category of the todos can be changed via a dropdown menu. The todos can also be deleted. Any task that is uncategorized will be put into the generic "To Do" list.

![Mobile version](https://github.com/da-morgan/to-do-midterm/blob/master/img/mobile.png)

Flexbox css was used to create the responsive design. This allows for the web app to be used as a mobile web app.

## Getting Started

NOTE: Google Places API credentials are required to pull in data from Google. These credentials must be saved in a .env file as follows: ```GOOGLE_API_TOKEN='TOKEN'```

1. Clone this repo!
1. Install back-end dependencies with ```bundle```
1. Navigate to front-end directory and install front-end dependencies with ```npm i```
1. (OPTIONAL) Set up Google credentials as mentioned above.

## Dependencies (Vue Front-end)

* Google Places API
* Vue
* Vuex
* Vue Router
* Axios

## Dependencies (Rails API Back-end)

* bcrypt
* Knock
* JWT
* Rack-CORS
