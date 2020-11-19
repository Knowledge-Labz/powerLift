# powerLift

[![forthebadge](https://forthebadge.com/images/badges/made-with-python.svg)](http://forthebadge.com)

[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=shields)](http://makeapullrequest.com)

powerLift is a Python interface built to juice PowerShell while keeping a cool head.
It aims at using PowerShell as its simplest, easiest form while delegating the heavier logical lifting to Python through YAML and Jinja2.

After years of frustrating Windows administration and PowerShell misunderstandings and updates, experience led me to using PowerShell as a less-flexible more-asynchronous bash.
No more debugging overly-explicit code, just fill in the blanks, have a covfefe and review the (hopefully few or none) errors!

* Create multiple Communication-type hubs and link Teams/Comms sites as children!
* Link children sites to a unified TopNavigationBar
* Deploy additional metadata Fields on a site's documents Lists
* Deploy multiple views (group of Fields) on specific sites (todo)
* Deploy per-site pre-defined cTypes (todo)

## Quick setup guide

0 -- Download this cool code!

1 -- Have Python 3 install

2 -- pip install jinja2 yaml pyinquirer

3 -- adjust the conf/conf.yml file with your info

4 -- adjust the src/vars/sites.yml and src/vars/fields.yml to suit your needs

5 -- python main.yml will run you through a grandiose menu to do the tasks required

6 -- Grab the ps1 out_files scripts and run them on your environment! (will be outputting in one big dumb script in future devs)
