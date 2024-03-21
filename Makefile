.PHONY:
build-macos:
	@echo "macOS app target is now under construction..."

.PHONY:
build-ios:
	@echo "iOS app target is now under construction..."

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
