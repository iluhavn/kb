SELECT komer4banki.id, komer4banki.`Наименование`, komer4banki.`Адрес`, `status`.`Type` FROM komer4banki
JOIN `status` ON
komer4banki.`Статус` = `status`.`id`