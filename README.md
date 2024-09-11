# xcode-and-playgrounds

## Localize
String Catalogs are only available in Xcode project. Build Xcode project and update String Catalogs(.xcstrings files).

Currently, not update a localize file for Swift Playgrounds. You should run this command after modifying String Catalogs. 

TODO: consider use run script to update localize files.

```bash
$(xcode-select -p)/usr/bin/xcstringstool compile xcode-and-playgrounds/Localizable.xcstrings --output-directory ./XcodeAndPlaygrounds.swiftpm/Localizable
$(xcode-select -p)/usr/bin/xcstringstool compile xcode-and-playgrounds/InfoPlist.xcstrings --output-directory ./XcodeAndPlaygrounds.swiftpm/Localizable
```
