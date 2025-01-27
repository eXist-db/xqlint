declare namespace opt = "http://www.zorba-xquery.com/options/optimizer";

declare option opt:enable "for-serialization-only";

declare variable $input-context external;

let $auction := doc($input-context) 
return
  for $b in $auction/site/regions//item
  let $k := $b/name/text()
  stable order by zero-or-one($b/location) ascending empty greatest
  return <item name="{$k}">{$b/location/text()}</item>

