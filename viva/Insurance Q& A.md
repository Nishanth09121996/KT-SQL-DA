# SQL Case Study Insurance Domain

**The below image will be the ER diagram for the entire SQL Problem statement.**

![Insurance ER Diagram](Insurance.drawio.png)

## Party Table

**Description:**
The "Party" table contains information about party ie Policy Holder or Agent ,generaly the party table will hold person related data. Each column is described as follows:

- **PartID (PK):** Primary Key, an integer that uniquely identifies each party (individual or entity) in the table.
- **Name:** The name of the party.
- **Age:** The age of the party, representing their age in years.
- **Gender:** The gender of the party, indicating whether they are male, female, or another gender identity.
- **Country:** The country where the party is located or associated.

| PartID | Name         | Age | Gender | Country   |
|--------|--------------|-----|--------|-----------|
| 1      | John Doe     | 30  | Male   | USA       |
| 2      | Jane Smith   | 25  | Female | Canada    |
| 3      | Alex Johnson | 40  | Male   | UK        |
| 4      | Maria Garcia | 28  | Female | Spain     |
| 5      | Kim Lee      | 35  | Female | South Korea |

## Policy Table

| PolicyID | PolicyNumber | PolicyHolderID | AgentID | PolicyLOB | PolicyStartDate | PolicyEndDate |
|----------|--------------|-----------------|---------|------------|------------------|---------------|
| 1        | POL001       | 1               | 2       | Life       | 2024-01-01       | 2025-01-01    |
| 2        | POL002       | 3               | 4       | Health     | 2024-02-15       | 2025-02-15    |
| 3        | POL003       | 2               | 1       | Auto       | 2024-03-10       | 2025-03-10    |
| 4        | POL004       | 4               | 3       | Property   | 2024-04-05       | 2025-04-05    |
| 5        | POL005       | 1               | 2       | Life       | 2024-05-20       | 2025-05-20    |

**Description:**
The "Policy" table contains information about insurance policies. Each column is described as follows:

- **PolicyID:** Unique identifier for each policy.
- **PolicyNumber:** A unique identifier for each policy.
- **PolicyHolderID:** Foreign Key referencing the Party table's PartyID, representing the policyholder.
- **AgentID:** Foreign Key referencing the Party table's PartyID, representing the agent associated with the policy.
- **PolicyLOB:** Line of Business, indicating the type of insurance coverage (e.g., life, health).
- **PolicyStartDate:** The start date of the policy coverage.
- **PolicyEndDate:** The end date of the policy coverage.

## Coverage Table

| CoverageID | Type   | Description                  | PremiumRate | CoverageLimit |
|------------|--------|------------------------------|-------------|---------------|
| 1          | Life   | Life insurance coverage      | $35      | $1,000,000    |
| 2          | Health | Health insurance coverage    | $45      | $500,000      |
| 3          | Auto   | Auto insurance coverage      | $40      | $100,000      |
| 4          | Home   | Home insurance coverage      | $38      | $250,000      |
| 5          | Travel | Travel insurance coverage    | $50      | $50,000       |

**Description:**
The "Coverage" table contains information about different types of insurance coverage. Each column is described as follows:

- **CoverageID:** Unique identifier for each type of coverage.
- **Type:** The type of coverage provided by the policy (e.g., life, health, auto).
- **Description:** A brief description of the coverage and its features.
- **PremiumRate:** The rate at which the premium is calculated for this type of coverage (in dollars).
- **CoverageLimit:** The maximum amount that the policy will cover for a specific type of loss or event.

## Premium Table

| PremiumID | PolicyID | CoverageID | DueDate    | InstallmentAmount | ReceivedAmount | ReceivedDate | Status    |
|-----------|----------|------------|------------|-------------------|-----------------|--------------|-----------|
| 1         | 1        | 1          | 2024-02-01 | $100              | $100            | 2024-02-01   | Paid      |
| 2         | 1        | 2          | 2024-03-01 | $150              | $150            | 2024-03-01   | Paid      |
| 3         | 2        | 3          | 2024-02-15 | $120              | $120            | 2024-02-15   | Paid      |
| 4         | 3        | 4          | 2024-03-10 | $200              | $200            | 2024-03-10   | Paid      |
| 5         | 4        | 5          | 2024-04-01 | $80               | $0             | 2024-04-01   | Unpaid    |
| 6         | 2        | 2          | 2024-04-01 | $180              | $0            | 2024-04-01   | Unpaid    |
| 7         | 3        | 3          | 2024-04-15 | $150              | $0            | 2024-04-15   | Unpaid    |

