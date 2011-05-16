import module namespace paginate = "paginate.xqm" at "modules/paginate.xqm";
import module namespace web = "basex.xqm" at "modules/base.xqm";

declare variable $GET := map {"page" = 1};
let $r := function($e) {<p>{$e} und {$e}</p> }
let $start := web:param("page",1)
let $x := (1 to 100) treat as xs:integer*
  return paginate:paginate($start,12 ,$x, $r )