


SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;


COMMENT ON SCHEMA "public" IS 'standard public schema';



CREATE SCHEMA IF NOT EXISTS "simulacion_juego";


ALTER SCHEMA "simulacion_juego" OWNER TO "postgres";


CREATE EXTENSION IF NOT EXISTS "pg_graphql" WITH SCHEMA "graphql";






CREATE EXTENSION IF NOT EXISTS "pg_stat_statements" WITH SCHEMA "extensions";






CREATE EXTENSION IF NOT EXISTS "pgcrypto" WITH SCHEMA "extensions";






CREATE EXTENSION IF NOT EXISTS "supabase_vault" WITH SCHEMA "vault";






CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA "extensions";






CREATE OR REPLACE FUNCTION "public"."fn_after_event_rating"() RETURNS "trigger"
    LANGUAGE "plpgsql"
    AS $$
BEGIN
  UPDATE public.user_laker
  SET reputation = (
    SELECT ROUND(AVG(uer.rating), 2)
    FROM public.user_event_ratings uer
    WHERE uer.rated_user_id = NEW.rated_user_id
  )
  WHERE user_id = NEW.rated_user_id;

  RETURN NEW;
END;
$$;


ALTER FUNCTION "public"."fn_after_event_rating"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_agenda_games"("p_year" integer, "p_month" integer) RETURNS TABLE("game_id" integer, "opposing_team_id" integer, "home" boolean, "start_date" timestamp with time zone, "game_end_time" timestamp with time zone, "team_name" "text", "logo_url" "text", "lakers_score" bigint, "opposite_score" bigint)
    LANGUAGE "sql"
    AS $$
  SELECT 
  -- Basic game details
  g.game_id,
  g.opposing_team_id,
  g.home,
  g.start_date,
  g.game_end_time, -- Game is null aka hasn't eneded yet cast as a 0
  -- Opp team logo, missing to add their name tho
  t.team_name,
  t.logo_url,
  -- Calc scores or sets to 0 if hasn't played yet aka no tps associated
  -- Lakers
  COALESCE(SUM(CASE
    WHEN tp.team_id = 1 THEN tps.points
    ELSE 0
  END), 0) AS lakers_score,

  -- Now calc for opposing team
  COALESCE(SUM(CASE
    WHEN tp.team_id = g.opposing_team_id THEN tps.points
    ELSE 0
  END), 0) AS opposite_score

  FROM simulacion_juego.game g
  -- Now bunch of stuff to link the game to ind players stats per game 
  JOIN simulacion_juego.team t ON t.team_id = g.opposing_team_id
  LEFT JOIN simulacion_juego.team_player_stats tps ON tps.game_id = g.game_id
  LEFT JOIN simulacion_juego.team_player tp ON tp.team_player_id = tps.team_player_id
  -- Date filtering within range 
  WHERE g.start_date >= make_date(p_year, p_month, 1)
    AND g.start_date < (make_date(p_year, p_month, 1) + INTERVAL '1 month') -- Here takes curr dates and adds a month so it'd be 2026-05-01 I think today it's month 04
  -- Must be same as selects cause sql is like that ig
  GROUP BY
    g.game_id,
    g.opposing_team_id,
    g.home,
    g.start_date,
    g.game_end_time,
    t.team_name,
    t.logo_url
  ORDER BY g.start_date; -- Ordering to show older to newer to hopefully make partition easier
$$;


ALTER FUNCTION "public"."get_agenda_games"("p_year" integer, "p_month" integer) OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_friend_chats"("p_user_id" "uuid") RETURNS TABLE("friendship_id" bigint, "conversation_id" bigint, "friend_id" "uuid", "friend_nickname" character varying, "friend_photo" character varying, "friend_online" boolean, "last_message" "text", "last_message_sent" timestamp with time zone, "last_message_sender_id" "uuid")
    LANGUAGE "sql" STABLE SECURITY DEFINER
    AS $$
  SELECT
    f.friendship_id,
    c.conversation_id,
    friend.user_id        AS friend_id,
    friend.nickname       AS friend_nickname,
    friend.photo_url      AS friend_photo,
    friend.online         AS friend_online,
    last_msg.message      AS last_message,
    last_msg.sent         AS last_message_sent,
    last_msg.user_id      AS last_message_sender_id
  FROM public.friendship f
  JOIN public.conversation c ON c.friendship_id = f.friendship_id
  JOIN public.user_laker friend ON friend.user_id = CASE
    WHEN f.user1 = p_user_id THEN f.user2
    ELSE f.user1
  END
  LEFT JOIN LATERAL (
    SELECT m.message, m.sent, m.user_id
    FROM public.message m
    WHERE m.conversation_id = c.conversation_id
    ORDER BY m.sent DESC
    LIMIT 1
  ) last_msg ON true
  WHERE f.user1 = p_user_id OR f.user2 = p_user_id
  ORDER BY last_msg.sent DESC NULLS LAST;
$$;


ALTER FUNCTION "public"."get_friend_chats"("p_user_id" "uuid") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_last_game_id"() RETURNS integer
    LANGUAGE "sql"
    AS $$
select * from simulacion_juego.get_last_game_id();
$$;


ALTER FUNCTION "public"."get_last_game_id"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_messages"("p_user_id" "uuid", "p_conversation_id" bigint) RETURNS TABLE("message_id" bigint, "user_id" "uuid", "nickname" character varying, "photo_url" character varying, "message" "text", "sent" timestamp with time zone, "is_mine" boolean)
    LANGUAGE "sql" STABLE SECURITY DEFINER
    AS $$
  -- Verifica que el usuario sea parte de la conversaci├│n antes de retornar mensajes
  SELECT
    m.message_id,
    m.user_id,
    ul.nickname,
    ul.photo_url,
    m.message,
    m.sent,
    m.user_id = p_user_id AS is_mine
  FROM public.message m
  JOIN public.user_laker ul ON ul.user_id = m.user_id
  WHERE m.conversation_id = p_conversation_id
    AND EXISTS (
      SELECT 1
      FROM public.conversation c
      JOIN public.friendship f ON f.friendship_id = c.friendship_id
      WHERE c.conversation_id = p_conversation_id
        AND (f.user1 = p_user_id OR f.user2 = p_user_id)
    )
  ORDER BY m.sent ASC;
$$;


ALTER FUNCTION "public"."get_messages"("p_user_id" "uuid", "p_conversation_id" bigint) OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_pending_rating"("p_user_id" "uuid") RETURNS TABLE("user_event_id" bigint, "event_id" bigint, "event_name" character varying, "event_date" timestamp with time zone)
    LANGUAGE "sql" STABLE SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
  SELECT
    ue.user_event_id,
    e.event_id,
    e.event_name,
    e.date AS event_date
  FROM public.user_event ue
  JOIN public.event e ON e.event_id = ue.event_id
  WHERE ue.user_id = p_user_id
    AND e.date < NOW()
    AND ue.rated_others = FALSE
  ORDER BY e.date DESC
  LIMIT 1;
$$;


ALTER FUNCTION "public"."get_pending_rating"("p_user_id" "uuid") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_players_played_with"("p_user_id" "uuid") RETURNS TABLE("user_id" "uuid", "nickname" character varying, "username" character varying, "photo_url" character varying, "reputation" numeric, "event_id" bigint, "event_name" character varying, "event_date" timestamp with time zone)
    LANGUAGE "sql" STABLE SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
  WITH last_event AS (
    SELECT ep.event_id
    FROM public.event_participant ep
    JOIN public.event e ON e.event_id = ep.event_id
    WHERE ep.user_id = p_user_id
      AND e.date < NOW()
    ORDER BY e.date DESC
    LIMIT 1
  )
  SELECT
    ul.user_id,
    ul.nickname,
    ul.username,
    ul.photo_url,
    ul.reputation,
    e.event_id,
    e.event_name,
    e.date AS event_date
  FROM last_event le
  JOIN public.event_participant ep_other
    ON ep_other.event_id = le.event_id
   AND ep_other.user_id <> p_user_id
  JOIN public.user_laker ul
    ON ul.user_id = ep_other.user_id
  JOIN public.event e
    ON e.event_id = le.event_id
  ORDER BY ul.nickname;
$$;


ALTER FUNCTION "public"."get_players_played_with"("p_user_id" "uuid") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_team_comparison"("p_game_id" integer) RETURNS TABLE("game_id" integer, "start_date" timestamp with time zone, "lakers_rebounds" integer, "opposing_rebounds" integer, "lakers_assists" integer, "opposing_assists" integer, "lakers_steals" integer, "opposing_steals" integer, "lakers_points" integer, "opposing_points" integer, "lakers_abv" "text", "opposing_abv" "text", "opposing_team_name" "text", "opposing_team_logo" "text")
    LANGUAGE "sql"
    AS $$
  select
    g.game_id,
    g.start_date,

    coalesce(sum(tps.rebounds) filter (where tp.team_id = 1), 0),
    coalesce(sum(tps.rebounds) filter (where tp.team_id <> 1), 0),

    coalesce(sum(tps.assists) filter (where tp.team_id = 1), 0),
    coalesce(sum(tps.assists) filter (where tp.team_id <> 1), 0),

    coalesce(sum(tps.steals) filter (where tp.team_id = 1), 0),
    coalesce(sum(tps.steals) filter (where tp.team_id <> 1), 0),

    coalesce(sum(tps.points) filter (where tp.team_id = 1), 0),
    coalesce(sum(tps.points) filter (where tp.team_id <> 1), 0),

    t.abreviatura,
    ot.abreviatura,
    ot.team_name,
    ot.logo_url

  from simulacion_juego.game g
  join simulacion_juego.team_player_stats tps 
    on tps.game_id = g.game_id
  join simulacion_juego.team_player tp 
    on tp.team_player_id = tps.team_player_id
  join simulacion_juego.team ot 
    on ot.team_id = g.opposing_team_id
  join simulacion_juego.team t 
    on t.team_id = 1

  where g.game_id = p_game_id

  group by g.game_id, t.abreviatura, ot.abreviatura, ot.team_name, ot.logo_url;
