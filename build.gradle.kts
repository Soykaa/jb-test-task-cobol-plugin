plugins {
    id("org.jetbrains.intellij") version "0.7.3"
    id("java")
}

group = "org.example"
version = "1.0-SNAPSHOT"

repositories {
    mavenCentral()
}

dependencies {
    implementation("org.jetbrains:annotations:20.1.0")
    testImplementation("org.junit.jupiter:junit-jupiter-api:5.8.1")
    testRuntimeOnly("org.junit.jupiter:junit-jupiter-engine:5.8.1")
    implementation("org.jetbrains:annotations:20.1.0")
}


tasks {

}

// See https://github.com/JetBrains/gradle-intellij-plugin/
intellij {
    version = "2021.3.2"
}

sourceSets["main"].java.srcDirs("src/main/gen")

tasks {
    test {
        useJUnitPlatform()
    }
}