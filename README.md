# Project 5 - *CodePath Twitter*

**CodePath Twitter** is a basic twitter app to read and compose tweets the [Twitter API](https://apps.twitter.com/).

Time spent: **27** hours spent in total

## User Stories

The following **required** functionality is completed:

- [x] User sees app icon in home screen and styled launch screen. (1pt)
- [x] User can sign in using OAuth login flow. (1pt)
- [x] User can Logout. (1pt)
- [x] Create Data Models for User and Tweet. (1pt)
- [x] User can view last 20 tweets from their home timeline with the user profile picture, username, tweet text, and timestamp. (2pts)
- [x] User can pull to refresh. (1pt)
- [x] User can tap the favorite button in a tweet cell to favorite a tweet. (1pts)
- [x] User can tap the retweet button in a tweet cell to retweet a tweet. (1pts)
- [x] Using AutoLayout, the Tweet cell should adjust it's layout for iPhone 7, Plus and SE device sizes as well as accommodate device rotation. (1pt)

- [x] User can tap on a tweet to view it in a detail view, with controls to retweet, favorite, and reply.
- [x] User can compose a new tweet by tapping on a compose button.
- [x] When composing a tweet, user sees a countdown for the number of characters remaining for the tweet (out of 140)
- [x] User can view their profile in a profile tab

The following **stretch** features are implemented:

- [x] The current signed in user will be persisted across restarts. (1pt)
- [ ] Each tweet should display the relative timestamp for each tweet "8m", "7h". (1pt)
- [x] User should be able to unretweet and unfavorite and should decrement the retweet and favorite count. (1pt)
- [ ] Links in tweets are clickable. (2pts)
- [ ] User can load more tweets once they reach the bottom of the feed using infinite loading similar to the actual Twitter client. (2pts)

The following **additional** features are implemented:

- [ ] List anything else that you can get done to improve the app functionality!

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. I really had issues interacting with the API, so I would like to talk more about how to properly interface with an API.
2. I would love to discuss syntax for closures.

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='https://i.imgur.com/W9OWQYq.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />
<img src='https://i.imgur.com/b5eM295.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />
<img src='https://i.imgur.com/WdhDxS3.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />


GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

Describe any challenges encountered while building the app.

- I had challenges with the auto-layout functionality with the retweet, favorite, and comment buttons.
- I had challenges connecting with the API because I was implementing the load from memory method, so I was not getting fresh data. This is why I was having so much trouble implementing the favorite button. 

## Credits

List an 3rd party libraries, icons, graphics, or other assets you used in your app.

- [AFNetworking](https://github.com/AFNetworking/AFNetworking) - networking task library

## License

Copyright [2018] [CodePath and Claudia Nelson]

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
