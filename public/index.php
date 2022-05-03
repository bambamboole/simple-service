<?php

require_once dirname(__DIR__) . '/vendor/autoload.php';

$app = new \Xentral\SimpleService\Application();

echo $app->getInfo();

exit(0);
