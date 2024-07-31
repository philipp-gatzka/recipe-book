rootProject.name = "recipe-book"

include(":recipe-book-data")

dependencyResolutionManagement{
    versionCatalogs {
        create("libs") {
            version("jooq", "3.19.10")

            plugin("jooq", "org.jooq.jooq-codegen-gradle").versionRef("jooq")
            plugin("lombok", "io.freefair.lombok").version("8.6")

            library("jooq", "org.jooq", "jooq").versionRef("jooq")
            library("jooq-meta", "org.jooq", "jooq-meta-extensions").versionRef("jooq")
        }
    }
}
