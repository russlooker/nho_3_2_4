connection: "events_ecommerce"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project

explore: order_items {
  join: users {
    type: left_outer
    sql_on:  ${order_items.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
  join: inventory_items {
    type: left_outer
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
    relationship: one_to_one
  }
  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id};;
    relationship: many_to_one
  }
  join: user_facts {
    type: left_outer
    sql_on: ${users.id} = ${user_facts.id} ;;
    relationship: one_to_one
  }
}


explore: order_items_2 {
#   from: order_items
  view_name: order_items
 fields: [ALL_FIELDS*,-order_items.sales_per_user]
}


explore: users {}
