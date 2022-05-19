p = 27
g = 13

print(f'The value of p is: {p}')
print(f'The value of g is: {g}')

a = 7
print(f'The Private key for a is: {a}')
x = int(pow(g,a,p))

b = 2
print(f'The Private key for b is: {b}')
y = int(pow(g,b,p))

ka = int(pow(y,a,p))
kb = int(pow(x,b,p))

print(f'Secret key for a is: {ka}')
print(f'Secret key for b is: {kb}')