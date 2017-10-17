# README

Bratwurst is a simple rails application intended to act as testing support for
Discourse single sign on.

Bratwurst is a brat, since it repeats whatever you say to it, and is the wurst
possible SSO provider you could use in a production scenario. On the other hand,
these attributes make it perfect for testing SSO scenarios of a Discourse instance.

In addition to an SSO processor at `/sso`, a normal login flow can be emulated
entirely within Bratwurst by visiting `/login` in a browser.