$$;


ALTER FUNCTION "public"."get_team_comparison"("p_game_id" integer) OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_user_stats"("p_user_id" "uuid") RETURNS TABLE("events_created" bigint, "events_attended" bigint)
    LANGUAGE "sql" STABLE SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
  SELECT
    (
      SELECT COUNT(*)
      FROM public.event
      WHERE created_user_id = p_user_id
    ) AS events_created,
    (
      SELECT COUNT(*)
      FROM public.user_event
      WHERE user_id = p_user_id
    ) AS events_attended;
$$;


ALTER FUNCTION "public"."get_user_stats"("p_user_id" "uuid") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."rls_auto_enable"() RETURNS "event_trigger"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'pg_catalog'
    AS $$
DECLARE
  cmd record;
BEGIN
  FOR cmd IN
    SELECT *
    FROM pg_event_trigger_ddl_commands()
    WHERE command_tag IN ('CREATE TABLE', 'CREATE TABLE AS', 'SELECT INTO')
      AND object_type IN ('table','partitioned table')
  LOOP
     IF cmd.schema_name IS NOT NULL AND cmd.schema_name IN ('public') AND cmd.schema_name NOT IN ('pg_catalog','information_schema') AND cmd.schema_name NOT LIKE 'pg_toast%' AND cmd.schema_name NOT LIKE 'pg_temp%' THEN
      BEGIN
        EXECUTE format('alter table if exists %s enable row level security', cmd.object_identity);
        RAISE LOG 'rls_auto_enable: enabled RLS on %', cmd.object_identity;
      EXCEPTION
        WHEN OTHERS THEN
          RAISE LOG 'rls_auto_enable: failed to enable RLS on %', cmd.object_identity;
      END;
     ELSE
        RAISE LOG 'rls_auto_enable: skip % (either system schema or not in enforced list: %.)', cmd.object_identity, cmd.schema_name;
     END IF;
  END LOOP;
END;
$$;


ALTER FUNCTION "public"."rls_auto_enable"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "simulacion_juego"."get_agenda_games"("p_year" integer, "p_month" integer) RETURNS TABLE("game_id" integer, "opposing_team_id" integer, "home" boolean, "start_date" timestamp with time zone, "logo_url" "text", "lakers_score" bigint, "opposite_score" bigint)
    LANGUAGE "sql"
    AS $$
  SELECT 
  -- Basic game details
  g.game_id,
  g.opposing_team_id,
  g.home,
  g.start_date,
  -- Opp team logo
  t.logo_url,
  -- Calc scores
  -- Lakers
  SUM(CASE
    WHEN tp.team_id = 1 THEN tps.points -- lakers always team id 1
    ELSE 0 -- Should always be 0 based on table def
  END) AS lakers_score,
  -- Opp team score
  SUM(CASE
    WHEN tp.team_id = g.opposing_team_id THEN tps.points
    ELSE 0
  END) AS opposite_score

  FROM simulacion_juego.game g
  -- Now bunch of stuff to link the game to ind players stats per game 
  JOIN simulacion_juego.team t ON t.team_id = g.opposing_team_id
  JOIN simulacion_juego.team_player_stats tps ON tps.game_id = g.game_id
  JOIN simulacion_juego.team_player tp ON tp.team_player_id = tps.team_player_id
  -- Date filtering within range 
  WHERE g.start_date >= make_date(p_year, p_month, 1)
    AND g.start_date < (make_date(p_year, p_month, 1) + INTERVAL '1 month') -- Here takes curr dates and adds a month so it'd be 2026-05-01 I think today it's month 04
  -- Must be same as selects cause sql is like that ig
  GROUP BY
    g.game_id,
    g.opposing_team_id,
    g.home,
    g.start_date,
    t.logo_url
  ORDER BY g.start_date; -- Ordering to show older to newer to hopefully make partition easier
$$;


ALTER FUNCTION "simulacion_juego"."get_agenda_games"("p_year" integer, "p_month" integer) OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "simulacion_juego"."get_last_game_id"() RETURNS integer
    LANGUAGE "sql"
    AS $$
  select coalesce((
    select g.game_id
    from simulacion_juego.game g
    where g.game_end_time < now()
    order by g.game_end_time desc
    limit 1
  ), 0);
$$;


ALTER FUNCTION "simulacion_juego"."get_last_game_id"() OWNER TO "postgres";

SET default_tablespace = '';

SET default_table_access_method = "heap";


CREATE TABLE IF NOT EXISTS "public"."achievement" (
    "achievement_id" bigint NOT NULL,
    "icon" character varying NOT NULL,
    "title" character varying NOT NULL,
    "description" character varying NOT NULL,
    "criteria_type" character varying,
    "criteria_value" integer
);


ALTER TABLE "public"."achievement" OWNER TO "postgres";


ALTER TABLE "public"."achievement" ALTER COLUMN "achievement_id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."achievement_achievement_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



CREATE TABLE IF NOT EXISTS "public"."bracket" (
    "id" bigint NOT NULL,
    "bracket_question_id1" integer NOT NULL,
    "bracket_question_id2" integer NOT NULL,
    "open_date" timestamp with time zone NOT NULL,
    "close_date" timestamp with time zone NOT NULL,
    "round" smallint NOT NULL,
    "winner" smallint,
    "question" "text"
);


ALTER TABLE "public"."bracket" OWNER TO "postgres";


ALTER TABLE "public"."bracket" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."bracket_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



CREATE TABLE IF NOT EXISTS "public"."bracket_question" (
    "id" bigint NOT NULL,
    "descripcion" "text" NOT NULL
);


ALTER TABLE "public"."bracket_question" OWNER TO "postgres";


ALTER TABLE "public"."bracket_question" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."bracket_question_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



CREATE TABLE IF NOT EXISTS "public"."card" (
    "card_id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "player_name" character varying NOT NULL,
    "web_url" character varying,
    "pixel_url" character varying,
    "attack" smallint,
    "defense" smallint,
    "velocity" smallint,
    "cost" smallint,
    "rare" boolean DEFAULT false NOT NULL
);


