import org.jetbrains.grammarkit.tasks.GenerateLexer
import org.jetbrains.grammarkit.tasks.GenerateParser


plugins {
    id("org.jetbrains.intellij") version "0.7.3"
    id("java")
    id("idea")
    id("org.jetbrains.grammarkit") version "2021.1.2"
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
//    val generateSimpleCobolLexer by registering(GenerateLexer::class) {
//        source = "src/main/java/org/intellij/sdk/language/SimpleCobol.flex"
//        targetDir = "src/main/java/gen/language"
//        targetClass = "SimpleCobolLexer"
//        purgeOldFiles = true
//    }
//
//    val generateSimpleCobolParser by registering(GenerateParser::class) {
//        dependsOn(generateSimpleCobolLexer)
//        source = "src/main/java/org/intellij/sdk/language/SimpleCobol.bnf"
//        targetRoot = "src/main/gen/"
//        pathToParser = "/language/parser/SimpleCobolParser.java"
//        pathToPsiRoot = "/language/psi"
//        purgeOldFiles = true
//    }
//
//    compileJava {
//        dependsOn(generateSimpleCobolParser)
//    }

    withType<JavaCompile> {
        sourceCompatibility = "11"
        targetCompatibility = "11"
    }

    test {
        useJUnitPlatform()
    }
}