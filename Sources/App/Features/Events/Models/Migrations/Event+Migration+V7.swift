import Fluent

final class EventMigrationV7: AsyncMigration {
    func prepare(on database: any Database) async throws {
        try await database.schema(Schema.event)
            .field("cfp_closed", .bool, .sql(.default(true)), .required)
            .update()
    }

    func revert(on database: any Database) async throws {
        try await database.schema(Schema.event)
            .deleteField("cfp_closed")
            .update()
    }
}
