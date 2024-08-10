#Cross Sell: Target Invoice Achieved
select 
    (select sum(`Cross sell bugdet`) 
     from `individual budget`) as Cross_Sell_Target,
    
    (select sum(Amount) 
     from invoice 
     where income_class = "Cross Sell") as Cross_Sell_Invoice_Amount,
     
    (select sum(Amount) 
     from (
         select Amount from fees 
         where income_class = "Cross Sell"
         union all 
         select Amount from brokerage 
         where income_class = "Cross Sell"
     ) as Achieved) as Cross_Sell_Achieved;
     
     
     #New : Target Invoice Achieved
     select 
    (select sum(`New Budget`) 
     from `individual budget`) as New_Target,
     
    (select sum(Amount) 
     from invoice 
     where income_class = "New") as New_Invoice_Amount,
     
    (select sum(Amount) 
     from (
         select Amount from fees 
         where income_class = "New"
         union all 
         select Amount from brokerage 
         where income_class = "New"
     ) as Achieved) as New_Achieved;
     
     
     #Renewal: Target Invoice Achieved
     select 
    (select sum(`Renewal Budget`) 
     from `individual budget`) as Renewal_Target,
     
    (select sum(Amount) 
     from invoice 
     where income_class = "Renewal") as Renewal_Invoice_Amount,
     
    (select round(sum(Amount), 2) 
     from (
         select Amount from fees 
         where income_class = "Renewal"
         union all 
         select Amount from brokerage 
         where income_class = "Renewal"
     ) as Achieved) as Renewal_Achieved;
     

#Opportunity By Revenue Top 4
select opportunity_name,sum(revenue_amount) as total_revenue
from opportunity
group by opportunity_name
order by total_revenue desc
limit 4;


#Stage Funnel By Revenue
select stage,sum(revenue_amount) as total_revenue
from opportunity
group by stage
order by total_revenue desc;


#Count Of Total Opportunities
select count(opportunity_name) as Total_Opportunities
from opportunity;

#Count Of Open Opportunities
select count(opportunity_name) as Total_Open_Opportunities
from opportunity
where stage="Qualify Opportunity" or stage="Propose Solution";

#Open Opportunities Top - 4
select opportunity_name,sum(revenue_amount) as Total_Revenue
from Opportunity
where stage="Qualify Opportunity" or stage="Propose Solution"
group by opportunity_name
order by Total_Revenue desc
limit 4;


# No of Invoice By Account Executive
select Account_Executive,count(invoice_date) as invoice_count
from invoice
group by Account_Executive
order by invoice_count desc;


# Opportunity Product Distribution
select product_group,count(opportunity_name) as Oppty
from opportunity
group by product_group
order by Oppty desc;

#Changing Date Datatype in Sql
SET SQL_SAFE_UPDATES = 0;
UPDATE meetings
SET meeting_date = str_to_date(meeting_date, "%d-%m-%Y");



# Yearly Meeting Count
select year(meeting_date) as year,
count(*) as meeting_count
from meetings
group by year(meeting_date)
order by year(meeting_date);


/* #Target Cross Sell
select sum(`Cross sell bugdet`) as Cross_Sell_Target
from `individual budget`;

#Target New
select sum(`New Budget`) as New_Target
from `individual budget`;

#Target Renewal
select sum(`Renewal Budget`) as Renewal_Target
from `individual budget`;

#Cross Sell Invoice
select sum(Amount) as amount
from invoice
where income_class ="Cross Sell";
#New Invoice
select sum(Amount) as amount
from invoice
where income_class ="New";
#Renewal Invoice
select sum(Amount) as amount
from invoice
where income_class ="Renewal";


#  Cross Sell Achieved
select sum(Amount) as Achieved
from (
select Amount from fees
where income_class="Cross Sell"
union all
select Amount from brokerage
where income_class="Cross Sell"
)
as Achieved;


#New Achieved
select sum(Amount) as Achieved
from (
select Amount from fees
where income_class="New"
union all
select Amount from brokerage
where income_class="New"
)
as Achieved;

#Renewal Achieved
select round(sum(Amount),2) as Achieved
from (
select Amount from fees
where income_class="Renewal"
union all
select Amount from brokerage
where income_class="Renewal"
)
as Achieved;
*/
