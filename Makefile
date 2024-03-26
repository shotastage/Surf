.PHONY:
build-macos:
	xcodebuild test -project ./App/macOS/Surf.xcodeproj -scheme Surf

.PHONY:
build-ios:
	xcodebuild test -project ./App/iOS/Surf.xcodeproj -scheme Surf

.PHONY:
build-android:
	@echo "Android app target is now under construction..."

.PHONY:
build-windows:
	@echo "Windows app target is now under construction..."

.PHONY:
genconf:
# @pkl eval -f yaml ./Config/swiftlint.pkl > .swiftlint.yml
	@pkl eval -f yaml ./Config/project_macos.pkl > ./App/macOS/project.yml

.PHONY:
clean:
	python ./Tools/devel-clean-project.py

.PHONY:
hard-clean:
	python ./Tools/devel-clean-project.py --hard
