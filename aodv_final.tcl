set val(chan)           Channel/WirelessChannel                  ;# Channel Type
set val(prop)           Propagation/TwoRayGround                 ;# Radio-propagation model
set val(netif)          Phy/WirelessPhy                          ;# Network interface type
set val(mac)            Mac/802_11                               ;# MAC type
set val(ifq)            Queue/DropTail/PriQueue                  ;# Interface queue type
set val(ll)             LL                                       ;# Link layer type
set val(ant)            Antenna/OmniAntenna                      ;# Antenna model
set val(ifqlen)         150                                      ;# Max packet in ifq
set val(nn)             20                                       ;# Total number of mobilenodes
set val(rp)             AODV                                     ;# Routing protocol
set val(x)              700                                      ;# X dimension of topography
set val(y)              700                                      ;# Y dimension of topography
set val(cstop)          10                                       ;# Time of connections end
set val(stop)           10                                       ;# Time of simulation end

set ns_ [new Simulator]

$ns_ use-newtrace
set tracefd [open AODV.tr w]
$ns_ trace-all $tracefd

set namtrace [open AODV.nam w]
$ns_ namtrace-all-wireless $namtrace $val(x) $val(y)

set topo [new Topography]
$topo load_flatgrid $val(x) $val(y)

create-god $val(nn)

set chan_1_ [new $val(chan)]
set chan_2_ [new $val(chan)]

$ns_ node-config        -adhocRouting $val(rp) \
                        -llType $val(ll) \
                        -macType $val(mac) \
                        -ifqType $val(ifq) \
                        -ifqLen $val(ifqlen) \
                        -antType $val(ant) \
                        -propType $val(prop) \
                        -phyType $val(netif) \
                        -topoInstance $topo \
                        -agentTrace ON \
                        -routerTrace ON \
                        -macTrace ON \
                        -movementTrace ON \
                        -channel $chan_1_
                        


# define color index
$ns_ color 0 blue
$ns_ color 1 red
$ns_ color 2 black

# Create nodes and set initial positions for 20 nodes
for {set i 0} {$i < $val(nn)} {incr i} {
    set node_($i) [$ns_ node]
    $ns_ at 0.0 "$node_($i) color black"
	$node_($i) color "2"

}
$ns_ at 0.0 "$node_(7) color red"
$node_(7) color "1"
$ns_ at 0.0 "$node_(0) color blue"
$node_(0) color "0"
$ns_ at 0.0 "$node_(8) color blue"
$node_(8) color "0"



# Set initial positions for each node (you can modify these positions)
set initial_positions {
    {50.0 150.0}
    {200.0 450.0}
    {350.0 75.0}
    {300.0 250.0}
    {350.0 225.0}
    {150.0 50.0}
    {300.0 50.0}
    {150.0 250.0}
    {400.0 300.0}
    {450.0 350.0}
    {500.0 400.0}
    {100.0 500.0}
    {600.0 100.0}
    {250.0 600.0}
    {550.0 250.0}
    {650.0 500.0}
    {50.0 650.0}
    {450.0 100.0}
    {400.0 550.0}
    {200.0 350.0}
}

# Assign positions to nodes
for {set i 0} {$i < $val(nn)} {incr i} {
    set pos [lindex $initial_positions $i]
    set x [lindex $pos 0]
    set y [lindex $pos 1]
    $node_($i) set X_ $x
    $node_($i) set Y_ $y
    $node_($i) set Z_ 0.0
}

