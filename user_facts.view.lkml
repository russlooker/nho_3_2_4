view: user_facts {
  derived_table: {
    sql: SELECT
        u.id,
        sum(oi.sale_price)
      FROM public.users U
      LEFT JOIN public.order_items OI ON (u.id = oi.user_id)
      group by 1
       ;;
#       sql_trigger_value: select current_date ;;

  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: user_lifetime_spend {
    type: number
    sql: ${TABLE}.sum ;;
  }

  measure: average_lifetime_spend {
    type: average
    sql:  ${user_lifetime_spend}  ;;
    value_format_name: usd
  }


  set: detail {
    fields: [id]
  }
}
