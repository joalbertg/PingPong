# Ping Pong Backend evaluation

## Getting Started

1. Run `bundle`
2. Run `rails db:create db:migrate db:seed`
4. Run `rails server`

## Requirements

The purpose of this API is to allow users to log their pingpong games and to
show the leaderboard ranking.

**Time allotted**: 2 hours.

#### 1. Game Logging

1. Add necessary functionality to log a game between two users
  * Games follow standard Ping Pong rules. They are games to 21. Each game needs
  to be won by a two point margin. This means that some games may go over 21.
  Examples of acceptable scores:
    * 9-21,
    * 21-19,
    * 24-22.
  * Games are inputted on an honorary system (no approval required)
2. Add history endpoint which allow to view history of games. This includes: timestamp, opponent user, game score

Please follow the interface provided at the end of this document.

#### 2. Leadboard

Design a solution to populate the leaderboard endpoint with rankings:
  * Rankings are updated every time a game is logged
  * Not all wins should count the same. e.g: a player ranked 4 beating a player
    ranked 5 should not count the same as a player ranked 5 beating a player
    ranked 1
  * When the leaderboard is first created all the users will be equal in ranking
  * Document your approach

**Please note the following**:

* The framework of the API already allows users to register and sign in
* Add all necessary migrations, models (with relationships, methods and
  validations), controllers, and tests.
* The current `Gemfile` should be sufficient for the task. Please feel free to
  include revelant gem from the moment it's production acceptable (maintenance,
  popularity, …).

Please follow the interface provided at the end of this document.

#### 3. Email

Create a job to send by email the current leaderboard. The design doesn't matter
so plain text is enough.

## Submit Your Code

The evaluation starts as soon you received the API archive and stops as soon you
sent back a Zip/GZip archive via email. It's essential to respect time to not have
penalties.

## Evaluation

We are evaluating you as a Backend Ruby Engineer. We will score your completion
of the task as follows:

* Create a game (5pts):
  * Validation test covered
  * Proper validations
  * Controller
* List games (3pts):
  * Controller test covered
  * Ordered by date descending
  * Controller Output
* Show a game 2pts
  * Controller test covered
  * Controller Output
* Show leaderboard (5pts):
  * Algorithm
  * Tests
  * Controller
  * Efficiency of the solution
* Email job (5pts):
  * ActiveJob job
  * Algorithm
  * Email
  * Tests
* General feeling (15pts):
  - No bugs found
  - Style is consistent and respect of Rails convention
  - Respect of time

**Notes**: For each bug discovered, some points will be removed from the total
scores. The style is also very important, if you work for Arcus, you would have
to work with teamates and is essential your code is professional and understable
(respect of conventions and consistent).

## Interface

### List games

`GET /games`

#### Example of response
```json
[
  {
    "id": 1,
    "player_id": 1,
    "opponent_id": 2,
    "player_score": 21,
    "opponent_score": 19,
    "played_at": "2018-11-11T19:31:04.431-06:00"
  }, {
    "id": 2,
    "player_id": 2,
    "opponent_id": 3,
    "player_score": 24,
    "opponent_score": 22,
    "played_at": "2018-11-11T20:12:04.123-06:00"
  }
]
```

#### Attributes

* `id`: ID of the game
* `player_id`: ID of the user who registered the game
* `opponent_id`: The player's score
* `player_score`: ID of user who played against the player
* `opponent_score`: The opponent's score
* `played_at`: The time when the game was played

### Show a game

`GET /games/:id`

#### Example of response

```json
{
  "id": 1,
  "player_id": 1,
  "player_score": 21,
  "opponent_id": 2,
  "opponent_score": 19,
  "played_at": "2018-11-11T19:31:04.431-06:00"
}
```

#### Attributes
* `id`: ID of the game
* `player_id`: ID of the user who registered the game
* `player_score`: The player's score
* `opponent_id`: ID of user who played against the player
* `opponent_score`: The opponent's score
* `played_at`: The time when the game was played

### Create a game

`POST /games`

#### Attributes
* `player_score`: The player's score
* `opponent_id`: ID of user who played against the player
* `opponent_score`: The opponent's score
* `played_at`: The time when the game was played

### Leaderboard

`GET /leaderboard`

#### Example of response
```json
[
  {
    "id": 2,
    "rank": 1,
    "first_name": "Jane",
    "last_name": "Smith",
    "email": "jane.smith@email.com",
  }, {
    "id": 1,
    "rank": 2,
    "first_name": "John",
    "last_name": "Smith",
    "email": "john.smith@email.com",
  }
]
```

#### Attributes
* `id`: User ID
* `rank`: Leaderboard ranking
* `first_name`: User's first name
* `last_name`: User's last name
* `email`: User's email
