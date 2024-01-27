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

