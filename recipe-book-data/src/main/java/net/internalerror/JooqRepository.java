package net.internalerror;

import lombok.RequiredArgsConstructor;
import org.jooq.*;

import java.util.List;
import java.util.function.Function;

@RequiredArgsConstructor
public abstract class JooqRepository<R extends UpdatableRecord<R>, T extends Table<R>, V extends Class<V>, P extends TableField<R, V>> {

  private final DSLContext dslContext;

  private final T table;

  private final P primaryKeyField;

  private final Class<V> primaryKeyClass;

  @SuppressWarnings("DataFlowIssue")
  public V insert(Function<R, R> function) {
    return dslContext.insertInto(table).set(function.apply(dslContext.newRecord(table)))
                     .returningResult(primaryKeyField).fetchOne().into(primaryKeyClass);
  }

  public R get(V primaryKey) {
    return get(primaryKeyField.eq(primaryKey));
  }

  public R get(Condition condition) {
    return dslContext.selectFrom(table).where(condition).fetchOne();
  }

  public List<R> read(Condition condition) {
    return read(condition, primaryKeyField);
  }

  public List<R> read(Condition condition, OrderField<?>... orderFields) {
    return dslContext.selectFrom(table).where(condition).orderBy(orderFields).fetch();
  }

  public void update(Function<R, R> function, Condition condition) {
    read(condition).forEach(entity -> function.apply(entity).update());
  }

  public void delete(V primaryKey) {
    delete(primaryKeyField.eq(primaryKey));
  }

  public void delete(Condition condition) {
    dslContext.deleteFrom(table).where(condition).execute();
  }

}
