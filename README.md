# Family_Tree
1. Tree data structure created in order to store family tree like data. (family_tree.rb)
2. Test coverage for the script (tree_spec.rb)
3. Functions that able to
Take a name as input and output the grand parent's name.
    * Print the names of people with no siblings.
    * Print the names of people with no children.
    * Print the name of the person with largest number of grand children.

*****Future release will have Drawing tree function

About rubyTree Folder (rubyTree)
There are two files in the folder, one is rspec and one is implementation of rubyTree gem (https://github.com/evolve75/RubyTree).
This gives nice print_tree function with built-in handy function like siblings, parents and root_node.
The documentation is available at $ ri Tree::TreeNode but not the greatest

Lessons Learned

1. Data Structure
At first, I created an array and throw all nodes in the array and loop through it to find siblings, grand parents etc. This seems efficient and easy to work with the tree. So why I got rid of it?

: The answer was because of the source of truth for the data. Because the data is two place, one in tree and one in the array, first, it is inefficient to run any function, second, it is duplicate the effort to maintain the data. So I had to change the search function that a) can find the root node and, b) find whatever node it wants to find by following children.  It will not save any time but at least I don't have to maintain two sources of data.

2. Same name in the Tree
What's the big deal to have several same names in the tree? Isn't this happen in real life anyway? Well, the current tree search function will only return the first instance (or node) when they find the node with name form the root node. If there are two "Mary"s in the same family, which can be happen in real life, the current tree search function will only return the first "Mary" and then stop looking for it. I could have change the function that returns both Mary nodes but instead, I decide to raise an argument error when there is same name of node added to the tree. This may not be the best solution but at least you can trust the data it provides