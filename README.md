# Venture-Menu-by-Olbin-Gil---smart-contract
A smart contract that can allow restaurants to sell items with the cryptocurrency STX

Restaurants can deploy a menu on the Stacks blockchain through the "venture-menu" smart contract. This contract allows restaurants to sell food items on their menu using STX. The smart contract would be used to interact with a website to facilitate the process for customers.

to use the contract simply call the function " (define-public (add-to-order (menu-ids (list 20 uint))) "
- where the parameter is a list of the ID's of each food item the customer wants. They can select to a maximum of 20 items.

to pay for the food items call the function "(define-public (getting-price-food-paying (id uint) (sender principal)) "
- where the first parameter is the ID of the order (order count starts at u1) and the second parameter is the wallet address or principal of the customer.

