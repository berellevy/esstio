# Yestaurant

## Alternate names

- Esstaurant
- Duresstaurant
- Restavant
- eatHappy
- Takeoutio
- Gasp
- Restia

---

## User Stories

### as a **user** I want to

1. log in
2. see all the restaurants near me
3. browse the restaurants menu
4. place an order
5. check status of order
6. see all my orders

### As a **restaurant** I want to

1. see my home page
2. see open orders
   1. see how many open orders I have
3. view/proccess an order
4. view all my orders
5. view my menu
6. edit my menu
7. view a list of customers
8. go into each customer
   1. look through the customers orders

---

## Models

### restaurant

#### Fields

- name
- phone number
- rating

#### Methods

- #open_orders
- #closed_orders
- #all_orders
  
#### views

- index
- show

    ##### Users

  - #list_users (order by most recent order date)
  - #show_user
    - user attributes
    - list orders

    ##### Orders

  - #index (sort by time)
  - #show

---

### User

#### Fields

- name
- address
- phone number

#### Methods

- #open_orders
- #most_recent_order_date

#### Views

- #new
- #show
  - #create an order
- #edit
- #index (admin)
- #items 
  - name
  - description
  - price

---

### Order

#### Order Methods

- #total_price
- #total_price_display
- #item_quantity

belogs to user
belongs to restaurant

has many order_items
has many items through order_items
accepts_nested attribiutes for items

user -< order >- 
  -< order_items >- items

#### Order Fields

- restaurant_id
- user_id
- date
- status
  - recieved
  - out for delivery
  - delivered
- methods**
- total price
- order_items
  - quantity
  - order_id
  - item_id

## user

### Welcome Screen

- user login  
- register  
- Restaurant "login"  

### home page
- name
- number
- address
- open orders on top

dropdown choose restaurant in your areas
  takes you to restaurants menu page
  choose items
  order button
  takes you to order page
    order page has jokes as long as the order is not delivered
    go back to your user page


home page
  name
  address
  menu
  rating
  open orders
    order by time

menu page
  list all items
  can edit
  delete new

all orders page
  list all orders
  can edit
  delete new

order page
  user name
  user addres
  user phone  number
  order items
  price

---

---

## Stretch Goals

- reviews table
- favorites table
- restaurants
  - **methods**
  - new
  - edit
- addresses with google distances
- restaurant login
- user has a feed of featured items
- home page has like a feed of food facts and jokes
- item quantity in order_item


    This README would normally document whatever steps are necessary to get the
    application up and running.

    Things you may want to cover:

    * Ruby version

    * System dependencies

    * Configuration

    * Database creation

    * Database initialization

    * How to run the test suite

    * Services (job queues, cache servers, search engines, etc.)

    * Deployment instructions

    * ...
