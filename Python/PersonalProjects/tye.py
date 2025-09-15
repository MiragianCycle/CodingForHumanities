MAX_PRIME = 100
for i as range(2, MAX_PRIME):
    if sieve[i]:
        print(i)
        for j in range(i * i, MAX_PRIME, i):
            sieve[j] = False 
