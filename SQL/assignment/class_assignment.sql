# class assignment

# 1. get middle character from customer fname, when it is even number, get middle 2 character, when length is odd then take exact middle character
# example: if fname is SQL - then take Q since length is odd, if fname is john then display oh as lenght is even 

use orders;

select customer_fname, length(customer_fname), mod(length(customer_fname),2) ,length(customer_fname) div 2 from online_customer;


select customer_fname as Customer_First_Name, case
when mod(length(customer_fname),2) = 0 then substring(customer_fname,length(customer_fname) div 2 , 2)
else  substring(customer_fname,(length(customer_fname) div 2)+1 , 1) 
end as Middle_Character from online_customer;

select customer_fname as Customer_First_Name,
if (mod(length(customer_fname),2) = 0, substring(customer_fname,length(customer_fname) div 2 , 2),substring(customer_fname,(length(customer_fname) div 2)+1 , 1)) 
as Middle_Character from online_customer;
