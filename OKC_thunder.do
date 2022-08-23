/*OKC Thunder Assesment
  By: Kyle Chmielewski
  Date: August 23, 2022
*/

//Version
version 17

//working directory
pwd

//changing directory to desired location
cd "/Users/kchmielewski/Desktop/Thunder_Assignment"

//closes any log files that are still open
capture log close  

//creates log and starts recording output
log using OKC_assignment.log, replace 

//read in the dataset
import delimited "/Users/kchmielewski/Desktop/Thunder_Assignment/shots_data.csv"

//assign shot zones
gen Shot_Zone = "C3" if abs(x) >= 22 & y <= 7.8
replace Shot_Zone = "NC3" if sqrt((x)^2 + (y)^2) > 23.75 & Shot_Zone != "C3"
replace Shot_Zone = "2PT" if Shot_Zone != "NC3" & Shot_Zone != "C3"

//Shot Distribution for Team A
//2PT
count if team == "Team A"
gen team_a_total = r(N)
count if Shot_Zone == "2PT" && team == "Team A"
gen team_a_2PT = r(N)

//Team A 2PT %
disp (team_a_2PT/team_a_total)*100

//NC3
count if Shot_Zone == "NC3" && team == "Team A"
gen team_a_NC3 = r(N)

//Team A NC3%
disp (team_a_NC3/team_a_total)*100


//C3
count if Shot_Zone == "C3" && team == "Team A"
gen team_a_c3 = r(N)

//Team A C3%
disp (team_a_c3/team_a_total)*100


//Shot Distribution for Team B
//2PT
count if team == "Team B"
gen team_b_total = r(N)
count if Shot_Zone == "2PT" && team == "Team B"
gen team_b_2PT = r(N)

//Team B 2PT%
disp (team_b_2PT/team_b_total)*100


//NC3
count if Shot_Zone == "NC3" && team == "Team B"
gen team_b_NC3 = r(N)

//Team B NC3%
disp (team_b_NC3/team_b_total)*100


//C3
count if Shot_Zone == "C3" && team == "Team B"
gen team_b_c3 = r(N)

//Team B C3%
disp (team_b_c3/team_b_total)*100

//Effective Field Goal Percentage for Team A

//2PT
count if Shot_Zone == "2PT" && team == "Team A" && fgmade == 1 
gen team_a_made2PTs = r(N)

//eFG% of Team A in the 2PT zone
disp (team_a_made2PTs + (0.5*0)) / team_a_2PT

//NC3
count if Shot_Zone == "NC3" && team == "Team A" && fgmade == 1 
gen team_a_madeNC3s = r(N)

//eFG% of Team A in the NC3 zone
disp (team_a_madeNC3s + (0.5*team_a_madeNC3s)) / team_a_NC3

//C3
count if Shot_Zone == "C3" && team == "Team A" && fgmade == 1 
gen team_a_madeC3s = r(N)

//eFG% of Team A in the C3 zone
disp (team_a_madeC3s + (0.5*team_a_madeC3s)) / team_a_c3

//Effective Field Goal Percentage for Team B

//2PT
count if Shot_Zone == "2PT" && team == "Team B" && fgmade == 1 
gen team_b_made2PTs = r(N)

//eFG% of Team B in the 2PT zone
disp (team_b_made2PTs + (0.5*0)) / team_b_2PT

//NC3
count if Shot_Zone == "NC3" && team == "Team B" && fgmade == 1 
gen team_b_madeNC3s = r(N)

//eFG% of Team B in the NC3 zone
disp (team_b_madeNC3s + (0.5*team_b_madeNC3s)) / team_b_NC3

//C3
count if Shot_Zone == "C3" && team == "Team B" && fgmade == 1 
gen team_b_madeC3s = r(N)

//eFG% of Team A in the C3 zone
disp (team_b_madeC3s + (0.5*team_b_madeC3s)) / team_b_c3

 