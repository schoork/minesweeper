# Minesweeper Clone

## Algorithm

The main algorithm for building a board is relatively simple. It makes use of Ruby's rand method and a set to store the 
coordinates. I tried storing a row and cell for each cell in the board and found that to be much slower. Instead I made 
use of Ruby's set class, doing exactly its job, and then stored only the bombs in the database.

## Deployment

Create an app:
```
heroku apps:create
```

Make sure to provision a database:
```
heroku addons:create heroku-postgresql:mini
```

Then you can deploy with Github via the console or this command:
```
git push heroku main
```

## Next Steps

I'd love to have it do the display all neighbors with 0 close mines that the real Minesweeper does. I was playing 
around with that algorithm but got down a rabbit hole there. Creating a new (non-database backed model) called Cell
seemed to be the way to go. I'd then probably do some refactoring to the BoardsHelper and BoardsController to use this
model on displaying the board, too. Particularly, some version of `neighbor_coordinates` to get an array of coordinates
that are directly next to the cell.
