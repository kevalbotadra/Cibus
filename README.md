# Cibus

Video (with demo) can be found at: https://devpost.com/software/cibus-57ghn4

## Inspiration
We gathered a lot of our inspiration from former experiences, more specifically, the experiences of two of our team members who are former chipotle employees. Although we learned a lot from there, one part of the job never stood right with us, and that was the fact that at the end of every night, they threw out any food that wasn't beans or meat. This meant that some nights, the store was throwing away pans of rice, tens of bags of chips, and so much more. When first learning about this hackathon and beginning our brainstorming process we immediately thought back to this experience. 

We also obtained inspiration from our local soup kitchen that we are currently working with on a separate project. One time during one of our meetings with them, they had mentioned how, as an organization, they were insanely busy and did not have any employees or volunteers at their service to go out and pick up food that was going to be donated, and that's why they required any donor to drive all the way to their facility and donate their food there. This is obviously inefficient as people at home don't always have the time to drive to the soup kitchen to donate their food. The same applies to large organizations as they are too busy to drive to donate food, and at the same time, they don’t get any benefit from donating which makes it less appealing. This sparked the idea of further researching and developing a solution to properly implement the transportation aspect, as well as look into an incentive system. 

## What it does
**The App**
Upon first opening the app, the user will have to go through a quick onboarding where they will learn more about the app. Then they will be prompted to create an account or log in using their email and password. If they are signing up they will also be asked to submit additional information such as their name, organization info, and organization type. 
Once the user is signed in they will have full access to the app. The app can be broken down into 4 parts:
The Feed: This page will essentially display all the current donation posts that are waiting to be accepted. When a post is clicked on, the app will redirect the user to a page that has more information regarding the donation. This is also where the receivers will have the ability to accept the posts. 
The Map: On this page, a map will appear displaying little markers at the pickup location of every donation around the user’s current location.  This is simply a way for receivers to get a better feel for where donations are around them.
Create Page: On this page, donors will have the ability to create donation posts. They will have to enter information about the post such as the title of the food, a body containing more information about the donation, the weight, location, and an image of the donation. Once the post is created it will be created in the database and visible on the feed and account page.
Account Page: This page simply displays statistics about the user. If they are a donor it will display all the posts they have created in the past, and if they are a receiver it will show their history of accepted donation posts.

**How did we manage food transportation when a receiver accepts a donation?**
Whenever a post is accepted, a notification will be sent out to a driver telling them the pickup location and the dropoff location off the donation as well as any additional info they may require. These drivers will be from non-profit organizations that we pair up with. These non-profit organizations will consist of institutions such as Invisible Hands and Delivering Good. By utilizing these existing non-profits our solution becomes a lot more feasible as we will be minimizing our costs by not spending additional money on cars and drivers. 

**What incentives are there for organizations to make donations?**
We plan to gain incentives from organizations in two ways. First and foremost, we plan to implement our own cryptocurrency known as Cibus Coins, which is built on top of the Ethereum network. Each coin will be given a monetary value. For each donation, an organization will receive a certain number of Cibus Coins and follow the rules of blockchain and crypto, as more donations are made, more coins will be distributed, thereby increasing the value of a Cibus Coin. This system will give people a reason to want to donate, further reducing the amount of food wasted annually. The second method of incentives is simply encouraging organizations to invoke their yearly donations quota which will provide them with tax deductions. We encourage them by simply giving them a major platform to easily make these donations.

**Proactive Data-Driven Solutions**
While our solution provides reactive help to the food waste problem, we can utilize data collected from our app to implement proactive data-driven solutions that will be capable of stopping food waste before it even happens. Our app currently collects lots of data like what foodservice organizations post for donation, how frequently donations are posted, and how much weight of each food is being posted. Using this data we can implement those further solutions, for example, if a restaurant is consistently having a surplus of 500 oz of a certain food every day, we can send them alerts, telling them to lower the production of that food ultimately minimizing the waste.


## How we built it
**Brainstorm Phase**
The first phase of this app was brainstorming the idea. To do this we researched different problems and used the inspiration discussed previously. Once we had our initial idea of creating a platform to connect food organizations (grocery stores, restaurants, and farms) with food shelters/banks, we decided to get to work right away on designing the app and developing it, while still continuing to build on the idea. We eventually talked to some mentors and built on our idea by adding the transportation and incentive aspects. 

**Developing Phase**
The app was designed in Figma and then developed using Flutter and Firebase. We also used external packages and APIs like Google Maps, GeoCoding, GeoLocator, and more. In order to manage the state, we used the flutter bloc library. The bloc flow is pretty straightforward, as the UI sends events to the bloc which will interact with the database through repositories and once the bloc has completed its task and obtained data, it will emit it back to the UI through a state. For more inquiries regarding our code check out our GitHub repo linked below and feel free to message us!

## Challenges we ran into
We ran into a few challenges in both the brainstorming and development phase of this app. We found it hard to properly provide an incentive system until we realized that we could use crypto currency to solve our problem. We also faced the issue of wanting to create an entire application within 2 days and fighting against time to do so. We also have a little trouble creating the video but overall we learned a lot not just about food waster, but how to fully brainstorm and implement a solution to an existing problem, use technologies like flutter, and create videos!

## Accomplishments that we’re proud of
We are very proud of our entire solution as we feel that it is definitely something that is realistic and could be used to help people in the real world. (It’s just cool to think that real people could actually utilize a solution we brainstormed!). We are really happy that we were able to create a functioning application in such a short amount of time as that was definitely a tough part of our hack. We are also really proud of the video we produced as it was difficult to put all our thoughts into such a short video.

## What we learned
Although we had definitely been exposed to food waste before and had heard about it, none of our group members were fully understanding of the actual problem at hand and definitely opened our eyes up to the problem at hand. I think all of us are going to be more proactive about food waste and make sure that we don’t contribute to this issue!  We also got to learn about how to properly create a solution to an existing problem and actually create a proper implementation plan.

## What's next for Cibus
Cibus is an app that we plan to expand beyond just the food industry. We plan to separate the app to have different sections that tackle different industries, including clothing, toys, and more. This way any organization/home will be able to donate whatever they wish with the same incentives, and our app will still be able to offer transportation services and a large platform.
