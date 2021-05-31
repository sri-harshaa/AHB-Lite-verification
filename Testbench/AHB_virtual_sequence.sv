//Project : Verification of AMBA3 AHB-Lite protocol    //
//			using Universal Verification Methodology   //
//													   //
// Subject:	ECE 593									   //
// Guide  : Tom Schubert   							   //
// Date   : May 25th, 2021							   //
// Team	  :	Shivanand Reddy Gujjula,                   //
//			Sri Harsha Doppalapudi,                    //
//			Hiranmaye Sarpana Chandu	               //
// Portland State University                           //
//                                                     //
/////////////////////////////////////////////////////////
import AHBpkg::*;
import uvm_pkg::*;
`include "uvm_macros.svh"
class AHB_virtual_sequence extends uvm_sequence;
	`uvm_object_utils(AHB_virtual_sequence)
	`uvm_declare_p_sequencer(AHB_virtual_sequencer)

	function new(string name = "AHB_virtual_sequence");
		super.new(name);
	endfunction

	uvm_sequencer #(AHB_sequence_item) sequencer;
	
	sequence_SINGLE_burst seq_single;
	sequence_INCR_burst   seq_incr;
	sequence_INCR4_burst  seq_incr4;
	sequence_INCR8_burst  seq_incr8;
	sequence_INCR16_burst seq_incr16;
	sequence_WRAP4_burst  seq_wrap4;
	sequence_WRAP8_burst  seq_wrap8;
	sequence_WRAP16_burst seq_wrap16;

	task prebody();
		seq_single = sequence_SINGLE_burst::type_id::create("seq_single");
		seq_incr   = sequence_INCR_burst  ::type_id::create("seq_incr");
		seq_incr4  = sequence_INCR4_burst ::type_id::create("seq_incr4");
		seq_incr8  = sequence_INCR8_burst ::type_id::create("seq_incr8");
		seq_incr16 = sequence_INCR16_burst::type_id::create("seq_incr16");
		seq_wrap4  = sequence_WRAP4_burst ::type_id::create("seq_wrap4");
		seq_wrap8  = sequence_WRAP8_burst ::type_id::create("seq_wrap8");
		seq_wrap16 = sequence_WRAP16_burst::type_id::create("seq_wrap16");
	endtask

	task body();
			seq_single.start(sequencer);
			seq_incr.start(sequencer);
			seq_incr4.start(sequencer);
			seq_incr8.start(sequencer);
			seq_incr16.start(sequencer);
			seq_wrap4.start(sequencer);
			seq_wrap8.start(sequencer);
			seq_wrap16.start(sequencer);
	endtask

endclass