ALTER TABLE "public"."card" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."conversation" (
    "conversation_id" bigint NOT NULL,
    "friendship_id" bigint NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."conversation" OWNER TO "postgres";


ALTER TABLE "public"."conversation" ALTER COLUMN "conversation_id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."conversation_conversation_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



CREATE TABLE IF NOT EXISTS "public"."court" (
    "court_id" bigint NOT NULL,
    "name" character varying DEFAULT ''::character varying NOT NULL,
    "direction" character varying DEFAULT ''::character varying NOT NULL,
    "longitude" real NOT NULL,
    "latitude" real NOT NULL,
    "allow_court" boolean DEFAULT true NOT NULL
);


ALTER TABLE "public"."court" OWNER TO "postgres";


ALTER TABLE "public"."court" ALTER COLUMN "court_id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."court_court_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



CREATE TABLE IF NOT EXISTS "public"."event" (
    "event_id" bigint NOT NULL,
    "event_name" character varying NOT NULL,
    "date" timestamp with time zone NOT NULL,
    "max_players" smallint NOT NULL,
    "min_age" smallint,
    "max_age" smallint,
    "allow_event" boolean DEFAULT true NOT NULL,
    "court_id" bigint,
    "skill_level_id" bigint,
    "created_user_id" "uuid"
);


ALTER TABLE "public"."event" OWNER TO "postgres";


ALTER TABLE "public"."event" ALTER COLUMN "event_id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."event_event_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



CREATE TABLE IF NOT EXISTS "public"."event_participant" (
    "event_participant_id" bigint NOT NULL,
    "event_id" bigint,
    "user_id" "uuid"
);


ALTER TABLE "public"."event_participant" OWNER TO "postgres";


ALTER TABLE "public"."event_participant" ALTER COLUMN "event_participant_id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."event_participant_event_participant_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



CREATE TABLE IF NOT EXISTS "public"."event_report" (
    "ereport_id" bigint NOT NULL,
    "event_id" bigint NOT NULL,
    "reporter_user_id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "comment" "text" NOT NULL,
    "priority" "text" NOT NULL,
    "status" "text" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."event_report" OWNER TO "postgres";


ALTER TABLE "public"."event_report" ALTER COLUMN "ereport_id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."event_report_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



CREATE TABLE IF NOT EXISTS "public"."friendship" (
    "friendship_id" bigint NOT NULL,
    "user1" "uuid" NOT NULL,
    "user2" "uuid" DEFAULT "gen_random_uuid"()
);


ALTER TABLE "public"."friendship" OWNER TO "postgres";


ALTER TABLE "public"."friendship" ALTER COLUMN "friendship_id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."friendship_friendship_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



CREATE TABLE IF NOT EXISTS "public"."game" (
    "game_id" integer NOT NULL,
    "opposing_team_id" integer NOT NULL,
    "home" boolean NOT NULL,
    "attended" integer,
    "venue" character varying(250) NOT NULL,
    "start_date" timestamp with time zone NOT NULL,
    "current_quarter_start" timestamp with time zone,
    "current_quarter" integer DEFAULT 0 NOT NULL,
    "game_end_time" timestamp with time zone,
    "defense" boolean DEFAULT false NOT NULL
);


ALTER TABLE "public"."game" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "public"."game_game_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "public"."game_game_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "public"."game_game_id_seq" OWNED BY "public"."game"."game_id";



CREATE TABLE IF NOT EXISTS "public"."gender" (
    "gender_id" smallint NOT NULL,
    "gender" character varying NOT NULL
);


ALTER TABLE "public"."gender" OWNER TO "postgres";


ALTER TABLE "public"."gender" ALTER COLUMN "gender_id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."gender_gender_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



CREATE TABLE IF NOT EXISTS "public"."message" (
    "message_id" bigint NOT NULL,
    "conversation_id" bigint NOT NULL,
    "user_id" "uuid" NOT NULL,
    "message" "text" NOT NULL,
    "sent" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."message" OWNER TO "postgres";


ALTER TABLE "public"."message" ALTER COLUMN "message_id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."message_message_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



CREATE TABLE IF NOT EXISTS "public"."skill_level" (
    "skill_level_id" bigint NOT NULL,
    "description" character varying NOT NULL
);


ALTER TABLE "public"."skill_level" OWNER TO "postgres";


ALTER TABLE "public"."skill_level" ALTER COLUMN "skill_level_id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."skill_level_skill_level_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



CREATE TABLE IF NOT EXISTS "public"."team" (
    "team_id" integer NOT NULL,
    "team_name" character varying(100) NOT NULL,
    "logo_url" character varying(200) NOT NULL
);


ALTER TABLE "public"."team" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."team_player" (
    "team_player_id" integer NOT NULL,
    "first_name" character varying(50) NOT NULL,
    "last_name" character varying(50) NOT NULL,
    "team_id" integer NOT NULL,
    "photo_url" character varying(200)
);


ALTER TABLE "public"."team_player" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."team_player_stats" (
    "team_player_stats_id" integer NOT NULL,
    "game_id" integer NOT NULL,
    "team_player_id" integer NOT NULL,
    "minutes" interval NOT NULL,
    "points" smallint DEFAULT 0 NOT NULL,
    "rebounds" smallint DEFAULT 0 NOT NULL,
    "assists" smallint,
    "steals" smallint DEFAULT 0 NOT NULL,
    "turnovers" smallint DEFAULT 0 NOT NULL,
    "field_made" smallint,
    "field_attempted" smallint
);


ALTER TABLE "public"."team_player_stats" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "public"."team_player_stats_team_player_stats_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "public"."team_player_stats_team_player_stats_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "public"."team_player_stats_team_player_stats_id_seq" OWNED BY "public"."team_player_stats"."team_player_stats_id";



CREATE SEQUENCE IF NOT EXISTS "public"."team_player_team_player_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "public"."team_player_team_player_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "public"."team_player_team_player_id_seq" OWNED BY "public"."team_player"."team_player_id";



ALTER TABLE "public"."team_player" ALTER COLUMN "team_player_id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."team_player_team_player_id_seq1"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



CREATE OR REPLACE VIEW "public"."team_stats_comparision" AS
 SELECT "tps"."game_id",
    "tp"."team_id",
    "sum"("tps"."points") AS "total_points",
    "sum"("tps"."rebounds") AS "total_rebounds",
    "sum"("tps"."assists") AS "total_assists",
    "sum"("tps"."steals") AS "total_steals",
    "sum"("tps"."turnovers") AS "total_turnovers",
    "sum"("tps"."field_made") AS "total_field_made",
    "sum"("tps"."field_attempted") AS "total_field_attempted"
   FROM ("public"."team_player_stats" "tps"
     JOIN "public"."team_player" "tp" ON (("tps"."team_player_id" = "tp"."team_player_id")))
  GROUP BY "tps"."game_id", "tp"."team_id";


ALTER VIEW "public"."team_stats_comparision" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "public"."team_team_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "public"."team_team_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "public"."team_team_id_seq" OWNED BY "public"."team"."team_id";



CREATE TABLE IF NOT EXISTS "public"."user_achievement" (
    "user_id" "uuid" NOT NULL,
    "achievement_id" bigint NOT NULL,
    "date_unlocked" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."user_achievement" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."user_card" (
    "user_id" "uuid" NOT NULL,
    "unlocked" boolean DEFAULT false,
    "card_id" "uuid" NOT NULL
);


ALTER TABLE "public"."user_card" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."user_event" (
    "user_event_id" bigint NOT NULL,
    "user_id" "uuid" NOT NULL,
    "event_id" bigint NOT NULL,
    "result" boolean,
    "user_score" smallint,
    "opponent_score" smallint,
    "points" smallint,
    "rebounds" smallint,
    "assists" smallint,
    "rated_others" boolean DEFAULT false NOT NULL
);


ALTER TABLE "public"."user_event" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."user_event_ratings" (
    "user_event_rating_id" bigint NOT NULL,
    "user_event_id" bigint NOT NULL,
    "rated_user_id" "uuid" NOT NULL,
    "rating" numeric(3,2) NOT NULL,
    "date_rated" timestamp with time zone DEFAULT "now"() NOT NULL,
    CONSTRAINT "user_event_ratings_rating_check" CHECK ((("rating" >= 0.00) AND ("rating" <= 5.00)))
);


ALTER TABLE "public"."user_event_ratings" OWNER TO "postgres";


ALTER TABLE "public"."user_event_ratings" ALTER COLUMN "user_event_rating_id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."user_event_ratings_user_event_rating_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



ALTER TABLE "public"."user_event" ALTER COLUMN "user_event_id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."user_event_user_event_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



CREATE TABLE IF NOT EXISTS "public"."user_laker" (
    "user_id" "uuid" NOT NULL,
    "user_type" smallint DEFAULT '0'::smallint NOT NULL,
    "birthdate" "date",
    "nickname" character varying,
    "username" character varying,
    "photo_url" character varying,
    "gender" smallint,
    "credits" bigint DEFAULT '0'::bigint,
    "crowns" bigint DEFAULT '0'::bigint,
    "allow_lakers_court" boolean,
    "notifications" boolean,
    "online" boolean,
    "reputation" numeric DEFAULT 0
);


ALTER TABLE "public"."user_laker" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."user_report" (
    "ureport_id" bigint NOT NULL,
    "event_id" bigint NOT NULL,
    "reported_user_id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "reporter_user_id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "comment" "text" NOT NULL,
    "priority" "text" NOT NULL,
    "status" "text" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "key_words" "text"[]
);


ALTER TABLE "public"."user_report" OWNER TO "postgres";


ALTER TABLE "public"."user_report" ALTER COLUMN "ureport_id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."user_report_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



CREATE TABLE IF NOT EXISTS "public"."user_type" (
    "user_type_id" smallint NOT NULL,
    "user_type_title" character varying NOT NULL
);


ALTER TABLE "public"."user_type" OWNER TO "postgres";


ALTER TABLE "public"."user_type" ALTER COLUMN "user_type_id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."user_type_user_type_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



CREATE TABLE IF NOT EXISTS "public"."user_vote" (
    "id" bigint NOT NULL,
    "user_id" "uuid" NOT NULL,
    "bracket_id" bigint NOT NULL,
    "bracket_question_id_voted" bigint NOT NULL,
    "date_voted" timestamp with time zone NOT NULL,
    "won" boolean
);


ALTER TABLE "public"."user_vote" OWNER TO "postgres";


ALTER TABLE "public"."user_vote" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."user_vote_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



CREATE OR REPLACE VIEW "public"."view_player_stats" AS
 SELECT "tps"."team_player_stats_id",
    "tps"."game_id",
    "tps"."team_player_id",
    "tp"."photo_url",
    "concat"("tp"."first_name", ' ', "tp"."last_name") AS "full_name",
    "to_char"("tps"."minutes", 'MI:SS'::"text") AS "minutes",
    "tps"."points",
    "tps"."rebounds",
    "tps"."assists",
    "tps"."steals",
    "tps"."turnovers",
    "tps"."field_made",
    "tps"."field_attempted"
   FROM ("public"."team_player_stats" "tps"
     JOIN "public"."team_player" "tp" ON (("tps"."team_player_id" = "tp"."team_player_id")))
  WHERE ("tp"."team_id" = 1);


ALTER VIEW "public"."view_player_stats" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "simulacion_juego"."game" (
    "game_id" integer NOT NULL,
    "opposing_team_id" integer NOT NULL,
    "home" boolean NOT NULL,
    "attended" integer,
    "venue" character varying(250) NOT NULL,
    "start_date" timestamp with time zone NOT NULL,
    "current_quarter_start" timestamp with time zone,
    "current_quarter" integer DEFAULT 0 NOT NULL,
    "game_end_time" timestamp with time zone,
    "defense" boolean DEFAULT false NOT NULL,
    "won" boolean DEFAULT false NOT NULL
);


ALTER TABLE "simulacion_juego"."game" OWNER TO "postgres";


COMMENT ON COLUMN "simulacion_juego"."game"."won" IS 'Whether lakers won or lost the game';



CREATE SEQUENCE IF NOT EXISTS "simulacion_juego"."game_game_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "simulacion_juego"."game_game_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "simulacion_juego"."game_game_id_seq" OWNED BY "simulacion_juego"."game"."game_id";



CREATE TABLE IF NOT EXISTS "simulacion_juego"."team" (
    "team_id" integer NOT NULL,
    "team_name" character varying(100) NOT NULL,
    "logo_url" character varying(200) NOT NULL,
    "abreviatura" "text"
);


ALTER TABLE "simulacion_juego"."team" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "simulacion_juego"."team_player" (
    "team_player_id" integer NOT NULL,
    "first_name" character varying(50) NOT NULL,
    "last_name" character varying(50) NOT NULL,
    "team_id" integer NOT NULL,
    "photo_url" character varying(200)
);


ALTER TABLE "simulacion_juego"."team_player" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "simulacion_juego"."team_player_stats" (
    "team_player_stats_id" integer NOT NULL,
    "game_id" integer NOT NULL,
    "team_player_id" integer NOT NULL,
    "minutes" interval NOT NULL,
    "points" smallint DEFAULT 0 NOT NULL,
    "rebounds" smallint DEFAULT 0 NOT NULL,
    "assists" smallint,
    "steals" smallint DEFAULT 0 NOT NULL,
    "turnovers" smallint DEFAULT 0 NOT NULL,
    "field_made" smallint,
    "field_attempted" smallint
);


ALTER TABLE "simulacion_juego"."team_player_stats" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "simulacion_juego"."team_player_stats_team_player_stats_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "simulacion_juego"."team_player_stats_team_player_stats_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "simulacion_juego"."team_player_stats_team_player_stats_id_seq" OWNED BY "simulacion_juego"."team_player_stats"."team_player_stats_id";



CREATE SEQUENCE IF NOT EXISTS "simulacion_juego"."team_player_team_player_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "simulacion_juego"."team_player_team_player_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "simulacion_juego"."team_player_team_player_id_seq" OWNED BY "simulacion_juego"."team_player"."team_player_id";



CREATE SEQUENCE IF NOT EXISTS "simulacion_juego"."team_team_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "simulacion_juego"."team_team_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "simulacion_juego"."team_team_id_seq" OWNED BY "simulacion_juego"."team"."team_id";



CREATE OR REPLACE VIEW "simulacion_juego"."v_fieldgoal" WITH ("security_invoker"='on') AS
 SELECT "g"."game_id",
    "round"(((("sum"("tps"."field_made"))::numeric / (NULLIF("sum"("tps"."field_attempted"), 0))::numeric) * (100)::numeric), 1) AS "fg_percentage"
   FROM (("simulacion_juego"."game" "g"
     JOIN "simulacion_juego"."team_player_stats" "tps" ON (("tps"."game_id" = "g"."game_id")))
     JOIN "simulacion_juego"."team_player" "tp" ON (("tp"."team_player_id" = "tps"."team_player_id")))
  WHERE (("g"."game_end_time" IS NULL) AND ("tp"."team_id" = 1))
  GROUP BY "g"."game_id";


ALTER VIEW "simulacion_juego"."v_fieldgoal" OWNER TO "postgres";


CREATE OR REPLACE VIEW "simulacion_juego"."v_marcador_activo" WITH ("security_invoker"='on') AS
 SELECT "g"."game_id",
    "t"."team_name" AS "lakers_name",
    "t"."logo_url" AS "lakers_logo",
    COALESCE("sum"(("tps"."points")::integer) FILTER (WHERE ("tp"."team_id" = 1)), (0)::bigint) AS "lakers_score",
    "ot"."team_name" AS "opposing_team_name",
    "ot"."logo_url" AS "opposing_team_logo",
    COALESCE("sum"(("tps"."points")::integer) FILTER (WHERE ("tp"."team_id" <> 1)), (0)::bigint) AS "opposing_score",
    "g"."home",
    "g"."start_date",
    (EXTRACT(epoch FROM ("now"() - "g"."start_date")))::integer AS "seconds_elapsed",
    "g"."venue",
    "g"."attended"
   FROM (((("simulacion_juego"."game" "g"
     JOIN "simulacion_juego"."team" "t" ON (("t"."team_id" = 1)))
     JOIN "simulacion_juego"."team" "ot" ON (("ot"."team_id" = "g"."opposing_team_id")))
     LEFT JOIN "simulacion_juego"."team_player_stats" "tps" ON (("tps"."game_id" = "g"."game_id")))
     LEFT JOIN "simulacion_juego"."team_player" "tp" ON (("tp"."team_player_id" = "tps"."team_player_id")))
  WHERE (("g"."start_date" <= "now"()) AND ("g"."game_end_time" IS NULL))
  GROUP BY "g"."game_id", "t"."team_name", "t"."logo_url", "ot"."team_name", "ot"."logo_url", "g"."home", "g"."start_date", "g"."venue", "g"."attended";


ALTER VIEW "simulacion_juego"."v_marcador_activo" OWNER TO "postgres";


CREATE OR REPLACE VIEW "simulacion_juego"."v_prox_juego" WITH ("security_invoker"='on') AS
 SELECT "g"."game_id",
    "t"."team_name" AS "opposing_team_name",
    "t"."logo_url" AS "opposing_team_logo",
    "g"."start_date"
   FROM ("simulacion_juego"."game" "g"
     JOIN "simulacion_juego"."team" "t" ON (("t"."team_id" = "g"."opposing_team_id")))
  WHERE (("g"."start_date" > "now"()) AND ("g"."game_end_time" IS NULL))
  ORDER BY "g"."start_date"
 LIMIT 1;


ALTER VIEW "simulacion_juego"."v_prox_juego" OWNER TO "postgres";


CREATE OR REPLACE VIEW "simulacion_juego"."v_scoreboard" AS
SELECT
    NULL::integer AS "game_id",
    NULL::integer AS "current_quarter",
    NULL::timestamp with time zone AS "current_quarter_start",
    NULL::timestamp with time zone AS "game_end_time",
    NULL::boolean AS "defense",
    NULL::character varying(250) AS "venue",
    NULL::integer AS "attended",
    NULL::boolean AS "home",
    NULL::timestamp with time zone AS "start_date",
    NULL::integer AS "elapsed_seconds",
    NULL::character varying(100) AS "lakers_team_name",
    NULL::character varying(200) AS "lakers_logo",
    NULL::character varying(100) AS "opposing_team_name",
    NULL::character varying(200) AS "opposing_team_logo",
    NULL::bigint AS "lakers_score",
    NULL::bigint AS "opposing_score";


ALTER VIEW "simulacion_juego"."v_scoreboard" OWNER TO "postgres";


CREATE OR REPLACE VIEW "simulacion_juego"."v_team_comparison" WITH ("security_invoker"='on') AS
 SELECT "g"."game_id",
    "sum"(
        CASE
            WHEN ("tp"."team_id" = 1) THEN ("tps"."rebounds")::integer
            ELSE 0
        END) AS "lakers_rebounds",
    "sum"(
        CASE
            WHEN ("tp"."team_id" <> 1) THEN ("tps"."rebounds")::integer
            ELSE 0
        END) AS "opposing_rebounds",
    "sum"(
        CASE
            WHEN ("tp"."team_id" = 1) THEN ("tps"."assists")::integer
            ELSE 0
        END) AS "lakers_assists",
    "sum"(
        CASE
            WHEN ("tp"."team_id" <> 1) THEN ("tps"."assists")::integer
            ELSE 0
        END) AS "opposing_assists",
    "sum"(
        CASE
            WHEN ("tp"."team_id" = 1) THEN ("tps"."steals")::integer
            ELSE 0
        END) AS "lakers_steals",
    "sum"(
        CASE
            WHEN ("tp"."team_id" <> 1) THEN ("tps"."steals")::integer
            ELSE 0
        END) AS "opposing_steals"
   FROM (("simulacion_juego"."game" "g"
     JOIN "simulacion_juego"."team_player_stats" "tps" ON (("tps"."game_id" = "g"."game_id")))
     JOIN "simulacion_juego"."team_player" "tp" ON (("tp"."team_player_id" = "tps"."team_player_id")))
  WHERE ("g"."game_end_time" IS NULL)
  GROUP BY "g"."game_id";


ALTER VIEW "simulacion_juego"."v_team_comparison" OWNER TO "postgres";


CREATE OR REPLACE VIEW "simulacion_juego"."view_marcadores" AS
 SELECT "g"."game_id",
    "t"."team_name" AS "lakers_name",
    "t"."logo_url" AS "lakers_logo",
    COALESCE("sum"(
        CASE
            WHEN ("tp"."team_id" = 1) THEN "tps"."points"
            ELSE NULL::smallint
        END), (0)::bigint) AS "lakers_score",
    "ot"."team_name" AS "opposing_team_name",
    "ot"."logo_url" AS "opposing_team_logo",
    COALESCE("sum"(
        CASE
            WHEN ("tp"."team_id" <> 1) THEN "tps"."points"
            ELSE NULL::smallint
        END), (0)::bigint) AS "opposing_score",
    "g"."home",
    "g"."start_date",
    "g"."game_end_time",
    (EXTRACT(epoch FROM ("now"() - "g"."start_date")))::integer AS "seconds_elapsed",
    "g"."venue",
    "g"."attended"
   FROM (((("simulacion_juego"."game" "g"
     JOIN "simulacion_juego"."team" "t" ON (("t"."team_id" = 1)))
     JOIN "simulacion_juego"."team" "ot" ON (("ot"."team_id" = "g"."opposing_team_id")))
     LEFT JOIN "simulacion_juego"."team_player_stats" "tps" ON (("tps"."game_id" = "g"."game_id")))
     LEFT JOIN "simulacion_juego"."team_player" "tp" ON (("tp"."team_player_id" = "tps"."team_player_id")))
  GROUP BY "g"."game_id", "t"."team_name", "t"."logo_url", "ot"."team_name", "ot"."logo_url", "g"."home", "g"."start_date", "g"."game_end_time", "g"."venue", "g"."attended";


ALTER VIEW "simulacion_juego"."view_marcadores" OWNER TO "postgres";


CREATE OR REPLACE VIEW "simulacion_juego"."view_player_stats" AS
 SELECT "tps"."team_player_stats_id",
    "tps"."game_id",
    "tps"."team_player_id",
    "tp"."photo_url",
    "concat"("tp"."first_name", ' ', "tp"."last_name") AS "full_name",
    "to_char"("tps"."minutes", 'MI:SS'::"text") AS "minutes",
    "tps"."points",
    "tps"."rebounds",
    "tps"."assists",
    "tps"."steals",
    "tps"."turnovers",
    "tps"."field_made",
    "tps"."field_attempted"
   FROM ("simulacion_juego"."team_player_stats" "tps"
     JOIN "simulacion_juego"."team_player" "tp" ON (("tps"."team_player_id" = "tp"."team_player_id")))
  WHERE ("tp"."team_id" = 1);


ALTER VIEW "simulacion_juego"."view_player_stats" OWNER TO "postgres";


CREATE OR REPLACE VIEW "simulacion_juego"."view_team_stats_comparision" AS
 SELECT "tps"."game_id",
    "tp"."team_id",
    "sum"("tps"."points") AS "total_points",
    "sum"("tps"."rebounds") AS "total_rebounds",
    "sum"("tps"."assists") AS "total_assists",
    "sum"("tps"."steals") AS "total_steals",
    "sum"("tps"."turnovers") AS "total_turnovers",
    "sum"("tps"."field_made") AS "total_field_made",
    "sum"("tps"."field_attempted") AS "total_field_attempted"
   FROM ("simulacion_juego"."team_player_stats" "tps"
     JOIN "simulacion_juego"."team_player" "tp" ON (("tps"."team_player_id" = "tp"."team_player_id")))
  GROUP BY "tps"."game_id", "tp"."team_id";


ALTER VIEW "simulacion_juego"."view_team_stats_comparision" OWNER TO "postgres";


ALTER TABLE ONLY "public"."game" ALTER COLUMN "game_id" SET DEFAULT "nextval"('"public"."game_game_id_seq"'::"regclass");



ALTER TABLE ONLY "public"."team" ALTER COLUMN "team_id" SET DEFAULT "nextval"('"public"."team_team_id_seq"'::"regclass");



ALTER TABLE ONLY "public"."team_player_stats" ALTER COLUMN "team_player_stats_id" SET DEFAULT "nextval"('"public"."team_player_stats_team_player_stats_id_seq"'::"regclass");



ALTER TABLE ONLY "simulacion_juego"."game" ALTER COLUMN "game_id" SET DEFAULT "nextval"('"simulacion_juego"."game_game_id_seq"'::"regclass");



ALTER TABLE ONLY "simulacion_juego"."team" ALTER COLUMN "team_id" SET DEFAULT "nextval"('"simulacion_juego"."team_team_id_seq"'::"regclass");



ALTER TABLE ONLY "simulacion_juego"."team_player" ALTER COLUMN "team_player_id" SET DEFAULT "nextval"('"simulacion_juego"."team_player_team_player_id_seq"'::"regclass");



ALTER TABLE ONLY "simulacion_juego"."team_player_stats" ALTER COLUMN "team_player_stats_id" SET DEFAULT "nextval"('"simulacion_juego"."team_player_stats_team_player_stats_id_seq"'::"regclass");



ALTER TABLE ONLY "public"."achievement"
    ADD CONSTRAINT "achievement_pkey" PRIMARY KEY ("achievement_id");



ALTER TABLE ONLY "public"."bracket"
    ADD CONSTRAINT "bracket_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."bracket_question"
    ADD CONSTRAINT "bracket_question_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."card"
    ADD CONSTRAINT "card_pkey" PRIMARY KEY ("card_id");



ALTER TABLE ONLY "public"."conversation"
    ADD CONSTRAINT "conversation_friendship_id_key" UNIQUE ("friendship_id");



ALTER TABLE ONLY "public"."conversation"
    ADD CONSTRAINT "conversation_pkey" PRIMARY KEY ("conversation_id");



ALTER TABLE ONLY "public"."court"
    ADD CONSTRAINT "court_pkey" PRIMARY KEY ("court_id");



ALTER TABLE ONLY "public"."event_participant"
    ADD CONSTRAINT "event_participant_pkey" PRIMARY KEY ("event_participant_id");



ALTER TABLE ONLY "public"."event"
    ADD CONSTRAINT "event_pkey" PRIMARY KEY ("event_id");



ALTER TABLE ONLY "public"."event_report"
    ADD CONSTRAINT "event_report_pkey" PRIMARY KEY ("ereport_id");



ALTER TABLE ONLY "public"."friendship"
    ADD CONSTRAINT "friendship_pkey" PRIMARY KEY ("friendship_id");



ALTER TABLE ONLY "public"."game"
    ADD CONSTRAINT "game_pkey" PRIMARY KEY ("game_id");



ALTER TABLE ONLY "public"."gender"
    ADD CONSTRAINT "gender_pkey" PRIMARY KEY ("gender_id");



ALTER TABLE ONLY "public"."message"
    ADD CONSTRAINT "message_pkey" PRIMARY KEY ("message_id");



ALTER TABLE ONLY "public"."skill_level"
    ADD CONSTRAINT "skill_level_pkey" PRIMARY KEY ("skill_level_id");



ALTER TABLE ONLY "public"."team"
    ADD CONSTRAINT "team_pkey" PRIMARY KEY ("team_id");



ALTER TABLE ONLY "public"."team_player"
    ADD CONSTRAINT "team_player_pkey" PRIMARY KEY ("team_player_id");



ALTER TABLE ONLY "public"."team_player_stats"
    ADD CONSTRAINT "team_player_stats_pkey" PRIMARY KEY ("team_player_stats_id");



ALTER TABLE ONLY "public"."user_achievement"
    ADD CONSTRAINT "user_achievement_pkey" PRIMARY KEY ("user_id", "achievement_id");



ALTER TABLE ONLY "public"."user_event"
    ADD CONSTRAINT "user_event_pkey" PRIMARY KEY ("user_event_id");



ALTER TABLE ONLY "public"."user_event_ratings"
    ADD CONSTRAINT "user_event_ratings_pkey" PRIMARY KEY ("user_event_rating_id");



ALTER TABLE ONLY "public"."user_event_ratings"
    ADD CONSTRAINT "user_event_ratings_user_event_id_rated_user_id_key" UNIQUE ("user_event_id", "rated_user_id");



ALTER TABLE ONLY "public"."user_event"
    ADD CONSTRAINT "user_event_user_id_event_id_key" UNIQUE ("user_id", "event_id");



ALTER TABLE ONLY "public"."user_laker"
    ADD CONSTRAINT "user_laker_pkey" PRIMARY KEY ("user_id");



ALTER TABLE ONLY "public"."user_report"
    ADD CONSTRAINT "user_report_pkey" PRIMARY KEY ("ureport_id");



ALTER TABLE ONLY "public"."user_type"
    ADD CONSTRAINT "user_type_pkey" PRIMARY KEY ("user_type_id");



ALTER TABLE ONLY "public"."user_vote"
    ADD CONSTRAINT "user_vote_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "simulacion_juego"."game"
    ADD CONSTRAINT "game_pkey" PRIMARY KEY ("game_id");



ALTER TABLE ONLY "simulacion_juego"."team"
    ADD CONSTRAINT "team_pkey" PRIMARY KEY ("team_id");



ALTER TABLE ONLY "simulacion_juego"."team_player"
    ADD CONSTRAINT "team_player_pkey" PRIMARY KEY ("team_player_id");



ALTER TABLE ONLY "simulacion_juego"."team_player_stats"
    ADD CONSTRAINT "team_player_stats_pkey" PRIMARY KEY ("team_player_stats_id");



CREATE INDEX "idx_message_conversation" ON "public"."message" USING "btree" ("conversation_id", "sent" DESC);



CREATE OR REPLACE VIEW "simulacion_juego"."v_scoreboard" WITH ("security_invoker"='on') AS
 SELECT "g"."game_id",
    "g"."current_quarter",
    "g"."current_quarter_start",
    "g"."game_end_time",
    "g"."defense",
    "g"."venue",
    "g"."attended",
    "g"."home",
    "g"."start_date",
    (EXTRACT(epoch FROM ("now"() - "g"."start_date")))::integer AS "elapsed_seconds",
    "lt"."team_name" AS "lakers_team_name",
    "lt"."logo_url" AS "lakers_logo",
    "t"."team_name" AS "opposing_team_name",
    "t"."logo_url" AS "opposing_team_logo",
    "sum"(
        CASE
            WHEN ("tp"."team_id" = 1) THEN ("tps"."points")::integer
            ELSE 0
        END) AS "lakers_score",
    "sum"(
        CASE
            WHEN ("tp"."team_id" <> 1) THEN ("tps"."points")::integer
            ELSE 0
        END) AS "opposing_score"
   FROM (((("simulacion_juego"."game" "g"
     JOIN "simulacion_juego"."team" "t" ON (("t"."team_id" = "g"."opposing_team_id")))
     JOIN "simulacion_juego"."team" "lt" ON (("lt"."team_id" = 1)))
     JOIN "simulacion_juego"."team_player_stats" "tps" ON (("tps"."game_id" = "g"."game_id")))
     JOIN "simulacion_juego"."team_player" "tp" ON (("tp"."team_player_id" = "tps"."team_player_id")))
  WHERE ("g"."game_end_time" IS NULL)
  GROUP BY "g"."game_id", "t"."team_name", "t"."logo_url", "lt"."team_name", "lt"."logo_url";



CREATE OR REPLACE TRIGGER "trg_after_event_rating" AFTER INSERT ON "public"."user_event_ratings" FOR EACH ROW EXECUTE FUNCTION "public"."fn_after_event_rating"();



ALTER TABLE ONLY "public"."conversation"
    ADD CONSTRAINT "conversation_friendship_id_fkey" FOREIGN KEY ("friendship_id") REFERENCES "public"."friendship"("friendship_id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."event"
    ADD CONSTRAINT "event_court_id_fkey" FOREIGN KEY ("court_id") REFERENCES "public"."court"("court_id");



ALTER TABLE ONLY "public"."event"
    ADD CONSTRAINT "event_created_user_id_fkey" FOREIGN KEY ("created_user_id") REFERENCES "public"."user_laker"("user_id") ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE ONLY "public"."event_participant"
    ADD CONSTRAINT "event_participant_event_id_fkey" FOREIGN KEY ("event_id") REFERENCES "public"."event"("event_id");



ALTER TABLE ONLY "public"."event_participant"
    ADD CONSTRAINT "event_participant_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."user_laker"("user_id");



ALTER TABLE ONLY "public"."event_report"
    ADD CONSTRAINT "event_report_event_id_fkey" FOREIGN KEY ("event_id") REFERENCES "public"."event"("event_id");



ALTER TABLE ONLY "public"."event_report"
    ADD CONSTRAINT "event_report_reporter_user_id_fkey" FOREIGN KEY ("reporter_user_id") REFERENCES "public"."user_laker"("user_id");



ALTER TABLE ONLY "public"."event"
    ADD CONSTRAINT "event_skill_level_id_fkey" FOREIGN KEY ("skill_level_id") REFERENCES "public"."skill_level"("skill_level_id");



ALTER TABLE ONLY "public"."friendship"
    ADD CONSTRAINT "friendship_user1_fkey" FOREIGN KEY ("user1") REFERENCES "public"."user_laker"("user_id");



ALTER TABLE ONLY "public"."friendship"
    ADD CONSTRAINT "friendship_user2_fkey" FOREIGN KEY ("user2") REFERENCES "public"."user_laker"("user_id");



ALTER TABLE ONLY "public"."game"
    ADD CONSTRAINT "game_opposing_team_id_fkey" FOREIGN KEY ("opposing_team_id") REFERENCES "public"."team"("team_id");



ALTER TABLE ONLY "public"."message"
    ADD CONSTRAINT "message_conversation_id_fkey" FOREIGN KEY ("conversation_id") REFERENCES "public"."conversation"("conversation_id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."message"
    ADD CONSTRAINT "message_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."user_laker"("user_id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."team_player_stats"
    ADD CONSTRAINT "team_player_stats_game_id_fkey" FOREIGN KEY ("game_id") REFERENCES "public"."game"("game_id");



ALTER TABLE ONLY "public"."team_player_stats"
    ADD CONSTRAINT "team_player_stats_team_player_id_fkey" FOREIGN KEY ("team_player_id") REFERENCES "public"."team_player"("team_player_id");



ALTER TABLE ONLY "public"."team_player"
    ADD CONSTRAINT "team_player_team_id_fkey" FOREIGN KEY ("team_id") REFERENCES "public"."team"("team_id");



ALTER TABLE ONLY "public"."user_achievement"
    ADD CONSTRAINT "user_achievement_achievement_id_fkey" FOREIGN KEY ("achievement_id") REFERENCES "public"."achievement"("achievement_id");



ALTER TABLE ONLY "public"."user_achievement"
    ADD CONSTRAINT "user_achievement_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."user_laker"("user_id");



ALTER TABLE ONLY "public"."user_card"
    ADD CONSTRAINT "user_card_card_id_fkey" FOREIGN KEY ("card_id") REFERENCES "public"."card"("card_id") ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE ONLY "public"."user_card"
    ADD CONSTRAINT "user_card_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."user_laker"("user_id") ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE ONLY "public"."user_event"
    ADD CONSTRAINT "user_event_event_id_fkey" FOREIGN KEY ("event_id") REFERENCES "public"."event"("event_id");



ALTER TABLE ONLY "public"."user_event_ratings"
    ADD CONSTRAINT "user_event_ratings_rated_user_id_fkey" FOREIGN KEY ("rated_user_id") REFERENCES "public"."user_laker"("user_id");



ALTER TABLE ONLY "public"."user_event_ratings"
    ADD CONSTRAINT "user_event_ratings_user_event_id_fkey" FOREIGN KEY ("user_event_id") REFERENCES "public"."user_event"("user_event_id");



ALTER TABLE ONLY "public"."user_event"
    ADD CONSTRAINT "user_event_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."user_laker"("user_id");



ALTER TABLE ONLY "public"."user_laker"
    ADD CONSTRAINT "user_laker_gender_fkey" FOREIGN KEY ("gender") REFERENCES "public"."gender"("gender_id") ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE ONLY "public"."user_laker"
    ADD CONSTRAINT "user_laker_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "auth"."users"("id") ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE ONLY "public"."user_laker"
    ADD CONSTRAINT "user_laker_user_type_fkey" FOREIGN KEY ("user_type") REFERENCES "public"."user_type"("user_type_id") ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE ONLY "public"."user_report"
    ADD CONSTRAINT "user_report_event_id_fkey" FOREIGN KEY ("event_id") REFERENCES "public"."event"("event_id");



ALTER TABLE ONLY "public"."user_report"
    ADD CONSTRAINT "user_report_reported_user_id_fkey" FOREIGN KEY ("reported_user_id") REFERENCES "public"."user_laker"("user_id");



ALTER TABLE ONLY "public"."user_report"
    ADD CONSTRAINT "user_report_reporter_user_id_fkey" FOREIGN KEY ("reporter_user_id") REFERENCES "public"."user_laker"("user_id");



ALTER TABLE ONLY "public"."user_vote"
    ADD CONSTRAINT "user_vote_bracket_id_fkey" FOREIGN KEY ("bracket_id") REFERENCES "public"."bracket"("id");



ALTER TABLE ONLY "public"."user_vote"
    ADD CONSTRAINT "user_vote_bracket_question_id_voted_fkey" FOREIGN KEY ("bracket_question_id_voted") REFERENCES "public"."bracket_question"("id");



ALTER TABLE ONLY "public"."user_vote"
    ADD CONSTRAINT "user_vote_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."user_laker"("user_id");



ALTER TABLE ONLY "simulacion_juego"."game"
    ADD CONSTRAINT "game_opposing_team_id_fkey" FOREIGN KEY ("opposing_team_id") REFERENCES "simulacion_juego"."team"("team_id");



ALTER TABLE ONLY "simulacion_juego"."team_player_stats"
    ADD CONSTRAINT "team_player_stats_game_id_fkey" FOREIGN KEY ("game_id") REFERENCES "simulacion_juego"."game"("game_id");



ALTER TABLE ONLY "simulacion_juego"."team_player_stats"
    ADD CONSTRAINT "team_player_stats_team_player_id_fkey" FOREIGN KEY ("team_player_id") REFERENCES "simulacion_juego"."team_player"("team_player_id");



ALTER TABLE ONLY "simulacion_juego"."team_player"
    ADD CONSTRAINT "team_player_team_id_fkey" FOREIGN KEY ("team_id") REFERENCES "simulacion_juego"."team"("team_id");



CREATE POLICY "Allow insert user_achievement" ON "public"."user_achievement" FOR INSERT WITH CHECK (true);



CREATE POLICY "Allow read achievement" ON "public"."achievement" FOR SELECT USING (true);



CREATE POLICY "Allow read event_participant" ON "public"."event_participant" FOR SELECT USING (true);



CREATE POLICY "Allow read friendship" ON "public"."friendship" FOR SELECT USING (true);



CREATE POLICY "Allow read user_achievement" ON "public"."user_achievement" FOR SELECT USING (true);



CREATE POLICY "Enable insert for authenticated users only" ON "public"."game" FOR INSERT WITH CHECK (true);



CREATE POLICY "Enable read access for all  auth users" ON "public"."team_player_stats" FOR SELECT TO "authenticated" USING (true);



CREATE POLICY "Enable read access for all users" ON "public"."card" FOR SELECT TO "anon" USING (true);



CREATE POLICY "Enable read access for all users" ON "public"."court" FOR SELECT USING (true);



CREATE POLICY "Enable read access for all users" ON "public"."event_report" FOR SELECT USING (true);



CREATE POLICY "Enable read access for all users" ON "public"."game" FOR SELECT TO "anon" USING (true);



CREATE POLICY "Enable read access for all users" ON "public"."team" FOR SELECT USING (true);



CREATE POLICY "Enable read access for all users" ON "public"."team_player_stats" FOR SELECT TO "anon" USING (true);



CREATE POLICY "Enable read access for all users" ON "public"."user_card" FOR SELECT TO "anon" USING (true);



CREATE POLICY "Enable read access for all users" ON "public"."user_report" FOR SELECT USING (true);



CREATE POLICY "Enable read access for authenticated users" ON "public"."user_card" FOR SELECT TO "authenticated" USING (true);



CREATE POLICY "Permitir lectura de bracket_question" ON "public"."bracket_question" FOR SELECT USING (true);



CREATE POLICY "Permitir lectura de user_vote" ON "public"."user_vote" FOR SELECT USING (true);



CREATE POLICY "Permitir leer generos" ON "public"."gender" FOR SELECT USING (true);



ALTER TABLE "public"."achievement" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."bracket" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."bracket_question" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."card" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."conversation" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."court" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "crear conversacion propia" ON "public"."conversation" FOR INSERT TO "authenticated" WITH CHECK ((EXISTS ( SELECT 1
   FROM "public"."friendship" "f"
  WHERE (("f"."friendship_id" = "conversation"."friendship_id") AND (("f"."user1" = "auth"."uid"()) OR ("f"."user2" = "auth"."uid"()))))));



CREATE POLICY "enviar mensaje propio" ON "public"."message" FOR INSERT TO "authenticated" WITH CHECK ((("user_id" = "auth"."uid"()) AND (EXISTS ( SELECT 1
   FROM ("public"."conversation" "c"
     JOIN "public"."friendship" "f" ON (("f"."friendship_id" = "c"."friendship_id")))
  WHERE (("c"."conversation_id" = "message"."conversation_id") AND (("f"."user1" = "auth"."uid"()) OR ("f"."user2" = "auth"."uid"())))))));



ALTER TABLE "public"."event" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "event_insert_authenticated" ON "public"."event" FOR INSERT TO "authenticated" WITH CHECK (true);



ALTER TABLE "public"."event_participant" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."event_report" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "event_select_authenticated" ON "public"."event" FOR SELECT TO "authenticated" USING (true);



ALTER TABLE "public"."friendship" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."game" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."gender" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."message" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "select" ON "public"."bracket" FOR SELECT TO "anon" USING (true);



CREATE POLICY "select_authenticated" ON "public"."bracket" FOR SELECT TO "authenticated" USING (true);



ALTER TABLE "public"."skill_level" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."team" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."team_player" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."team_player_stats" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."user_achievement" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."user_card" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."user_event" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "user_event_delete_own" ON "public"."user_event" FOR DELETE TO "authenticated" USING (("auth"."uid"() = "user_id"));



CREATE POLICY "user_event_insert_own" ON "public"."user_event" FOR INSERT TO "authenticated" WITH CHECK (("auth"."uid"() = "user_id"));



ALTER TABLE "public"."user_event_ratings" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "user_event_ratings_insert_own" ON "public"."user_event_ratings" FOR INSERT TO "authenticated" WITH CHECK ((EXISTS ( SELECT 1
   FROM "public"."user_event" "ue"
  WHERE (("ue"."user_event_id" = "user_event_ratings"."user_event_id") AND ("ue"."user_id" = "auth"."uid"())))));



CREATE POLICY "user_event_ratings_select_own" ON "public"."user_event_ratings" FOR SELECT TO "authenticated" USING ((EXISTS ( SELECT 1
   FROM "public"."user_event" "ue"
  WHERE (("ue"."user_event_id" = "user_event_ratings"."user_event_id") AND ("ue"."user_id" = "auth"."uid"())))));



CREATE POLICY "user_event_ratings_update_own" ON "public"."user_event_ratings" FOR UPDATE TO "authenticated" USING ((EXISTS ( SELECT 1
   FROM "public"."user_event" "ue"
  WHERE (("ue"."user_event_id" = "user_event_ratings"."user_event_id") AND ("ue"."user_id" = "auth"."uid"()))))) WITH CHECK ((EXISTS ( SELECT 1
   FROM "public"."user_event" "ue"
  WHERE (("ue"."user_event_id" = "user_event_ratings"."user_event_id") AND ("ue"."user_id" = "auth"."uid"())))));



CREATE POLICY "user_event_select_authenticated" ON "public"."user_event" FOR SELECT TO "authenticated" USING (true);



CREATE POLICY "user_event_update_own" ON "public"."user_event" FOR UPDATE TO "authenticated" USING (("auth"."uid"() = "user_id")) WITH CHECK (("auth"."uid"() = "user_id"));



ALTER TABLE "public"."user_laker" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "user_laker_select_authenticated" ON "public"."user_laker" FOR SELECT TO "authenticated" USING (true);



CREATE POLICY "user_laker_update_own" ON "public"."user_laker" FOR UPDATE TO "authenticated" USING (("auth"."uid"() = "user_id")) WITH CHECK (("auth"."uid"() = "user_id"));



ALTER TABLE "public"."user_report" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."user_type" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."user_vote" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "ver conversacion propia" ON "public"."conversation" FOR SELECT TO "authenticated" USING ((EXISTS ( SELECT 1
   FROM "public"."friendship" "f"
  WHERE (("f"."friendship_id" = "conversation"."friendship_id") AND (("f"."user1" = "auth"."uid"()) OR ("f"."user2" = "auth"."uid"()))))));



CREATE POLICY "ver friendships propias" ON "public"."friendship" FOR SELECT TO "authenticated" USING ((("user1" = "auth"."uid"()) OR ("user2" = "auth"."uid"())));



CREATE POLICY "ver mensajes propios" ON "public"."message" FOR SELECT TO "authenticated" USING ((EXISTS ( SELECT 1
   FROM ("public"."conversation" "c"
     JOIN "public"."friendship" "f" ON (("f"."friendship_id" = "c"."friendship_id")))
  WHERE (("c"."conversation_id" = "message"."conversation_id") AND (("f"."user1" = "auth"."uid"()) OR ("f"."user2" = "auth"."uid"()))))));



CREATE POLICY "Enable insert for authenticated users only" ON "simulacion_juego"."team_player_stats" FOR INSERT TO "authenticated", "anon" WITH CHECK (true);



CREATE POLICY "Enable read access for all users" ON "simulacion_juego"."team_player_stats" FOR SELECT TO "anon" USING (true);



CREATE POLICY "Permitir select a autenticados" ON "simulacion_juego"."team_player_stats" FOR SELECT TO "authenticated" USING (true);



CREATE POLICY "Permitir update a autenticados" ON "simulacion_juego"."team_player_stats" FOR UPDATE TO "authenticated" USING (true) WITH CHECK (true);



CREATE POLICY "allow update stats" ON "simulacion_juego"."team_player_stats" FOR UPDATE TO "authenticated", "anon" USING (true) WITH CHECK (true);



ALTER TABLE "simulacion_juego"."team_player_stats" ENABLE ROW LEVEL SECURITY;




ALTER PUBLICATION "supabase_realtime" OWNER TO "postgres";






ALTER PUBLICATION "supabase_realtime" ADD TABLE ONLY "public"."conversation";



ALTER PUBLICATION "supabase_realtime" ADD TABLE ONLY "public"."event_report";



ALTER PUBLICATION "supabase_realtime" ADD TABLE ONLY "public"."message";



ALTER PUBLICATION "supabase_realtime" ADD TABLE ONLY "public"."user_report";



ALTER PUBLICATION "supabase_realtime" ADD TABLE ONLY "simulacion_juego"."game";



ALTER PUBLICATION "supabase_realtime" ADD TABLE ONLY "simulacion_juego"."team_player_stats";



GRANT USAGE ON SCHEMA "public" TO "postgres";
GRANT USAGE ON SCHEMA "public" TO "anon";
GRANT USAGE ON SCHEMA "public" TO "authenticated";
GRANT USAGE ON SCHEMA "public" TO "service_role";



GRANT USAGE ON SCHEMA "simulacion_juego" TO "anon";
GRANT USAGE ON SCHEMA "simulacion_juego" TO "authenticated";

























































































































































GRANT ALL ON FUNCTION "public"."fn_after_event_rating"() TO "anon";
GRANT ALL ON FUNCTION "public"."fn_after_event_rating"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."fn_after_event_rating"() TO "service_role";



GRANT ALL ON FUNCTION "public"."get_agenda_games"("p_year" integer, "p_month" integer) TO "anon";
GRANT ALL ON FUNCTION "public"."get_agenda_games"("p_year" integer, "p_month" integer) TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_agenda_games"("p_year" integer, "p_month" integer) TO "service_role";



GRANT ALL ON FUNCTION "public"."get_friend_chats"("p_user_id" "uuid") TO "anon";
GRANT ALL ON FUNCTION "public"."get_friend_chats"("p_user_id" "uuid") TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_friend_chats"("p_user_id" "uuid") TO "service_role";



GRANT ALL ON FUNCTION "public"."get_last_game_id"() TO "anon";
GRANT ALL ON FUNCTION "public"."get_last_game_id"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_last_game_id"() TO "service_role";



GRANT ALL ON FUNCTION "public"."get_messages"("p_user_id" "uuid", "p_conversation_id" bigint) TO "anon";
GRANT ALL ON FUNCTION "public"."get_messages"("p_user_id" "uuid", "p_conversation_id" bigint) TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_messages"("p_user_id" "uuid", "p_conversation_id" bigint) TO "service_role";



GRANT ALL ON FUNCTION "public"."get_pending_rating"("p_user_id" "uuid") TO "anon";
GRANT ALL ON FUNCTION "public"."get_pending_rating"("p_user_id" "uuid") TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_pending_rating"("p_user_id" "uuid") TO "service_role";



GRANT ALL ON FUNCTION "public"."get_players_played_with"("p_user_id" "uuid") TO "anon";
GRANT ALL ON FUNCTION "public"."get_players_played_with"("p_user_id" "uuid") TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_players_played_with"("p_user_id" "uuid") TO "service_role";



GRANT ALL ON FUNCTION "public"."get_team_comparison"("p_game_id" integer) TO "anon";
GRANT ALL ON FUNCTION "public"."get_team_comparison"("p_game_id" integer) TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_team_comparison"("p_game_id" integer) TO "service_role";



GRANT ALL ON FUNCTION "public"."get_user_stats"("p_user_id" "uuid") TO "anon";
GRANT ALL ON FUNCTION "public"."get_user_stats"("p_user_id" "uuid") TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_user_stats"("p_user_id" "uuid") TO "service_role";



GRANT ALL ON FUNCTION "public"."rls_auto_enable"() TO "anon";
GRANT ALL ON FUNCTION "public"."rls_auto_enable"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."rls_auto_enable"() TO "service_role";


















GRANT ALL ON TABLE "public"."achievement" TO "anon";
GRANT ALL ON TABLE "public"."achievement" TO "authenticated";
GRANT ALL ON TABLE "public"."achievement" TO "service_role";



GRANT ALL ON SEQUENCE "public"."achievement_achievement_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."achievement_achievement_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."achievement_achievement_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."bracket" TO "anon";
GRANT ALL ON TABLE "public"."bracket" TO "authenticated";
GRANT ALL ON TABLE "public"."bracket" TO "service_role";



GRANT ALL ON SEQUENCE "public"."bracket_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."bracket_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."bracket_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."bracket_question" TO "anon";
GRANT ALL ON TABLE "public"."bracket_question" TO "authenticated";
GRANT ALL ON TABLE "public"."bracket_question" TO "service_role";



GRANT ALL ON SEQUENCE "public"."bracket_question_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."bracket_question_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."bracket_question_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."card" TO "anon";
GRANT ALL ON TABLE "public"."card" TO "authenticated";
GRANT ALL ON TABLE "public"."card" TO "service_role";



GRANT ALL ON TABLE "public"."conversation" TO "anon";
GRANT ALL ON TABLE "public"."conversation" TO "authenticated";
GRANT ALL ON TABLE "public"."conversation" TO "service_role";



GRANT ALL ON SEQUENCE "public"."conversation_conversation_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."conversation_conversation_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."conversation_conversation_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."court" TO "anon";
GRANT ALL ON TABLE "public"."court" TO "authenticated";
GRANT ALL ON TABLE "public"."court" TO "service_role";



GRANT ALL ON SEQUENCE "public"."court_court_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."court_court_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."court_court_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."event" TO "anon";
GRANT ALL ON TABLE "public"."event" TO "authenticated";
GRANT ALL ON TABLE "public"."event" TO "service_role";



GRANT ALL ON SEQUENCE "public"."event_event_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."event_event_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."event_event_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."event_participant" TO "anon";
GRANT ALL ON TABLE "public"."event_participant" TO "authenticated";
GRANT ALL ON TABLE "public"."event_participant" TO "service_role";



GRANT ALL ON SEQUENCE "public"."event_participant_event_participant_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."event_participant_event_participant_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."event_participant_event_participant_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."event_report" TO "anon";
GRANT ALL ON TABLE "public"."event_report" TO "authenticated";
GRANT ALL ON TABLE "public"."event_report" TO "service_role";



GRANT ALL ON SEQUENCE "public"."event_report_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."event_report_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."event_report_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."friendship" TO "anon";
GRANT ALL ON TABLE "public"."friendship" TO "authenticated";
GRANT ALL ON TABLE "public"."friendship" TO "service_role";



GRANT ALL ON SEQUENCE "public"."friendship_friendship_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."friendship_friendship_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."friendship_friendship_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."game" TO "anon";
GRANT ALL ON TABLE "public"."game" TO "authenticated";
GRANT ALL ON TABLE "public"."game" TO "service_role";



GRANT ALL ON SEQUENCE "public"."game_game_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."game_game_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."game_game_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."gender" TO "anon";
GRANT ALL ON TABLE "public"."gender" TO "authenticated";
GRANT ALL ON TABLE "public"."gender" TO "service_role";



GRANT ALL ON SEQUENCE "public"."gender_gender_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."gender_gender_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."gender_gender_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."message" TO "anon";
GRANT ALL ON TABLE "public"."message" TO "authenticated";
GRANT ALL ON TABLE "public"."message" TO "service_role";



GRANT ALL ON SEQUENCE "public"."message_message_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."message_message_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."message_message_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."skill_level" TO "anon";
GRANT ALL ON TABLE "public"."skill_level" TO "authenticated";
GRANT ALL ON TABLE "public"."skill_level" TO "service_role";



GRANT ALL ON SEQUENCE "public"."skill_level_skill_level_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."skill_level_skill_level_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."skill_level_skill_level_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."team" TO "anon";
GRANT ALL ON TABLE "public"."team" TO "authenticated";
GRANT ALL ON TABLE "public"."team" TO "service_role";



GRANT ALL ON TABLE "public"."team_player" TO "anon";
GRANT ALL ON TABLE "public"."team_player" TO "authenticated";
GRANT ALL ON TABLE "public"."team_player" TO "service_role";



GRANT ALL ON TABLE "public"."team_player_stats" TO "anon";
GRANT ALL ON TABLE "public"."team_player_stats" TO "authenticated";
GRANT ALL ON TABLE "public"."team_player_stats" TO "service_role";



GRANT ALL ON SEQUENCE "public"."team_player_stats_team_player_stats_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."team_player_stats_team_player_stats_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."team_player_stats_team_player_stats_id_seq" TO "service_role";



GRANT ALL ON SEQUENCE "public"."team_player_team_player_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."team_player_team_player_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."team_player_team_player_id_seq" TO "service_role";



GRANT ALL ON SEQUENCE "public"."team_player_team_player_id_seq1" TO "anon";
GRANT ALL ON SEQUENCE "public"."team_player_team_player_id_seq1" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."team_player_team_player_id_seq1" TO "service_role";



GRANT ALL ON TABLE "public"."team_stats_comparision" TO "anon";
GRANT ALL ON TABLE "public"."team_stats_comparision" TO "authenticated";
GRANT ALL ON TABLE "public"."team_stats_comparision" TO "service_role";



GRANT ALL ON SEQUENCE "public"."team_team_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."team_team_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."team_team_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."user_achievement" TO "anon";
GRANT ALL ON TABLE "public"."user_achievement" TO "authenticated";
GRANT ALL ON TABLE "public"."user_achievement" TO "service_role";



GRANT ALL ON TABLE "public"."user_card" TO "anon";
GRANT ALL ON TABLE "public"."user_card" TO "authenticated";
GRANT ALL ON TABLE "public"."user_card" TO "service_role";



GRANT ALL ON TABLE "public"."user_event" TO "anon";
GRANT ALL ON TABLE "public"."user_event" TO "authenticated";
GRANT ALL ON TABLE "public"."user_event" TO "service_role";



GRANT ALL ON TABLE "public"."user_event_ratings" TO "anon";
GRANT ALL ON TABLE "public"."user_event_ratings" TO "authenticated";
GRANT ALL ON TABLE "public"."user_event_ratings" TO "service_role";



GRANT ALL ON SEQUENCE "public"."user_event_ratings_user_event_rating_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."user_event_ratings_user_event_rating_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."user_event_ratings_user_event_rating_id_seq" TO "service_role";



GRANT ALL ON SEQUENCE "public"."user_event_user_event_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."user_event_user_event_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."user_event_user_event_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."user_laker" TO "anon";
GRANT ALL ON TABLE "public"."user_laker" TO "authenticated";
GRANT ALL ON TABLE "public"."user_laker" TO "service_role";



GRANT ALL ON TABLE "public"."user_report" TO "anon";
GRANT ALL ON TABLE "public"."user_report" TO "authenticated";
GRANT ALL ON TABLE "public"."user_report" TO "service_role";



GRANT ALL ON SEQUENCE "public"."user_report_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."user_report_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."user_report_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."user_type" TO "anon";
GRANT ALL ON TABLE "public"."user_type" TO "authenticated";
GRANT ALL ON TABLE "public"."user_type" TO "service_role";



GRANT ALL ON SEQUENCE "public"."user_type_user_type_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."user_type_user_type_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."user_type_user_type_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."user_vote" TO "anon";
GRANT ALL ON TABLE "public"."user_vote" TO "authenticated";
GRANT ALL ON TABLE "public"."user_vote" TO "service_role";



GRANT ALL ON SEQUENCE "public"."user_vote_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."user_vote_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."user_vote_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."view_player_stats" TO "anon";
GRANT ALL ON TABLE "public"."view_player_stats" TO "authenticated";
GRANT ALL ON TABLE "public"."view_player_stats" TO "service_role";



GRANT SELECT ON TABLE "simulacion_juego"."game" TO "anon";
GRANT SELECT ON TABLE "simulacion_juego"."game" TO "authenticated";



GRANT SELECT ON SEQUENCE "simulacion_juego"."game_game_id_seq" TO "anon";



GRANT SELECT ON TABLE "simulacion_juego"."team" TO "anon";
GRANT SELECT ON TABLE "simulacion_juego"."team" TO "authenticated";



GRANT SELECT ON TABLE "simulacion_juego"."team_player" TO "anon";
GRANT SELECT ON TABLE "simulacion_juego"."team_player" TO "authenticated";



GRANT SELECT,UPDATE ON TABLE "simulacion_juego"."team_player_stats" TO "anon";
GRANT SELECT,UPDATE ON TABLE "simulacion_juego"."team_player_stats" TO "authenticated";



GRANT SELECT ON SEQUENCE "simulacion_juego"."team_player_stats_team_player_stats_id_seq" TO "anon";



GRANT SELECT ON SEQUENCE "simulacion_juego"."team_player_team_player_id_seq" TO "anon";



GRANT SELECT ON SEQUENCE "simulacion_juego"."team_team_id_seq" TO "anon";



GRANT SELECT ON TABLE "simulacion_juego"."v_fieldgoal" TO "anon";
GRANT SELECT ON TABLE "simulacion_juego"."v_fieldgoal" TO "authenticated";



GRANT SELECT ON TABLE "simulacion_juego"."v_marcador_activo" TO "anon";
GRANT SELECT ON TABLE "simulacion_juego"."v_marcador_activo" TO "authenticated";



GRANT SELECT ON TABLE "simulacion_juego"."v_prox_juego" TO "anon";
GRANT SELECT ON TABLE "simulacion_juego"."v_prox_juego" TO "authenticated";



GRANT SELECT ON TABLE "simulacion_juego"."v_scoreboard" TO "anon";
GRANT SELECT ON TABLE "simulacion_juego"."v_scoreboard" TO "authenticated";



GRANT SELECT ON TABLE "simulacion_juego"."v_team_comparison" TO "anon";
GRANT SELECT ON TABLE "simulacion_juego"."v_team_comparison" TO "authenticated";



GRANT SELECT ON TABLE "simulacion_juego"."view_marcadores" TO "anon";
GRANT SELECT ON TABLE "simulacion_juego"."view_marcadores" TO "authenticated";



GRANT SELECT ON TABLE "simulacion_juego"."view_player_stats" TO "anon";
GRANT SELECT ON TABLE "simulacion_juego"."view_player_stats" TO "authenticated";



GRANT SELECT ON TABLE "simulacion_juego"."view_team_stats_comparision" TO "anon";
GRANT SELECT ON TABLE "simulacion_juego"."view_team_stats_comparision" TO "authenticated";









ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES TO "service_role";






ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS TO "service_role";






ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES TO "service_role";



































