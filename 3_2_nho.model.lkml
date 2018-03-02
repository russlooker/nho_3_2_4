connection: "events_ecommerce"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project

explore: order_items {
  join: users {
    type: left_outer
    sql_on:  ${order_items.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: order_items_2 {
  from: order_items
  fields: [ALL_FIELDS*,-order_items_2.sales_per_user]
}