**Description:**
The "Premium" table contains information about premium payments for insurance policies. Each row represents a premium payment.

- **PremiumID:** Unique identifier for each premium payment.
- **PolicyID:** Foreign Key referencing the "Policy" table's PolicyID.
- **CoverageID:** Foreign Key referencing the "Coverage" table's CoverageID.
- **DueDate:** The date by which the premium installment is due.
- **InstallmentAmount:** The amount of the premium installment.
- **ReceivedAmount:** The amount of the premium installment that has been received.
- **ReceivedDate:** The date on which the premium installment is received.
- **Status:** The status of the premium installment (e.g., Paid, Unpaid).

## Claim Table

| ClaimID | PolicyID | CoverageID | ClaimDate  | Description               | ClaimStatus | Amount   |
|---------|----------|------------|------------|---------------------------|-------------|----------|
| 1       | 1        | 1          | 2024-02-15 | Car accident              | Pending     | $5,000   |
| 2       | 2        | 2          | 2024-03-10 | Hospitalization           | Approved    | $10,000  |
| 3       | 3        | 3          | 2024-04-05 | Property damage           | Denied      | $2,000   |
| 4       | 4        | 4          | 2024-05-01 | Travel delay              | Pending     | $500     |
| 5       | 1        | 2          | 2024-06-15 | Medical expenses          | Approved    | $8,000   |

**Description:**
The "Claim" table contains information about insurance claims. Each column is described as follows:

- **ClaimID:** Unique identifier for each claim.
- **PolicyID:** Foreign Key referencing the "Policy" table's PolicyID.
- **CoverageID:** Foreign Key referencing the "Coverage" table's CoverageID.
- **ClaimDate:** The date when the claim is filed or processed.
- **Description:** Additional information or details about the claim.
- **ClaimStatus:** The status of the claim (e.g., Pending, Approved, Denied).
- **Amount:** The amount associated with the claim.

## Q&A

**1.find the number of active policies available in the insurance database.**

```text
Hint: To find expired policy use Policy End Date
```

**2. Find the Agent who doesn't created atleast 5 policy.**

```text
Hint: Find number of policy by a Agent in Policy Table
```

Sample Output:
| Agent ID | Agent Name | No Of Policy |
|----------|------------|--------------|
| 1      | John Doe   | 20           |
| 2      | Jane Smith | 15           |
| 3      | Bob Johnson| 25           |

 **3.Find the number of Adult Policy Holders in Each country  with number of policy.**

 ```text
 Tip: Check Weather a Policy holder is adult or not using the age in Party Table
 ```

| Country      | No Of Adult Policy Holders |
|--------------|----------------------------|
| USA          | 5000                       |
| Canada       | 2500                       |
| United Kingdom| 3500                       |
| Australia    | 2000                       |

**4.Find the Premium Amount generated by each Agent and find the top 5 agent based on premium generated.**

```text
Hint: find sum of premium from Installment Amount from Premium table and Rank them by descending order of generated premium
```

Sample Output:
| Agent Name   | Rank   | Premium Generated (in USD) |
|--------------|--------|-----------------------------|
| John Doe     | 1      | 100,000                     |
| Jane Smith   | 2      | 75,000                      |
| Bob Johnson  | 3      | 50,000                      |
| Mary Williams| 4      | 30,000                      |

**5.Find the top Coverage Type taken by the Policy Holders.**

```text
Tip: FInd the Number of Policy Holders by Coverage Type.
```

| Coverage Type | Rank | No Of Policy Holders |
|---------------|------|-----------------------|
| Life          | 1    | 10,000                |
| Health        | 2    | 8,000                 |
| Auto          | 3    | 12,000                |
| Home          | 4    | 7,000                 |
| Travel        | 5    | 5,500                 |

**6.Find the pending premium which has to be paid by each Policy Holder and display the Last due date in Premium date as Last Date to Pay.**

