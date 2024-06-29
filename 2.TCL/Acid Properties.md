### ACID Properties of Database Transactions

**ACID** is an acronym that stands for Atomicity, Consistency, Isolation, and Durability. These properties ensure reliability and consistency of transactions within a database system:

1. **Atomicity**:
   - **Definition**: Atomicity guarantees that each transaction is treated as a single "atomic" unit. Either all of its operations are completed successfully and committed, or none of them are performed at all.
   - **Example**: When transferring money from one account to another, if any part of the transaction fails (e.g., due to insufficient funds), the entire transaction is rolled back to its initial state.

2. **Consistency**:
   - **Definition**: Consistency ensures that a transaction brings the database from one valid state to another. If the database is consistent before a transaction starts, it will remain consistent after the transaction completes.
   - **Example**: After a transaction, all integrity constraints, triggers, and cascades are satisfied, ensuring data remains valid and follows predefined rules.

3. **Isolation**:
   - **Definition**: Isolation ensures that the concurrent execution of transactions results in a system state that would be obtained if transactions were executed sequentially, one after the other.
   - **Example**: When multiple transactions are executed simultaneously, they are isolated from each other to prevent interference. Each transaction operates as if it is the only transaction running on the system.

4. **Durability**:
   - **Definition**: Durability guarantees that once a transaction has been committed, it will persist even in the event of a system failure (e.g., power outage or crash). Committed data is stored in non-volatile memory (disk) and remains intact.
   - **Example**: After a user receives a confirmation that their transaction (like a purchase) has been completed, the system ensures that the data is permanently stored and can be retrieved even after a restart.

These ACID properties are crucial for ensuring data integrity, reliability, and accuracy in database systems, especially in environments where transactions occur concurrently and system failures can occur. They provide a framework for building robust and dependable database applications.