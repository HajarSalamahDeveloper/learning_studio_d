## Flavor setup

### Setup ANDROID

 1- Open the `android/app/build.gradle` file and define product flavors under `android`

 ```gradle
  flavorDimensions "default"
    productFlavors {
        dev {
            dimension "default"
            applicationIdSuffix ".dev"
            versionNameSuffix "-dev"
            resValue "string", "app_name", "[DEV]app"
        }
        prod {
            dimension "default"
            resValue "string", "app_name", "app"
        }
    }
```

2- go to `android/app/main/AndroidManifest.xml` 

replace `android:label="app_skeleton"` with `android:label="@string/app_name"`

3- add .vscode/launch.json

```json
{
	"version": "0.2.0",
	"configurations": [
		{
			"name": "app [dev]",
			"request": "launch",
			"type": "dart",
			"program": "lib/main_dev.dart",
			"args": ["--flavor", "dev"]
		},
		{
			"name": "app [prod]",
			"request": "launch",
			"type": "dart",
			"program": "lib/main_prod.dart",
			"args": ["--flavor", "prod"]
		},
		
	]
}
```

### Setup IOS


