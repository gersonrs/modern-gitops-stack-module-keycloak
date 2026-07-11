# Changelog

## [2.9.0](https://github.com/gersonrs/modern-gitops-stack-module-keycloak/compare/v2.8.0...v2.9.0) (2026-07-11)


### 🚀 New Features

* add namespace_labels variable to all modules ([9e38497](https://github.com/gersonrs/modern-gitops-stack-module-keycloak/commit/9e384974065dfeae49896380e83804e431304b1c))
* add namespace_labels variable to all modules ([08b89f9](https://github.com/gersonrs/modern-gitops-stack-module-keycloak/commit/08b89f93c1e13187319aac01eb60bf3a2afe66d7))

## [2.8.0](https://github.com/gersonrs/modern-gitops-stack-module-keycloak/compare/v2.7.0...v2.8.0) (2026-05-19)


### 🚀 New Features

* add custom theme support via initContainer git clone ([e35e811](https://github.com/gersonrs/modern-gitops-stack-module-keycloak/commit/e35e8115a1f280a45016bc76e756ccbabe5e948c))
* add custom theme support via initContainer git clone ([9c93373](https://github.com/gersonrs/modern-gitops-stack-module-keycloak/commit/9c93373636aa9c8e18b759d99825b74449b1c62f))
* add gateway_name and gateway_namespace variables ([4d02904](https://github.com/gersonrs/modern-gitops-stack-module-keycloak/commit/4d02904585c26bd259472d634d25518e28830ded))
* config somethings ([45918c5](https://github.com/gersonrs/modern-gitops-stack-module-keycloak/commit/45918c5889c70ca4b18db2926f39214465f51497))
* configure theme modern-gitops ([70e8a6a](https://github.com/gersonrs/modern-gitops-stack-module-keycloak/commit/70e8a6ab21c0cfaeb33dc68297e6863e2b3f447b))
* migrate from Traefik Ingress to Istio HTTPRoute (Gateway API) ([2dbf0d9](https://github.com/gersonrs/modern-gitops-stack-module-keycloak/commit/2dbf0d9190a45a7beeb8dc902a7f516c0a10da4b))
* redirect HTTP to HTTPS via separate HTTPRoutes with sectionName ([22ed427](https://github.com/gersonrs/modern-gitops-stack-module-keycloak/commit/22ed4276ad53465875ee19589b2875177627aaed))


### 🔥 Bug Fixes

* add audience protocol mapper to Keycloak client ([fffad0b](https://github.com/gersonrs/modern-gitops-stack-module-keycloak/commit/fffad0bf45c7aa90c3ba7795bb1ab401e2688d00))
* ensure secret is created after namespace by operator ([21f3f76](https://github.com/gersonrs/modern-gitops-stack-module-keycloak/commit/21f3f76e6bf1f79b6d32b572aca9dd1ff9c68332))
* escape %{http_code} in Terraform heredoc template ([a14f544](https://github.com/gersonrs/modern-gitops-stack-module-keycloak/commit/a14f54429c6c84ade96713b312ed3eab1e3dd30c))
* quote curl in wait_for_keycloak for POSIX sh compatibility ([960a495](https://github.com/gersonrs/modern-gitops-stack-module-keycloak/commit/960a49510946e61a98ab8f7d1e268c16ab445432))
* use http protocol in wait_for_keycloak since gateway only has http listener for kind ([397d588](https://github.com/gersonrs/modern-gitops-stack-module-keycloak/commit/397d58856427466c715aaef6706162fc56e23b17))
* use http scheme for non-prod issuers in OIDC URLs and Keycloak ssl_required ([4f45380](https://github.com/gersonrs/modern-gitops-stack-module-keycloak/commit/4f453803fd696057e468c5dd8efd578b0defa4e4))
* use https scheme for all cluster issuers except selfsigned-issuer ([eb037d6](https://github.com/gersonrs/modern-gitops-stack-module-keycloak/commit/eb037d626013edb53ed24ad70c01ca2f3ec3a014))
* wait for keycloak using https endpoint in local-exec readiness check ([0402aef](https://github.com/gersonrs/modern-gitops-stack-module-keycloak/commit/0402aef77b841dc52410de07954ece3d1700d851))


### ⌨️ Code Refactoring

* simplify HTTPRoute to use sectionName https only ([74cc5cd](https://github.com/gersonrs/modern-gitops-stack-module-keycloak/commit/74cc5cd03455b672dfdff204bf2fc466390254c6))

## [2.7.0](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/compare/v2.6.0...v2.7.0) (2026-01-26)


### 🚀 New Features

* add copilot instructions and update module configuration ([da12a40](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/da12a407ed1517d953049470cab0660f9efe0c0b))
* add pre-commit, config release-please workflow and adjust add-t… ([e51f2d7](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/e51f2d7cf913a4200d73bc0f9b5ced224c6183a6))
* add pre-commit, config release-please workflow and adjust add-to-project workflow ([d1cd02a](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/d1cd02ab0aa112ac9cd7f28ace33ed944f5e477e))
* add service monitor ([84159ab](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/84159abd4bfca165e07d2f34726a3da2bff2caf2))
* adicionar grupos para MLOps (viewers, editors, data-engineers, data-scientists, ml-engineers) ([4dff505](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/4dff505292dc48a2966e4e458551d19460b29798))
* adjust annotations ([7ecce9f](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/7ecce9f35875404988e5dc4c3a475781c87c8e0e))
* adjust code ([125e7c8](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/125e7c8576f7de035794bd7177cd10183574b4b8))
* adjust port ([69cbde6](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/69cbde61d075c10e0e473a9f45f90130a57c7620))
* adjust workflow ([0904fe3](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/0904fe30ff02e8f9cf919db9f0d31b427364ac28))
* ajust code ([556ab45](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/556ab450fcb58ab9533d4c6f0ac273661a49bb79))
* criar secret via terraform para ocultar valores sensíveis no plan ([7a50539](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/7a5053992b5b4f4ca3addeb62acae63fe8f0b4d0))
* disable network policies ([b5a3c8c](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/b5a3c8c5825bea2567426ce93a9c35b1133e391b))
* enhance keycloak ingress template ([8001710](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/8001710748ced5b2bc9a303fcc2dc75b9400259e))
* enhance oidc_bootstrap main configuration ([00a0442](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/00a04421be24c23e3b02e729b20863493f7a8ff1))
* Finish configuration ([6f4d002](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/6f4d0023569668e8ad6b41f234993a973cbd66ef))
* fix indent ([0ca327f](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/0ca327f3ffb5c0c4d96ee669c701a296273f976e))
* hidden somethings ([918942d](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/918942dcfec7fa66378973fb9d218e16f0b92c65))
* module modularization ([935b5e5](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/935b5e5c76632f2777616997138889e072f4f67a))
* module modularization ([663e7d8](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/663e7d8c9739e16a0f44c0b3debe1fffd61b0052))
* module modularization ([b6d0070](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/b6d0070384a987377f2b7370721b88dbba09d8ab))
* module modularization ([ab828e6](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/ab828e6e509b63b178c2d2c9e3b78ab1eb517d9a))
* module modularization ([da6784c](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/da6784c800cf79afec9e7eef0201632337ace63e))
* module modularization ([b2a100f](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/b2a100fb97756946fd05b0b15b22ce8b0bf1db0d))
* module modularization ([4ec71b9](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/4ec71b912af3c376165f2a8f2bec378a99932797))
* module rollback ([e92c59d](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/e92c59d2817a629e3879ad79fc9b7538be8bdacb))
* new operator ([1c6f904](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/1c6f904f4705c5e59668b5a1d8aedf819fd4cc1d))
* new operator ([be99b5a](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/be99b5a95c016d038c9fc07a8868a1e37e140b59))
* old operator ([d0c254d](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/d0c254da69b24821dd7e75a4fb43fed7aae1c6ac))
* pull request template ([ad204bd](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/ad204bd96fe3f271621033d19473d6d35ad7738e))
* remove a criação do namespace ([8aba742](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/8aba742894d41ff34adf07a2024e6d9d32f866a7))
* remove ingress manifest ([80fe523](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/80fe5230abe1ca4a879dd5d63b8f01c002cdb003))
* rollback to old version with improviments ([9c76fd5](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/9c76fd54bf9c2b44eca30ca5f041b805787bab84))
* test without proxy ([0cdf201](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/0cdf2018817c52e1c3af9adc2144b261e2336992))
* try again ([e2fa218](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/e2fa2184c9275f3b3c0837c57a146d024316a41e))
* update all the things ([950b6f2](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/950b6f255357f8508dde7a1d5be8f5d3bc603423))
* update and adjust documentation ([c680fc5](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/c680fc5101d1756c60d07e78c22fa7d82763831e))
* update chart ([43c1317](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/43c1317197500c1f3076055155739a372439d5a7))
* update code ([8ba55d1](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/8ba55d1d32344c69dc8c7abbf76674d2e546d994))
* update code ([f553ed7](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/f553ed73173daaccfe8998bd68f068d2920255e1))
* update operator ([3dc704b](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/3dc704b70f2df32f38e59c4f3f7fa0b6b3e4964e))
* update operator ([01b0ddf](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/01b0ddf29e5610a633ea7e5e919f225d03075054))
* update operator and keycloak ([2fdda79](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/2fdda79452a72b2b79a49a25a2154da9dfdca180))
* update project ([3765dad](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/3765dadff1bb298c9e243d94b0ef3248f4071d2c))
* update project ([148f7df](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/148f7df02d4135780ecd61655ec4fcc7c84d4318))
* update pull request template ([6de13dc](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/6de13dc87093f97d40908e16b24c55cf2a19a32a))


### 🔥 Bug Fixes

* adjust service name ([219163b](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/219163be871cf679e24eaaf0d07418de1ab9c2eb))
* improve fingerprint generator script robustness ([c2407f0](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/c2407f0a980157ca69157760bab30731381a79a3))
* remove strict ([ffe0558](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/ffe05580b55a9acf3ce88d2c17c1740459c4b5e4))
* update keycloak ingress configuration ([a22b833](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/a22b833adac3b508757f76c2e63612863f95cdd6))
* update oidc_bootstrap locals configuration ([d335023](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/d335023a5ca70ebf0fd254edef7e077e6e14f29b))


### 📚 Documentation

* **terraform-docs:** generate docs and write to README.adoc ([6fcd8d3](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/6fcd8d3ace3f4ca2ab4ae3d7254e3ec07a5f5d85))
* **terraform-docs:** generate docs and write to README.adoc ([0963ede](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/0963ede757bc48c15b79c6a9be8eff00aced08c0))
* **terraform-docs:** generate docs and write to README.adoc ([4b0b8e1](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/4b0b8e1cb52f99c7a382488f8986a0247d910622))
* **terraform-docs:** gerar docs e escrever no README.adoc ([64c4a3a](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/64c4a3a8dbaa8ae66298e727196885a15ffe6130))


### ⚙️ Chores

* release 1.0.0 ([0ec64ab](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/0ec64abd04091625b1fa67e716b7e116f85ee446))
* release 1.0.0 ([4f27f64](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/4f27f648f1700e8ec32a6579d45bb7f40d63591a))
* release 1.1.0 ([e8d8298](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/e8d829821a782ff422ca4c5d49690fa0fef51fd4))
* release 1.1.0 ([07525f6](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/07525f697d18002cfad0b54ab2a39173d7237a93))
* release 1.2.0 ([efe2d0d](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/efe2d0dce6242645b8ad8bd694270c505a8bc633))
* release 1.2.0 ([eaa0e6a](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/eaa0e6a1d6e1aeff2842abe6f595bf68f7f1aa38))
* release 2.4.0 ([7b5ec2b](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/7b5ec2b2656f4a1fe934df61a8882a6ac4937d38))
* release 2.4.0 ([bd946cc](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/bd946ccf3c6e13822df28606e67cadfb96680c68))
* release 2.5.0 ([2bf1346](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/2bf13468769a8ecbc75c57d050728874e0e0a235))
* release 2.5.0 ([ed3abd6](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/ed3abd6c5182a38c184dbf5c7114bb7ee611d599))
* release 2.5.1 ([eaf7653](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/eaf76537cd689d4a79591de93da9a3c84cb35288))
* release 2.5.1 ([965a812](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/965a8123b66411da3e34c9df2c82e1153c4e4ea0))
* release 2.6.0 ([e077a37](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/e077a37a628eae250832765723e22245c9104379))
* release 2.6.0 ([e89bd0c](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/e89bd0c3dade20bb1df7fdf16200cc95fee4d439))


### ⌨️ Code Refactoring

* adjust code ([44d9149](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/44d9149995edff1074d9f85b29e48bf6a4203825))
* adjust kubernete revision ([3142e18](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/3142e18233f4349efebdfdd68d2cec5855542dce))
* adjust workflows ([204f02d](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/204f02df3fade691e4f4d74954338928f29e2ebf))
* fix the url format ([d2f962c](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/d2f962c2bb857420c09c6818cb78830772e7187a))
* remover recursos relacionados ao GitLab do OIDC bootstrap ([26b197d](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/26b197d8ab6c66b3ed4160acedfb0599bbe271e1))
* try adjust code 5 ([fbbb9a1](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/fbbb9a131b48f8391bf5c58b96f76e0646c9af69))
* update keycloak configuration and chart templates ([5fa7b15](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/5fa7b159e4a416b75b056e4d1ed478bd28177638))
* update oidc_bootstrap configuration ([df679d0](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/df679d0ace404e512e9710fc0bbdcc74c34ba353))

## [2.6.0](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/compare/v2.5.1...v2.6.0) (2026-01-26)


### 🚀 New Features

* add copilot instructions and update module configuration ([da12a40](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/da12a407ed1517d953049470cab0660f9efe0c0b))
* add service monitor ([84159ab](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/84159abd4bfca165e07d2f34726a3da2bff2caf2))
* adicionar grupos para MLOps (viewers, editors, data-engineers, data-scientists, ml-engineers) ([4dff505](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/4dff505292dc48a2966e4e458551d19460b29798))
* adjust annotations ([7ecce9f](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/7ecce9f35875404988e5dc4c3a475781c87c8e0e))
* adjust code ([125e7c8](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/125e7c8576f7de035794bd7177cd10183574b4b8))
* adjust port ([69cbde6](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/69cbde61d075c10e0e473a9f45f90130a57c7620))
* adjust workflow ([0904fe3](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/0904fe30ff02e8f9cf919db9f0d31b427364ac28))
* ajust code ([556ab45](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/556ab450fcb58ab9533d4c6f0ac273661a49bb79))
* criar secret via terraform para ocultar valores sensíveis no plan ([7a50539](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/7a5053992b5b4f4ca3addeb62acae63fe8f0b4d0))
* disable network policies ([b5a3c8c](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/b5a3c8c5825bea2567426ce93a9c35b1133e391b))
* enhance keycloak ingress template ([8001710](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/8001710748ced5b2bc9a303fcc2dc75b9400259e))
* enhance oidc_bootstrap main configuration ([00a0442](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/00a04421be24c23e3b02e729b20863493f7a8ff1))
* fix indent ([0ca327f](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/0ca327f3ffb5c0c4d96ee669c701a296273f976e))
* hidden somethings ([918942d](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/918942dcfec7fa66378973fb9d218e16f0b92c65))
* module rollback ([e92c59d](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/e92c59d2817a629e3879ad79fc9b7538be8bdacb))
* new operator ([1c6f904](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/1c6f904f4705c5e59668b5a1d8aedf819fd4cc1d))
* new operator ([be99b5a](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/be99b5a95c016d038c9fc07a8868a1e37e140b59))
* old operator ([d0c254d](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/d0c254da69b24821dd7e75a4fb43fed7aae1c6ac))
* remove a criação do namespace ([8aba742](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/8aba742894d41ff34adf07a2024e6d9d32f866a7))
* remove ingress manifest ([80fe523](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/80fe5230abe1ca4a879dd5d63b8f01c002cdb003))
* rollback to old version with improviments ([9c76fd5](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/9c76fd54bf9c2b44eca30ca5f041b805787bab84))
* test without proxy ([0cdf201](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/0cdf2018817c52e1c3af9adc2144b261e2336992))
* try again ([e2fa218](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/e2fa2184c9275f3b3c0837c57a146d024316a41e))
* update all the things ([950b6f2](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/950b6f255357f8508dde7a1d5be8f5d3bc603423))
* update chart ([43c1317](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/43c1317197500c1f3076055155739a372439d5a7))
* update code ([8ba55d1](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/8ba55d1d32344c69dc8c7abbf76674d2e546d994))
* update code ([f553ed7](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/f553ed73173daaccfe8998bd68f068d2920255e1))
* update operator ([3dc704b](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/3dc704b70f2df32f38e59c4f3f7fa0b6b3e4964e))
* update operator ([01b0ddf](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/01b0ddf29e5610a633ea7e5e919f225d03075054))
* update operator and keycloak ([2fdda79](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/2fdda79452a72b2b79a49a25a2154da9dfdca180))


### 🔥 Bug Fixes

* adjust service name ([219163b](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/219163be871cf679e24eaaf0d07418de1ab9c2eb))
* improve fingerprint generator script robustness ([c2407f0](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/c2407f0a980157ca69157760bab30731381a79a3))
* remove strict ([ffe0558](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/ffe05580b55a9acf3ce88d2c17c1740459c4b5e4))
* update keycloak ingress configuration ([a22b833](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/a22b833adac3b508757f76c2e63612863f95cdd6))
* update oidc_bootstrap locals configuration ([d335023](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/d335023a5ca70ebf0fd254edef7e077e6e14f29b))


### ⌨️ Code Refactoring

* adjust code ([44d9149](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/44d9149995edff1074d9f85b29e48bf6a4203825))
* adjust kubernete revision ([3142e18](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/3142e18233f4349efebdfdd68d2cec5855542dce))
* fix the url format ([d2f962c](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/d2f962c2bb857420c09c6818cb78830772e7187a))
* remover recursos relacionados ao GitLab do OIDC bootstrap ([26b197d](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/26b197d8ab6c66b3ed4160acedfb0599bbe271e1))
* update keycloak configuration and chart templates ([5fa7b15](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/5fa7b159e4a416b75b056e4d1ed478bd28177638))
* update oidc_bootstrap configuration ([df679d0](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/df679d0ace404e512e9710fc0bbdcc74c34ba353))

## [2.5.1](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/compare/v2.5.0...v2.5.1) (2025-02-08)


### ⌨️ Code Refactoring

* adjust workflows ([204f02d](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/204f02df3fade691e4f4d74954338928f29e2ebf))
* try adjust code 5 ([fbbb9a1](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/fbbb9a131b48f8391bf5c58b96f76e0646c9af69))

## [2.5.0](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/compare/v2.4.0...v2.5.0) (2025-01-18)


### 🚀 New Features

* update project ([148f7df](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/148f7df02d4135780ecd61655ec4fcc7c84d4318))

## [2.4.0](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/compare/v2.3.0...v2.4.0) (2024-05-01)


### 🚀 New Features

* add pre-commit, config release-please workflow and adjust add-to-project workflow ([d1cd02a](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/d1cd02ab0aa112ac9cd7f28ace33ed944f5e477e))
* Finish configuration ([6f4d002](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/6f4d0023569668e8ad6b41f234993a973cbd66ef))
* module modularization ([935b5e5](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/935b5e5c76632f2777616997138889e072f4f67a))
* module modularization ([663e7d8](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/663e7d8c9739e16a0f44c0b3debe1fffd61b0052))
* module modularization ([b6d0070](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/b6d0070384a987377f2b7370721b88dbba09d8ab))
* module modularization ([ab828e6](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/ab828e6e509b63b178c2d2c9e3b78ab1eb517d9a))
* module modularization ([da6784c](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/da6784c800cf79afec9e7eef0201632337ace63e))
* module modularization ([b2a100f](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/b2a100fb97756946fd05b0b15b22ce8b0bf1db0d))
* module modularization ([4ec71b9](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/4ec71b912af3c376165f2a8f2bec378a99932797))
* pull request template ([ad204bd](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/ad204bd96fe3f271621033d19473d6d35ad7738e))
* update and adjust documentation ([c680fc5](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/c680fc5101d1756c60d07e78c22fa7d82763831e))
* update pull request template ([6de13dc](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/6de13dc87093f97d40908e16b24c55cf2a19a32a))


### 📚 Documentation

* **terraform-docs:** generate docs and write to README.adoc ([4b0b8e1](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/4b0b8e1cb52f99c7a382488f8986a0247d910622))


### ⚙️ Chores

* release 1.0.0 ([4f27f64](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/4f27f648f1700e8ec32a6579d45bb7f40d63591a))
* release 1.1.0 ([07525f6](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/07525f697d18002cfad0b54ab2a39173d7237a93))
* release 1.2.0 ([eaa0e6a](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/eaa0e6a1d6e1aeff2842abe6f595bf68f7f1aa38))

## [1.2.0](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/compare/v1.1.0...v1.2.0) (2024-04-26)


### Features

* pull request template ([ad204bd](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/ad204bd96fe3f271621033d19473d6d35ad7738e))
* update pull request template ([6de13dc](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/6de13dc87093f97d40908e16b24c55cf2a19a32a))

## [1.1.0](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/compare/v1.0.0...v1.1.0) (2024-04-26)


### Features

* update and adjust documentation ([c680fc5](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/c680fc5101d1756c60d07e78c22fa7d82763831e))

## 1.0.0 (2024-04-24)


### Features

* Finish configuration ([6f4d002](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/6f4d0023569668e8ad6b41f234993a973cbd66ef))
* module modularization ([935b5e5](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/935b5e5c76632f2777616997138889e072f4f67a))
* module modularization ([663e7d8](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/663e7d8c9739e16a0f44c0b3debe1fffd61b0052))
* module modularization ([b6d0070](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/b6d0070384a987377f2b7370721b88dbba09d8ab))
* module modularization ([ab828e6](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/ab828e6e509b63b178c2d2c9e3b78ab1eb517d9a))
* module modularization ([da6784c](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/da6784c800cf79afec9e7eef0201632337ace63e))
* module modularization ([b2a100f](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/b2a100fb97756946fd05b0b15b22ce8b0bf1db0d))
* module modularization ([4ec71b9](https://github.com/GersonRS/modern-gitops-stack-module-keycloak/commit/4ec71b912af3c376165f2a8f2bec378a99932797))
