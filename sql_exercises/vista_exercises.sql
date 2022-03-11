EXERCISE 1 VISTAPRINT SQL

-- write your code in PostgreSQL 9.4
select a.place from (
select place, 
       sum(case when opinion = 'recommended' then 1 else 0 end) as ranking_best_recom,
       sum(case when opinion = 'not recommended' then 1 else 0 end) as ranking_not_recom
from opinions
group by place
order by ranking_best_recom desc
) a
where ranking_best_recom > ranking_not_recom


EXERCISE 2 VISTAPRINT PYTHON

https://www.codigopiton.com/como-filtrar-una-lista-en-python/
https://www.geeksforgeeks.org/count-ways-to-split-a-binary-string-into-three-substrings-having-equal-count-of-zeros/



        first = [S[:i]]
        rest = S[i:]


def splitter(str):
    for i in range(1, len(str)):
        start = str[0:i]
        end = str[i:]
        yield (start, end)
        for split in splitter(end):
            result = [start]
            result.extend(split)
            yield result

combinations = list(splitter(S))

print(combinations)
[('b', 'abaa'), 
['b', 'a', 'baa'], 
['b', 'a', 'b', 'aa'], 
['b', 'a', 'b', 'a', 'a'], 
['b', 'a', 'ba', 'a'], 
['b', 'ab', 'aa'], 
['b', 'ab', 'a', 'a'], 
['b', 'aba', 'a'], 

('ba', 'baa'), 
['ba', 'b', 'aa'], 
['ba', 'b', 'a', 'a'], 
['ba', 'ba', 'a'], 

('bab', 'aa'), ['bab', 'a', 'a'], 

('baba', 'a')]

##################
### SOLUTION #####
##################


# you can write to stdout for debugging purposes, e.g.
# print("this is a debug message")

S = 'babaa'


def solution(S):
    counter = 0 
    n = 3 

    if (len(S)/n) <= 1 :
        return 0

    if (len(S)/n) > 1 :

        for i in S:
            if i == 'a':
                counter += 1

        if (counter % 3 !=0):
            return 

        rest = 0
        k = counter // 3 #number of divisions

        sum = 0
        # store freq of a 
        map_var = {}

        for i in range(len(S)):

            if S[i] == 'a':
                sum += 1 

            if (sum == 2 * k and k in map_var and i < len(S) - 1 and i>0):
                rest += map_var[k]

            if sum in map_var:
                map_var[sum] += 1 
            else:
                map_var[sum] = 1
        return rest



        
