# Silver Engine

## Table of contents
 * [Want to contribute](#want-to-contribute)
 * [Pull Requests](#pull-requests)

## Want to contribute
If you want to contribute to this project you need to use following naming conventions.

Variables - `snake_case` - `player_movement_direction`

Functions - `camelCase` - `rotatePlayer()`

Classes and Types - `PascalCase` - `PlayerBody`

Constants - `All capitals with _ inbetween` - `MAX_PLAYER_SPEED`

Additionally the names of all <b>member variable</b> should start with `m_` - `m_player_current_speed`. Note this <b>does not</b> affect structs that just hold data.

## Pull requests
When making a change you should first create a branch with a clear name of what you are doing. You can create and checkout a branch like this.

`git checkout -b {name}`

Then in GitHub you can create a pull request to merge your branch into main.
You can, but don't have to use the following format for your pull requests.

```
## Description

A clear and concise description of the PR.

Use this section for review hints, explanations or discussion points/todos.

- Summary of changes
- Reasoning
- Additional context

## Screenshots

Screenshots or a screen recording of the visual changes associated with this PR.
(Optional)

## Docs

Add any notes that help to document the feature/changes. Doesn't need to be your best writing, just a few words and/or code snippets.
```