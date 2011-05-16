module namespace web = "basex.xqm";
(:
    This module defines some common functionality needed to perform
    operations on FSML Filesystem Mappings.
    @author DeepFS Team
    @author Copyright (c) 2011, Michael Seiferle, ISC license
    @author Copyright (c) 2011, Alexander Holupirek, ISC license
:)
declare function web:toList($elems) as element(ul)  {
    <ul>{
      for $elem in $elems
      return  
        <li>{string($elem)}</li>
    }</ul>
};

declare function web:param($name as xs:string, $default){
	if($GET($name)) then $GET($name) else $default
};
