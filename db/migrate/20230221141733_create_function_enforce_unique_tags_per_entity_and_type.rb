class CreateFunctionEnforceUniqueTagsPerEntityAndType < ActiveRecord::Migration[7.0]
  def change
      # Hecking darck magic made by ChatGPT and corrected by me
      execute <<-SQL
      CREATE OR REPLACE FUNCTION enforce_unique_tags_per_entity_and_type() RETURNS TRIGGER AS $$
        DECLARE
          new_tag_type_id       INTEGER;
          type_allows_multiple  BOOLEAN;
          same_tag_type_count   INTEGER;
        BEGIN
          SELECT tag_type_id     INTO new_tag_type_id       FROM tags      WHERE id = NEW.tag_id;
          SELECT allows_multiple INTO type_allows_multiple  FROM tag_types WHERE id = new_tag_type_id;
          SELECT COUNT(1)        INTO same_tag_type_count   FROM entities_tags et
            WHERE et.entity_id         = NEW.entity_id
              AND et.tag_id           != NEW.tag_id
              AND new_tag_type_id      = (SELECT tag_type_id FROM tags WHERE id = et.tag_id)
              AND type_allows_multiple = FALSE;

          IF (same_tag_type_count = 0)
          THEN
            RETURN NEW;
          ELSE
            -- RAISE INFO 'Cannot add duplicate tag for entity and tag type combination';
            RETURN NULL;
          END IF;
        END;
      $$ LANGUAGE plpgsql;
    SQL

    execute <<-SQL
      CREATE TRIGGER unique_tags_per_entity_and_type
        BEFORE INSERT ON entities_tags
        FOR EACH ROW
        EXECUTE FUNCTION enforce_unique_tags_per_entity_and_type();
    SQL
  end
end
