# shopping Basket

### Table of Contents

1. [Introduction](#introduction)
2. [Setup](#setup)
3. [Running the Application](#running-the-application)


----


# Introduction
This repository is for the Rails-based app that helps doctors with immediate medical information on their phones, helping them provide the right treatment at the right moment. With our mobile app, we make their jobs easier and save them time, so they can dedicate more time to their real job, helping patients. We started with an idea from two doctors in 2012, and we are now by far the most popular medical information app in 8 countries and expanding, with an enthusiastic and growing team of 21 people.

## Problem Statement
This problem requires some kind of input. You are free to implement any mechanism for feeding the input into your solution. You should provide sufficient evidence that your solution is complete by, as a minimum, indicating that it works correctly against the supplied test data.

Basic sales tax is applicable at a rate of 10% on all goods, except books, food, and medical products that are exempt. Import duty is an additional sales tax applicable on all imported goods at a rate of 5%, with no exemptions.

When I purchase items I receive a receipt which lists the name of all the items and their price (including tax), finishing with the total cost of the items, and the total amounts of sales taxes paid. The rounding rules for sales tax are that for a tax rate of n%, a shelf price of p contains (np/100 rounded up to the nearest 0.05) amount of sales tax.

Write an application that prints out the receipt details for these shopping baskets:

## Input

#### Input 1:
```
2 book at 12.49
1 music CD at 14.99
1 chocolate bar at 0.85
```
#### Input 2:
```
1 imported box of chocolates at 10.00
1 imported bottle of perfume at 47.50
```
#### Input 3:
```
1 imported bottle of perfume at 27.99
1 bottle of perfume at 18.99
1 packet of headache pills at 9.75
3 imported boxes of chocolates at 11.25
```
## Output
#### Output 1:
```
2 book: 24.98
1 music CD: 16.49
1 chocolate bar: 0.85
Sales Taxes: 1.50
Total: 42.32
```
#### Output 2:
```
1 imported box of chocolates: 10.50
1 imported bottle of perfume: 54.65
Sales Taxes: 7.65
Total: 65.15
```
#### Output 3:
```
1 imported bottle of perfume: 32.19
1 bottle of perfume: 20.89
1 packet of headache pills: 9.75
3 imported box of chocolates: 35.55
Sales Taxes: 7.90
Total: 98.38
```


----


# Setup
Here's how to test the application on your local computer for development:


### Installation
Follow these instructions to setup your local development environment:

1. Clone the project and `cd` into the project directory

2. Run `bundle install` to install RSpec dependencies.



----


# Running the Application
There are three input files in the `lib/assests` folder that serves as the shopping baskets for testing the application

1. Run `Ruby challenge.rb <input_file_name>`. E.g: E.g: `Ruby challenge.rb input_3`
2. Run `rspec spec` to run all the tests for the application.

Note: The `input_file_name` should not include the file_name extension.


