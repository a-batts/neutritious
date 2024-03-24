# neutritious
> _As in neural, nutritious_

For HooHacks 2024 🦉 | Live at [neutritio.us](https://neutritio.us)

---

## Mission 🚀

> “Just like it’s hard to make really good food choices when you are already hungry, it’s really hard to make good dopamine choices when you’re already low on dopamine.”
> \- Jessica McCabe

What's the solution? A [Dopamenu](https://www.additudemag.com/dopamenu-dopamine-menu-adhd-brain/)!

By separating the planning and the choosing of dopamine-increasing activities, a dopamine menu provides the user with a **curated, pre-chosen list of activities**, making it easier to select the ones that will benefit them the most. Rather than waiting until you are hungry to decide if you should get fast food, planning ahead will help you make the best decision.

Our project aims to implement the idea of a dopamenu as described in the [ADDitude article](https://www.additudemag.com/dopamenu-dopamine-menu-adhd-brain/) mentioned above.

## What's on the menu? 🍽️

Much like a restaurant menu, the dopamenu is split into sections.

1. **Appetizers**: Quick activities to give you a boost. Listening to a favorite song, having a snack, doing the Wordle.
2. **Entrées**: Longer activities that contribute to a healthy and productive lifestyle while boosting dopamine levels. Practicing a hobby, exercising, baking.
3. **Sides**: Supplemental activities to make boring tasks more palatable. Listening to white noise, playing with a fidget, working outside.
4. **Desserts**: Activities that are easy to overdo, but are great in moderation. Streaming, playing video games, catching up with social media.

These categories allow the user to mindfully assess their situation and decide what kinds of activities to do.

## Our implementation 🌐

Our webapp is built in **Flutter**, with **Firebase** powering authentication, deployment, and data storage on the backend.

Once the user logs in, they are greeted with the main categories of the Dopamenu. selecting any of these will bring them to a list of activities. They can choose one of these, or press the Randomize button to roll the dice. The user can add their own activities, as well as like and dislike the built-in suggestions to curate their menu.