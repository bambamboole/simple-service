<?php

namespace Xentral\SimpleService;

class Application
{
    public function getInfo(): string
    {
        ob_start();
        phpinfo();

        return ob_get_clean();
    }
}
