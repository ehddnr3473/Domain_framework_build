# Domain_framework_build

## 1. 프레임워크 프로젝트 생성

## 2. Archiving
### Archive for iOS

xcodebuild archive \
-scheme FrameworkName \\\
-configuration Release \\\
-destination 'generic/platform=iOS' \\\
-archivePath './build/FrameworkName.fromework-iphoneos.xcarchive' \\\
SKIP_INSTALL=NO \\\
BUILD_LIBRARY_FOR_DISTRIBUTION=YES

<br></br>
### Archive for Simulator
xcodebuild archive \
-scheme FrameworkName \
-configuration Release \
-destination 'generic/platform=iOS Simulator' \
-archivePath './build/FrameworkName.framework-iphonesimulator.xcarchive' \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES


<br></br>
## 3. xcframework 생성

xcodebulid -create-xcframework \
-framework './build/FrameworkName.framework-iphoneos.xcarchive/Products/Library/Frameworks/FrameworkName.framework' \
-framework './build/FrameworkName.framework-iphonesimulator.xcarchive/Products/Library/Frameworks/FrameworkName.framework' \
-output './build/FrameworkName.xcframework'

<br></br>
### **** 아카이빙할 때, -destination 'generic/platform=iOS' vs -sdk iphoneos ****
- 둘 다 Xcode 빌드 시 사용하는 옵션
- destination은 빌드 결과물을 실행할 시뮬레이터 또는 실제 기기의 정보를 지정. 'generic/platform=iOS'는 iOS 플랫폼의 제네릭한 장치를 대상으로 빌드하도록 설정.
- sdk는 빌드 시 사용할 SDK 버전을 선택. iphoneos는 iPhone OS SDK 버전을 사용하도록 설정.
- 두 옵션은 비슷하지만 destination은 실행할 대상 장치를 지정하는 데 초점을 두고, sdk는 빌드 시 사용할 SDK 버전을 지정하는 데 초점을 둠.
