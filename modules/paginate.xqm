(:~ 
: This module provides helper functions for pagination. 
:
: @author Michael Seiferle
: @author BaseX Team, 2011

:)
module namespace paginate = "paginate.xqm";

(:
This method paginates an arbitrary number of elements.
@param $page        the current page
@param $perPage     number of records per page
@param $elems       the elements to render
@param $renderFunc  function that contains information how to render the actual records
:)
declare function paginate:paginate($page as xs:integer, $perPage as xs:integer,
                                    $elems, $renderFunc)  {
  let $total := count($elems)
  let $first := ($page - 1)*$perPage
  
  return if($first lt $total and $page > 0) then
            let $content := 
              for $elem in $elems[    position() >= $first 
                                  and position() <= $page*$perPage]
              return $renderFunc($elem)
            return 
            <div>
              {$content} 
              <div class="pagination">{ paginate:links($page, $perPage, $total)}</div>
            </div>
        else
          <div class="error">No more pages available.</div>
};


declare function paginate:links($page as xs:integer, $perPage as xs:integer, $total as xs:integer){
  let $pages := if( 0 != ($total mod $perPage) ) 
                  then 1 + ($total idiv $perPage)
                  else $total idiv $perPage
  for $i in 1 to $pages
  return if ($i eq $page) then
              <strong>{$i}</strong>
        else  <a href="?page={$i}&amp;perPage={$perPage}">{$i}</a>
};