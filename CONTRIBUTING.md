# Contributing to Speakerline

Want to contribute to Speakerline? That's great! Here are a few guidelines that will help you to do so.

Before we get started: Please note that this project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md) to ensure that it is a welcoming place for **everyone** to contribute to. By participating in this project you agree to abide by its terms.

#### Contents

* [Contributing workflow](#contributing-workflow)
* [Setup instructions](#setup-instructions)
* [Reporting a bug](#reporting-a-bug)
* [Contributing to an existing issue](#contributing-to-an-existing-issue)
* [Our labels](#our-labels)
* [Credits](#credits)

## Contributing workflow

* Fork the project
* Clone a version to your local machine
* *Test-drive* your feature addition or bug fix
* Push your code to your forked repo
* Submit your pull request!

## Setup instructions

You can find instructions on how to install the correct Ruby and Postgres versions in our [README](https://github.com/nodunayo/speakerline#setting-up-for-local-development).
You'll also find information on setting up the database, getting the tests running,
and running the site locally.


## Reporting a bug

So you've found a bug, and want to help us fix it? Yay, thank you!

Before filing a bug report, please double-check that the bug hasn't already been reported. You can do so in our [issue tracker](https://github.com/nodunayo/speakerline/issues?q=is%3Aissue+is%3Aopen+label%3Abug). If the same issue hasn't already been raised, please go ahead and create a new issue with the following information:

* On which page did the error happen?
* How can the error be reproduced?

Where possible, please provide the error message or a screenshot to illustrate the problem.

If you want to be really thorough, there is a great overview on Stack Overflow of [what you should consider when reporting a bug](http://stackoverflow.com/questions/240323/how-to-report-bugs-the-smart-way).

You are more than welcome to help investigate further and/or find a fix for the bug.
If you want to do so, just offer your help within your bug report!

## Contributing to an existing issue

### Finding an issue to work on

We've got a few open issues and are always glad to get help. Have a look at our
[list of issues](https://github.com/nodunayo/speakerline/issues). Most of the issues are labelled. You can use the labels to get an idea of which issue might be a good fit for you. (Here's [a helpful article](https://medium.freecodecamp.com/finding-your-first-open-source-project-or-bug-to-work-on-1712f651e5ba) on how to find your first bug to fix.)

Before getting to work, take a look at the issue and the conversation around it. Has someone already offered to work on the issue? Has someone been assigned to the issue? If so, you might want to check with them to see whether they're still actively working on it.

If the issue is a few months old, it might be a good idea to write a short comment to double-check that the issue or feature is still a valid one to jump on.

Feel free to ask for more detail on what is expected: are there any more details or specifications you need to know?

If at any point you get stuck: don't hesitate to ask for help! If you want to
reach out to me outside of GitHub, [drop me an email](mailto:nodunayo@gmail.com)
or [DM me on Twitter](https://twitter.com/nodunayo).

### Making your contribution

Check out the [contributing workflow](#contributing-workflow) above.
If you're a first-timer, don't worry! GitHub has loads of guides to help you
through your first pull request. Find out more [about pull requests](https://help.github.com/articles/about-pull-requests/) and [about creating a pull request](https://help.github.com/articles/creating-a-pull-request/).

## Our labels

- **blocked**: We will mark an issue as blocked if it requires more context for us to fix, is waiting on an updated version of a library that the issue depends on, or is waiting on a maintainer to do something before it can be answered. There may be other conditions in which we'll mark an issue as blocked and we'll make this clear in the issue comments.

- **bug**: An issue gets marked as a bug if (surprise!) the issue is linked to a bug in our code or something broken in our infrastructure. Bugs are usually the highest priority kind of issue as they will affect our users.

 - **dependencies**: If you're into gems, bundler and dependency management, then these are the issues for you. These issues tend to be good first issues as they typically consist of a straightforward gem version update.

- **design**: This relates to visual elements of the site that could be improved or are broken. These may be as simple as a change to a CSS colour or font size, but can stretch all the way to things that do not render as expected on mobile devices. These are usually good issues for people with front-end development experience to tackle.

- **documentation**: If an issue requires changes or clarification to our documentation (README, CONTRIBUTING, wiki, code comments, etc.) then it will be marked with this label. These issues normally do not pertain to code changes so may be suitable for first-timers or those new to the project.

- **duplicate**: If an issue has been reported before, it will be marked with this label. This flags that a previous issue may not have been fixed as expected, or in the case of things we don't intend to fix or issues currently in discussion in another open issue, it means that we are likely to close the issue.

- **enhancement**: These are improvements to the codebase that are "nice to have", and are usually of medium to high impact but low importance. This includes improvements to features that already exist and may be assigned a milestone to give you an idea as to when it might be implemented. These are great for contributors that might have some extra spare time on their hands and would prefer to change existing code rather than add large chunks of brand new code.

- **feature**: An issue will be marked with this label if it adds a new, discrete functional element to the codebase. They will generally require large amounts or effort to implement, require changes to both front-end view templates and back-end code, and assume prior knowledge of the codebase. This makes these the most tricky kinds of issues to close. However, they can be the most rewarding to tackle for the intrepid or for those looking to challenge themselves!

- **good first issue**: One of our most important kinds of issues! These issues have been marked by the maintainers as small, low-impact changes and fixes, ideal for those dipping their toes into the world of contributing to Open Source software for the first time. These are by no means any less important than any other issues! We'd appreciate if our more experienced contributors would leave these issues to our newer teammates!

- **help wanted**: Issues will be marked with this label by the maintainers if we'd like outside contributors to pitch in with code or opinions before we close them. These do not assume any skill level and are great opportunities for all members of our community to steer the direction of the project.

- **question**: Issues can be marked with this label by anybody who would like other contributors or maintainers to answer a specific question before an issue can be closed. These normally do not assume any skill level (although may sometimes require maintainers to have the final say on them) and are great opportunities for all members of our community to steer the direction of the project.

- **rebase**: You will find this label normally attached to pull requests, and means that the maintainers would like to you squash commits or rebase existing commits from master into your branch before we can merge your pull request. A maintainer will clarify this in the comment thread.

- **refactoring**: If an issue requires code to be refactored before a particular change can be made, or if you spot inelegant patterns or implementations in code that you feel could be better, then feel free to add this label to an issue. If the issue is the latter type, please be careful about the language you use in these threads. For example, things like "this code sucks!" or "you must be an idiot!" are unacceptable!. Programmers have feelings too and there are ways to suggest code changes without insulting people.

- **security**: If you spot an issue related to security issues (e.g. invalid SSL certs, potential CSRF issues), mark it with this label. Don't forget to be a good OSS citizen and always report zero-day issues through [a private channel](mailto:nodunayo@gmail.com) to minimise impact to your fellow users!

- **testing**: If you're into all things testing, then this is the label for you. These issues are likely to be ones where refactoring of current tests are needed, tests are missing from something already delivered (hopefully not!), or you've spotted another test case to add. Currently the project uses Cucumber, Capybara, and RSpec.

- **ux**: These issues relate to how the site works or, more holistically, how the site _feels_ to the end user, and will normally be related to the front-end of the website. These issues might relate to confusion stemming from navigation, form elements, input validation, or breaks in user flows.

- **wontfix**: This means that, after considering your issue in full, your issue is outside of the intended scope of the project and is not something we'd like to add to the codebase right now or in the future. This label is used sparingly, is intended to be rare, and is never used without reasoned justification.

If you have any suggestions for adding, removing, renaming a label, or rewording a label's
description then please let me know!

## Credits
* Thank you to [24 Pull Requests](https://github.com/24pullrequests/24pullrequests). This [CONTRIBUTING.md](CONTRIBUTING.md) was heavily inspired by theirs!
