package net.corda.core.node.services

import com.google.common.util.concurrent.ListenableFuture
import net.corda.core.transactions.LedgerTransaction

/**
 * Provides verification service. The implementation may be a simple in-memory verify() call or perhaps an IPC/RPC.
 */
interface TransactionVerifierService {
    /**
     * @param transaction The transaction to be verified.
     * @return A future that completes successfully if the transaction verified, or sets an exception the verifier threw.
     */
    fun verify(transaction: LedgerTransaction): ListenableFuture<*>
}