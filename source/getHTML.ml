# require "xml-light";;
open Xml;;

let path  = "/Users/Gideon/Dropbox/Columbia/PLT/W4115/source/"

(* HTTP request and convert to XML *)
let status = Sys.command (path^"./to_xml.sh http://www.google.com") in
Printf.printf "status = %d\n" status

(* Parse XML *)
let x = Xml.parse_file (path^"page.xml") in
	Printf.printf "XML formated = \n%s" (Xml.to_string_fmt x);;


