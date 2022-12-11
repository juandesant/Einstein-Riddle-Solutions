#!/usr/bin/env python
# Based on https://artificialcognition.github.io/who-owns-the-zebra


from constraint import *

positions =      [ 1, 2, 3, 4, 5 ]
colors =        ['red', 'green', 'white', 'yellow', 'blue']
nationalities = ['Brit', 'Swede', 'Dane', 'Norwegian', 'German']
cigars =        ['Pall Mall', 'Dunhill', 'Blends', 'Blue Master', 'Prince']
pets =          ['dogs', 'cats', 'birds', 'horses', 'fish']
drinks =        ['milk', 'water', 'tea', 'beer', 'coffee']

problem = Problem()

criteria = colors + nationalities + cigars + pets + drinks

# Try to do this 
problem.addVariables(criteria, positions)

problem.addConstraint(AllDifferentConstraint(), colors)
problem.addConstraint(AllDifferentConstraint(), nationalities)
problem.addConstraint(AllDifferentConstraint(), cigars)
problem.addConstraint(AllDifferentConstraint(), pets) # This one includes the fact that one of them is a fish
problem.addConstraint(AllDifferentConstraint(), drinks)


problem.addConstraint(lambda e, r: e == r, ["Brit",  "red"])
problem.addConstraint(lambda s, d: s == d, ["Swede", "dogs"])
problem.addConstraint(lambda d, t: d == t, ["Dane",  "tea"])
problem.addConstraint(lambda g, w: w-g == 1, ["green", "white"])
problem.addConstraint(lambda g, c: g == c, ["green", "coffee"])
problem.addConstraint(lambda p, b: p == b, ["Pall Mall", "birds"])
problem.addConstraint(lambda y, d: y == d, ["yellow",  "Dunhill"])
problem.addConstraint(InSetConstraint([3]), ["milk"])
problem.addConstraint(InSetConstraint([1]), ["Norwegian"])
problem.addConstraint(lambda b, c: abs(b-c)==1, ["Blends", "cats"])
problem.addConstraint(lambda d, h: abs(d-h)==1, ["Dunhill", "horses"])
problem.addConstraint(lambda bm, b: bm==b, ["Blue Master", "beer"])
problem.addConstraint(lambda g, p: g==p, ["German", "Prince"])
problem.addConstraint(lambda n, b: abs(n-b)==1, ["Norwegian", "blue"])
#facts = [
##	(None, 'red', 'Brit', None, None, None, None, None),
##	(None, None, 'Swede', None, 'dogs', None, None, None),
##	(None, None, 'Dane', None, None, 'tea', None, None),
##	(None, 'green', None, None, None, None, None, 'white'),
##	(None, 'white', None, None, None, None, 'green', None),
##	(None, 'green', None, None, None, 'coffee', None, None),
##	(None, None, None, 'Pall Mall', 'birds', None, None, None),
##	(None, 'yellow', None, 'Dunhill', None, None, None, None),
##    (3, None, None, None, None, 'milk', 'colors:blue', None),
##    (1, None, 'Norwegian', None, None, None, 0, 'colors:blue'),
##    (None, None, None, 'Blends', None, None, 'pets:cats'), None), # This might not be true, but the next one
##    #(None, None, None, 'Blends', None, None, None, 'pets:cats'), # This might not be true, but the previous one
##    (None, None, None, 'Dunhill', None, None, 'pets:horses', None), # This might not be true, but the next one
##    #(None, None, None, 'Dunhill', None, None, None, 'pets:horses'), # This might not be true, but the previous one
##    (None, None, None, 'Blue Master', 'beer', None, None, None),
##    (None, None, 'German', 'Prince', None, None, None, None),
##    (2, 'blue', None, None, None, None, None, None),
#]

solution = problem.getSolutions()
print(f"Solutions found: {len(solution)}")

for i in positions:
    for x in solution[0]:
        if solution[0][x] == i:
            print(str(i), x)