# Mobility for nodes (e.g., move in a random pattern)
for {set i 0} {$i < $val(nn)} {incr i} {
    # Random movement every 1 second, max distance 15 meters
    $ns_ at 0.5 "$node_($i) setdest [expr rand()*$val(x)] [expr rand()*$val(y)] 15.0"
    $ns_ at 1.0 "$node_($i) setdest [expr rand()*$val(x)] [expr rand()*$val(y)] 15.0"
    $ns_ at 1.5 "$node_($i) setdest [expr rand()*$val(x)] [expr rand()*$val(y)] 15.0"
    $ns_ at 2.0 "$node_($i) setdest [expr rand()*$val(x)] [expr rand()*$val(y)] 15.0"
    $ns_ at 2.5 "$node_($i) setdest [expr rand()*$val(x)] [expr rand()*$val(y)] 15.0"
    $ns_ at 3.0 "$node_($i) setdest [expr rand()*$val(x)] [expr rand()*$val(y)] 15.0"
    $ns_ at 3.5 "$node_($i) setdest [expr rand()*$val(x)] [expr rand()*$val(y)] 15.0"
    $ns_ at 4.0 "$node_($i) setdest [expr rand()*$val(x)] [expr rand()*$val(y)] 15.0"
    $ns_ at 4.5 "$node_($i) setdest [expr rand()*$val(x)] [expr rand()*$val(y)] 15.0"
    $ns_ at 5.0 "$node_($i) setdest [expr rand()*$val(x)] [expr rand()*$val(y)] 15.0"
    $ns_ at 5.5 "$node_($i) setdest [expr rand()*$val(x)] [expr rand()*$val(y)] 15.0"
    $ns_ at 6.0 "$node_($i) setdest [expr rand()*$val(x)] [expr rand()*$val(y)] 15.0"
    $ns_ at 6.5 "$node_($i) setdest [expr rand()*$val(x)] [expr rand()*$val(y)] 15.0"
    $ns_ at 7.0 "$node_($i) setdest [expr rand()*$val(x)] [expr rand()*$val(y)] 15.0"
    $ns_ at 7.5 "$node_($i) setdest [expr rand()*$val(x)] [expr rand()*$val(y)] 15.0"
    $ns_ at 8.0 "$node_($i) setdest [expr rand()*$val(x)] [expr rand()*$val(y)] 15.0"
    $ns_ at 8.5 "$node_($i) setdest [expr rand()*$val(x)] [expr rand()*$val(y)] 15.0"
    $ns_ at 9.0 "$node_($i) setdest [expr rand()*$val(x)] [expr rand()*$val(y)] 15.0"
    $ns_ at 9.5 "$node_($i) setdest [expr rand()*$val(x)] [expr rand()*$val(y)] 15.0"
}

# Attach CBR traffic between node 0 (source) and nodes 8 (destinations)
set udp [new Agent/UDP]
$ns_ attach-agent $node_(0) $udp
set null [new Agent/Null]
$ns_ attach-agent $node_(8) $null

set cbr [new Application/Traffic/CBR]
$cbr set packet_size_ 512
$cbr set interval_ 1
$cbr set rate_ 10kb
$cbr set random_ false
$cbr attach-agent $udp
$ns_ connect $udp $null

$ns_ at 0.01 "$cbr start"
$ns_ at 0.01 "$node_(0) label \"Source\""
$ns_ at 0.01 "$node_(8) label \"Destination\""

#set udp1 [new Agent/UDP]
#$ns_ attach-agent $node_(0) $udp1
#set null1 [new Agent/Null]
#$ns_ attach-agent $node_(12) $null1

#set cbr1 [new Application/Traffic/CBR]
#$cbr1 set packet_size_ 512
#$cbr1 set interval_ 1
#$cbr1 set rate_ 10kb
#$cbr1 set random_ false
#$cbr1 attach-agent $udp1
#$ns_ connect $udp1 $null1

#$ns_ at 5.0 "$cbr1 start"
#$ns_ at 0.01 "$node_(0) label \"Source\""
#$ns_ at 5.0 "$node_(12) label \"Destination2\""

# Set initial positions for all nodes
for {set i 0} {$i < $val(nn)} {incr i} {
    $ns_ initial_node_pos $node_($i) 10
}

# Define malicious behavior for node 7 as a Grayhole
# Set malicious behavior for node 7 as a Grayhole
$ns_ at 2.0 "[$node_(7) set ragent_] malicious"
$ns_ at 2.0 "$node_(7) label \"Grayhole\"" 

# Make node 7 return to normal after 5 seconds
#$ns_ at 6.0 "[$node_(7) set ragent_] normal"
#$ns_ at 6.0 "$node_(7) label \"normal\""

# Example to reset malicious behavior after a delay
$ns_ at 7.0 "[$node_(7) set ragent_] some_other_state"  ;# Set to a valid state
$ns_ at 7.0 "$node_(7) label \"Normal\""

# Stop CBR traffic at connection stop time
$ns_ at $val(cstop) "$cbr stop"
#$ns_ at $val(cstop) "$cbr1 stop"

# Reset nodes at the end of the simulation
for {set i 0} {$i < $val(nn)} {incr i} {
    $ns_ at $val(stop).000000001 "$node_($i) reset";
}

$ns_ at $val(stop) "finish"

proc finish {} {
    global ns_ tracefd namtrace
    $ns_ flush-trace
    close $tracefd
    close $namtrace
    exec nam AODV.nam &
    exit 0
}

puts "Starting Simulation..."
$ns_ run
