CREATE TABLE GeoCheckin
(
   id           SINT64    NOT NULL,
   time         TIMESTAMP NOT NULL,
   region       VARCHAR   NOT NULL,
   state        VARCHAR   NOT NULL,
   weather      VARCHAR   NOT NULL,
   temperature  DOUBLE,
   PRIMARY KEY (
     (id, QUANTUM(time, 15, 'm')),
      id, time
   )
)
