# QtJambi-with-IDE

## Purpose of this repo
This repo documents how to setup QtJambi...
- On Fedora 39
- In IntelliJ IDEA with the new UI
- From flathub

## Things to know
- https://github.com/OmixVisualization/qtjambi this repo has unclear instruction unsuited for beginners.
- Not all Qt Libraries are made equal, Qt6 devel libs downloaded from Fedora repos gave me some linker error, both the .jar files and the Qt6 devel libs were 6.6.0.
- Keeping that in mind, get the official libs from Qt website ( https://www.qt.io/download-open-source ).
- Yes, unless you compile for source and risk linker errors or smth you should get them from the official website and make an account.
- There are 3 things at play here,
- - qtjambi-6.6.0.jar file is only needed to compile your program. (For this guide stored in a folder named "dependencies" besides "src")
  - qtjambi-native-linux-x64-6.6.0.jar file is needed to run your file (?) serves as glue between native Qt libs and Java. (Same as previous)
  - Qt Libraries themselves for the Java app to run. (in ~/.Qt for this guide)

## Installing Qt Libs
1. Get Qt Libs from https://www.qt.io/download-open-source
2. Make the downloaded file executable (extract first if archive), either with chmod +x or via file manager.
3. Create a Qt account.
4. Log into the installer prompt with your Qt account.
5. Go through installer until you hit "Installation Folder" screen.
6. I recommend installing Qt in a hidden folder, preferably ~/.Qt
7. Select "Custom Installation"
8. Select desired Qt version (like Qt 6.6.0), WebAssembly, Android, sources, Wayland Compositor etc can all be unselected if you donot need them.
9. Deselect everything you DONOT need, we only need Qt libs to run our desktop app, so unselect Qt Creator/Designer etc like picrel.
10. Go through install as usual and wait for it to finish installing.

## (Skip if using a build system) Getting QtJambi jars
1. As described in https://github.com/OmixVisualization/qtjambi , goto Maven Central Repository
2. Download the .jars from...
   - https://central.sonatype.com/artifact/io.qtjambi/qtjambi/versions
   - https://central.sonatype.com/artifact/io.qtjambi/qtjambi-native-linux-x64/versions
3. Additionally, you can also get the Javadoc and source jars
4. Place them inside the "dependencies" folder you create in IntelliJ IDEA

## Configuring Intellij IDEA
1. Install IntelliJ IDEA and start a new project
2. Set it up however you like, try to use JDK 1.8 or 11, Temurin is good too if you cant find OpenJDK.
3. (Skip if using a build system) On the created project, create a folder besides "src" named "dependencies"
4. (Skip if using a build system) Copy the QtJambi .jars as mentioned.
5. Alternatively, paste the following text into your pom.xml file if using Maven

    ```<dependencies>
        <dependency>
            <groupId>io.qtjambi</groupId>
            <artifactId>qtjambi</artifactId>
            <version>6.6.0</version>
            <scope>compile</scope>
        </dependency>
        <dependency>
            <groupId>io.qtjambi</groupId>
            <artifactId>qtjambi-native-linux-x64</artifactId>
            <version>6.6.0</version>
            <scope>runtime</scope>
        </dependency>
    </dependencies>```

7. Goto File > Project Structure > Modules (Project) > Dependencies > Add > JAR or directories...
8. (Skip if using a build system) Goto the "dependencies" folder and add the .jar files one-by one
9. After that add the Qt libraries by repeating step 6 but this time going to ~/.Qt/<VERSION>/gcc_64/lib and adding that directory
10. After that it will show up as Unknown Directory or something like that, rename it to something appropriate like "Qt Libraries"
11. Click on the little arrow at the very right and set it to Runtime from Compile.

You're done.
