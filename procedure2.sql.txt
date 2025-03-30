CREATE OR REPLACE PROCEDURE PopulateOrdersAndItems AS
    v_items NUMBER;            -- Number of items per order
    v_product_id NUMBER;       -- Random ProductID
    v_price NUMBER(10, 2);     -- Price from Products table
    v_total NUMBER(10, 2);     -- Total amount for the order
    v_order_id NUMBER;         -- Current OrderID
    v_orderitem_id NUMBER := 0; -- ORDERITEMID counter

BEGIN
    FOR i IN 1..20000 LOOP
        -- Set ORDERID explicitly
        v_order_id := i;
        v_total := 0.00;

        -- Insert into Orders_PB first
        INSERT INTO Orders_PB (ORDERID, CUSTOMERID, STOREID, EMPLOYEEID, ORDERDATE, TOTALAMOUNT, PAYMENTMETHOD, ORDERTYPE)
        VALUES (
            v_order_id,                         
            FLOOR(DBMS_RANDOM.VALUE(1, 10001)), -- Random CustomerID (1 to 10000)
            FLOOR(DBMS_RANDOM.VALUE(1, 21)),    -- Random StoreID (1 to 20)
            FLOOR(DBMS_RANDOM.VALUE(1, 101)),   -- Random EmployeeID (1 to 100)
            TO_DATE('2025-03-23', 'YYYY-MM-DD') - FLOOR(DBMS_RANDOM.VALUE(0, 365)), 
            0.00, -- Placeholder for TotalAmount
            CASE WHEN DBMS_RANDOM.VALUE < 0.5 THEN 'Cash' ELSE 'Credit' END,
            CASE WHEN DBMS_RANDOM.VALUE < 0.6 THEN 'In-Store' ELSE 'Online' END
        );
        
        -- Commit the order insertion to ensure visibility
        COMMIT;
        
        -- Determine number of items (1 to 3)
        v_items := FLOOR(DBMS_RANDOM.VALUE(1, 4)); -- 1 to 3 items
        
        -- Insert items for the order
        FOR j IN 1..v_items LOOP
            v_product_id := FLOOR(DBMS_RANDOM.VALUE(1, 251)); -- Random ProductID (1 to 250)
            
            BEGIN
                SELECT PRICE INTO v_price 
                FROM Products_PB
                WHERE PRODUCTID = v_product_id;
            EXCEPTION
                WHEN NO_DATA_FOUND THEN
                    CONTINUE; -- Skip this iteration if product does not exist
            END;
            
            -- Increment ORDERITEMID for each item
            v_orderitem_id := v_orderitem_id + 1;

            INSERT INTO Order_Items_PB (ORDERITEMID, ORDERID, PRODUCTID, QUANTITY, UNITPRICE)
            VALUES (
                v_orderitem_id,                     
                v_order_id,
                v_product_id,
                FLOOR(DBMS_RANDOM.VALUE(1, 4)), -- Random quantity 1-3
                v_price
            );
            
            v_total := v_total + (v_price * FLOOR(DBMS_RANDOM.VALUE(1, 4)));
        END LOOP;
        
        -- Update TotalAmount in Orders_PB
        UPDATE Orders_PB 
        SET TOTALAMOUNT = v_total 
        WHERE ORDERID = v_order_id;
        
        -- Commit the changes for this order
        COMMIT;
    END LOOP;

EXCEPTION
    WHEN OTHERS THEN
        -- Roll back on error and raise the exception
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20001, 'Error in PopulateOrdersAndItems: ' || SQLERRM);
END PopulateOrdersAndItems;
/
