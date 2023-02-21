# Domain_framework_build

## Create xcframework
### 1. 프레임워크 프로젝트 생성

<br></br>
### 2. Archiving
**Archive for iOS**

```bash
xcodebuild clean archive \
-scheme FrameworkName \
-configuration Release \
-sdk iphoneos \
-destination 'generic/platform=iOS' \
-archivePath './build/FrameworkName.framework-iphoneos.xcarchive' \
ONLY_ACTIVE_ARCH=YES \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES
```

<br></br>
**Archive for Simulator**

```bash
xcodebuild clean archive \
-scheme FrameworkName \
-configuration Release \
-sdk iphonesimulator \
-destination 'generic/platform=iOS Simulator' \
-archivePath './build/FrameworkName.framework-iphonesimulator.xcarchive' \
ONLY_ACTIVE_ARCH=YES \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES
```


<br></br>
### 3. xcframework 생성

```bash
xcodebuild -create-xcframework \
-framework './build/FrameworkName.framework-iphoneos.xcarchive/Products/Library/Frameworks/FrameworkName.framework' \
-framework './build/FrameworkName.framework-iphonesimulator.xcarchive/Products/Library/Frameworks/FrameworkName.framework' \
-output './build/FrameworkName.xcframework'
```


<br></br>
## xcodebuild

### Build
**iOS**

```bash
xcodebuild clean build \
-scheme Domain \
-sdk iphoneos \
-destination 'generic/platform=iOS' \
-configuration Release \
ONLY_ACTIVE_ARCH=YES \
BUILD_DIR='./build' \
OBJROOT='./build/iphoneos/objroot' \
SYMROOT='./build/iphoneos/symroot' \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES
```


<br></br>
**iOS Simulator**

```bash
xcodebuild clean build \
-scheme Domain \
-sdk iphonesimulator \
-destination 'generic/platform=iOS Simulator' \
-configuration Release \
ONLY_ACTIVE_ARCH=YES \
BUILD_DIR='./build' \
OBJROOT='./build/iphonesimulator/objroot' \
SYMROOT='./build/iphonesimulator/symroot' \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES
```

<br></br>
## 참고
### -destination 'generic/platform=iOS' 와 -sdk iphoneos
- 둘 다 Xcode 빌드 시 사용하는 옵션
- destination은 빌드 결과물을 실행할 시뮬레이터 또는 실제 기기의 정보를 지정. 'generic/platform=iOS'는 iOS 플랫폼의 제네릭한 장치를 대상으로 빌드하도록 설정
- sdk는 빌드 시 사용할 SDK 버전을 선택. iphoneos는 iPhone OS SDK 버전을 사용하도록 설정
- 두 옵션은 비슷하지만 destination은 실행할 대상 장치를 지정하는 데 초점을 두고, sdk는 빌드 시 사용할 SDK 버전을 지정하는 데 초점을 둠.

<br></br>
### SKIP_INSTALL
- 정적 라이브러리 형태로 xcframework를 만들기 위해서는 SKIP_INSTALL을 YES로 설정

<br></br>
### BUILD_LIBRARY_FOR_DISTRIBUTION
- Build Settings - Mach-O Type을 Dynamic Library로 설정하거나 default library/framework를 생성하는 경우, BUILD_LIBRARY_FOR_DISTRIBUTION=YES를 명시하여 아카이빙하고 xcframework 생성
- 동적 라이브러리와 함께 사용하는 플래그
- 정적 라이브러리를 생성할 때 MACH_O_TYPE 플래그를 사용하여 Mach-O 파일 형식을 명시적으로 지정 예) MACH_O_TYPE=staticlib

<br></br>
### ONLY_ACTIVE_ARCH
- Xcode 빌드 설정
- 현재 액티브 아키텍처만 빌드하도록 지정하는 옵션
- 만약 액티브 아키텍처가 시뮬레이터일 경우 시뮬레이터 아키텍처만 빌드하게 되고, 디바이스일 경우 디바이스 아키텍처만 빌드
- 이 옵션을 사용하면 전체 아키텍처를 빌드하지 않고, 빌드 시간을 단축시킬 수 있음.

<br></br>
### OBJROOT
- 빌드 시 생성되는 object 파일 저장 경로를 지정하는 환경변수
- object 파일: 컴파일러가 소스 코드를 컴파일한 후 생성되는 중간 파일로, 링커가 이를 이용하여 최종적인 바이너리를 생성
