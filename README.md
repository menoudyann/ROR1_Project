# ROR1 - Project

## Introduction

In this project, we will implement an application using Ruby on Rails that uses the database that we had created in the module SQL1.

## Database

**With test data (recommended)**

To create the database with test data, run this command

```
rails db:migrate db:seed
```

**Without test data**

To create the database without test data, run this command

```
rails db:migrate
```

In the event of incorrect operation, you can run the following command at any time to restore the test data.

```
rails db:migrate:reset db:seed
```

## Dependencies

After creating the database, install the dependencies with the following command

```
bundle install
```

## How to run ?

 You can finally run the project with the following command 

```
rails server
```

Open a browser and access this url

```
localhost:3000
```

## Accounts

It has several accounts already created based on CPNV personalities so that it's easy to remember.

Here you will find the different accounts. **All these accounts use the same password : password**

```
hardeggerc@eduvaud.ch
ithurbidej@eduvaud.ch
hurnip@eduvaud.ch
glasseyn@eduvaud.ch
pinheirop@eduvaud.ch
menoudy@eduvaud.ch
barberinin@eduvaud.ch
```

## Schemas

You can find the different database schemas in [/docs](https://github.com/menoudyann/ROR1_Project/tree/main/docs)
