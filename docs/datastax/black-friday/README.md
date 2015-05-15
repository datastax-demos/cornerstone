# Black Friday Demo

This project is currently being used for the DataStax certification program as
well as our Demos Team technical screenings.

The job description for the Data Visualization/Engineering Intern can be found
[here](https://gist.github.com/joaquincasares/af1a45b67088be5b9869).

The story of the demo can be found [here](SCRIPT.md).


## Out of Office until June 1st

I'll be out of the office until June 1st and will continue reviewing technical screens
then. If you need to get in contact with our Hiring Department before then,
please contact Jenna Connell at jconnell@datastax.com.

If you have any issues with any part of the setup, see if other candidates can
help you on HipChat. I'll review all missed logs upon my return.

If you cannot resolve the issues, please follow the instructions in the last
section of this document.


## Setup

**Note:** This entire setup expects an OS X or \*nix environment. Windows support
is close, but still needs modification. Ping me on
[HipChat](https://www.hipchat.com/gUPdWxUUx) if you do not have access to a
supported environment.

This project should follow the same
[documentation](../../../docs/datastax/cornerstone) as the `cornerstone` project and
should have all documentation updates there until `black-friday` project
is fully built out.

The script that links the `black-friday` project with the `cornerstone-python`
project can be found
[here](../../../vagrant/datastax/black-friday/3.start.sh).

Through the use of symlinks we are allowed to keep a [minimal project specific
layout](../../../web/datastax/black-friday) while directly benefiting
from the `cornerstone-python` project as well as enhancing it.

All modifications to Flask routing should take place
[here](../../../web/datastax/cornerstone-python/Cornerstone/routes/datastax/black_friday),
all static files should be added to their `datastax/black-friday` directory
[here](../../../web/datastax/cornerstone-python/Cornerstone/static),
and all template files should be added to a `black-friday` directory
[here](../../../web/datastax/cornerstone-python/Cornerstone/templates/datastax).

## Start

Once Virtualbox and Vagrant have been installed following the
[README](../../../README.md), run:

    run/datastax/black-friday/run

You'll be able to ssh into the box using:

    vagrant ssh singlenode

## Technical Screening

### Deadline

I'll be out of the office starting end of day May 15th and will return June 1st.
I still do not have a proper plan in place for interviews conducted during the
two weeks I'll be out of the office, but will update this section here.

If possible, I'd like to have technical screens in by May 15th, but I also
understand many of you are currently working on finals. If we can get them in by
May 15th, that's great, if not, work on them when you're free again. I, however,
will not be able to provide technical guidance during my OOO time, but the
Hipchat room will remain open for collaboration.

Good luck with your finals!

### Time Requirement

Since this is an open ended screening I would like to set the implementation time
suggestion to be of something close to an hour. What I'm looking for is a
candidate that:

* has a basic understanding of how the platform is integrated,
* is able to produce at least one additional chart based on the provided data,
* and is able to implement at least
[one additional chart type](https://google-developers.appspot.com/chart/interactive/docs/gallery).

Additionally, sketch out a general layout for a future interface and/or future data.
Evaluation criteria is as follows:

* main evaluation points:
    * futuristic/innovative use cases
    * ability to execute
    * intuitive design
* implementation preference, in order of highest preference:
    * React.js
    * Angular.js
    * Backbone.js
    * HTML
* web design:
    * vanilla Bootstrap implementation is all that's expected
* polish:
    * having placeholder charts, images, or text is all that's expected

### Summary

The technical screening will follow the same workflow as that of a normal day
in this position. The infrastructure and data will already be present and data
manipulation and visualization skills will be needed for this position. There are typically
minimal requirements for how the data should be presented so feel free to
greenfield ideas based on the provided data.

Since visualizing data will be the main aspect of the current position, the above
paragraph is a requirement. However, feel free to do quick iterations over fake
data or even build out an end-user interface as opposed to a dashboard interface.
Again, feel free to greenfield ideas since we are looking for high amounts of creativity
with minimal supervision.

Since this same screening is being given out to multiple candidates, please
submit the `git diff` output as well as screenshots of the created layouts.
Once an offer is made and accepted, we'll ask that the new hire submit a pull request
to the repository under their Github account.

### Questions?

If something is unclear, feel free to find me on
[HipChat](https://www.hipchat.com/gUPdWxUUx) between the hours of 9am-5pm CST.
If I don't respond within 10 minutes during the above availability hours,
feel free to @mention my name so I get a notification.
This should also be seen as
reminiscent of a normal day in this position and thus will be evaluated as part
of the interview process. I will be available to help field all questions
that cannot be found online and help clarify the current use cases.

Do be aware that other candidates may also be sitting in the channel, feel free
to collaborate with each other at a high level since this interaction will also
be evaluated, but please refrain from sharing implementation
details.

## Errors / Issues

If using Windows or encountering an error while using Vagrant, please paste the
error into the [HipChat](https://www.hipchat.com/gUPdWxUUx) room and submit it
with your final answer. Please also include all relevant information about the
system that you are on to help us debug that environment further.

The backup project would be to create an interesting demo, preferably using
Flask, that coincides with this [story](SCRIPT.md). Showcase your skills, your
imagination, and your capabilities at full-stack development.

This may seem too simple, or a trick, but rest assured it should be and is not,
respectively. Just showcase what you're good at and what comes naturally. Build
a demo using the technologies that you know to visualize data of your choosing.
The only requirement is that it fits into the retail market.
