
proc ::DBTools::buildDendrimer {dname gen\
  {coreid ""} {repeatid ""} {termid ""}} {

  ## Build a nth generation dendrimer
  ## having name "dname" defined in the 
  ## dendrimer topology

  variable topo 
  variable tree
  variable cpylist

  ## Selection array
  catch {array unset selections}
  array set selections {} 

  ## Load Fragments if necessary 
  set fnames [dict get $topo $dname fname] 
  if {$coreid == ""} {
   set prefix [dict get $fnames core]
   set coreid [safeMolNew $prefix]
  }

  if {$repeatid == ""} {
   set prefix [dict get $fnames repeat]
   set repeatid [safeMolNew $prefix]
  }

  if {$termid == ""} {
   set prefix [dict get $fnames term]
   set termid [safeMolNew $prefix]
  }

  ## Create a dummy molecule to store temprary files 
  set dumid [safeMolNew [molinfo $repeatid get filename]]

  ## Create some selections for each of the fragments
  set sel_core   [atomselect $coreid "all"]
  set sel_repeat [atomselect $repeatid "all"]
  set sel_dum    [atomselect $dumid "all"] 
  set sel_term   [atomselect $termid "all"]

  ## Coordinates, topologies 
  set props {}; set bondlist {} 

  ## Root id of the binary tree 
  set rootid [lindex $tree($gen) 0 0] 

  ## Center the core at the origin
  $sel_core moveby [vecinvert [measure center $sel_core]]
  set coord_arr($rootid) [$sel_core get {x y z}]
  $sel_core set resid $rootid

  ## update the atomic data and bond list 
  lappend props [$sel_core get $cpylist]
  lappend bondlist [topo -sel $sel_core getbondlist] 

  ## Attach the core to the repeats 
  set links [dict get $topo $dname link core-repeat]
  set geometry [dict get $topo $dname geometry core-repeat]
 
  if {[llength $links] >2} {
    dbtCon -error "No more than 2 core-repeat links are supported for now"
  }

  ## Get the nodes with depth = 1 
  ## This is the root/core molecule
  set paths  [getNodes $gen 1]
  set molids [list $coreid $repeatid]
  foreach p $paths l $links g $geometry {
   set id0 [lindex $p 0]; ## Parent 
   set id1 [lindex $p 1]; ## Node 
 
   ## Set the Geometry about the first linkage 
   setGeometry selections $molids $l $g

   ## Update coordiates, topologies and properties
   set coord_arr($id1) [$sel_repeat get {x y z}]
   $sel_repeat set resid "$id1"
   lappend props [$sel_repeat get $cpylist] 
   lappend bondlist [topo -sel $sel_repeat getbondlist] 
  }

  ## Do the repeats
  ## Attach the core to the repeats 
  lassign [dict get $topo $dname link repeat-repeat] l1 l2 
  lassign [dict get $topo $dname geometry repeat-repeat] g1 g2 
  set molids [list $dumid $repeatid]

  for {set i 2} {$i < $gen} {incr i} {
    set paths  [getNodes $gen $i]
    
    foreach {p1 p2} $paths {
      set id0 [lindex $p1 $i-1]; ## Parent Node 
      set id1 [lindex $p1 $i];   ## Left  Node 
      set id2 [lindex $p2 $i];   ## Right Node 

      ## Load the coordinates of the antecendent
      ## into the dummy mol
      $sel_dum set {x y z} $coord_arr($id0)

      if {![info exists coord_arr($id1)]} {

        ## Set the Geometry about the first linkage 
        setGeometry selections $molids $l1 $g1

        ## Update coordiates, topologies and properties
        set coord_arr($id1) [$sel_repeat get {x y z}]
        $sel_repeat set resid "$id1"
        lappend props [$sel_repeat get $cpylist] 
        lappend bondlist [topo -sel $sel_repeat getbondlist] 
      }

      if {![info exists coord_arr($id2)]} {

        ## Set the Geometry about the first linkage 
        setGeometry selections $molids $l2 $g2

        ## Update coordinates, topologies and properties
        set coord_arr($id2) [$sel_repeat get {x y z}]
        $sel_repeat set resid "$id2"
        lappend props [$sel_repeat get $cpylist] 
        lappend bondlist [topo -sel $sel_repeat getbondlist] 
      }
    }
  }       
 
  ## Get the nodes with depth = Dendrimer Generation 
  ## These are the leafs / terminal units 
  lassign [dict get $topo $dname link repeat-term] l1 l2 
  lassign [dict get $topo $dname geometry repeat-term] g1 g2 
  set molids [list $dumid $termid]
  set paths  [getNodes $gen $gen]
    
  foreach {p1 p2} $paths {
    set id0 [lindex $p1 $i-1]; ## Parent Node 
    set id1 [lindex $p1 $i];   ## Left  Node 
    set id2 [lindex $p2 $i];   ## Right Node 

    ## Load the coordinates of the antecendent
    ## into the dummy mol
    $sel_dum set {x y z} $coord_arr($id0)

    if {![info exists coord_arr($id1)]} {

      ## Set the Geometry about the first linkage 
      setGeometry selections $molids $l1 $g1

      ## Update coordiates, topologies and properties
      set coord_arr($id1) [$sel_term get {x y z}]
      $sel_term set resid "$id1"
      lappend props [$sel_term get $cpylist] 
      lappend bondlist [topo -sel $sel_term getbondlist] 
    }

    if {![info exists coord_arr($id2)]} {

      ## Set the Geometry about the first linkage 
      setGeometry selections $molids $l2 $g2

      ## Update coordinates, topologies and properties
      set coord_arr($id2) [$sel_term get {x y z}]
      $sel_term set resid "$id2"
      lappend props [$sel_term get $cpylist] 
      lappend bondlist [topo -sel $sel_term getbondlist] 
    }
  }

  ## Merge the fragments 
  set newmol [mergeFragments $props $bondlist] 

  ## Fix bonds

  ## Cleanup
  $sel_core   delete
  $sel_repeat delete
  $sel_term   delete
  $sel_dum    delete 

  foreach {key value} [array get selections *] {
    catch {$value delete}
  }
  array unset selections *

  mol delete $coreid
  mol delete $repeatid   
  mol delete $termid
  mol delete $dumid   
 
  return $newmol
}

proc ::DBTools::mergeFragments {props bondlist} {

    variable cpylist

    ## Collapse the property array
    set props [join $props]

    ## Create a new mol and dump the coordinates
    ## and atom properties into it
    set newmol [mol new atoms [llength $props]]
    animate dup $newmol
    set sel_new [atomselect $newmol "all"]
    $sel_new set $cpylist $props

    ## Update the bond list
    set newbl {}
    set offset [llength [lsort\
        -unique -integer -increasing [join [lindex $bondlist 0]]]]
    lappend newbl {*}[lindex $bondlist 0]

    foreach l [lrange $bondlist 1 end] {
      ## Collapse the list and get the unique
      ## indices, count them
        foreach b $l {
          lassign $b bid1 bid2
            incr bid1 $offset
            incr bid2 $offset
            lappend newbl [list $bid1 $bid2]
        }

      incr offset [llength [lsort\
        -unique -integer -increasing [join $l]]]
    }

    ## Apply the bond list
    topo -molid $newmol setbondlist $newbl

    ## Cleanup
    $sel_new delete

    return $newmol
}

proc ::DBTools::safeMolNew {fname} {

  if { [catch { mol new $fname waitfor all } retval] } {
    dbtCon -error $retval; return -code error
  }

  return $retval 
}
