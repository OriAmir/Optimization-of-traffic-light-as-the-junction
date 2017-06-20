# Optimization-of-traffic-light-as-the-junction

<h3>General</h3>

<ul>

<li>This is the repository of my final project B.Sc in Software engineer for year 2016-2017</li>
<li>The project takes place in the jerusalem College of Engineering, in Ramat Bet HaKerem, Jerusalem, Israel.</li>
<li>The project is scheduled between October 2016 untill July 2017</li>
<li>This repository will include all the codes and informations about the progress of the project, from the zero stage to the presentation.</li>

</ul>

<hr>

<h3>Staff</h3>

Presentor: Ori Amir

[![Ori](https://avatars2.githubusercontent.com/u/17565646?v=3&s=120)](https://github.com/OriAmir)

Academic advisor: Dr. Guy Leshem

<hr>

<h3>Abstract</h3>

As part of the requirements for the BSc Software Engineering degree in Azrieli – College of Engineering Jerusalem, I will implement a final project for the company SHEMER ENERGY LTD. This company develop a “smart city” and want to create smart system to control on traffic in the city by automatically system and without control center. 
Today, at most junctions where traffic lights are exist, a traffic light program is fitted to the junction condition and changes according to the hours or according to the predetermined events according to the specific junction, but the main problem is that the traffic light program is not automatically updated 
when there is an extreme state at the junction.
The goal of the project is to streamline the traffic lights by replacing the traffic light program with a program that matches traffic conditions at the junction and in fact minimizes waiting time at the junction. As part of the project, two main directions were examined in order to do so:
1. Choosing a static program from preset programs: The idea is to prepare a certain amount of traffic lights plans, run them all on the current situation at the junction and take the program will give the lowest total delay time at the junction.
2. Preparation of a dynamic program according to delays at the junction: The idea is not to choose from pre-prepared plans, but to prepare a real-time traffic plan, which is according to the total delay times at the intersection.
In order to simulate an junction I wrote a simulation program.

The simulation simulates movement at the intersection for a certain time according to the plans of pre-prepared traffic volumes, and changes the light program according to the situation at the intersection.

In the end, the goal of the simulation is to show that when we change the traffic light program to a program suitable for traffic volume at the junction, we will see 
an improvement in the time delay at the junction and in the number of vehicles that will cross the junction.

<hr>

<h3>How to run</h3>

For run this project you must have:
<ul>
<li>Operating System - Windows or macOS.</li>
<li>MATLAB software version 2016b or higher.</li>
</ul>

Steps:

<ol>
<li>Clone the branch 'master' to your computer.</li>
<li>Import the files into MATLAB.</li>
<li>Go to gui1.m file in your files list.</li>
<li>On navigation bar click editor -> play.</li>
</ol>


<hr>

<h3>Demo</h3>

The main screen of this simulation is:
<img src="http://i.imgur.com/FgyLquu.png"/>

You need to choose 3 different parameters for running:
<ul>
<li><b>Plan:</b> There is 3 different plans , every plan contain a different traffic volumes for simulation running.   </li>
<li><b>Time:</b> Time for running the simulation (It's not the real time , just time we imagine a junction).</li>
<li><b>Simulation type:</b> You have 2 options here:<br/>
  Static: to choose a traffic light program from a prepared programs.<br/>
  Dynamic: to create a dynamic traffic light program by the delay times at the junction .</li>
</ul>


After click on 'Start' button the simulation start to run :

<img src="http://i.imgur.com/Ta4EVCz.png"/>
The information on screen contains:
<ul>
<li>Number of round and how long the simulation run until now.</li>
<li>Current traffic light program.</li>
<li>Mark for vehicles:<br/>
Red: How many total vehicles arrival to specific lane on last 3.5 minutes.
Green: How many vehicles cross the junction with traffic light program does change on last 3.5 minutes.
Blue: How many vehicles cross the junction with traffic light program does not change on last 3.5 minutes.
</li>
</ul>

<I>If there is some change in traffic light a yellow square will blinking on the current traffic light program.</I>



After simulation finish to run :
<img src="http://i.imgur.com/6fWISue.png"/>

The information on screen contains:
<ul>
<li>Number of round and how long the simulation run until now.</li>
<li>Current traffic light program</li>
<li>Mark for vehicles:<br/>
Red: How many total vehicles arrival to specific lane on all simulation run.
Green: How many vehicles cross the junction with traffic light program does change on all simulation run.
Blue: How many vehicles cross the junction with traffic light program does not change on all simulation run.
</li>
</ul>

We could export all infromation from simulation running by click on 'export statics' button .

<hr>
<h3>Credits
</h3>


