#### 1.Based on Policy Holder Country  find the number of Policies ?
```sql  

select
p2.country as PolicyHolderCountry
,count(distinct PolicyID) as PolicyCount from insurance.policy p 
join insurance.party p2 
on p.PolicyHolderID = p2.PartyID 
group by PolicyHolderCountry
limit 5;

+---------------------+-------------+
| PolicyHolderCountry | PolicyCount |
+---------------------+-------------+
| Australia           |          14 |
| Austria             |          13 |
| Belgium             |          22 |
| Brazil              |          12 |
| Canada              |          12 |
+---------------------+-------------+

```

#### 2.Which country policy holder has created more number of claims?
```sql 
select 
pt.country as PolicyHolderCountry 
,count(distinct clm.IncidentID) as claim_count
from insurance.claims clm
join insurance.policy pol 
on clm.PolicyID = pol.PolicyID 
join insurance.party pt 
on pol.PolicyHolderID = pt.PartyID 
group by PolicyHolderCountry
limit 5;

+---------------------+-------------+
| PolicyHolderCountry | claim_count |
+---------------------+-------------+
| Australia           |          14 |
| Austria             |          13 |
| Belgium             |          22 |
| Brazil              |          12 |
| Canada              |          12 |
+---------------------+-------------+
```

#### 3.Find the premium each policy.
```sql
select pol.PolicyID ,sum(writtenPremium) as premium  from insurance.premium premium 
join insurance.policy pol 
on premium.PolicyID = pol.PolicyID 
group by 1
limit 5;

+----------+---------+
| PolicyID | premium |
+----------+---------+
| POL1000  |     430 |
| POL10000 |     430 |
| POL10040 |     430 |
| POL10080 |     430 |
| POL10120 |     430 |
+----------+---------+

```


#### 4.find the policy where claim amount(LossIncured) paid is greater then the premium.

```sql 

with premium as (select pol.PolicyID ,sum(writtenPremium) as premium  from insurance.premium premium 
join insurance.policy pol 
on premium.PolicyID = pol.PolicyID 
group by 1)
,loss as
(select pol.PolicyID ,sum(c.LossIncured) as claimPaid  from insurance.claims c   
join insurance.policy pol
on c.PolicyID = pol.PolicyID 
group by 1)
select loss.policyid from loss
join premium on loss.policyid  = premium .PolicyID 
where loss.claimPaid>premium.premium
limit 5;

+----------+
| policyid |
+----------+
| POL1160  |
| POL1360  |
+----------+
```
#### 5.Find the policy where claim created date (col:lossDate) before the policy effective date(col:PolicyStartDarte) and print policy number and holder name.

```sql
select distinct p.PolicyID ,p2.name  as policy_holderName from insurance.policy p 
join insurance.claims c 
on p.PolicyID = c.PolicyID 
join insurance.party p2 on p.PolicyHolderID = p2.PartyID 
where p.PolicyStartDarte < c.lossDate
limit 5;

+----------+-------------------+
| PolicyID | policy_holderName |
+----------+-------------------+
| POL10000 | Raven Cantu       |
| POL10040 | Rhona Sanford     |
| POL10120 | Sophia Crawford   |
| POL10280 | Fatima Knapp      |
| POL10320 | Kirby Morrison    |
+----------+-------------------+

```
