ThisBuild / scalaVersion := "2.13.7"
ThisBuild / organization := "com.avonsystem"

lazy val avonsystem = (project in file("."))
  .settings(
    name := "AvonSystem",
    version := "0.0.1"
  )

lazy val utilities = (project in file("utilities"))
  .settings(
    name := "Utilities",
    version := "1.0.3",
    libraryDependencies += "org.postgresql" % "postgresql" % "42.3.3"
  )

lazy val parserdata = (project in file("parserdata"))
  .settings(
    name := "ParserData",
    version := "0.1.4",
    libraryDependencies += "org.scala-lang.modules" %% "scala-parser-combinators" % "2.0.0",
    libraryDependencies += "org.postgresql" % "postgresql" % "42.3.3",
    assembly / assemblyJarName := "parserdata.jar"
  ).dependsOn(utilities)

