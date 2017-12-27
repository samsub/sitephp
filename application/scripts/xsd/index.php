<?php
$file = "diaporama.xml";
$schema = "schemadiapo.xsd";


function libxml_display_error($error) {
$return = "<br/>\n";
switch ($error->level) {
case LIBXML_ERR_WARNING:
$return .= "<b>Warning $error->code</b>: ";
break;
case LIBXML_ERR_ERROR:
$return .= "<b>Error $error->code</b>: ";
break;
case LIBXML_ERR_FATAL:
$return .= "<b>Fatal Error $error->code</b>: ";
break;
}
$return .= trim($error->message);
if ($error->file) {
$return .= " in <b>$error->file</b>";
}
$return .= " on line <b>$error->line</b>\n";

return $return;
}

function libxml_display_errors($display_errors = true) {
$errors = libxml_get_errors();
$chain_errors = "";

foreach ($errors as $error) {
$chain_errors .= preg_replace('/( in\ \/(.*))/',  '»', strip_tags(libxml_display_error($error)))."\n";
if ($display_errors) {
trigger_error(libxml_display_error($error), E_USER_WARNING);
}
}
libxml_clear_errors();

return $chain_errors;
}

// Activer "user error handling"
libxml_use_internal_errors(true);


// Instanciation d’un DOMDocument
$dom = new DOMDocument("1.0");

// Charge du XML depuis un fichier
$dom->load($file);

// Validation du document XML
$validate = $dom->schemaValidate($schema);

// Affichage du résultat
if ($validate) {
echo "<b>DOMDocument::schemaValidate() Valid schema !</b>";
} else {
echo "<b>DOMDocument::schemaValidate() Generated Errors !</b><br /><br />";
libxml_display_errors();
}
?>