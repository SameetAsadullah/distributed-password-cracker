# Parallel architecture

The application combines distributed-memory and shared-memory parallelism:

1. MPI rank 0 reads the selected SHA-512 crypt hash and extracts its salt.
2. The lowercase search space is divided across the remaining MPI ranks.
3. Each rank uses two OpenMP threads: one explores its assigned candidates while the other listens for an abort signal.
4. A rank that finds a match notifies rank 0.
5. Rank 0 broadcasts an abort message so the remaining workers stop searching.

This hybrid approach demonstrates how MPI can distribute work between machines while OpenMP coordinates tasks within each process.

## Scope and limitations

- Candidate passwords contain lowercase ASCII letters and are limited to eight characters.
- The implementation targets SHA-512 `crypt` hashes in the traditional shadow-file format.
- Work distribution is based on the first candidate character.
- The implementation is scoped to its defined brute-force search model rather than general-purpose password auditing.
