# Bucket List

Save and share your bucket list with the world. Just type in where you want to go and Bucket List does the rest. Location data including coordinates and images are pulled from the Google Places API. Browse all posts if you're looking for inspiration.

Posts have public categories, locations, and can be saved to board(s) each user has. Users can search for specific posts, locations, and categories with the search bar in the navbar. Selecting a location or category will allow a user to browse all posts with that location/category, while selecting a post will bring the user to that post.

## Final Product

![Home page](https://github.com/da-morgan/to-do-midterm/blob/master/img/todos.png)

Home page with all posts. Browse through posts for inspiration for your next tripe. Seed images of kittens were used.

![Create a post](https://github.com/da-morgan/to-do-midterm/blob/master/img/mobile.png)

Create a post with help from the Google Places API. Type in where you want to go and information about that location will automatically be pulled in.

![Create a post](https://github.com/da-morgan/to-do-midterm/blob/master/img/mobile.png)

A post after creation. View the posts' title, how many likes the post has, the categories and boards it has, and the location on a Google map. Browse all posts in a category or saved to a specific board by clicking on the button.

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
