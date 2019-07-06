# 0x287 A Game of Chance

# The final program in this section is a set of games of chance that use many of
# the concepts we've discussed.

# The program uses pseudo-random number generator functions to provide the element
# of chance. It has three different game functions, which are called using a single
# global function pointer, and it uses structs to hold data for the player,
# which is saved in a file.

# Multi-user file permissions and user IDs allow multiple users to play and maintain
# their own account data.

# Here is an example (103 page).
gcc -o game_of_chance game_of_chance.c
sudo chown root:group ./game_of_chance
sudo chmod u+s ./game_of_chance
./game_of_chance

"""
-=-={ New Player Registration }=-=-
Enter your name: Daeha Kim

Welcome to the Game of Chance Daeha Kim.
You have been given 100 credits.
-=[ Game of Chance Menu ]=-
1 - Play the Pick a Number game
2 - Player the No Match Dealer game
3 - Play the Find the Ace game
4 - View current high score
5 - Change your user name
6 - Reset your account at 100 credits
7 - Quit
[Name: Daeha Kim]
[You have 100 credits] -> 1

[DEBUG] current_game pointer @ 0x0664cba0

####### Pick a Number #######
This game costs 10 credits to play. Simply pick a number
between 1 and 20, and if you pick the winning number, you
will win the jackpot of 100 credits!

10 credits have been deducted from your account.
Pick a number between 1 and 20: 14
The winning number is 14
*+*+*+*+*+* JACKPOT *+*+*+*+*+*
You have won the jackpot of 100 credits!

You now have 190 credits
Would you like to play again? (y/n)  y

[DEBUG] current_game pointer @ 0x0664cba0

####### Pick a Number #######
This game costs 10 credits to play. Simply pick a number
between 1 and 20, and if you pick the winning number, you
will win the jackpot of 100 credits!

10 credits have been deducted from your account.
Pick a number between 1 and 20: 20
The winning number is 2
Sorry, you didn't win.

You now have 180 credits
Would you like to play again? (y/n)  y

[DEBUG] current_game pointer @ 0x0664cba0

####### Pick a Number #######
This game costs 10 credits to play. Simply pick a number
between 1 and 20, and if you pick the winning number, you
will win the jackpot of 100 credits!

10 credits have been deducted from your account.
Pick a number between 1 and 20: 1
The winning number is 8
Sorry, you didn't win.

You now have 170 credits
Would you like to play again? (y/n)  n
-=[ Game of Chance Menu ]=-
1 - Play the Pick a Number game
2 - Player the No Match Dealer game
3 - Play the Find the Ace game
4 - View current high score
5 - Change your user name
6 - Reset your account at 100 credits
7 - Quit
[Name: Daeha Kim]
[You have 170 credits] -> 2

[DEBUG] current_game pointer @ 0x0664ccd0

::::::: No Match Dealer :::::::
In this game, you can wager up to all of your credits.
The dealer will deal out 16 random numbers between 0 and 99.
If there are no matches among them, you double your money!

How many of your 170 credits would you like to wager?  30
		::: Dealing out 16 random numbers :::
26	49	1	66	86	0	24	62
96	22	36	17	12	0	16	54
The dealer matched the number 0!
You lose 30 credits.

You now have 140 credits
Would you like to play again? (y/n)  y

[DEBUG] current_game pointer @ 0x0664ccd0

::::::: No Match Dealer :::::::
In this game, you can wager up to all of your credits.
The dealer will deal out 16 random numbers between 0 and 99.
If there are no matches among them, you double your money!

How many of your 140 credits would you like to wager?  40
		::: Dealing out 16 random numbers :::
29	92	12	85	7	65	61	39
48	94	6	6	89	13	67	68
The dealer matched the number 6!
You lose 40 credits.

You now have 100 credits
Would you like to play again? (y/n)  y

[DEBUG] current_game pointer @ 0x0664ccd0

::::::: No Match Dealer :::::::
In this game, you can wager up to all of your credits.
The dealer will deal out 16 random numbers between 0 and 99.
If there are no matches among them, you double your money!

How many of your 100 credits would you like to wager?  50
		::: Dealing out 16 random numbers :::
53	70	2	91	1	43	9	3
82	88	95	14	46	73	22	46
The dealer matched the number 46!
You lose 50 credits.

You now have 50 credits
Would you like to play again? (y/n)  50

[DEBUG] current_game pointer @ 0x0664ccd0

::::::: No Match Dealer :::::::
In this game, you can wager up to all of your credits.
The dealer will deal out 16 random numbers between 0 and 99.
If there are no matches among them, you double your money!

How many of your 50 credits would you like to wager?  Nice try, but you must wager a positive number!
How many of your 50 credits would you like to wager?  20
		::: Dealing out 16 random numbers :::
78	83	44	52	78	30	12	70
87	32	65	25	72	91	32	40
The dealer matched the number 32!
You lose 20 credits.

You now have 30 credits
Would you like to play again? (y/n)  n
-=[ Game of Chance Menu ]=-
1 - Play the Pick a Number game
2 - Player the No Match Dealer game
3 - Play the Find the Ace game
4 - View current high score
5 - Change your user name
6 - Reset your account at 100 credits
7 - Quit
[Name: Daeha Kim]
[You have 30 credits] -> 3

[DEBUG] current_game pointer @ 0x0664cf40
******* Find the Ace *******
In this game, you can wager up to all of your credits.
Three cards will be dealt out, two queens and one ace.
If you find the ace, you will win your wager.
After choosing a card, one of the queens will be revealed.
At this point, you may either select a different card or
increase your wager.

How many of your 30 credits would you like to wager?  10

	*** Dealing cards ***
      	._.	._.	._.
Cards:	|X|	|X|	|X|
	 1 	 2 	 3
Select a card: 1, 2, or 3  3

	*** Revealing a queen ***
      	._.	._.	._.
Cards:	|X|	|Q|	|X|
			 ^-- your pick
Would you like to:
[c]hange your pick	or	[i]ncrease your wager?
Select c or i:  i
How many of your 30 credits would you like to wager?  10

	*** End result ***
      	._.	._.	._.
Cards:	|A|	|Q|	|Q|
			 ^-- your pick
You have lost 10 credits from your first wager
and an additional 10 credits from your second wager!

You now have 10 credits
Would you like to play again? (y/n)  n
-=[ Game of Chance Menu ]=-
1 - Play the Pick a Number game
2 - Player the No Match Dealer game
3 - Play the Find the Ace game
4 - View current high score
5 - Change your user name
6 - Reset your account at 100 credits
7 - Quit
[Name: Daeha Kim]
[You have 10 credits] -> 6

Your account has been reset with 100 credits.

-=[ Game of Chance Menu ]=-
1 - Play the Pick a Number game
2 - Player the No Match Dealer game
3 - Play the Find the Ace game
4 - View current high score
5 - Change your user name
6 - Reset your account at 100 credits
7 - Quit
[Name: Daeha Kim]
[You have 100 credits] -> 5

Change user name
Enter your new name: kdh
Your name has been changed.

-=[ Game of Chance Menu ]=-
1 - Play the Pick a Number game
2 - Player the No Match Dealer game
3 - Play the Find the Ace game
4 - View current high score
5 - Change your user name
6 - Reset your account at 100 credits
7 - Quit
[Name: kdh]
[You have 100 credits] -> 5

Change user name
Enter your new name: KDH
Your name has been changed.

-=[ Game of Chance Menu ]=-
1 - Play the Pick a Number game
2 - Player the No Match Dealer game
3 - Play the Find the Ace game
4 - View current high score
5 - Change your user name
6 - Reset your account at 100 credits
7 - Quit
[Name: KDH]
[You have 100 credits] -> 4

====================| HIGH SCORE |====================
You currently have the high score of 190 credits!
======================================================

-=[ Game of Chance Menu ]=-
1 - Play the Pick a Number game
2 - Player the No Match Dealer game
3 - Play the Find the Ace game
4 - View current high score
5 - Change your user name
6 - Reset your account at 100 credits
7 - Quit
[Name: KDH]
[You have 100 credits] -> 7

Thanks for playing! Bye.
"""
