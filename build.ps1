﻿#Remove-Item –path ./ –recurse
& java -jar swagger-codegen-cli.jar generate -i https://api.cloudmersive.com/swagger/api/convert -l php -c packageconfig.json
#(Get-Content ./client/package.json).replace('v1', '1.0.1') | Set-Content ./client/package.json
Copy-Item ./cloudmersive_document_convert_api_client/* -Destination . -Recurse -Force
Remove-Item –path ./cloudmersive_document_convert_api_client –recurse

# Bug fix

(Get-Content ./vendor/guzzlehttp/guzzle/src/Client.php).replace("'verify'          => true,", "'verify'          => false,") | Set-Content ./vendor/guzzlehttp/guzzle/src/Client.php

(Get-Content ./README.md).replace('This PHP package is automatically generated by the [Swagger Codegen](https://github.com/swagger-api/swagger-codegen) project:', '[Cloudmersive Document and Data Conversion API](https://www.cloudmersive.com/convert-api) provides advanced document conversion, editing and generation capabilities.') | Set-Content ./README.md
(Get-Content ./README.md).replace('- Build package: io.swagger.codegen.languages.PhpClientCodegen', '') | Set-Content ./README.md
(Get-Content ./composer.json).replace('Swagger and contributors', 'Cloudmersive') | Set-Content ./composer.json
(Get-Content ./composer.json).replace('https://github.com/swagger-api/swagger-codegen', 'https://cloudmersive.com') | Set-Content ./composer.json
(Get-Content ./composer.json).replace('http://swagger.io', 'https://cloudmersive.com') | Set-Content ./composer.json

& php C:\ProgramData\ComposerSetup\bin\composer.phar install