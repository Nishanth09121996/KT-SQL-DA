--1.Based on Policy Holder Country  find the number of Policies ?

    select
    p2.country as PolicyHolderCountry
    ,count(distinct PolicyID) as PolicyCount from insurance.policy p 
    join insurance.party p2 
    on p.PolicyHolderID = p2.PartyID 
    group by PolicyHolderCountry

--2.Which country policy holder has created more number of claims?

    select 
    pt.country as PolicyHolderCountry 
    ,count(distinct clm.IncidentID) as claim_count
    from insurance.claims clm
    join insurance.policy pol 
    on clm.PolicyID = pol.PolicyID 
    join insurance.party pt 
    on pol.PolicyHolderID = pt.PartyID 
    group by PolicyHolderCountry

--3.Find the premium each policy.
    select pol.PolicyID ,sum(writtenPremium) as premium  from insurance.premium premium 
    join insurance.policy pol 
    on premium.PolicyID = pol.PolicyID 
    group by 1

--4.find the policy where claim amount paid is greater then the premium.

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

--5.Find the policy where claim is raised before the policy effective date and print policy number and holder name.

    select distinct p.PolicyID ,p2.name  as policy_holderName from insurance.policy p 
    join insurance.claims c 
    on p.PolicyID = c.PolicyID 
    join insurance.party p2 on p.PolicyHolderID = p2.PartyID 
    where p.PolicyStartDarte < c.lossDate 