```text
Hints: 
1.find the difference of InstallmentAmount and ReceivedAmount.
2.If the Due is less than the current date and the ReceivedAmount is less than the InstallmentAmount, it is considered as Pending Premium Amount.
3.After finding the Pending Premium, take maximum of unpaid premium date as Last date to pay.       
```

| Policy Number | Policy Holder  | Last Date to Pay | Pending Premium Amount (in USD) |
|---------------|----------------|-------------------|---------------------------------|
| P001          | John Doe        | 2024-02-15        | 150                             |
| P002          | Jane Smith      | 2024-02-20        | 75                              |
| P003          | Bob Johnson     | 2024-02-10        | 100                             |
| P004          | Mary Williams   | 2024-02-18        | 50                              |

**7.Compare the premium which is generated by Agent year over year.**

```text
Hint: Sum of ReceivedAmount 
```

Sample Output:
| Agent ID | Agent Name   | Year | Current Year Premium (in USD) | Prior Year Premium (in USD) | Percentage Difference |
|----------|--------------|------|---------------------------------|-----------------------------|------------------------|
| A001     | John Doe     | 2024 | 100,000                         | 80,000                      | 25%                    |
| A002     | Jane Smith   | 2024 | 75,000                          | 70,000                      | 7.14%                  |
| A003     | Bob Johnson  | 2024 | 50,000                          | 45,000                      | 11.11%                 |
| A004     | Mary Williams| 2024 | 30,000                          | 25,000                      | 20%                    |

**8.Find the running Premium generated by a Agent over the series of month.**

```text
Tip: Sum of ReceivedAmount (Use Window function, running total) 
```

Sample Output:
| Agent ID | Agent Name   | Start of Month | Premium (in USD) |
|----------|--------------|-----------------|-------------------|
| A001     | John Doe     | 2024-01-01      | 10,000            |
| A001     | John Doe     | 2024-02-01      | 20,000            |
| A001     | John Doe     | 2024-03-01      | 30,000             |
| A002     | Jane Smith   | 2024-01-01      | 15,000            |
| A002     | Jane Smith   | 2024-02-01      | 30,000            |
| A002     | Jane Smith   | 2024-03-01      | 45,000            |

**9. Create view CLM_VW with column called SettledAmount on top of claim table, using the provided logic.**

```text
1.Compare the Coverage Limit in coverage table and Claim Amount in the Claim table.
2.If the CoverageLimit is more than claim Amount in claim table then the SettledAmount will the Claim Amount.
3.If the CoverageLimit is less than claim Amount in claim table then the SettledAmount will the Coverage limit.

for reference review the output provided below.
```

Sample Output:
| ClaimID | PolicyID | CoverageID | ClaimDate   | Description       | ClaimStatus | Amount  | CoverageLimit | SettledAmount |
|---------|----------|------------|-------------|-------------------|-------------|---------|---------------|---------------|
| 1       | 1        | 1          | 15-02-2024  | Car accident      | Pending     | $5,000  | $2,000        | $2,000        |
| 2       | 2        | 2          | 10-03-2024  | Hospitalization   | Approved    | $1,000  | $3,000        | $1,000        |

**10.The Insurance Company Plans to provide discount to Policy holders, who doesn't have any claim history, so list out the policy holders who haven't created any claim.**

```text
Hint: Find the Policy who doesn't have any claim created
```

**11.Add a column(Use Stored Procedure) in Policy Table as Policy Status, it should have only three vlaues "Active", "Expired" and "Quote".**

```text
Condition: 
1.If the Policy Enddate is Less than Current date then "Expired". 
2.If the Policy Start Date is Less than the Current Date and Policy Enddate is greater than Current date then "Active". 
3.If the Policy Start Date is greater than the Current Date then "Quote".
```

**12.Find Total number of policies by a agent for every year, the result should be in below format.**

| Agent Name   | 2022 | 2023 | 2024 |
|--------------|------|------|------|
| John Doe     | 10   | 12   | 15   |
| Jane Smith   | 8    | 9    | 10   |
| Bob Johnson  | 15   | 14   | 12   |
| Mary Williams| 5    | 7    | 8    |
