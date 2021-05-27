# 2 Interview Code Challenges
Repository for interviewing / programming tests. 


## Palindrome
Implement a function detecting whether a string is a palindrome or not.
Example on valid input: `A Santa at Nasa`, `deleveled`, `Dumb mud`.
Example on invalid input: `Hello world`.
### Results Verified...
    - IsPalindrome( "A Santa at Nasa" ) == TRUE
    - IsPalindrome( "A man a plan a canal panama" ) == TRUE
    - IsPalindrome( "Dumb  mud" ) == TRUE
    - IsPalindrome( "Hello world" ) == FALSE

    

## LicensePlate
In a list of license plate numbers, detect whether the list contains any duplicates or not. 
In this case in Swedish format, with three letters followed by three digits, like `ABC123`.
The function should return true if the list contains duplicates and false if not.

> If interviewing senior developers, the problem can be tweaked to find an effective solution, which only looks at every license plate number at most once.
    

                        
### **/interview-tests** is Based on a *Single Source of Truth* (SSoT.me)
**Please Note** - This `README.md`, as well as most of the infrastructure for this repository are based on a Single Source of Truth, and the SSoT.me CLI.

The interview tests described below are Authoritatively Defined in `/SSoT/InterviewTests.csv`.  Additionally, the list of XUnit Tests which are performed on eaech function is authoritatively defined in `/SSoT/TestInputData.csv`.  

After making changes to either of these two files, simply run `> ssotme -build` to Update the README, Generate projects, Unit Test code and a Stub function which throws a `NotImplementedException()` for any new Interview Test added to the CSV.

You can install ssot.me with npm using `> npm install ssotme/cli -g`.  

