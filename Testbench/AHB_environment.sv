import uvm_pkg::*;
`include "uvm_macros.svh"
`include "AHB_virtual_sequencer.sv"
`include "AHB_coverage.sv"
`include "AHB_agent.sv"

class AHB_env extends uvm_env;
   
	`uvm_component_utils(AHB_env)
	
	AHB_agent      			agent;
	//AHB_scoreboard 			scoreboard;
	AHB_virtual_sequencer 	vsequencer;
	AHB_coverage			coverage;
   
	function new(string name = "AHB_env",uvm_component parent=null);
		super.new(name, parent);
	endfunction 
 
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		agent 		= AHB_agent::type_id::create("agent",this);
		coverage 	= AHB_coverage::type_id::create("coverage",this);
		//scoreboard  = AHB_scoreboard::type_id::create("scoreboard",this);
		vsequencer	= AHB_virtual_sequencer::type_id::create("vsequencer",this);
	endfunction
  
	function void connect_phase(uvm_phase phase);
		agent.monitor.analysis_port.connect(coverage.analysis_imp);
		//agent.monitor.analysis_port.connect(scoreboard.analysis_imp);
	endfunction
 
endclass 