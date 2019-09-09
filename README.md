# DevfestRegistrationPortal
## To contribute
Fork the this repo then clone from forked repo from your github account 

```git clone https://github.com/your_username/devfest-registration-portal.git```  

or   
```git clone git@github.com:your_username/devfest-registration-portal.git```


To start your Phoenix server:

  * Change directory into the cloned repo: `cd devfest-registration-portal`
  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install` 
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Create a remote repo with name upstream, i.e 

```git remote add upstream https://github.com/Podiihq/devfest-registration-portal```

 or

```git remote add upstream git@github.com:Podiihq/devfest-registration-portal.git```

Before working on an issue, ensure your local repo is up-to-date, by running:

```
git checkout develop
git pull upstream develop
```

When creating a branch, ensure it has an issue number.

For example, issue `#3 update contribution readme` should be in the branch name:

`3-update-contribution-readme`

Run 

```mix check_lint``` 

and    

```mix test```

Then solve any arising issues before pushing up.

Upon making changes push to the `upstream` remote 

```git push upstream branchname```

Your last commit message should be in the form `Update contribution readme#fixes3`

Then create a pull request if you feel the issue is completed.

## Official site
  - Devfest registration website <https://devfest-portal.herokuapp.com/sessions/new>



