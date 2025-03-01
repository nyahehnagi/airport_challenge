Airport Challenge
=================

```
        ______
        _\____\___
=  = ==(____MA____)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                =  ===(_________)

```

## Airport Challenge

This program emulates an airport with the take off and landing of airplanes. The airport is subject to weather conditions which can prohibit the take off and landing of planes.

## Author Notes
This project is an end of week challenge to practice the concepts of test driven development based on the user stories provided.

As I look at what I have done retrospectively, I can see that I have not worked on each user story in a methodical way. This is apparent in the commit notes and the way the code got constructed. I am aware of this and it goes a long to explain why I spent so much time trying to get things to work. If I had stayed focused on a single user story I feel I would have had a better time of it and thus constructed better code with less edits later on down the line.

I also spent a fair amount of time trying to write good tidy code from the outset, so in essence refactoring to soon. So my take away here is.. just get it working and then worry about the refactor. Hence the Green, Red, Refactor mantra!

I have also dabbled with the use of shared context from RSpec to see how I could take mock configuration out of the test scripts, the initial idea was to reduce some of the repetitive code I had regarding landing lots of planes, I then thought I'd take the lions share of the config into a seperate file. Whether this is good practice, it's a conversation I need to have with my peers and coaches

I feel I need to continue getting my hands dirty in TDD and the use of the testing frameworks available.

## Files

This project contains the following files and directories
* `./docs` contains the domain_model
* `./lib` contains all core program files relating to the challenge, weather.rb, airport.rb and plane.rb
* `./spec` contains all spec files for the associated core files plus a `feature_spec.rb` used to test actual calls to the classes
* `./spec/support/mock_config.rb` this file  contains the mock configuration and helper functions used in the tests

## How to run tests

Navigate to root directory of the project `../airport_challenge`

run `rspec` from the command line

## Question For Coaches

* What is best practice regarding where to place mock config and how much config should be in that file
* I am testing for a returned plane in both land and take off. I could test for no error and test against the plane_inventory (I could then drop some tests).. However, I have added this extra public method to enable this. Is there a design pattern to test for what planes are in the airport without the creation of the public plane_inventory method

OK, I have thought about this.. I think there's an opportunity for a Hanger class, this is a collection of planes with maybe other functionality. This can be passed into the Airport. I can then test the Hanger class for the planes inside the hanger. This can then do away with the plane_inventory public method and simplify testing of planes in the airport. I have however run out of time! :(

Instructions
---------

* Feel free to use google, your notes, books, etc. but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

Steps
-------

1. Fork this repo, and clone to your local machine
2. Run the command `gem install bundler` (if you don't have bundler already)
3. When the installation completes, run `bundle`
4. Complete the following task:

Task
-----

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

```
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport

As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 

As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 
```

Your task is to test drive the creation of a set of classes/modules to satisfy all the above user stories. You will need to use a random number generator to set the weather (it is normally sunny but on rare occasions it may be stormy). In your tests, you'll need to use a stub to override random weather to ensure consistent test behaviour.

Your code should defend against [edge cases](http://programmers.stackexchange.com/questions/125587/what-are-the-difference-between-an-edge-case-a-corner-case-a-base-case-and-a-b) such as inconsistent states of the system ensuring that planes can only take off from airports they are in; planes that are already flying cannot take off and/or be in an airport; planes that are landed cannot land again and must be in an airport, etc.

For overriding random weather behaviour, please read the documentation to learn how to use test doubles: https://www.relishapp.com/rspec/rspec-mocks/docs . There’s an example of using a test double to test a die that’s relevant to testing random weather in the test.

Please create separate files for every class, module and test suite.

In code review we'll be hoping to see:

* All tests passing
* High [Test coverage](https://github.com/makersacademy/course/blob/main/pills/test_coverage.md) (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc. 

Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance will make the challenge somewhat easier.  You should be the judge of how much challenge you want this at this moment.

**BONUS**

* Write an RSpec **feature** test that lands and takes off a number of planes

Note that is a practice 'tech test' of the kinds that employers use to screen developer applicants.  More detailed submission requirements/guidelines are in [CONTRIBUTING.md](CONTRIBUTING.md)

Finally, don’t overcomplicate things. This task isn’t as hard as it may seem at first.

* **Submit a pull request early.**

* Finally, please submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am.
