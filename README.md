Chris Ray, Ryan Tick, Nathan Vahrenberg
MGTI 40660

Summary:

Welcome to our Tournament Bracket Manager Web Application. This is our final project for MGTI 40660. This application will allow users to create and manage a tournament event with multiple teams.  Users will be able to add various rounds to the tournament.  From there users will be able to add different matches to each round and add the teams to the matches.

Matches will have a home team and an away team as well as a way to mark which team has won the match.  Once all matches in a round have a winner, the app will automatically create a new round and randomly assign the winners from the previous round into various matches.  This process will continue until only one team remains, who is declared the winner of the tournament.  

Instructions:

In order to begin, please clone our repository using the following command:

	git clone https://github.com/rtick/Tournament-Bracket-App

Once cloned, navigate inside the folder to Tournament-Bracket-App\bracket-app\ and run the following command in order to start the server:

	rails server

Once the server is running, open up your favorite web browser (our code was tested on IE, Firefox and Chrome) and type in the following address:

	http://localhost:3000/

This is the main page for our application. From here, you need to create a tournament. Click on the “New Tournament” link on the side bar. Enter a “Name” in for your tournament and click create. This will take you to the “teams” page, where you need to enter all of your teams for your tournament. Our bracket manager is optimized for 16 teams. It will not allow you to have more than 16 teams in one bracket. If you have less 16 teams, our manager will scale your bracket down to the respective size. For example, if you have 8 teams then you will have 8, 4, 2, 1 bracket. If you have an odd number of teams, we will add a "bye week" to the last team. Additionally, we may add "bye weeks" to make your bracket nicer. So with this example, if you have 9 teams entered, then the 9th team would have a bye week (play a "bye week" and automatically win). We would also add 6 more "bye weeks" to have your bracket formatted to a 16 team bracket so that everything looks nice. 

Nonetheless, Once you get your teams set up, click on the link on the side bar to create your round. Give your round a name, and from here your matches will be automatically generated. You can click on the matches link on the sidebar to see all of your matches. From this page, you will be able edit your matches (home and away teams, winner, and match name). 

Once all your matches are set up, you can go back and view your tournament bracket on the home page. As games are played, you can navigate back to matches and select a winner. Once all the winners of a round have been decided, our app will take you to the next round, and the next round until you reach the end of the tournament. 
