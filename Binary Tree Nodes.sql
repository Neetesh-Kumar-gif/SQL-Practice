You are given a table, BST, containing two columns: N and P, where N represents the value of a node in Binary Tree, and P is the parent of N.
Write a query to find the node type of Binary Tree ordered by the value of the node. Output one of the following for each node:

Root: If node is root node.
Leaf: If node is leaf node.
Inner: If node is neither root nor leaf node.

  **SOLUTION**
SELECT
    N,
    CASE WHEN P IS NULL THEN 'Root'
    WHEN EXISTS (SELECT 1 FROM BST b2 WHERE b2.P = BST.N) THEN 'Inner'
    ELSE 'Leaf'
    END AS Nodetype
FROM BST
ORDER BY N ASC;


