ThisBuild / scalaVersion := "2.13.7"
ThisBuild / organization := "com.avonsystem"

lazy val avonsystem = (project in file("."))
  .settings(
    name := "AvonSystem",
    version := "0.1.6"
  )

lazy val utilities = (project in file("utilities"))
  .settings(
    name := "Utilities",
    version := "1.9.0",
    libraryDependencies += "org.postgresql" % "postgresql" % "42.3.3"
  )

lazy val parserdata = (project in file("parserdata"))
  .settings(
    name := "ParserData",
    version := "2.0.0",
    libraryDependencies += "org.scala-lang.modules" %% "scala-parser-combinators" % "2.0.0",
    assembly / assemblyJarName := "parserdata.jar"
  ).dependsOn(utilities)

lazy val apilayer = (project in file("apilayer"))
  .settings(
    name := "ApiLayer",
    version := "0.1.0",
    libraryDependencies += "org.scala-lang.modules" %% "scala-parser-combinators" % "2.0.0",
    libraryDependencies += "com.squareup.okhttp3" % "okhttp" % "4.5.0",
    assembly / assemblyJarName := "apilayer.jar"
  ).dependsOn(utilities)

