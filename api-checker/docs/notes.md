The nested hierarchical structure of a degree programme is modelled using an AND-OR Tree. Each threshold node defines a predicate that evaluates to a boolean value. An AND Node is used to model a set of requirements that must all be fulfilled for the node to evaluate to TRUE. An OR Node evaluates to TRUE when any of its child nodes evaluates to TRUE and the threshold value defined on the node is satisfied. Individual courses are represented as leaf nodes and are atomic.

## Tree Model - BSc Computer Science

![tree-computer-science](https://i.imgur.com/erC5psx.png)


## Tree Model - BSc General Chemistry
![tree-general-chemistry](https://i.imgur.com/5swfGk9.png)

## Degree Audit/Progress Check
Degree requirements are organized in a top-down hierarchy with the upper levels containing the most general requirements and lower levels having more specific requirements. This notion can be represented as a tree structure, where the root represents degree requirements and the leaves represent satisfied and unsatisfied requirements. The satisfied and unsatisfied requirements are obtained by accessing the student's record and checking fulfillment of the most specific requirements (whether a course is passed or not).

To perform an audit or progress check, a student record and tree are passed to an auditor object that calls an audit function on the root node of the tree. All child nodes of the programme tree have a defined audit function which is invoked during an audit. Each node performs an evaluation and a report object is generated and passed back up the tree. The complete report is a nested object containing the results of the audit on each node and is analogous in structure to the tree from which it was generated.
