(:~ 
: This module provides several convenience functions for
: web applications.
: @author Michael Seiferle
: @author BaseX Team, 2011
:)

module namespace web = "basex.xqm";

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
