plugins {
    `java-library`
    application
}

group = "com.care.audio"
version = "1.0-SNAPSHOT"

application {
    mainClass.set("com.care.audio.WavFileProcessor")
}

repositories {
    mavenCentral()
}

// Configure Java compilation
java {
    sourceCompatibility = JavaVersion.VERSION_11
    targetCompatibility = JavaVersion.VERSION_11
}

// Configure native build
tasks.register<Exec>("buildNative") {
    group = "build"
    description = "Builds native libraries using CMake"
    
    workingDir(project.projectDir)
    
    doFirst {
        // Clean previous build
        delete("${projectDir}/src/main/cpp/build")
        file("${projectDir}/src/main/cpp/build").mkdirs()
        file("${projectDir}/build/libs/native").mkdirs()
    }
    
    val buildType = if (project.hasProperty("buildType")) {
        project.property("buildType").toString()
    } else {
        "Debug"
    }
    
    commandLine(
        "bash", "-c",
        """
        cd ${projectDir}/src/main/cpp
        chmod +x apply_patches.sh
        ./apply_patches.sh
        mkdir -p build
        cd build
        cmake -DCMAKE_BUILD_TYPE=$buildType \
            -DCMAKE_VERBOSE_MAKEFILE=ON \
            -DCMAKE_INSTALL_PREFIX=${projectDir}/src/main/cpp/build/install \
            ..
        cmake --build . --config $buildType -j$(nproc)
        mkdir -p ${projectDir}/build/libs/native
        cp lib/libcare_audio_processing.so ${projectDir}/build/libs/native/
        """
    )
}

tasks.named("classes") {
    dependsOn("buildNative")
}

// Configure JAR task
tasks.jar {
    manifest {
        attributes(
            "Main-Class" to "com.care.audio.WavFileProcessor",
            "Class-Path" to configurations.runtimeClasspath.get().joinToString(" ") { it.name }
        )
    }
    
    // Include all dependencies in the JAR
    from(configurations.runtimeClasspath.get().map { if (it.isDirectory) it else zipTree(it) })
    
    duplicatesStrategy = DuplicatesStrategy.EXCLUDE
}

dependencies {
    testImplementation("org.junit.jupiter:junit-jupiter-api:5.8.1")
    testRuntimeOnly("org.junit.jupiter:junit-jupiter-engine:5.8.1")
}

tasks.test {
    useJUnitPlatform()
}

// Configure resource directories
sourceSets {
    main {
        resources {
            srcDirs("src/main/resources", "build/libs/native")
        }
    }
}