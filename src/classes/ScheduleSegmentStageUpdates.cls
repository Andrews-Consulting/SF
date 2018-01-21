/*******************************************************************
// (c) 2016 Doextra
// 
// Description    : Class that schedules the batch update class for the contact maintenance
//     
// April 7, 2016 Andrews
********************************************************************/
global class ScheduleSegmentStageUpdates implements Schedulable {
  global void execute(SchedulableContext ctx) {
    
    SegmentStageUpdBatch ssub = new SegmentStageUpdBatch();
    ID thisBatchJob = database.executebatch(ssub); 
  }
}