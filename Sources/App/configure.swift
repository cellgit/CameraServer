import FluentSQLite
import Vapor
import FluentPostgreSQL

import Leaf

/// Called before your application initializes.
public func configure(_ config: inout Config, _ env: inout Environment, _ services: inout Services) throws {
    /// Register providers first
    try services.register(FluentPostgreSQLProvider())
    
    try services.register(LeafProvider())
    
    /// Register routes to the router
    let router = EngineRouter.default()
    try routes(router)
    services.register(router, as: Router.self)
    /// Register middleware
    var middlewares = MiddlewareConfig() // Create _empty_ middleware config
    /// middlewares.use(FileMiddleware.self) // Serves files from `Public/` directory
    middlewares.use(ErrorMiddleware.self) // Catches errors and converts to HTTP response
    services.register(middlewares)
    // Configure a SQLite database
//    let sqlite = try SQLiteDatabase(storage: .memory)
    /// Register the configured SQLite database to the database config.
    var databases = DatabasesConfig()
    
    let databaseConfig:PostgreSQLDatabaseConfig
    
    
    if let url = Environment.get("DATABASE_URL") {
//        databaseConfig = try PostgreSQLDatabaseConfig(url: url)
        databaseConfig = PostgreSQLDatabaseConfig(url: url)!
    }
    else {
        /// 在这里设置端口号
        let serverConfigure = NIOServerConfig.default(hostname: "localhost", port: 8123)    // Server port
        services.register(serverConfigure)
        
//        let serverConfig = NIOServerConfig.default(port: 8123)
//        services.register(serverConfig)
        
//        databaseConfig = PostgreSQLDatabaseConfig(hostname: "localhost",
//                                                  username: "liuhongli",
//                                                  database: "postgres")
        
        databaseConfig = PostgreSQLDatabaseConfig(hostname: "localhost",
                                                  port: 5432,   // database port
                                                  username: "liuhongli",
                                                  database: "postgres")
        
    }
    
    
    let database = PostgreSQLDatabase(config: databaseConfig)
    databases.add(database: database, as: .psql)
    services.register(databases)
    
    
    
    
    var migrations = MigrationConfig()
//    migrations.add(model: HotKeyModel.self, database: .psql)
    migrations.setupModels()
    services.register(migrations)
    config.prefer(LeafRenderer.self, for: ViewRenderer.self)
}
