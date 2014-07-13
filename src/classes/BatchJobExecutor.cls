global class BatchJobExecutor {

	WebService static void executeHelloBatch(){
		HelloBatchApex batch = new HelloBatchApex();
		Id jobId = Database.executeBatch(batch);
		System.debug('====================Started Batch Apex job: ' + jobId);
	}
}