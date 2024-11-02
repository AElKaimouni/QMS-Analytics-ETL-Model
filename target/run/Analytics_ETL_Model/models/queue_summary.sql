
      
        
            delete from "qms"."public"."queue_summary"
            using "queue_summary__dbt_tmp020318300461"
            where (
                
                    "queue_summary__dbt_tmp020318300461".queue_id = "qms"."public"."queue_summary".queue_id
                    and 
                
                    "queue_summary__dbt_tmp020318300461".date = "qms"."public"."queue_summary".date
                    
                
                
            );
        
    

    insert into "qms"."public"."queue_summary" ("queue_id", "date", "total_reservations")
    (
        select "queue_id", "date", "total_reservations"
        from "queue_summary__dbt_tmp020318300461"
    )
  