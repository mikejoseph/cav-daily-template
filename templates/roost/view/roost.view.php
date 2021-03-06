<?php
namespace roost\view\roost;

use foundry\response as Response;
use foundry\fs\path as Path;
use foundry\view as View;
use foundry\view\template as Template;
use foundry\request\url as URL;

use foundry\model as M;

function main($request, $payload, $kwargs=array()) {
	
	$ext = 'tpl';
	if( $request->isMobile() ) {
		$ext = 'mbl';
	}
	
	$action = $request->action;
	if( $action == 'send' ) {
		$action = 'property';
	}
	
	$str = sprintf('roost/%s.%s', $action, $ext);
	
	$s = $request->getSession();
	$s->set('roost_referrer', $request->query->query);

	try {
		$tpl = new Template($str);
		
		$res = new Response;
		$res->content = $tpl->render($payload);
	} catch( \foundry\exception $e ) {
		// couldn't locate template load the default
		
		$tpl = new Template(sprintf('roost/main.%s', $ext));
		
		$res = new Response;
		$res->content = $tpl->render($payload);
	}

	return $res;
}

?>