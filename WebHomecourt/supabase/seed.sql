SET session_replication_role = replica;

--
-- PostgreSQL database dump
--

-- \restrict 4BFl1RxMeklosAPxSXwg1n1JgDqrJPQifseYR2RtmgSAxpFHIP48T6AFzinGzo7

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: custom_oauth_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."flow_state" ("id", "user_id", "auth_code", "code_challenge_method", "code_challenge", "provider_type", "provider_access_token", "provider_refresh_token", "created_at", "updated_at", "authentication_method", "auth_code_issued_at", "invite_token", "referrer", "oauth_client_state_id", "linking_target_id", "email_optional") VALUES
	('f9dc205c-0192-428f-bd7e-9f32d33a2e16', NULL, NULL, NULL, NULL, 'google', '', '', '2026-03-13 01:44:17.158906+00', '2026-03-13 01:44:17.158906+00', 'oauth', NULL, NULL, 'http://localhost:5173/', NULL, NULL, false),
	('287a6e36-727c-4ff3-a1a9-86d7905d127a', NULL, NULL, NULL, NULL, 'google', '', '', '2026-03-13 02:03:33.873345+00', '2026-03-13 02:03:33.873345+00', 'oauth', NULL, NULL, 'http://localhost:5173/', NULL, NULL, false),
	('8b17954d-d124-4c82-91e1-c8b7c878b1b0', NULL, NULL, NULL, NULL, 'google', '', '', '2026-03-13 02:51:04.995416+00', '2026-03-13 02:51:04.995416+00', 'oauth', NULL, NULL, 'http://localhost:5173/', NULL, NULL, false),
	('f694ea1e-19fc-4c35-93c8-36d1d97b81dd', NULL, NULL, NULL, NULL, 'google', '', '', '2026-03-13 05:31:43.944307+00', '2026-03-13 05:31:43.944307+00', 'oauth', NULL, NULL, 'http://localhost:5173/', NULL, NULL, false),
	('54fce808-da1f-4fee-86f5-feca72abbba4', NULL, NULL, NULL, NULL, 'google', '', '', '2026-04-09 07:28:56.629473+00', '2026-04-09 07:28:56.629473+00', 'oauth', NULL, NULL, 'http://10.14.255.81:8666', NULL, NULL, false),
	('9cf998a9-3904-4b24-a286-e61665304641', NULL, NULL, NULL, NULL, 'google', '', '', '2026-04-13 18:10:02.925082+00', '2026-04-13 18:10:02.925082+00', 'oauth', NULL, NULL, 'http://localhost:5173/session', NULL, NULL, false),
	('901af9d7-3ad2-41bb-8f16-08c3027a3f6d', NULL, NULL, NULL, NULL, 'google', '', '', '2026-04-14 16:24:18.862028+00', '2026-04-14 16:24:18.862028+00', 'oauth', NULL, NULL, 'http://localhost:5173/', NULL, NULL, false),
	('82f9ff4e-64b1-47b0-a470-6eb7e88161f5', NULL, NULL, NULL, NULL, 'google', '', '', '2026-04-14 16:31:04.5865+00', '2026-04-14 16:31:04.5865+00', 'oauth', NULL, NULL, 'http://localhost:5173/', NULL, NULL, false);


--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."users" ("instance_id", "id", "aud", "role", "email", "encrypted_password", "email_confirmed_at", "invited_at", "confirmation_token", "confirmation_sent_at", "recovery_token", "recovery_sent_at", "email_change_token_new", "email_change", "email_change_sent_at", "last_sign_in_at", "raw_app_meta_data", "raw_user_meta_data", "is_super_admin", "created_at", "updated_at", "phone", "phone_confirmed_at", "phone_change", "phone_change_token", "phone_change_sent_at", "email_change_token_current", "email_change_confirm_status", "banned_until", "reauthentication_token", "reauthentication_sent_at", "is_sso_user", "deleted_at", "is_anonymous") VALUES
	('00000000-0000-0000-0000-000000000000', 'ac3a5447-1b6f-4324-8830-5ddc2d7b2c47', 'authenticated', 'authenticated', 'amps@fakeuser.com', '$2a$10$MbT/Do3pCQVg4PaL9SsnzeNQgCiD4eLm6pXWvw5TFEXwaCNIUrh9e', '2026-03-12 20:08:39.100352+00', NULL, '', NULL, '', NULL, '', '', NULL, NULL, '{"provider": "email", "providers": ["email"]}', '{"email_verified": true}', NULL, '2026-03-12 20:08:39.064639+00', '2026-03-12 20:08:39.111253+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false),
	('00000000-0000-0000-0000-000000000000', '706bc30f-68fd-4dab-9517-6ac7285d4e33', 'authenticated', 'authenticated', 'a01741767@tec.mx', NULL, '2026-03-13 01:41:41.816856+00', NULL, '', NULL, '', NULL, '', '', NULL, '2026-04-17 00:07:20.896224+00', '{"provider": "google", "providers": ["google"]}', '{"iss": "https://accounts.google.com", "sub": "108303032915148608797", "name": "Adolfo Garc├¡a V├ízquez", "email": "a01741767@tec.mx", "picture": "https://lh3.googleusercontent.com/a/ACg8ocJAfzg4UJv0V7igSvShPTGk4qGK2TJOJQfL180R3ihuZS-xJw=s96-c", "full_name": "Adolfo Garc├¡a V├ízquez", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocJAfzg4UJv0V7igSvShPTGk4qGK2TJOJQfL180R3ihuZS-xJw=s96-c", "provider_id": "108303032915148608797", "custom_claims": {"hd": "tec.mx"}, "email_verified": true, "phone_verified": false}', NULL, '2026-03-13 01:41:41.788653+00', '2026-04-17 03:28:41.364898+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false),
	('00000000-0000-0000-0000-000000000000', 'fbaaa5cf-814b-4d65-b4e7-7ec19fcd94ee', 'authenticated', 'authenticated', 'holaa@fakeuser.com', '$2a$10$1rwWcpTGE6i1.oWrxNsWaONeqALFRTiWdxPDrcdFSIEzkQPDBzkNW', '2026-03-12 20:44:34.786945+00', NULL, '', NULL, '', NULL, '', '', NULL, NULL, '{"provider": "email", "providers": ["email"]}', '{"email_verified": true}', NULL, '2026-03-12 20:44:34.757463+00', '2026-03-12 20:44:34.79929+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false),
	('00000000-0000-0000-0000-000000000000', 'c7855248-e94f-4651-bad5-c48592e5c269', 'authenticated', 'authenticated', 'cosasparatecnologiaadolfo@gmail.com', NULL, '2026-03-13 01:44:54.868444+00', NULL, '', NULL, '', NULL, '', '', NULL, '2026-04-14 17:07:01.796034+00', '{"provider": "google", "providers": ["google"]}', '{"iss": "https://accounts.google.com", "sub": "100551136547310048093", "name": "Eustaquio Villa reneiba", "email": "cosasparatecnologiaadolfo@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocL6ucfNrxfcUEufpOBG2W-sXUQVnzieXw3vo-zQWQMH_XYbDQ=s96-c", "full_name": "Eustaquio Villa reneiba", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocL6ucfNrxfcUEufpOBG2W-sXUQVnzieXw3vo-zQWQMH_XYbDQ=s96-c", "provider_id": "100551136547310048093", "email_verified": true, "phone_verified": false}', NULL, '2026-03-13 01:44:54.810583+00', '2026-04-14 17:07:01.810539+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false),
	('00000000-0000-0000-0000-000000000000', '9eec2cc7-0552-4f95-945d-866aa3de4faa', 'authenticated', 'authenticated', 'monica.guzman.contact@gmail.com', NULL, '2026-03-13 05:40:58.64774+00', NULL, '', NULL, '', NULL, '', '', NULL, '2026-04-19 16:37:29.706017+00', '{"provider": "google", "providers": ["google"]}', '{"iss": "https://accounts.google.com", "sub": "103206142878725794508", "name": "Monica Guzman", "email": "monica.guzman.contact@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocIAERIayE_WkILe2i4MNYPq-ozhxYPY5_CZ-Pwqr57IDEhkYw=s96-c", "full_name": "Monica Guzman", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocIAERIayE_WkILe2i4MNYPq-ozhxYPY5_CZ-Pwqr57IDEhkYw=s96-c", "provider_id": "103206142878725794508", "email_verified": true, "phone_verified": false}', NULL, '2026-03-13 05:40:58.617774+00', '2026-04-19 16:37:29.741474+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false),
	('00000000-0000-0000-0000-000000000000', '16870c9b-33e7-4aed-8f70-5936e823deb2', 'authenticated', 'authenticated', 'lebronjam@fakeuser.com', '$2a$10$I0vWI7JMcmt/2eVKppzXHO4C/mCobXdXgudlHYEdlSvE2rBpgXrSi', '2026-04-09 09:10:41.182094+00', NULL, '', NULL, '', NULL, '', '', NULL, NULL, '{"provider": "email", "providers": ["email"]}', '{"email_verified": true}', NULL, '2026-04-09 09:10:41.147325+00', '2026-04-09 09:10:41.185818+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false),
	('00000000-0000-0000-0000-000000000000', 'a8c3b01e-febc-470c-aaca-37a679fee2db', 'authenticated', 'authenticated', 'lakerfan@lakerscourt.com', '$2a$10$WkFiZ0lXtcR1kRxmm7X1jOhxDy.6mZchOlr.Kp/JFVmfOsz3asI3C', '2026-04-12 00:32:48.277572+00', NULL, '', NULL, '', NULL, '', '', NULL, '2026-04-17 22:41:17.248185+00', '{"provider": "email", "providers": ["email"]}', '{"email_verified": true}', NULL, '2026-04-12 00:32:48.227607+00', '2026-04-19 22:46:05.199172+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false),
	('00000000-0000-0000-0000-000000000000', 'e4c6c3f4-46ab-4b25-b8e5-52419db25d3f', 'authenticated', 'authenticated', 'cielomaria22godoy@gmail.com', NULL, '2026-03-13 19:21:22.419413+00', NULL, '', NULL, '', NULL, '', '', NULL, '2026-04-14 17:07:36.692611+00', '{"provider": "google", "providers": ["google"]}', '{"iss": "https://accounts.google.com", "sub": "101458221478304499890", "name": "Cielo Vega", "email": "cielomaria22godoy@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocLSlemuiy6qAQLaQl_IN_dyFqSQ56WIMXZpBJ1rwsEcN-QBqw=s96-c", "full_name": "Cielo Vega", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocLSlemuiy6qAQLaQl_IN_dyFqSQ56WIMXZpBJ1rwsEcN-QBqw=s96-c", "provider_id": "101458221478304499890", "email_verified": true, "phone_verified": false}', NULL, '2026-03-13 19:21:22.383652+00', '2026-04-14 18:11:31.009049+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false),
	('00000000-0000-0000-0000-000000000000', 'd6aa5592-1373-4398-90ee-e5e45cd4a287', 'authenticated', 'authenticated', 'a00838824@tec.mx', NULL, '2026-03-13 05:14:15.285148+00', NULL, '', NULL, '', NULL, '', '', NULL, '2026-04-14 01:28:43.617226+00', '{"provider": "google", "providers": ["google"]}', '{"iss": "https://accounts.google.com", "sub": "102066219002994066337", "name": "M├│nica Catalina Guzm├ín Garc├¡a", "email": "a00838824@tec.mx", "picture": "https://lh3.googleusercontent.com/a/ACg8ocI9PfzKDm92M-fUtW3F4KVyTX3U0HRgI-Nux-2mZ7TTJUgXsA=s96-c", "full_name": "M├│nica Catalina Guzm├ín Garc├¡a", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocI9PfzKDm92M-fUtW3F4KVyTX3U0HRgI-Nux-2mZ7TTJUgXsA=s96-c", "provider_id": "102066219002994066337", "custom_claims": {"hd": "tec.mx"}, "email_verified": true, "phone_verified": false}', NULL, '2026-03-13 05:14:15.257995+00', '2026-04-14 15:25:35.182217+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false),
	('00000000-0000-0000-0000-000000000000', '3f3e4d60-f9e9-4c0b-8856-dbff1a66e8b2', 'authenticated', 'authenticated', 'hooper@lakerscourt.com', '$2a$10$scG3RdVbCHnSHjWQlejacuvfJZcUAo8HHYA4S7X6Z30SE44Au620K', '2026-04-14 01:56:43.146299+00', NULL, '', NULL, '', NULL, '', '', NULL, '2026-04-14 13:34:32.734801+00', '{"provider": "email", "providers": ["email"]}', '{"email_verified": true}', NULL, '2026-04-14 01:56:43.091759+00', '2026-04-14 13:34:32.790821+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false),
	('00000000-0000-0000-0000-000000000000', 'e9c9fa0e-6179-4023-80d3-03d4475ccdd6', 'authenticated', 'authenticated', 'player2@lakerscourt.com', '$2a$10$Ok6/Pbqx80SsA0JHu7kncOHaKLtLppmkxpGai8Tz9BSAoQ/.X/b.K', '2026-04-14 01:56:26.512238+00', NULL, '', NULL, '', NULL, '', '', NULL, '2026-04-14 13:35:44.346459+00', '{"provider": "email", "providers": ["email"]}', '{"email_verified": true}', NULL, '2026-04-14 01:56:26.478409+00', '2026-04-14 13:35:44.384122+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false),
	('00000000-0000-0000-0000-000000000000', '9b2b2585-8e2c-4209-b316-fbb24748eba6', 'authenticated', 'authenticated', 'sixthman@lakerscourt.com', '$2a$10$Ap67..jyh4q2MUumPkNyAeJukyoqwJ3lVGAGRy6yNH7VyMGOesLLm', '2026-04-14 01:58:21.622648+00', NULL, '', NULL, '', NULL, '', '', NULL, '2026-04-16 04:20:55.157041+00', '{"provider": "email", "providers": ["email"]}', '{"email_verified": true}', NULL, '2026-04-14 01:58:21.615162+00', '2026-04-16 04:20:55.681071+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false),
	('00000000-0000-0000-0000-000000000000', 'b6ceb5fa-017d-4582-b23a-128ab1bda35a', 'authenticated', 'authenticated', 'baller@lakerscourt.com', '$2a$10$88.Zuz6SzD6170P9S9dseecpTkf.loNGBtTwlSIZhLlpaGaRKSXFS', '2026-04-14 01:57:02.380382+00', NULL, '', NULL, '', NULL, '', '', NULL, '2026-04-14 13:37:55.629137+00', '{"provider": "email", "providers": ["email"]}', '{"email_verified": true}', NULL, '2026-04-14 01:57:02.34392+00', '2026-04-14 13:37:55.708999+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false),
	('00000000-0000-0000-0000-000000000000', '5737ff41-0d3c-4dfb-913a-4d93732447b2', 'authenticated', 'authenticated', 'adolfogv2005@gmail.com', NULL, '2026-04-13 05:01:50.785542+00', NULL, '', NULL, '', NULL, '', '', NULL, '2026-04-19 20:20:49.133288+00', '{"provider": "google", "providers": ["google"]}', '{"iss": "https://accounts.google.com", "sub": "115129353055355716189", "name": "Adolfo Garc├¡a", "email": "adolfogv2005@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocKRK8qxJwE2oak2vyysjG_tRMuK5OMv7w6ES0ymFqWD_h61Bg=s96-c", "full_name": "Adolfo Garc├¡a", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocKRK8qxJwE2oak2vyysjG_tRMuK5OMv7w6ES0ymFqWD_h61Bg=s96-c", "provider_id": "115129353055355716189", "email_verified": true, "phone_verified": false}', NULL, '2026-04-13 05:01:50.768388+00', '2026-04-19 20:20:49.187542+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false),
	('00000000-0000-0000-0000-000000000000', '372280a1-c9b3-4a10-8204-b24cfe617994', 'authenticated', 'authenticated', 'fastbreak@lakerscourt.com', '$2a$10$oEftQN9XXrDsFZC3P10QDOjNAY/9YKt0JMcBC8egVG4bISkMqMSZO', '2026-04-14 01:57:26.415842+00', NULL, '', NULL, '', NULL, '', '', NULL, '2026-04-14 13:39:10.494476+00', '{"provider": "email", "providers": ["email"]}', '{"email_verified": true}', NULL, '2026-04-14 01:57:26.398081+00', '2026-04-14 13:39:10.531665+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false),
	('00000000-0000-0000-0000-000000000000', '5d5af46e-4edb-4dff-b4ed-cb94c7be5d86', 'authenticated', 'authenticated', 'clutch@lakerscourt.com', '$2a$10$U8S56LvvnH5iSCWmQTVLG.axJL3qf2PWuNjm4gRpoaPejXkY3PJIC', '2026-04-14 01:57:41.953148+00', NULL, '', NULL, '', NULL, '', '', NULL, '2026-04-14 13:41:30.183698+00', '{"provider": "email", "providers": ["email"]}', '{"email_verified": true}', NULL, '2026-04-14 01:57:41.946022+00', '2026-04-14 13:41:30.231156+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false),
	('00000000-0000-0000-0000-000000000000', '793219d5-fe72-4e77-b733-a94beb340b69', 'authenticated', 'authenticated', 'triplethreat@lakerscourt.com', '$2a$10$tfla2p/EHAE7rI2Ih6nmfO8MAHy/mRj4KM5wRiZtALTUHqfxEQK/a', '2026-04-14 01:58:01.353456+00', NULL, '', NULL, '', NULL, '', '', NULL, '2026-04-14 13:42:14.76619+00', '{"provider": "email", "providers": ["email"]}', '{"email_verified": true}', NULL, '2026-04-14 01:58:01.346342+00', '2026-04-14 13:42:14.806373+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false),
	('00000000-0000-0000-0000-000000000000', 'bdd6cbce-77d3-46a2-baee-09221eed2a40', 'authenticated', 'authenticated', 'regigi@lakerscourt.com', '$2a$10$lGS5cRm/3O1VIdsWeC615.QdzctjG6k.QH/eKmKkU9EbYPaiwkA7O', '2026-04-14 13:12:58.584144+00', NULL, '', NULL, '', NULL, '', '', NULL, '2026-04-14 13:45:45.505347+00', '{"provider": "email", "providers": ["email"]}', '{"email_verified": true}', NULL, '2026-04-14 13:12:58.55499+00', '2026-04-14 13:45:45.548679+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false),
	('00000000-0000-0000-0000-000000000000', '165c8626-2c35-4ebe-aac1-bc0c797a1376', 'authenticated', 'authenticated', 'player1@lakerscourt.com', '$2a$10$H3napYJGjojQe2C54wmkN.BTBjT9EuEeX56XgC8Dw4sIWrtNU6SA6', '2026-04-14 01:55:55.624896+00', NULL, '', NULL, '', NULL, '', '', NULL, '2026-04-14 17:48:40.696785+00', '{"provider": "email", "providers": ["email"]}', '{"email_verified": true}', NULL, '2026-04-14 01:55:55.173502+00', '2026-04-18 00:32:03.347833+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false),
	('00000000-0000-0000-0000-000000000000', 'af5ed49a-4fd9-415d-9429-013e51f65a08', 'authenticated', 'authenticated', 'gali@lakerscourt.com', '$2a$10$NaN.Zy6e0s6Ip.VojDCHAu5wFyjXwZ2t5I3mWskPzbNlBxVr4sYSS', '2026-04-14 13:13:25.215107+00', NULL, '', NULL, '', NULL, '', '', NULL, '2026-04-14 13:47:54.352367+00', '{"provider": "email", "providers": ["email"]}', '{"email_verified": true}', NULL, '2026-04-14 13:13:25.209722+00', '2026-04-14 13:47:54.410272+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false),
	('00000000-0000-0000-0000-000000000000', 'dd1eef03-ac09-4708-b010-5c78adb953d0', 'authenticated', 'authenticated', 'admin@lakerscourt.com', '$2a$10$eRjIwtOD/p2OAxE1kOLhhevStdYDOj.g1Di/oVDpmoQrOewzxyvs.', '2026-04-14 02:00:13.170963+00', NULL, '', NULL, '', NULL, '', '', NULL, '2026-04-19 16:40:42.639464+00', '{"provider": "email", "providers": ["email"]}', '{"email_verified": true}', NULL, '2026-04-14 02:00:13.155345+00', '2026-04-19 16:40:42.692717+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false),
	('00000000-0000-0000-0000-000000000000', '92c0d0d0-27d6-4c4f-830a-1e5cc389feb4', 'authenticated', 'authenticated', 'valcarazy@gmail.com', NULL, '2026-04-16 04:19:46.501209+00', NULL, '', NULL, '', NULL, '', '', NULL, '2026-04-16 04:19:46.507751+00', '{"provider": "google", "providers": ["google"]}', '{"iss": "https://accounts.google.com", "sub": "118104388146702196975", "name": "Vladimiro Alcaraz", "email": "valcarazy@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocKG-rFWN8AU7v-UNcLDVCGeBdC4CMk2tJV72F5FyPqMU9-mgQ=s96-c", "full_name": "Vladimiro Alcaraz", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocKG-rFWN8AU7v-UNcLDVCGeBdC4CMk2tJV72F5FyPqMU9-mgQ=s96-c", "provider_id": "118104388146702196975", "email_verified": true, "phone_verified": false}', NULL, '2026-04-16 04:19:46.465328+00', '2026-04-16 04:19:46.547094+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false),
	('00000000-0000-0000-0000-000000000000', '334e2471-91cd-43b1-af3b-85be66604be4', 'authenticated', 'authenticated', 'a00840840@tec.mx', NULL, '2026-04-14 16:53:22.042062+00', NULL, '', NULL, '', NULL, '', '', NULL, '2026-04-14 20:14:15.981946+00', '{"provider": "google", "providers": ["google"]}', '{"iss": "https://accounts.google.com", "sub": "117147384617426665889", "name": "Regina Romero Alvarado", "email": "a00840840@tec.mx", "picture": "https://lh3.googleusercontent.com/a/ACg8ocJXkamSbBTQeEivAOXs8cIkW7myOChBM9sKiES_wgyGd1wPDA=s96-c", "full_name": "Regina Romero Alvarado", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocJXkamSbBTQeEivAOXs8cIkW7myOChBM9sKiES_wgyGd1wPDA=s96-c", "provider_id": "117147384617426665889", "custom_claims": {"hd": "tec.mx"}, "email_verified": true, "phone_verified": false}', NULL, '2026-04-14 16:53:21.971219+00', '2026-04-14 20:14:16.030243+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false);


--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."identities" ("provider_id", "user_id", "identity_data", "provider", "last_sign_in_at", "created_at", "updated_at", "id") VALUES
	('ac3a5447-1b6f-4324-8830-5ddc2d7b2c47', 'ac3a5447-1b6f-4324-8830-5ddc2d7b2c47', '{"sub": "ac3a5447-1b6f-4324-8830-5ddc2d7b2c47", "email": "amps@fakeuser.com", "email_verified": false, "phone_verified": false}', 'email', '2026-03-12 20:08:39.079836+00', '2026-03-12 20:08:39.080518+00', '2026-03-12 20:08:39.080518+00', '33c53e24-488b-4c58-811e-30de91a8e2af'),
	('fbaaa5cf-814b-4d65-b4e7-7ec19fcd94ee', 'fbaaa5cf-814b-4d65-b4e7-7ec19fcd94ee', '{"sub": "fbaaa5cf-814b-4d65-b4e7-7ec19fcd94ee", "email": "holaa@fakeuser.com", "email_verified": false, "phone_verified": false}', 'email', '2026-03-12 20:44:34.775189+00', '2026-03-12 20:44:34.775797+00', '2026-03-12 20:44:34.775797+00', 'f449106d-9468-4f45-8bc1-1d74e58fd576'),
	('165c8626-2c35-4ebe-aac1-bc0c797a1376', '165c8626-2c35-4ebe-aac1-bc0c797a1376', '{"sub": "165c8626-2c35-4ebe-aac1-bc0c797a1376", "email": "player1@lakerscourt.com", "email_verified": false, "phone_verified": false}', 'email', '2026-04-14 01:55:55.405291+00', '2026-04-14 01:55:55.408968+00', '2026-04-14 01:55:55.408968+00', 'e305a9a0-e878-4180-be35-cfee1cfab6b6'),
	('115129353055355716189', '5737ff41-0d3c-4dfb-913a-4d93732447b2', '{"iss": "https://accounts.google.com", "sub": "115129353055355716189", "name": "Adolfo Garc├¡a", "email": "adolfogv2005@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocKRK8qxJwE2oak2vyysjG_tRMuK5OMv7w6ES0ymFqWD_h61Bg=s96-c", "full_name": "Adolfo Garc├¡a", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocKRK8qxJwE2oak2vyysjG_tRMuK5OMv7w6ES0ymFqWD_h61Bg=s96-c", "provider_id": "115129353055355716189", "email_verified": true, "phone_verified": false}', 'google', '2026-04-13 05:01:50.779568+00', '2026-04-13 05:01:50.779616+00', '2026-04-19 20:20:49.113583+00', '6976ae50-6598-423b-835f-910a775c18d9'),
	('16870c9b-33e7-4aed-8f70-5936e823deb2', '16870c9b-33e7-4aed-8f70-5936e823deb2', '{"sub": "16870c9b-33e7-4aed-8f70-5936e823deb2", "email": "lebronjam@fakeuser.com", "email_verified": false, "phone_verified": false}', 'email', '2026-04-09 09:10:41.16368+00', '2026-04-09 09:10:41.163735+00', '2026-04-09 09:10:41.163735+00', '6269d513-b0b1-457e-9b8e-7e628e5ed5be'),
	('a8c3b01e-febc-470c-aaca-37a679fee2db', 'a8c3b01e-febc-470c-aaca-37a679fee2db', '{"sub": "a8c3b01e-febc-470c-aaca-37a679fee2db", "email": "lakerfan@lakerscourt.com", "email_verified": false, "phone_verified": false}', 'email', '2026-04-12 00:32:48.257732+00', '2026-04-12 00:32:48.258291+00', '2026-04-12 00:32:48.258291+00', '03578a63-31d4-40ec-b22d-fa0cd63aaf0f'),
	('101458221478304499890', 'e4c6c3f4-46ab-4b25-b8e5-52419db25d3f', '{"iss": "https://accounts.google.com", "sub": "101458221478304499890", "name": "Cielo Vega", "email": "cielomaria22godoy@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocLSlemuiy6qAQLaQl_IN_dyFqSQ56WIMXZpBJ1rwsEcN-QBqw=s96-c", "full_name": "Cielo Vega", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocLSlemuiy6qAQLaQl_IN_dyFqSQ56WIMXZpBJ1rwsEcN-QBqw=s96-c", "provider_id": "101458221478304499890", "email_verified": true, "phone_verified": false}', 'google', '2026-03-13 19:21:22.405599+00', '2026-03-13 19:21:22.405659+00', '2026-04-14 17:07:36.68039+00', '959bf196-da65-4d62-a6f1-51639cd1a689'),
	('793219d5-fe72-4e77-b733-a94beb340b69', '793219d5-fe72-4e77-b733-a94beb340b69', '{"sub": "793219d5-fe72-4e77-b733-a94beb340b69", "email": "triplethreat@lakerscourt.com", "email_verified": false, "phone_verified": false}', 'email', '2026-04-14 01:58:01.351365+00', '2026-04-14 01:58:01.351411+00', '2026-04-14 01:58:01.351411+00', '5bc2ba04-f4a3-458f-89f8-47a695ed911a'),
	('e9c9fa0e-6179-4023-80d3-03d4475ccdd6', 'e9c9fa0e-6179-4023-80d3-03d4475ccdd6', '{"sub": "e9c9fa0e-6179-4023-80d3-03d4475ccdd6", "email": "player2@lakerscourt.com", "email_verified": false, "phone_verified": false}', 'email', '2026-04-14 01:56:26.499713+00', '2026-04-14 01:56:26.499771+00', '2026-04-14 01:56:26.499771+00', 'c8b3a31e-1ae6-4fa4-bd6d-b4783d902422'),
	('103206142878725794508', '9eec2cc7-0552-4f95-945d-866aa3de4faa', '{"iss": "https://accounts.google.com", "sub": "103206142878725794508", "name": "Monica Guzman", "email": "monica.guzman.contact@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocIAERIayE_WkILe2i4MNYPq-ozhxYPY5_CZ-Pwqr57IDEhkYw=s96-c", "full_name": "Monica Guzman", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocIAERIayE_WkILe2i4MNYPq-ozhxYPY5_CZ-Pwqr57IDEhkYw=s96-c", "provider_id": "103206142878725794508", "email_verified": true, "phone_verified": false}', 'google', '2026-03-13 05:40:58.637143+00', '2026-03-13 05:40:58.637201+00', '2026-04-19 16:37:29.688115+00', '56b8bb97-dd10-4794-8a4a-db1c57f03594'),
	('3f3e4d60-f9e9-4c0b-8856-dbff1a66e8b2', '3f3e4d60-f9e9-4c0b-8856-dbff1a66e8b2', '{"sub": "3f3e4d60-f9e9-4c0b-8856-dbff1a66e8b2", "email": "hooper@lakerscourt.com", "email_verified": false, "phone_verified": false}', 'email', '2026-04-14 01:56:43.125555+00', '2026-04-14 01:56:43.126186+00', '2026-04-14 01:56:43.126186+00', 'f115c7f5-f090-4a13-b209-67cec5468522'),
	('108303032915148608797', '706bc30f-68fd-4dab-9517-6ac7285d4e33', '{"iss": "https://accounts.google.com", "sub": "108303032915148608797", "name": "Adolfo Garc├¡a V├ízquez", "email": "a01741767@tec.mx", "picture": "https://lh3.googleusercontent.com/a/ACg8ocJAfzg4UJv0V7igSvShPTGk4qGK2TJOJQfL180R3ihuZS-xJw=s96-c", "full_name": "Adolfo Garc├¡a V├ízquez", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocJAfzg4UJv0V7igSvShPTGk4qGK2TJOJQfL180R3ihuZS-xJw=s96-c", "provider_id": "108303032915148608797", "custom_claims": {"hd": "tec.mx"}, "email_verified": true, "phone_verified": false}', 'google', '2026-03-13 01:41:41.807904+00', '2026-03-13 01:41:41.807956+00', '2026-04-17 00:07:20.883428+00', '442c9d78-f705-41c0-b9ad-f07f8632b782'),
	('102066219002994066337', 'd6aa5592-1373-4398-90ee-e5e45cd4a287', '{"iss": "https://accounts.google.com", "sub": "102066219002994066337", "name": "M├│nica Catalina Guzm├ín Garc├¡a", "email": "a00838824@tec.mx", "picture": "https://lh3.googleusercontent.com/a/ACg8ocI9PfzKDm92M-fUtW3F4KVyTX3U0HRgI-Nux-2mZ7TTJUgXsA=s96-c", "full_name": "M├│nica Catalina Guzm├ín Garc├¡a", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocI9PfzKDm92M-fUtW3F4KVyTX3U0HRgI-Nux-2mZ7TTJUgXsA=s96-c", "provider_id": "102066219002994066337", "custom_claims": {"hd": "tec.mx"}, "email_verified": true, "phone_verified": false}', 'google', '2026-03-13 05:14:15.271651+00', '2026-03-13 05:14:15.2717+00', '2026-04-14 01:28:43.569186+00', '4ea539c9-e7db-4a0d-84af-5e79fda7f606'),
	('b6ceb5fa-017d-4582-b23a-128ab1bda35a', 'b6ceb5fa-017d-4582-b23a-128ab1bda35a', '{"sub": "b6ceb5fa-017d-4582-b23a-128ab1bda35a", "email": "baller@lakerscourt.com", "email_verified": false, "phone_verified": false}', 'email', '2026-04-14 01:57:02.365585+00', '2026-04-14 01:57:02.366172+00', '2026-04-14 01:57:02.366172+00', '26149102-d187-46f7-8433-10a754b1be5c'),
	('372280a1-c9b3-4a10-8204-b24cfe617994', '372280a1-c9b3-4a10-8204-b24cfe617994', '{"sub": "372280a1-c9b3-4a10-8204-b24cfe617994", "email": "fastbreak@lakerscourt.com", "email_verified": false, "phone_verified": false}', 'email', '2026-04-14 01:57:26.407811+00', '2026-04-14 01:57:26.407863+00', '2026-04-14 01:57:26.407863+00', '8388d911-982f-41bd-86eb-8e3e7f96a060'),
	('5d5af46e-4edb-4dff-b4ed-cb94c7be5d86', '5d5af46e-4edb-4dff-b4ed-cb94c7be5d86', '{"sub": "5d5af46e-4edb-4dff-b4ed-cb94c7be5d86", "email": "clutch@lakerscourt.com", "email_verified": false, "phone_verified": false}', 'email', '2026-04-14 01:57:41.948849+00', '2026-04-14 01:57:41.948923+00', '2026-04-14 01:57:41.948923+00', '6048b6ed-f28c-43bb-b833-1669c8dea46d'),
	('9b2b2585-8e2c-4209-b316-fbb24748eba6', '9b2b2585-8e2c-4209-b316-fbb24748eba6', '{"sub": "9b2b2585-8e2c-4209-b316-fbb24748eba6", "email": "sixthman@lakerscourt.com", "email_verified": false, "phone_verified": false}', 'email', '2026-04-14 01:58:21.620066+00', '2026-04-14 01:58:21.62012+00', '2026-04-14 01:58:21.62012+00', '163d5d50-0f18-416f-bc0f-84739adb027a'),
	('dd1eef03-ac09-4708-b010-5c78adb953d0', 'dd1eef03-ac09-4708-b010-5c78adb953d0', '{"sub": "dd1eef03-ac09-4708-b010-5c78adb953d0", "email": "admin@lakerscourt.com", "email_verified": false, "phone_verified": false}', 'email', '2026-04-14 02:00:13.16446+00', '2026-04-14 02:00:13.165107+00', '2026-04-14 02:00:13.165107+00', '5d073a37-6d52-42c1-8a01-71d9add9582d'),
	('bdd6cbce-77d3-46a2-baee-09221eed2a40', 'bdd6cbce-77d3-46a2-baee-09221eed2a40', '{"sub": "bdd6cbce-77d3-46a2-baee-09221eed2a40", "email": "regigi@lakerscourt.com", "email_verified": false, "phone_verified": false}', 'email', '2026-04-14 13:12:58.565461+00', '2026-04-14 13:12:58.56603+00', '2026-04-14 13:12:58.56603+00', '1e9abfb2-6b4f-424d-ac6f-a22c27fb0bd4'),
	('af5ed49a-4fd9-415d-9429-013e51f65a08', 'af5ed49a-4fd9-415d-9429-013e51f65a08', '{"sub": "af5ed49a-4fd9-415d-9429-013e51f65a08", "email": "gali@lakerscourt.com", "email_verified": false, "phone_verified": false}', 'email', '2026-04-14 13:13:25.213661+00', '2026-04-14 13:13:25.213709+00', '2026-04-14 13:13:25.213709+00', '77aabbfd-7885-4bfb-8861-1bc9709eb564'),
	('100551136547310048093', 'c7855248-e94f-4651-bad5-c48592e5c269', '{"iss": "https://accounts.google.com", "sub": "100551136547310048093", "name": "Eustaquio Villa reneiba", "email": "cosasparatecnologiaadolfo@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocL6ucfNrxfcUEufpOBG2W-sXUQVnzieXw3vo-zQWQMH_XYbDQ=s96-c", "full_name": "Eustaquio Villa reneiba", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocL6ucfNrxfcUEufpOBG2W-sXUQVnzieXw3vo-zQWQMH_XYbDQ=s96-c", "provider_id": "100551136547310048093", "email_verified": true, "phone_verified": false}', 'google', '2026-03-13 01:44:54.852364+00', '2026-03-13 01:44:54.852417+00', '2026-04-14 17:07:01.784545+00', 'b1ff6e82-1160-4e5b-bafc-da9a2ee900de'),
	('117147384617426665889', '334e2471-91cd-43b1-af3b-85be66604be4', '{"iss": "https://accounts.google.com", "sub": "117147384617426665889", "name": "Regina Romero Alvarado", "email": "a00840840@tec.mx", "picture": "https://lh3.googleusercontent.com/a/ACg8ocJXkamSbBTQeEivAOXs8cIkW7myOChBM9sKiES_wgyGd1wPDA=s96-c", "full_name": "Regina Romero Alvarado", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocJXkamSbBTQeEivAOXs8cIkW7myOChBM9sKiES_wgyGd1wPDA=s96-c", "provider_id": "117147384617426665889", "custom_claims": {"hd": "tec.mx"}, "email_verified": true, "phone_verified": false}', 'google', '2026-04-14 16:53:22.01518+00', '2026-04-14 16:53:22.017413+00', '2026-04-14 20:14:15.962647+00', '3389303e-d07f-40fa-88ed-fb3b6a704622'),
	('118104388146702196975', '92c0d0d0-27d6-4c4f-830a-1e5cc389feb4', '{"iss": "https://accounts.google.com", "sub": "118104388146702196975", "name": "Vladimiro Alcaraz", "email": "valcarazy@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocKG-rFWN8AU7v-UNcLDVCGeBdC4CMk2tJV72F5FyPqMU9-mgQ=s96-c", "full_name": "Vladimiro Alcaraz", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocKG-rFWN8AU7v-UNcLDVCGeBdC4CMk2tJV72F5FyPqMU9-mgQ=s96-c", "provider_id": "118104388146702196975", "email_verified": true, "phone_verified": false}', 'google', '2026-04-16 04:19:46.489652+00', '2026-04-16 04:19:46.489711+00', '2026-04-16 04:19:46.489711+00', 'ce305f20-3be6-4e76-a8c1-9f336eebe0ce');


--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: oauth_clients; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."sessions" ("id", "user_id", "created_at", "updated_at", "factor_id", "aal", "not_after", "refreshed_at", "user_agent", "ip", "tag", "oauth_client_id", "refresh_token_hmac_key", "refresh_token_counter", "scopes") VALUES
	('eaab9107-fd6f-4893-a459-74a79de4271a', '92c0d0d0-27d6-4c4f-830a-1e5cc389feb4', '2026-04-16 04:19:46.507856+00', '2026-04-16 04:19:46.507856+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Mobile Safari/537.36', '187.158.18.66', NULL, NULL, NULL, NULL, NULL),
	('d579d234-4ec5-4b79-83aa-16734ad9688a', '706bc30f-68fd-4dab-9517-6ac7285d4e33', '2026-04-17 00:07:20.896322+00', '2026-04-17 03:28:41.372687+00', NULL, 'aal1', NULL, '2026-04-17 03:28:41.372588', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '189.175.47.214', NULL, NULL, NULL, NULL, NULL),
	('500ddf7b-6c5d-4a19-9792-73c7277df62b', '5737ff41-0d3c-4dfb-913a-4d93732447b2', '2026-04-19 20:20:49.133394+00', '2026-04-19 20:20:49.133394+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '189.175.47.214', NULL, NULL, NULL, NULL, NULL),
	('478dbce0-5069-4814-a29a-81832221033f', 'd6aa5592-1373-4398-90ee-e5e45cd4a287', '2026-03-13 05:14:15.29621+00', '2026-04-12 15:51:51.356856+00', NULL, 'aal1', NULL, '2026-04-12 15:51:51.356216', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '189.159.216.188', NULL, NULL, NULL, NULL, NULL),
	('71cd5568-9b2f-41b4-8d9d-6dff5a967604', 'a8c3b01e-febc-470c-aaca-37a679fee2db', '2026-04-17 22:41:17.248286+00', '2026-04-19 22:46:05.207492+00', NULL, 'aal1', NULL, '2026-04-19 22:46:05.206587', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '187.161.117.240', NULL, NULL, NULL, NULL, NULL),
	('728b80e4-a4ab-428c-8f50-f30f4f20c28d', '165c8626-2c35-4ebe-aac1-bc0c797a1376', '2026-04-14 17:48:40.696905+00', '2026-04-18 00:32:03.355003+00', NULL, 'aal1', NULL, '2026-04-18 00:32:03.354904', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '131.178.102.136', NULL, NULL, NULL, NULL, NULL),
	('30a9dc0f-1cdf-41c4-a5ba-83b0b951cc77', 'd6aa5592-1373-4398-90ee-e5e45cd4a287', '2026-04-13 03:36:27.606038+00', '2026-04-13 03:36:27.606038+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '189.159.192.163', NULL, NULL, NULL, NULL, NULL),
	('86eb918f-7604-417b-86d6-c8a74d09bbea', 'd6aa5592-1373-4398-90ee-e5e45cd4a287', '2026-04-13 03:37:57.810968+00', '2026-04-13 03:37:57.810968+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '189.159.192.163', NULL, NULL, NULL, NULL, NULL),
	('1c1bba44-d08a-4def-b9a3-5a0ed7f40210', 'e4c6c3f4-46ab-4b25-b8e5-52419db25d3f', '2026-04-14 17:00:20.501801+00', '2026-04-14 17:00:20.501801+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '131.178.102.180', NULL, NULL, NULL, NULL, NULL),
	('08462999-1c48-4456-a7b9-d251ff1e28cc', 'd6aa5592-1373-4398-90ee-e5e45cd4a287', '2026-04-13 03:22:33.906672+00', '2026-04-13 03:22:33.906672+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '189.159.192.163', NULL, NULL, NULL, NULL, NULL),
	('28d96eb4-9631-4b2f-9c64-3c78b4260f06', 'd6aa5592-1373-4398-90ee-e5e45cd4a287', '2026-04-13 03:34:19.36187+00', '2026-04-13 03:34:19.36187+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '189.159.192.163', NULL, NULL, NULL, NULL, NULL),
	('61347888-b2f5-4c6e-8a08-d33b5ff46a9e', 'd6aa5592-1373-4398-90ee-e5e45cd4a287', '2026-04-13 03:39:48.025655+00', '2026-04-13 03:39:48.025655+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '189.159.192.163', NULL, NULL, NULL, NULL, NULL),
	('8ded0605-382f-462f-8f9c-66c2e1535c37', 'd6aa5592-1373-4398-90ee-e5e45cd4a287', '2026-04-13 03:40:58.171058+00', '2026-04-13 03:40:58.171058+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '189.159.192.163', NULL, NULL, NULL, NULL, NULL),
	('d737fa8a-e3da-4594-b750-dd87bafff41c', 'd6aa5592-1373-4398-90ee-e5e45cd4a287', '2026-04-13 03:42:01.160366+00', '2026-04-13 03:42:01.160366+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '189.159.192.163', NULL, NULL, NULL, NULL, NULL),
	('2969934a-3913-440a-ba8e-113ec5159500', '165c8626-2c35-4ebe-aac1-bc0c797a1376', '2026-04-14 17:43:47.727239+00', '2026-04-14 17:43:47.727239+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '131.178.102.156', NULL, NULL, NULL, NULL, NULL),
	('48c2cc48-ffd0-4946-9dba-0f78096f98a7', 'e4c6c3f4-46ab-4b25-b8e5-52419db25d3f', '2026-03-13 19:21:22.429946+00', '2026-04-13 18:19:47.577568+00', NULL, 'aal1', NULL, '2026-04-13 18:19:47.57745', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '131.178.102.180', NULL, NULL, NULL, NULL, NULL),
	('4573ae32-1c82-43ef-91c2-f75db4d9ff05', '165c8626-2c35-4ebe-aac1-bc0c797a1376', '2026-04-14 17:48:25.700135+00', '2026-04-14 17:48:25.700135+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '131.178.102.156', NULL, NULL, NULL, NULL, NULL),
	('74591e20-73f6-4daf-b4ea-ce8ea88ae2bb', '165c8626-2c35-4ebe-aac1-bc0c797a1376', '2026-04-14 17:48:26.190176+00', '2026-04-14 17:48:26.190176+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '131.178.102.156', NULL, NULL, NULL, NULL, NULL),
	('9c35a964-4976-45de-b6ec-9ccf964823a8', '165c8626-2c35-4ebe-aac1-bc0c797a1376', '2026-04-14 17:48:30.688608+00', '2026-04-14 17:48:30.688608+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '131.178.102.156', NULL, NULL, NULL, NULL, NULL),
	('84941ef5-1ec3-4978-a7d3-85bc132b959d', '165c8626-2c35-4ebe-aac1-bc0c797a1376', '2026-04-14 17:48:30.918537+00', '2026-04-14 17:48:30.918537+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '131.178.102.156', NULL, NULL, NULL, NULL, NULL),
	('8b178632-78e4-4ccf-a94d-008c797be12c', '165c8626-2c35-4ebe-aac1-bc0c797a1376', '2026-04-14 17:48:31.187017+00', '2026-04-14 17:48:31.187017+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '131.178.102.156', NULL, NULL, NULL, NULL, NULL),
	('2063cfd2-4fcf-4cd7-861c-38646e3ccdb5', '165c8626-2c35-4ebe-aac1-bc0c797a1376', '2026-04-14 17:48:31.472291+00', '2026-04-14 17:48:31.472291+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '131.178.102.156', NULL, NULL, NULL, NULL, NULL),
	('8cae7c94-7d5b-4f16-bd26-23abc1bf3570', '165c8626-2c35-4ebe-aac1-bc0c797a1376', '2026-04-14 17:48:31.68306+00', '2026-04-14 17:48:31.68306+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '131.178.102.156', NULL, NULL, NULL, NULL, NULL),
	('230398b8-b452-4cd7-8fdb-989020b94af6', '165c8626-2c35-4ebe-aac1-bc0c797a1376', '2026-04-14 17:48:40.393223+00', '2026-04-14 17:48:40.393223+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '131.178.102.156', NULL, NULL, NULL, NULL, NULL),
	('ef19ef0e-21b4-4eed-8366-d5b341592978', 'e4c6c3f4-46ab-4b25-b8e5-52419db25d3f', '2026-04-13 21:45:31.662996+00', '2026-04-14 16:27:53.77704+00', NULL, 'aal1', NULL, '2026-04-14 16:27:53.776934', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '131.178.102.180', NULL, NULL, NULL, NULL, NULL),
	('b3f39b53-ec40-4f66-a4ee-d474c9ec2315', '165c8626-2c35-4ebe-aac1-bc0c797a1376', '2026-04-14 17:47:25.686344+00', '2026-04-14 17:47:25.686344+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '131.178.102.156', NULL, NULL, NULL, NULL, NULL),
	('3e668fcd-cfa3-4fd5-bf80-6547ae915820', '165c8626-2c35-4ebe-aac1-bc0c797a1376', '2026-04-14 17:47:26.597198+00', '2026-04-14 17:47:26.597198+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '131.178.102.156', NULL, NULL, NULL, NULL, NULL),
	('9295d5db-6717-4123-8605-6621ba52f224', '165c8626-2c35-4ebe-aac1-bc0c797a1376', '2026-04-14 17:47:27.625386+00', '2026-04-14 17:47:27.625386+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '131.178.102.156', NULL, NULL, NULL, NULL, NULL),
	('f8353e1b-d13a-4739-b307-f0a3fea5aa8e', '165c8626-2c35-4ebe-aac1-bc0c797a1376', '2026-04-14 17:47:28.227538+00', '2026-04-14 17:47:28.227538+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '131.178.102.156', NULL, NULL, NULL, NULL, NULL),
	('e6a56649-c9bf-4a36-811f-2c73481e2c19', '165c8626-2c35-4ebe-aac1-bc0c797a1376', '2026-04-14 17:47:45.581964+00', '2026-04-14 17:47:45.581964+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '131.178.102.156', NULL, NULL, NULL, NULL, NULL),
	('323cf621-b0c1-4ae8-a414-a60fb79852ee', '165c8626-2c35-4ebe-aac1-bc0c797a1376', '2026-04-14 17:47:47.583369+00', '2026-04-14 17:47:47.583369+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '131.178.102.156', NULL, NULL, NULL, NULL, NULL),
	('45d5a79b-521f-416f-82ca-418444bbbf57', '165c8626-2c35-4ebe-aac1-bc0c797a1376', '2026-04-14 17:47:52.580437+00', '2026-04-14 17:47:52.580437+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '131.178.102.156', NULL, NULL, NULL, NULL, NULL),
	('2e16ccc1-2fbd-4ebf-97f3-93c7b79133a1', '165c8626-2c35-4ebe-aac1-bc0c797a1376', '2026-04-14 17:47:57.759467+00', '2026-04-14 17:47:57.759467+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '131.178.102.156', NULL, NULL, NULL, NULL, NULL),
	('d73a3dc6-9ee7-417d-88e8-a4e4248d9511', '165c8626-2c35-4ebe-aac1-bc0c797a1376', '2026-04-14 17:47:58.109088+00', '2026-04-14 17:47:58.109088+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '131.178.102.156', NULL, NULL, NULL, NULL, NULL),
	('4f236f84-fd07-419f-b223-86d4e073ca9b', '165c8626-2c35-4ebe-aac1-bc0c797a1376', '2026-04-14 17:47:58.2894+00', '2026-04-14 17:47:58.2894+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '131.178.102.156', NULL, NULL, NULL, NULL, NULL),
	('f5624a7f-b290-477a-850b-c49b2b6f19a6', '165c8626-2c35-4ebe-aac1-bc0c797a1376', '2026-04-14 17:47:58.485434+00', '2026-04-14 17:47:58.485434+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '131.178.102.156', NULL, NULL, NULL, NULL, NULL),
	('c0db62b8-4fe5-4cd4-8d13-9ef46b15d30c', '165c8626-2c35-4ebe-aac1-bc0c797a1376', '2026-04-14 17:48:01.605386+00', '2026-04-14 17:48:01.605386+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '131.178.102.156', NULL, NULL, NULL, NULL, NULL),
	('9c203f29-b6f0-427b-aa5c-a2fa71e35a10', 'd6aa5592-1373-4398-90ee-e5e45cd4a287', '2026-04-14 01:28:43.623158+00', '2026-04-14 15:25:35.197788+00', NULL, 'aal1', NULL, '2026-04-14 15:25:35.19768', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '131.178.102.172', NULL, NULL, NULL, NULL, NULL),
	('8a87abe3-fe5c-443f-9623-26e9ee8e5ef0', '165c8626-2c35-4ebe-aac1-bc0c797a1376', '2026-04-14 17:48:01.89317+00', '2026-04-14 17:48:01.89317+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '131.178.102.156', NULL, NULL, NULL, NULL, NULL),
	('15556b78-3e61-47bb-aa1e-625461a35616', '165c8626-2c35-4ebe-aac1-bc0c797a1376', '2026-04-14 17:48:02.09695+00', '2026-04-14 17:48:02.09695+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '131.178.102.156', NULL, NULL, NULL, NULL, NULL),
	('eec6c5f5-be89-4916-94b5-863241fc6cda', '165c8626-2c35-4ebe-aac1-bc0c797a1376', '2026-04-14 17:48:02.743545+00', '2026-04-14 17:48:02.743545+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '131.178.102.156', NULL, NULL, NULL, NULL, NULL),
	('f1eed518-1b47-4eaf-9f0e-51a23b3fba79', '165c8626-2c35-4ebe-aac1-bc0c797a1376', '2026-04-14 17:48:03.022823+00', '2026-04-14 17:48:03.022823+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '131.178.102.156', NULL, NULL, NULL, NULL, NULL),
	('600eea40-9433-43e7-932b-6decbe49b2e9', '165c8626-2c35-4ebe-aac1-bc0c797a1376', '2026-04-14 17:48:03.231025+00', '2026-04-14 17:48:03.231025+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '131.178.102.156', NULL, NULL, NULL, NULL, NULL),
	('dd9eb2da-64bd-4a54-88b8-b77d27f6754c', '165c8626-2c35-4ebe-aac1-bc0c797a1376', '2026-04-14 17:48:03.474632+00', '2026-04-14 17:48:03.474632+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '131.178.102.156', NULL, NULL, NULL, NULL, NULL),
	('a49e8c9c-d9f6-4286-90bf-36ac19148741', '165c8626-2c35-4ebe-aac1-bc0c797a1376', '2026-04-14 17:48:05.53803+00', '2026-04-14 17:48:05.53803+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '131.178.102.156', NULL, NULL, NULL, NULL, NULL),
	('69296fe7-7b0b-4544-a65f-11999080f859', '165c8626-2c35-4ebe-aac1-bc0c797a1376', '2026-04-14 17:48:08.305481+00', '2026-04-14 17:48:08.305481+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '131.178.102.156', NULL, NULL, NULL, NULL, NULL),
	('a3bf676f-0194-473c-95dd-ff7be2268f02', 'e4c6c3f4-46ab-4b25-b8e5-52419db25d3f', '2026-04-14 16:58:58.529946+00', '2026-04-14 16:58:58.529946+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '131.178.102.180', NULL, NULL, NULL, NULL, NULL),
	('21ff518f-9f44-4445-9cf0-fadfd4665427', 'a8c3b01e-febc-470c-aaca-37a679fee2db', '2026-04-17 07:34:49.528993+00', '2026-04-17 08:33:28.281299+00', NULL, 'aal1', NULL, '2026-04-17 08:33:28.280196', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '143.105.17.102', NULL, NULL, NULL, NULL, NULL),
	('938cf35d-82d8-40ff-b5da-18e46d1a623f', '165c8626-2c35-4ebe-aac1-bc0c797a1376', '2026-04-14 17:48:08.503014+00', '2026-04-14 17:48:08.503014+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '131.178.102.156', NULL, NULL, NULL, NULL, NULL),
	('012419fd-6f32-492a-85f4-2a262d064f16', '165c8626-2c35-4ebe-aac1-bc0c797a1376', '2026-04-14 17:48:08.709555+00', '2026-04-14 17:48:08.709555+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '131.178.102.156', NULL, NULL, NULL, NULL, NULL),
	('a7a75a03-0dd4-43e1-9d51-fd17f13203c6', 'dd1eef03-ac09-4708-b010-5c78adb953d0', '2026-04-19 16:40:42.644661+00', '2026-04-19 16:40:42.644661+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '189.159.220.101', NULL, NULL, NULL, NULL, NULL),
	('0ad8df05-c535-4b89-85de-ea35efb9e635', 'e4c6c3f4-46ab-4b25-b8e5-52419db25d3f', '2026-04-14 17:07:36.693918+00', '2026-04-14 18:11:31.016506+00', NULL, 'aal1', NULL, '2026-04-14 18:11:31.016396', 'Mozilla/5.0 (iPhone; CPU iPhone OS 26_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/147.0.7727.47 Mobile/15E148 Safari/604.1', '131.178.102.136', NULL, NULL, NULL, NULL, NULL);


--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."mfa_amr_claims" ("session_id", "created_at", "updated_at", "authentication_method", "id") VALUES
	('eaab9107-fd6f-4893-a459-74a79de4271a', '2026-04-16 04:19:46.547613+00', '2026-04-16 04:19:46.547613+00', 'oauth', '631211df-d387-4574-b33c-0e5ea2cfc6e8'),
	('d579d234-4ec5-4b79-83aa-16734ad9688a', '2026-04-17 00:07:20.942302+00', '2026-04-17 00:07:20.942302+00', 'oauth', '48e8d127-0271-4fd7-89d8-4d256d1df8d1'),
	('478dbce0-5069-4814-a29a-81832221033f', '2026-03-13 05:14:15.33107+00', '2026-03-13 05:14:15.33107+00', 'oauth', '45ce310b-cd50-44dd-9a4a-4109700caf48'),
	('21ff518f-9f44-4445-9cf0-fadfd4665427', '2026-04-17 07:34:49.577037+00', '2026-04-17 07:34:49.577037+00', 'password', '7cbe856d-7137-446c-9a97-70c7813405f3'),
	('71cd5568-9b2f-41b4-8d9d-6dff5a967604', '2026-04-17 22:41:17.316264+00', '2026-04-17 22:41:17.316264+00', 'password', '502f318e-51c0-4a27-a714-a627c4292afa'),
	('a7a75a03-0dd4-43e1-9d51-fd17f13203c6', '2026-04-19 16:40:42.697787+00', '2026-04-19 16:40:42.697787+00', 'password', 'cf3c3fc0-c6da-47e8-bd0d-bd1530d84408'),
	('500ddf7b-6c5d-4a19-9792-73c7277df62b', '2026-04-19 20:20:49.188131+00', '2026-04-19 20:20:49.188131+00', 'oauth', '50212fe6-5bb0-4611-9b37-d0301f3e22b0'),
	('48c2cc48-ffd0-4946-9dba-0f78096f98a7', '2026-03-13 19:21:22.462848+00', '2026-03-13 19:21:22.462848+00', 'oauth', 'c46e8e37-14f1-4d59-880e-47e62716ebfc'),
	('08462999-1c48-4456-a7b9-d251ff1e28cc', '2026-04-13 03:22:33.954875+00', '2026-04-13 03:22:33.954875+00', 'oauth', '7427a2a2-fa54-45cc-b97e-a33831658900'),
	('28d96eb4-9631-4b2f-9c64-3c78b4260f06', '2026-04-13 03:34:19.406619+00', '2026-04-13 03:34:19.406619+00', 'oauth', 'ce4968c6-73fe-4df0-b74b-bfb4460c0772'),
	('30a9dc0f-1cdf-41c4-a5ba-83b0b951cc77', '2026-04-13 03:36:27.631416+00', '2026-04-13 03:36:27.631416+00', 'oauth', 'c86dcf65-5f47-4b88-97b1-6bed8194cca8'),
	('86eb918f-7604-417b-86d6-c8a74d09bbea', '2026-04-13 03:37:57.84619+00', '2026-04-13 03:37:57.84619+00', 'oauth', '8ccedc06-8448-4d8f-b30e-76f3a62d4c2c'),
	('61347888-b2f5-4c6e-8a08-d33b5ff46a9e', '2026-04-13 03:39:48.044369+00', '2026-04-13 03:39:48.044369+00', 'oauth', 'd4eaca30-4b9e-40fe-b566-b2b53a465980'),
	('8ded0605-382f-462f-8f9c-66c2e1535c37', '2026-04-13 03:40:58.216545+00', '2026-04-13 03:40:58.216545+00', 'oauth', '386c5c7c-3d85-469b-973a-32675be24979'),
	('d737fa8a-e3da-4594-b750-dd87bafff41c', '2026-04-13 03:42:01.190579+00', '2026-04-13 03:42:01.190579+00', 'oauth', '1f55a757-4234-4713-836a-54618da1f0b3'),
	('ef19ef0e-21b4-4eed-8366-d5b341592978', '2026-04-13 21:45:31.706849+00', '2026-04-13 21:45:31.706849+00', 'oauth', 'ee009bf2-f586-4cea-8555-e1b62b6f8eac'),
	('9c203f29-b6f0-427b-aa5c-a2fa71e35a10', '2026-04-14 01:28:43.663359+00', '2026-04-14 01:28:43.663359+00', 'oauth', '79e31c1d-3b27-4602-b70a-1f5f68ad389a'),
	('a3bf676f-0194-473c-95dd-ff7be2268f02', '2026-04-14 16:58:58.575931+00', '2026-04-14 16:58:58.575931+00', 'oauth', 'c243a2f0-07fc-467e-a478-b4d1c6ae848c'),
	('1c1bba44-d08a-4def-b9a3-5a0ed7f40210', '2026-04-14 17:00:20.541269+00', '2026-04-14 17:00:20.541269+00', 'oauth', '14cc3056-1316-4db2-a7be-a6ce60278d3e'),
	('0ad8df05-c535-4b89-85de-ea35efb9e635', '2026-04-14 17:07:36.704321+00', '2026-04-14 17:07:36.704321+00', 'oauth', 'd46df87b-fea7-4d83-83fd-7f379cef6c17'),
	('2969934a-3913-440a-ba8e-113ec5159500', '2026-04-14 17:43:47.830758+00', '2026-04-14 17:43:47.830758+00', 'password', '63f48444-c61f-43c6-b26b-91f80dbdb603'),
	('b3f39b53-ec40-4f66-a4ee-d474c9ec2315', '2026-04-14 17:47:25.864245+00', '2026-04-14 17:47:25.864245+00', 'password', '91c0054d-7217-49f7-99c9-df76c3d381b5'),
	('3e668fcd-cfa3-4fd5-bf80-6547ae915820', '2026-04-14 17:47:26.605489+00', '2026-04-14 17:47:26.605489+00', 'password', 'bdc3f42e-b3f3-4608-893e-266af29f9d55'),
	('9295d5db-6717-4123-8605-6621ba52f224', '2026-04-14 17:47:27.631208+00', '2026-04-14 17:47:27.631208+00', 'password', '32a52a12-5f2d-41f0-aa69-25eb2b983b7c'),
	('f8353e1b-d13a-4739-b307-f0a3fea5aa8e', '2026-04-14 17:47:28.23383+00', '2026-04-14 17:47:28.23383+00', 'password', '9e43c4d7-56d0-410e-99ef-62f9724c3217'),
	('e6a56649-c9bf-4a36-811f-2c73481e2c19', '2026-04-14 17:47:45.600608+00', '2026-04-14 17:47:45.600608+00', 'password', 'b0ad46eb-2291-4d88-9207-2e67643d336f'),
	('323cf621-b0c1-4ae8-a414-a60fb79852ee', '2026-04-14 17:47:47.593801+00', '2026-04-14 17:47:47.593801+00', 'password', 'f8e49bd0-51b4-40b1-84fc-ad019da3e37b'),
	('45d5a79b-521f-416f-82ca-418444bbbf57', '2026-04-14 17:47:52.616979+00', '2026-04-14 17:47:52.616979+00', 'password', '17e89a5f-e5cc-4ac8-9d85-290c370c67e4'),
	('2e16ccc1-2fbd-4ebf-97f3-93c7b79133a1', '2026-04-14 17:47:57.765669+00', '2026-04-14 17:47:57.765669+00', 'password', '670a26a6-8f0a-4c12-b25d-f2ee2cf56531'),
	('d73a3dc6-9ee7-417d-88e8-a4e4248d9511', '2026-04-14 17:47:58.111822+00', '2026-04-14 17:47:58.111822+00', 'password', '990d2752-d85f-4d32-8de8-c49f6fda3d61'),
	('4f236f84-fd07-419f-b223-86d4e073ca9b', '2026-04-14 17:47:58.292525+00', '2026-04-14 17:47:58.292525+00', 'password', '7afe5172-289a-4a58-8e41-9765e4df175f'),
	('f5624a7f-b290-477a-850b-c49b2b6f19a6', '2026-04-14 17:47:58.490756+00', '2026-04-14 17:47:58.490756+00', 'password', '91aa3b46-1e29-485e-a130-d7a291f1008a'),
	('c0db62b8-4fe5-4cd4-8d13-9ef46b15d30c', '2026-04-14 17:48:01.607415+00', '2026-04-14 17:48:01.607415+00', 'password', 'ec2ab781-3f29-4641-995c-0816dcf0bc69'),
	('8a87abe3-fe5c-443f-9623-26e9ee8e5ef0', '2026-04-14 17:48:01.895707+00', '2026-04-14 17:48:01.895707+00', 'password', '02a80735-c9f3-45aa-a1b3-e3d95925b8ec'),
	('15556b78-3e61-47bb-aa1e-625461a35616', '2026-04-14 17:48:02.101666+00', '2026-04-14 17:48:02.101666+00', 'password', 'd560f949-74df-4ea5-9e99-dbc10f6633b6'),
	('eec6c5f5-be89-4916-94b5-863241fc6cda', '2026-04-14 17:48:02.753061+00', '2026-04-14 17:48:02.753061+00', 'password', '66f6a0f4-69ad-413f-8e73-bb898a91c3e1'),
	('f1eed518-1b47-4eaf-9f0e-51a23b3fba79', '2026-04-14 17:48:03.026759+00', '2026-04-14 17:48:03.026759+00', 'password', '855542ed-5d44-4e21-95db-20417b431e46'),
	('600eea40-9433-43e7-932b-6decbe49b2e9', '2026-04-14 17:48:03.235788+00', '2026-04-14 17:48:03.235788+00', 'password', '73d79fb7-a594-4ea1-bbbf-b82579aa2657'),
	('dd9eb2da-64bd-4a54-88b8-b77d27f6754c', '2026-04-14 17:48:03.478155+00', '2026-04-14 17:48:03.478155+00', 'password', '8248cac1-01fb-45ee-9f52-13296253bdb7'),
	('a49e8c9c-d9f6-4286-90bf-36ac19148741', '2026-04-14 17:48:05.557643+00', '2026-04-14 17:48:05.557643+00', 'password', '4fc8f56f-814e-45a7-b917-d727311a6642'),
	('69296fe7-7b0b-4544-a65f-11999080f859', '2026-04-14 17:48:08.310554+00', '2026-04-14 17:48:08.310554+00', 'password', '9903afaa-30a3-47aa-b51e-8227d06b6a75'),
	('938cf35d-82d8-40ff-b5da-18e46d1a623f', '2026-04-14 17:48:08.51097+00', '2026-04-14 17:48:08.51097+00', 'password', 'f6d39fcf-975a-40b7-8680-c4331b9e229f'),
	('012419fd-6f32-492a-85f4-2a262d064f16', '2026-04-14 17:48:08.717012+00', '2026-04-14 17:48:08.717012+00', 'password', 'b7936b5f-4e9f-4930-bc8d-74b19a8c70c7'),
	('4573ae32-1c82-43ef-91c2-f75db4d9ff05', '2026-04-14 17:48:25.716342+00', '2026-04-14 17:48:25.716342+00', 'password', '9c3f8862-2032-4833-8720-5bced05d6646'),
	('74591e20-73f6-4daf-b4ea-ce8ea88ae2bb', '2026-04-14 17:48:26.194266+00', '2026-04-14 17:48:26.194266+00', 'password', 'f0d46a84-6613-4e1d-9061-efd1f68efe90'),
	('9c35a964-4976-45de-b6ec-9ccf964823a8', '2026-04-14 17:48:30.692608+00', '2026-04-14 17:48:30.692608+00', 'password', 'beba6ca9-82f8-41ed-8562-77148ec4eb94'),
	('84941ef5-1ec3-4978-a7d3-85bc132b959d', '2026-04-14 17:48:30.92529+00', '2026-04-14 17:48:30.92529+00', 'password', 'aee94112-809f-4ef4-b96b-3ecbae30c86f'),
	('8b178632-78e4-4ccf-a94d-008c797be12c', '2026-04-14 17:48:31.189918+00', '2026-04-14 17:48:31.189918+00', 'password', '9a73912f-a8c1-4be8-94e3-2f168ce61fdf'),
	('2063cfd2-4fcf-4cd7-861c-38646e3ccdb5', '2026-04-14 17:48:31.478885+00', '2026-04-14 17:48:31.478885+00', 'password', 'd416b391-6505-41c3-b9f0-4074f7d3fae6'),
	('8cae7c94-7d5b-4f16-bd26-23abc1bf3570', '2026-04-14 17:48:31.69022+00', '2026-04-14 17:48:31.69022+00', 'password', '96e0dbec-237d-40b1-b184-6277605340c4'),
	('230398b8-b452-4cd7-8fdb-989020b94af6', '2026-04-14 17:48:40.397302+00', '2026-04-14 17:48:40.397302+00', 'password', '2ea81764-1cff-43c4-9940-2713f31667b8'),
	('728b80e4-a4ab-428c-8f50-f30f4f20c28d', '2026-04-14 17:48:40.700602+00', '2026-04-14 17:48:40.700602+00', 'password', '89bd0506-846c-43ec-b757-e62a1f7b9e1f');


--
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: oauth_authorizations; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: oauth_client_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: oauth_consents; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."refresh_tokens" ("instance_id", "id", "token", "user_id", "revoked", "created_at", "updated_at", "parent", "session_id") VALUES
	('00000000-0000-0000-0000-000000000000', 320, '4hihfizeoenn', '92c0d0d0-27d6-4c4f-830a-1e5cc389feb4', false, '2026-04-16 04:19:46.525157+00', '2026-04-16 04:19:46.525157+00', NULL, 'eaab9107-fd6f-4893-a459-74a79de4271a'),
	('00000000-0000-0000-0000-000000000000', 325, 'a5bigwugygb7', '706bc30f-68fd-4dab-9517-6ac7285d4e33', true, '2026-04-17 00:07:20.917551+00', '2026-04-17 01:12:07.327662+00', NULL, 'd579d234-4ec5-4b79-83aa-16734ad9688a'),
	('00000000-0000-0000-0000-000000000000', 337, 'bcamuf5arh3j', 'a8c3b01e-febc-470c-aaca-37a679fee2db', false, '2026-04-17 08:33:28.243795+00', '2026-04-17 08:33:28.243795+00', 'cttrkz24by34', '21ff518f-9f44-4445-9cf0-fadfd4665427'),
	('00000000-0000-0000-0000-000000000000', 341, 'ka24n6zc56py', 'a8c3b01e-febc-470c-aaca-37a679fee2db', true, '2026-04-17 23:39:52.092845+00', '2026-04-19 03:14:07.892242+00', '63wte5bnjuws', '71cd5568-9b2f-41b4-8d9d-6dff5a967604'),
	('00000000-0000-0000-0000-000000000000', 170, 'i5xvgmejbqic', 'e4c6c3f4-46ab-4b25-b8e5-52419db25d3f', true, '2026-04-14 15:22:38.00146+00', '2026-04-14 16:27:53.711674+00', '6akk4ne2k7lg', 'ef19ef0e-21b4-4eed-8366-d5b341592978'),
	('00000000-0000-0000-0000-000000000000', 12, 'zi6725nebkt2', 'd6aa5592-1373-4398-90ee-e5e45cd4a287', true, '2026-03-13 05:14:15.311752+00', '2026-03-13 15:45:56.821658+00', NULL, '478dbce0-5069-4814-a29a-81832221033f'),
	('00000000-0000-0000-0000-000000000000', 22, '7gqgmejkie4o', 'd6aa5592-1373-4398-90ee-e5e45cd4a287', true, '2026-03-13 15:45:56.849202+00', '2026-03-13 16:44:26.343328+00', 'zi6725nebkt2', '478dbce0-5069-4814-a29a-81832221033f'),
	('00000000-0000-0000-0000-000000000000', 25, 'dqqwx2e5lfap', 'd6aa5592-1373-4398-90ee-e5e45cd4a287', true, '2026-03-13 16:44:26.354946+00', '2026-03-13 17:52:52.57365+00', '7gqgmejkie4o', '478dbce0-5069-4814-a29a-81832221033f'),
	('00000000-0000-0000-0000-000000000000', 26, 'dcjw64hyfbrh', 'd6aa5592-1373-4398-90ee-e5e45cd4a287', true, '2026-03-13 17:52:52.59032+00', '2026-03-13 19:16:50.450509+00', 'dqqwx2e5lfap', '478dbce0-5069-4814-a29a-81832221033f'),
	('00000000-0000-0000-0000-000000000000', 27, 'kuvy46quyvfk', 'd6aa5592-1373-4398-90ee-e5e45cd4a287', true, '2026-03-13 19:16:50.46144+00', '2026-03-13 20:22:21.310309+00', 'dcjw64hyfbrh', '478dbce0-5069-4814-a29a-81832221033f'),
	('00000000-0000-0000-0000-000000000000', 166, '6akk4ne2k7lg', 'e4c6c3f4-46ab-4b25-b8e5-52419db25d3f', true, '2026-04-14 14:06:15.008302+00', '2026-04-14 15:22:37.99158+00', '25pwlwk5edub', 'ef19ef0e-21b4-4eed-8366-d5b341592978'),
	('00000000-0000-0000-0000-000000000000', 29, '2tafto5do4no', 'd6aa5592-1373-4398-90ee-e5e45cd4a287', true, '2026-03-13 20:22:21.599342+00', '2026-04-08 00:33:41.584914+00', 'kuvy46quyvfk', '478dbce0-5069-4814-a29a-81832221033f'),
	('00000000-0000-0000-0000-000000000000', 31, 'ymd6dgzma7gy', 'd6aa5592-1373-4398-90ee-e5e45cd4a287', true, '2026-04-08 00:33:41.605991+00', '2026-04-08 01:32:34.788496+00', '2tafto5do4no', '478dbce0-5069-4814-a29a-81832221033f'),
	('00000000-0000-0000-0000-000000000000', 32, 'qrstob3drn22', 'd6aa5592-1373-4398-90ee-e5e45cd4a287', true, '2026-04-08 01:32:34.806358+00', '2026-04-08 17:44:49.856935+00', 'ymd6dgzma7gy', '478dbce0-5069-4814-a29a-81832221033f'),
	('00000000-0000-0000-0000-000000000000', 33, 'mwasler5ltx6', 'd6aa5592-1373-4398-90ee-e5e45cd4a287', true, '2026-04-08 17:44:49.871399+00', '2026-04-08 18:47:29.035751+00', 'qrstob3drn22', '478dbce0-5069-4814-a29a-81832221033f'),
	('00000000-0000-0000-0000-000000000000', 34, 'qpm4lw43dkey', 'd6aa5592-1373-4398-90ee-e5e45cd4a287', true, '2026-04-08 18:47:29.055276+00', '2026-04-09 00:00:39.010923+00', 'mwasler5ltx6', '478dbce0-5069-4814-a29a-81832221033f'),
	('00000000-0000-0000-0000-000000000000', 35, 'lyc2gjk4dkwf', 'd6aa5592-1373-4398-90ee-e5e45cd4a287', true, '2026-04-09 00:00:39.030956+00', '2026-04-09 03:52:23.264711+00', 'qpm4lw43dkey', '478dbce0-5069-4814-a29a-81832221033f'),
	('00000000-0000-0000-0000-000000000000', 36, 'nyus62qqdd6a', 'd6aa5592-1373-4398-90ee-e5e45cd4a287', true, '2026-04-09 03:52:23.290489+00', '2026-04-09 04:50:51.541337+00', 'lyc2gjk4dkwf', '478dbce0-5069-4814-a29a-81832221033f'),
	('00000000-0000-0000-0000-000000000000', 37, 'ah5ypcxznn6j', 'd6aa5592-1373-4398-90ee-e5e45cd4a287', true, '2026-04-09 04:50:51.568089+00', '2026-04-09 15:19:22.036474+00', 'nyus62qqdd6a', '478dbce0-5069-4814-a29a-81832221033f'),
	('00000000-0000-0000-0000-000000000000', 38, 'rq5zoclcawbr', 'd6aa5592-1373-4398-90ee-e5e45cd4a287', true, '2026-04-09 15:19:22.060345+00', '2026-04-09 17:04:59.954141+00', 'ah5ypcxznn6j', '478dbce0-5069-4814-a29a-81832221033f'),
	('00000000-0000-0000-0000-000000000000', 39, 'zvfg2bqetnnl', 'd6aa5592-1373-4398-90ee-e5e45cd4a287', true, '2026-04-09 17:04:59.985411+00', '2026-04-09 18:12:23.197726+00', 'rq5zoclcawbr', '478dbce0-5069-4814-a29a-81832221033f'),
	('00000000-0000-0000-0000-000000000000', 40, 'ifjsya2yj4wg', 'd6aa5592-1373-4398-90ee-e5e45cd4a287', true, '2026-04-09 18:12:23.229929+00', '2026-04-09 19:31:27.769475+00', 'zvfg2bqetnnl', '478dbce0-5069-4814-a29a-81832221033f'),
	('00000000-0000-0000-0000-000000000000', 41, 'lt3iqiq5l2ud', 'd6aa5592-1373-4398-90ee-e5e45cd4a287', true, '2026-04-09 19:31:27.797035+00', '2026-04-09 22:56:44.267234+00', 'ifjsya2yj4wg', '478dbce0-5069-4814-a29a-81832221033f'),
	('00000000-0000-0000-0000-000000000000', 42, 'ibcvvh7wevoh', 'd6aa5592-1373-4398-90ee-e5e45cd4a287', true, '2026-04-09 22:56:44.286066+00', '2026-04-09 23:55:53.359707+00', 'lt3iqiq5l2ud', '478dbce0-5069-4814-a29a-81832221033f'),
	('00000000-0000-0000-0000-000000000000', 43, 'nvi2azytkqar', 'd6aa5592-1373-4398-90ee-e5e45cd4a287', true, '2026-04-09 23:55:53.376723+00', '2026-04-10 00:56:11.420023+00', 'ibcvvh7wevoh', '478dbce0-5069-4814-a29a-81832221033f'),
	('00000000-0000-0000-0000-000000000000', 44, 'o2lweypng2u7', 'd6aa5592-1373-4398-90ee-e5e45cd4a287', true, '2026-04-10 00:56:11.432635+00', '2026-04-10 15:32:53.273791+00', 'nvi2azytkqar', '478dbce0-5069-4814-a29a-81832221033f'),
	('00000000-0000-0000-0000-000000000000', 45, 'xb5loktkjzho', 'd6aa5592-1373-4398-90ee-e5e45cd4a287', true, '2026-04-10 15:32:53.286669+00', '2026-04-11 23:29:04.602533+00', 'o2lweypng2u7', '478dbce0-5069-4814-a29a-81832221033f'),
	('00000000-0000-0000-0000-000000000000', 46, 'nx34pycyycyd', 'd6aa5592-1373-4398-90ee-e5e45cd4a287', true, '2026-04-11 23:29:04.625159+00', '2026-04-12 00:27:06.248373+00', 'xb5loktkjzho', '478dbce0-5069-4814-a29a-81832221033f'),
	('00000000-0000-0000-0000-000000000000', 47, 'hifayoxcqu7k', 'd6aa5592-1373-4398-90ee-e5e45cd4a287', true, '2026-04-12 00:27:06.282082+00', '2026-04-12 15:51:51.323794+00', 'nx34pycyycyd', '478dbce0-5069-4814-a29a-81832221033f'),
	('00000000-0000-0000-0000-000000000000', 48, '7g5ftu3plwlo', 'd6aa5592-1373-4398-90ee-e5e45cd4a287', false, '2026-04-12 15:51:51.336231+00', '2026-04-12 15:51:51.336231+00', 'hifayoxcqu7k', '478dbce0-5069-4814-a29a-81832221033f'),
	('00000000-0000-0000-0000-000000000000', 28, '226y6injziuk', 'e4c6c3f4-46ab-4b25-b8e5-52419db25d3f', true, '2026-03-13 19:21:22.44754+00', '2026-04-13 18:19:47.552749+00', NULL, '48c2cc48-ffd0-4946-9dba-0f78096f98a7'),
	('00000000-0000-0000-0000-000000000000', 218, 'vkcg3httd56a', 'e4c6c3f4-46ab-4b25-b8e5-52419db25d3f', false, '2026-04-14 16:27:53.744521+00', '2026-04-14 16:27:53.744521+00', 'i5xvgmejbqic', 'ef19ef0e-21b4-4eed-8366-d5b341592978'),
	('00000000-0000-0000-0000-000000000000', 245, 'i4c72lskkouc', 'e4c6c3f4-46ab-4b25-b8e5-52419db25d3f', false, '2026-04-14 17:00:20.522595+00', '2026-04-14 17:00:20.522595+00', NULL, '1c1bba44-d08a-4def-b9a3-5a0ed7f40210'),
	('00000000-0000-0000-0000-000000000000', 58, 'tnqb5ziizkio', 'd6aa5592-1373-4398-90ee-e5e45cd4a287', false, '2026-04-13 03:22:33.92984+00', '2026-04-13 03:22:33.92984+00', NULL, '08462999-1c48-4456-a7b9-d251ff1e28cc'),
	('00000000-0000-0000-0000-000000000000', 60, 'fi4buaybhpae', 'd6aa5592-1373-4398-90ee-e5e45cd4a287', false, '2026-04-13 03:34:19.383911+00', '2026-04-13 03:34:19.383911+00', NULL, '28d96eb4-9631-4b2f-9c64-3c78b4260f06'),
	('00000000-0000-0000-0000-000000000000', 61, '4gdcr6bmckvh', 'd6aa5592-1373-4398-90ee-e5e45cd4a287', false, '2026-04-13 03:36:27.617285+00', '2026-04-13 03:36:27.617285+00', NULL, '30a9dc0f-1cdf-41c4-a5ba-83b0b951cc77'),
	('00000000-0000-0000-0000-000000000000', 62, 'u6fqvjvcdri2', 'd6aa5592-1373-4398-90ee-e5e45cd4a287', false, '2026-04-13 03:37:57.830505+00', '2026-04-13 03:37:57.830505+00', NULL, '86eb918f-7604-417b-86d6-c8a74d09bbea'),
	('00000000-0000-0000-0000-000000000000', 330, 'ms3aiehfqrvn', '706bc30f-68fd-4dab-9517-6ac7285d4e33', true, '2026-04-17 02:29:00.16839+00', '2026-04-17 03:28:41.337307+00', 'h5qnzyc4t7tx', 'd579d234-4ec5-4b79-83aa-16734ad9688a'),
	('00000000-0000-0000-0000-000000000000', 64, '6ubpmdnlr6hn', 'd6aa5592-1373-4398-90ee-e5e45cd4a287', false, '2026-04-13 03:39:48.038313+00', '2026-04-13 03:39:48.038313+00', NULL, '61347888-b2f5-4c6e-8a08-d33b5ff46a9e'),
	('00000000-0000-0000-0000-000000000000', 65, 'birffwcjttwg', 'd6aa5592-1373-4398-90ee-e5e45cd4a287', false, '2026-04-13 03:40:58.190774+00', '2026-04-13 03:40:58.190774+00', NULL, '8ded0605-382f-462f-8f9c-66c2e1535c37'),
	('00000000-0000-0000-0000-000000000000', 66, 'ylerlusfidge', 'd6aa5592-1373-4398-90ee-e5e45cd4a287', false, '2026-04-13 03:42:01.174179+00', '2026-04-13 03:42:01.174179+00', NULL, 'd737fa8a-e3da-4594-b750-dd87bafff41c'),
	('00000000-0000-0000-0000-000000000000', 338, 'fa47n4dloorb', '165c8626-2c35-4ebe-aac1-bc0c797a1376', true, '2026-04-17 21:44:37.390821+00', '2026-04-17 22:46:22.649929+00', '5dw2ohqja66a', '728b80e4-a4ab-428c-8f50-f30f4f20c28d'),
	('00000000-0000-0000-0000-000000000000', 342, 'rgivxzxuxri7', '165c8626-2c35-4ebe-aac1-bc0c797a1376', false, '2026-04-18 00:32:03.335465+00', '2026-04-18 00:32:03.335465+00', 'lr3ei3aityt3', '728b80e4-a4ab-428c-8f50-f30f4f20c28d'),
	('00000000-0000-0000-0000-000000000000', 257, 'ct4uuacz4ofs', '165c8626-2c35-4ebe-aac1-bc0c797a1376', false, '2026-04-14 17:43:47.79363+00', '2026-04-14 17:43:47.79363+00', NULL, '2969934a-3913-440a-ba8e-113ec5159500'),
	('00000000-0000-0000-0000-000000000000', 275, 'kiyxb333kzfl', '165c8626-2c35-4ebe-aac1-bc0c797a1376', false, '2026-04-14 17:48:02.744861+00', '2026-04-14 17:48:02.744861+00', NULL, 'eec6c5f5-be89-4916-94b5-863241fc6cda'),
	('00000000-0000-0000-0000-000000000000', 276, 'yh7g7xdpircw', '165c8626-2c35-4ebe-aac1-bc0c797a1376', false, '2026-04-14 17:48:03.024841+00', '2026-04-14 17:48:03.024841+00', NULL, 'f1eed518-1b47-4eaf-9f0e-51a23b3fba79'),
	('00000000-0000-0000-0000-000000000000', 277, 'upninlkcwt5t', '165c8626-2c35-4ebe-aac1-bc0c797a1376', false, '2026-04-14 17:48:03.232669+00', '2026-04-14 17:48:03.232669+00', NULL, '600eea40-9433-43e7-932b-6decbe49b2e9'),
	('00000000-0000-0000-0000-000000000000', 278, 'lrcqgdstytjt', '165c8626-2c35-4ebe-aac1-bc0c797a1376', false, '2026-04-14 17:48:03.476023+00', '2026-04-14 17:48:03.476023+00', NULL, 'dd9eb2da-64bd-4a54-88b8-b77d27f6754c'),
	('00000000-0000-0000-0000-000000000000', 279, 'fdmcex3leaht', '165c8626-2c35-4ebe-aac1-bc0c797a1376', false, '2026-04-14 17:48:05.548431+00', '2026-04-14 17:48:05.548431+00', NULL, 'a49e8c9c-d9f6-4286-90bf-36ac19148741'),
	('00000000-0000-0000-0000-000000000000', 280, 'cmt37klundz5', '165c8626-2c35-4ebe-aac1-bc0c797a1376', false, '2026-04-14 17:48:08.308737+00', '2026-04-14 17:48:08.308737+00', NULL, '69296fe7-7b0b-4544-a65f-11999080f859'),
	('00000000-0000-0000-0000-000000000000', 281, 'rejwe3mp4p5q', '165c8626-2c35-4ebe-aac1-bc0c797a1376', false, '2026-04-14 17:48:08.508211+00', '2026-04-14 17:48:08.508211+00', NULL, '938cf35d-82d8-40ff-b5da-18e46d1a623f'),
	('00000000-0000-0000-0000-000000000000', 282, '7s62hkjb43lb', '165c8626-2c35-4ebe-aac1-bc0c797a1376', false, '2026-04-14 17:48:08.715264+00', '2026-04-14 17:48:08.715264+00', NULL, '012419fd-6f32-492a-85f4-2a262d064f16'),
	('00000000-0000-0000-0000-000000000000', 347, 'pnusdchemea6', 'dd1eef03-ac09-4708-b010-5c78adb953d0', false, '2026-04-19 16:40:42.677476+00', '2026-04-19 16:40:42.677476+00', NULL, 'a7a75a03-0dd4-43e1-9d51-fd17f13203c6'),
	('00000000-0000-0000-0000-000000000000', 284, 'jsvqatr2gmld', '165c8626-2c35-4ebe-aac1-bc0c797a1376', false, '2026-04-14 17:48:25.706189+00', '2026-04-14 17:48:25.706189+00', NULL, '4573ae32-1c82-43ef-91c2-f75db4d9ff05'),
	('00000000-0000-0000-0000-000000000000', 285, 'xdxcus77wt75', '165c8626-2c35-4ebe-aac1-bc0c797a1376', false, '2026-04-14 17:48:26.192381+00', '2026-04-14 17:48:26.192381+00', NULL, '74591e20-73f6-4daf-b4ea-ce8ea88ae2bb'),
	('00000000-0000-0000-0000-000000000000', 286, 'c736vhzqdagk', '165c8626-2c35-4ebe-aac1-bc0c797a1376', false, '2026-04-14 17:48:30.690159+00', '2026-04-14 17:48:30.690159+00', NULL, '9c35a964-4976-45de-b6ec-9ccf964823a8'),
	('00000000-0000-0000-0000-000000000000', 255, 'yqhq4kt2mhoo', 'e4c6c3f4-46ab-4b25-b8e5-52419db25d3f', true, '2026-04-14 17:07:36.697537+00', '2026-04-14 18:11:30.954472+00', NULL, '0ad8df05-c535-4b89-85de-ea35efb9e635'),
	('00000000-0000-0000-0000-000000000000', 88, 'fywoelth3wxl', 'e4c6c3f4-46ab-4b25-b8e5-52419db25d3f', false, '2026-04-13 18:19:47.564469+00', '2026-04-13 18:19:47.564469+00', '226y6injziuk', '48c2cc48-ffd0-4946-9dba-0f78096f98a7'),
	('00000000-0000-0000-0000-000000000000', 100, 'd37het4sfssl', 'e4c6c3f4-46ab-4b25-b8e5-52419db25d3f', true, '2026-04-13 21:45:31.678897+00', '2026-04-13 22:44:28.431878+00', NULL, 'ef19ef0e-21b4-4eed-8366-d5b341592978'),
	('00000000-0000-0000-0000-000000000000', 103, '7nk6knxcqjd6', 'e4c6c3f4-46ab-4b25-b8e5-52419db25d3f', true, '2026-04-13 22:44:28.441159+00', '2026-04-13 23:43:28.16282+00', 'd37het4sfssl', 'ef19ef0e-21b4-4eed-8366-d5b341592978'),
	('00000000-0000-0000-0000-000000000000', 327, 'h5qnzyc4t7tx', '706bc30f-68fd-4dab-9517-6ac7285d4e33', true, '2026-04-17 01:12:07.352158+00', '2026-04-17 02:29:00.140654+00', 'a5bigwugygb7', 'd579d234-4ec5-4b79-83aa-16734ad9688a'),
	('00000000-0000-0000-0000-000000000000', 124, '25pwlwk5edub', 'e4c6c3f4-46ab-4b25-b8e5-52419db25d3f', true, '2026-04-14 01:45:27.782853+00', '2026-04-14 14:06:14.982185+00', 'tytjbbrtcosw', 'ef19ef0e-21b4-4eed-8366-d5b341592978'),
	('00000000-0000-0000-0000-000000000000', 339, '63wte5bnjuws', 'a8c3b01e-febc-470c-aaca-37a679fee2db', true, '2026-04-17 22:41:17.281808+00', '2026-04-17 23:39:52.069873+00', NULL, '71cd5568-9b2f-41b4-8d9d-6dff5a967604'),
	('00000000-0000-0000-0000-000000000000', 133, '26e5awkqmnq7', 'd6aa5592-1373-4398-90ee-e5e45cd4a287', true, '2026-04-14 03:51:43.977506+00', '2026-04-14 15:25:35.144058+00', 'plfmdwmivemk', '9c203f29-b6f0-427b-aa5c-a2fa71e35a10'),
	('00000000-0000-0000-0000-000000000000', 173, 'ix7fbsd6ghlz', 'd6aa5592-1373-4398-90ee-e5e45cd4a287', false, '2026-04-14 15:25:35.168667+00', '2026-04-14 15:25:35.168667+00', '26e5awkqmnq7', '9c203f29-b6f0-427b-aa5c-a2fa71e35a10'),
	('00000000-0000-0000-0000-000000000000', 108, 'jp4gbsmn623y', 'e4c6c3f4-46ab-4b25-b8e5-52419db25d3f', true, '2026-04-13 23:43:28.180574+00', '2026-04-14 00:42:02.2035+00', '7nk6knxcqjd6', 'ef19ef0e-21b4-4eed-8366-d5b341592978'),
	('00000000-0000-0000-0000-000000000000', 343, 'jzawg32okpuy', 'a8c3b01e-febc-470c-aaca-37a679fee2db', true, '2026-04-19 03:14:07.912566+00', '2026-04-19 05:35:21.814554+00', 'ka24n6zc56py', '71cd5568-9b2f-41b4-8d9d-6dff5a967604'),
	('00000000-0000-0000-0000-000000000000', 348, 'ox7wccs3fn2l', '5737ff41-0d3c-4dfb-913a-4d93732447b2', false, '2026-04-19 20:20:49.161796+00', '2026-04-19 20:20:49.161796+00', NULL, '500ddf7b-6c5d-4a19-9792-73c7277df62b'),
	('00000000-0000-0000-0000-000000000000', 113, 'tytjbbrtcosw', 'e4c6c3f4-46ab-4b25-b8e5-52419db25d3f', true, '2026-04-14 00:42:02.239174+00', '2026-04-14 01:45:27.766789+00', 'jp4gbsmn623y', 'ef19ef0e-21b4-4eed-8366-d5b341592978'),
	('00000000-0000-0000-0000-000000000000', 122, 'kkeazgc3ewv4', 'd6aa5592-1373-4398-90ee-e5e45cd4a287', true, '2026-04-14 01:28:43.642836+00', '2026-04-14 02:27:05.690791+00', NULL, '9c203f29-b6f0-427b-aa5c-a2fa71e35a10'),
	('00000000-0000-0000-0000-000000000000', 244, 'znrylwasaomv', 'e4c6c3f4-46ab-4b25-b8e5-52419db25d3f', false, '2026-04-14 16:58:58.552938+00', '2026-04-14 16:58:58.552938+00', NULL, 'a3bf676f-0194-473c-95dd-ff7be2268f02'),
	('00000000-0000-0000-0000-000000000000', 128, 'plfmdwmivemk', 'd6aa5592-1373-4398-90ee-e5e45cd4a287', true, '2026-04-14 02:27:05.71089+00', '2026-04-14 03:51:43.949987+00', 'kkeazgc3ewv4', '9c203f29-b6f0-427b-aa5c-a2fa71e35a10'),
	('00000000-0000-0000-0000-000000000000', 259, '4agkr5fxwlq3', '165c8626-2c35-4ebe-aac1-bc0c797a1376', false, '2026-04-14 17:47:25.840974+00', '2026-04-14 17:47:25.840974+00', NULL, 'b3f39b53-ec40-4f66-a4ee-d474c9ec2315'),
	('00000000-0000-0000-0000-000000000000', 260, 'j427gici4qxh', '165c8626-2c35-4ebe-aac1-bc0c797a1376', false, '2026-04-14 17:47:26.599333+00', '2026-04-14 17:47:26.599333+00', NULL, '3e668fcd-cfa3-4fd5-bf80-6547ae915820'),
	('00000000-0000-0000-0000-000000000000', 261, 'di5ln4xoibzx', '165c8626-2c35-4ebe-aac1-bc0c797a1376', false, '2026-04-14 17:47:27.628085+00', '2026-04-14 17:47:27.628085+00', NULL, '9295d5db-6717-4123-8605-6621ba52f224'),
	('00000000-0000-0000-0000-000000000000', 262, 'tolxcsliosev', '165c8626-2c35-4ebe-aac1-bc0c797a1376', false, '2026-04-14 17:47:28.231235+00', '2026-04-14 17:47:28.231235+00', NULL, 'f8353e1b-d13a-4739-b307-f0a3fea5aa8e'),
	('00000000-0000-0000-0000-000000000000', 263, 'je2waqbecf4x', '165c8626-2c35-4ebe-aac1-bc0c797a1376', false, '2026-04-14 17:47:45.593698+00', '2026-04-14 17:47:45.593698+00', NULL, 'e6a56649-c9bf-4a36-811f-2c73481e2c19'),
	('00000000-0000-0000-0000-000000000000', 264, '7mj34uytjxl5', '165c8626-2c35-4ebe-aac1-bc0c797a1376', false, '2026-04-14 17:47:47.586935+00', '2026-04-14 17:47:47.586935+00', NULL, '323cf621-b0c1-4ae8-a414-a60fb79852ee'),
	('00000000-0000-0000-0000-000000000000', 266, '5sysdyxhj5xk', '165c8626-2c35-4ebe-aac1-bc0c797a1376', false, '2026-04-14 17:47:52.610206+00', '2026-04-14 17:47:52.610206+00', NULL, '45d5a79b-521f-416f-82ca-418444bbbf57'),
	('00000000-0000-0000-0000-000000000000', 268, 'zc7x5ugrbfit', '165c8626-2c35-4ebe-aac1-bc0c797a1376', false, '2026-04-14 17:47:57.761016+00', '2026-04-14 17:47:57.761016+00', NULL, '2e16ccc1-2fbd-4ebf-97f3-93c7b79133a1'),
	('00000000-0000-0000-0000-000000000000', 269, 'dpbo32hiror2', '165c8626-2c35-4ebe-aac1-bc0c797a1376', false, '2026-04-14 17:47:58.110026+00', '2026-04-14 17:47:58.110026+00', NULL, 'd73a3dc6-9ee7-417d-88e8-a4e4248d9511'),
	('00000000-0000-0000-0000-000000000000', 270, 'z4k7fvappt7m', '165c8626-2c35-4ebe-aac1-bc0c797a1376', false, '2026-04-14 17:47:58.29083+00', '2026-04-14 17:47:58.29083+00', NULL, '4f236f84-fd07-419f-b223-86d4e073ca9b'),
	('00000000-0000-0000-0000-000000000000', 271, 'zngjgcnj2oua', '165c8626-2c35-4ebe-aac1-bc0c797a1376', false, '2026-04-14 17:47:58.488505+00', '2026-04-14 17:47:58.488505+00', NULL, 'f5624a7f-b290-477a-850b-c49b2b6f19a6'),
	('00000000-0000-0000-0000-000000000000', 272, '4s64zqfvxwrm', '165c8626-2c35-4ebe-aac1-bc0c797a1376', false, '2026-04-14 17:48:01.606305+00', '2026-04-14 17:48:01.606305+00', NULL, 'c0db62b8-4fe5-4cd4-8d13-9ef46b15d30c'),
	('00000000-0000-0000-0000-000000000000', 273, 'lxaiqs7g5dl2', '165c8626-2c35-4ebe-aac1-bc0c797a1376', false, '2026-04-14 17:48:01.894523+00', '2026-04-14 17:48:01.894523+00', NULL, '8a87abe3-fe5c-443f-9623-26e9ee8e5ef0'),
	('00000000-0000-0000-0000-000000000000', 274, 'ivzcpbkag7gh', '165c8626-2c35-4ebe-aac1-bc0c797a1376', false, '2026-04-14 17:48:02.099332+00', '2026-04-14 17:48:02.099332+00', NULL, '15556b78-3e61-47bb-aa1e-625461a35616'),
	('00000000-0000-0000-0000-000000000000', 287, 'wxrdvhmvuxmm', '165c8626-2c35-4ebe-aac1-bc0c797a1376', false, '2026-04-14 17:48:30.920681+00', '2026-04-14 17:48:30.920681+00', NULL, '84941ef5-1ec3-4978-a7d3-85bc132b959d'),
	('00000000-0000-0000-0000-000000000000', 288, 'dimna3s3keaz', '165c8626-2c35-4ebe-aac1-bc0c797a1376', false, '2026-04-14 17:48:31.188023+00', '2026-04-14 17:48:31.188023+00', NULL, '8b178632-78e4-4ccf-a94d-008c797be12c'),
	('00000000-0000-0000-0000-000000000000', 289, 'jlqh22fvyebb', '165c8626-2c35-4ebe-aac1-bc0c797a1376', false, '2026-04-14 17:48:31.47684+00', '2026-04-14 17:48:31.47684+00', NULL, '2063cfd2-4fcf-4cd7-861c-38646e3ccdb5'),
	('00000000-0000-0000-0000-000000000000', 290, 'in7apqvwrkqd', '165c8626-2c35-4ebe-aac1-bc0c797a1376', false, '2026-04-14 17:48:31.687487+00', '2026-04-14 17:48:31.687487+00', NULL, '8cae7c94-7d5b-4f16-bd26-23abc1bf3570'),
	('00000000-0000-0000-0000-000000000000', 291, 'vivt3zujq2ym', '165c8626-2c35-4ebe-aac1-bc0c797a1376', false, '2026-04-14 17:48:40.395576+00', '2026-04-14 17:48:40.395576+00', NULL, '230398b8-b452-4cd7-8fdb-989020b94af6'),
	('00000000-0000-0000-0000-000000000000', 297, 'nh6waxkmm6cy', 'e4c6c3f4-46ab-4b25-b8e5-52419db25d3f', false, '2026-04-14 18:11:30.995481+00', '2026-04-14 18:11:30.995481+00', 'yqhq4kt2mhoo', '0ad8df05-c535-4b89-85de-ea35efb9e635'),
	('00000000-0000-0000-0000-000000000000', 332, 'akjnxdkweiiy', '706bc30f-68fd-4dab-9517-6ac7285d4e33', false, '2026-04-17 03:28:41.355699+00', '2026-04-17 03:28:41.355699+00', 'ms3aiehfqrvn', 'd579d234-4ec5-4b79-83aa-16734ad9688a'),
	('00000000-0000-0000-0000-000000000000', 336, 'cttrkz24by34', 'a8c3b01e-febc-470c-aaca-37a679fee2db', true, '2026-04-17 07:34:49.554313+00', '2026-04-17 08:33:28.214607+00', NULL, '21ff518f-9f44-4445-9cf0-fadfd4665427'),
	('00000000-0000-0000-0000-000000000000', 292, '5dw2ohqja66a', '165c8626-2c35-4ebe-aac1-bc0c797a1376', true, '2026-04-14 17:48:40.698385+00', '2026-04-17 21:44:37.364454+00', NULL, '728b80e4-a4ab-428c-8f50-f30f4f20c28d'),
	('00000000-0000-0000-0000-000000000000', 340, 'lr3ei3aityt3', '165c8626-2c35-4ebe-aac1-bc0c797a1376', true, '2026-04-17 22:46:22.670214+00', '2026-04-18 00:32:03.312994+00', 'fa47n4dloorb', '728b80e4-a4ab-428c-8f50-f30f4f20c28d'),
	('00000000-0000-0000-0000-000000000000', 344, '2q74hlgazjzk', 'a8c3b01e-febc-470c-aaca-37a679fee2db', true, '2026-04-19 05:35:21.842912+00', '2026-04-19 22:46:05.169083+00', 'jzawg32okpuy', '71cd5568-9b2f-41b4-8d9d-6dff5a967604'),
	('00000000-0000-0000-0000-000000000000', 349, 'usu32hfo33bu', 'a8c3b01e-febc-470c-aaca-37a679fee2db', false, '2026-04-19 22:46:05.186208+00', '2026-04-19 22:46:05.186208+00', '2q74hlgazjzk', '71cd5568-9b2f-41b4-8d9d-6dff5a967604');


--
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: webauthn_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: webauthn_credentials; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: achievement; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."achievement" ("achievement_id", "icon", "title", "description", "criteria_type", "criteria_value") OVERRIDING SYSTEM VALUE VALUES
	(1, 'trophy', 'First Win', 'Win your first game on the LakersCourt', 'first_win', 1),
	(2, 'mode_heat', 'On Fire', 'Win 5 games in a row', 'win_streak', 5),
	(3, 'star_rate', 'All-Star', 'Get a reputation above 4.7', 'reputation', 47),
	(4, 'taunt', 'Showtime Supporter', 'Send 100 messages in live chat', 'messages_sent', 100),
	(5, 'crown', 'Loyal Fan', 'Log in 30 days in a row', 'days_logged', 30),
	(7, 'award_star', 'Legend', 'Reach 100 games played', 'games_played', 100),
	(8, 'military_tech', 'Veteran Status', 'Account active for 1 year', 'account_age', 365),
	(6, 'sports_score', 'Champion', 'Win a 3v3 or 5v5 LakersCourt tournament', 'tournament_win', 1);


--
-- Data for Name: bracket; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."bracket" ("id", "bracket_question_id1", "bracket_question_id2", "open_date", "close_date", "round", "winner", "question") VALUES
	(2, 5, 6, '2026-04-02 17:20:16.876117+00', '2026-04-07 17:20:16.876117+00', 1, 1, 'Who had the best defense last season?'),
	(3, 3, 4, '2026-04-14 17:20:16.876117+00', '2026-04-17 17:20:16.876117+00', 2, NULL, 'Who will be the breakout star next season?'),
	(1, 1, 2, '2026-04-12 17:15:52.568677+00', '2026-04-17 17:15:52.568677+00', 1, NULL, 'Who is the best player this season?');


--
-- Data for Name: bracket_question; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."bracket_question" ("id", "descripcion") VALUES
	(1, 'LeBron James'),
	(2, 'Anthony Davis'),
	(3, 'Austin Reaves'),
	(4, 'D''Angelo Russell'),
	(5, 'Rui Hachimura'),
	(6, 'Jarred Vanderbilt');


--
-- Data for Name: card; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."card" ("card_id", "player_name", "web_url", "pixel_url", "attack", "defense", "velocity", "cost", "rare") VALUES
	('b3f0f18c-a30c-4c7d-83e6-27fa4bae5cbb', 'Jake LaRavia', 'https://ptbcoxaguvbwprxdundz.supabase.co/storage/v1/object/sign/videogame/jake_laravia.png?token=eyJraWQiOiJzdG9yYWdlLXVybC1zaWduaW5nLWtleV8yMjM0MDRlMi1hNmFhLTRhN2QtYWMwMi0xNjE1MzBhN2UyZTIiLCJhbGciOiJIUzI1NiJ9.eyJ1cmwiOiJ2aWRlb2dhbWUvamFrZV9sYXJhdmlhLnBuZyIsImlhdCI6MTc3MzM1NzE4NCwiZXhwIjoxNzczOTYxOTg0fQ.DryA1nVImTLjjAsmQ3DwoWcyTs98nd0mRwK5fGBl2D8', 'https://ptbcoxaguvbwprxdundz.supabase.co/storage/v1/object/sign/videogame/pixel_jake_laravia.jpeg?token=eyJraWQiOiJzdG9yYWdlLXVybC1zaWduaW5nLWtleV8yMjM0MDRlMi1hNmFhLTRhN2QtYWMwMi0xNjE1MzBhN2UyZTIiLCJhbGciOiJIUzI1NiJ9.eyJ1cmwiOiJ2aWRlb2dhbWUvcGl4ZWxfamFrZV9sYXJhdmlhLmpwZWciLCJpYXQiOjE3NzMzNTcxOTQsImV4cCI6MTc3Mzk2MTk5NH0.TeYKuwD4oEI1OmEXFY59MwhS8rwuH97v49j3Izh7RW8', 60, 50, 50, 1000, false),
	('f06f105c-b191-4757-a21e-8ccbb3768e98', 'LeBron James', 'https://ptbcoxaguvbwprxdundz.supabase.co/storage/v1/object/sign/videogame/lebron.jpg?token=eyJraWQiOiJzdG9yYWdlLXVybC1zaWduaW5nLWtleV8yMjM0MDRlMi1hNmFhLTRhN2QtYWMwMi0xNjE1MzBhN2UyZTIiLCJhbGciOiJIUzI1NiJ9.eyJ1cmwiOiJ2aWRlb2dhbWUvbGVicm9uLmpwZyIsImlhdCI6MTc3MzM1NzE2NCwiZXhwIjoxNzczOTYxOTY0fQ.A-Kmx44eUb4BOvhsEkVne8oASiq9FJZlJaeM_PvbJm4', 'https://ptbcoxaguvbwprxdundz.supabase.co/storage/v1/object/sign/videogame/pixel_lebron.png?token=eyJraWQiOiJzdG9yYWdlLXVybC1zaWduaW5nLWtleV8yMjM0MDRlMi1hNmFhLTRhN2QtYWMwMi0xNjE1MzBhN2UyZTIiLCJhbGciOiJIUzI1NiJ9.eyJ1cmwiOiJ2aWRlb2dhbWUvcGl4ZWxfbGVicm9uLnBuZyIsImlhdCI6MTc3MzM1NzE3NSwiZXhwIjoxNzczOTYxOTc1fQ.QNRmM_o4yLqa0ylY9ei-1XbWBk013TtdsyGufzPt8_4', 60, 20, 40, 2000, true);


--
-- Data for Name: gender; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."gender" ("gender_id", "gender") VALUES
	(0, 'Female'),
	(1, 'Male'),
	(2, 'Other');


--
-- Data for Name: user_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."user_type" ("user_type_id", "user_type_title") VALUES
	(0, 'Regular'),
	(1, 'Admin');


--
-- Data for Name: user_laker; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."user_laker" ("user_id", "user_type", "birthdate", "nickname", "username", "photo_url", "gender", "credits", "crowns", "allow_lakers_court", "notifications", "online", "reputation") VALUES
	('d6aa5592-1373-4398-90ee-e5e45cd4a287', 0, '1998-11-24', 'lebron fan', 'THE_GOAT', 'https://ptbcoxaguvbwprxdundz.supabase.co/storage/v1/object/sign/user_images/thegoat.jpg?token=eyJraWQiOiJzdG9yYWdlLXVybC1zaWduaW5nLWtleV8yMjM0MDRlMi1hNmFhLTRhN2QtYWMwMi0xNjE1MzBhN2UyZTIiLCJhbGciOiJIUzI1NiJ9.eyJ1cmwiOiJ1c2VyX2ltYWdlcy90aGVnb2F0LmpwZyIsImlhdCI6MTc3NjA0NTIwMywiZXhwIjoxODA3NTgxMjAzfQ.DEbdkcXhtfcgjLMxfOCtmQZFMn45EtE0nmDLt8aqPlw', 1, 102, 32, true, false, true, 3.2),
	('fbaaa5cf-814b-4d65-b4e7-7ec19fcd94ee', 0, '1979-09-16', 'wicho', 'RockyBeagle', 'https://ptbcoxaguvbwprxdundz.supabase.co/storage/v1/object/sign/user_images/rockythebeagle.jpg?token=eyJraWQiOiJzdG9yYWdlLXVybC1zaWduaW5nLWtleV8yMjM0MDRlMi1hNmFhLTRhN2QtYWMwMi0xNjE1MzBhN2UyZTIiLCJhbGciOiJIUzI1NiJ9.eyJ1cmwiOiJ1c2VyX2ltYWdlcy9yb2NreXRoZWJlYWdsZS5qcGciLCJpYXQiOjE3NzYwNDQzNjMsImV4cCI6MTgwNzU4MDM2M30.1kRBj2TjUXaIJQLgI_KXS0sWnmzknPwxHwy0Xzf9E3A', 1, 1349, 203, true, false, true, 5.0),
	('a8c3b01e-febc-470c-aaca-37a679fee2db', 0, '2001-06-11', 'pato', 'cuackcuack', 'https://ptbcoxaguvbwprxdundz.supabase.co/storage/v1/object/public/user_images/avatars/a8c3b01e-febc-470c-aaca-37a679fee2db-1776189631865.png', 1, 750, 0, NULL, NULL, NULL, 4.50),
	('16870c9b-33e7-4aed-8f70-5936e823deb2', 0, NULL, 'LebronJam', 'lebronjam', 'https://ptbcoxaguvbwprxdundz.supabase.co/storage/v1/object/sign/user_images/lebron.jpg?token=eyJraWQiOiJzdG9yYWdlLXVybC1zaWduaW5nLWtleV8yMjM0MDRlMi1hNmFhLTRhN2QtYWMwMi0xNjE1MzBhN2UyZTIiLCJhbGciOiJIUzI1NiJ9.eyJ1cmwiOiJ1c2VyX2ltYWdlcy9sZWJyb24uanBnIiwiaWF0IjoxNzc2MDQ1NTEwLCJleHAiOjE4MDc1ODE1MTB9.pF7eyQ6L0nx_5DHynNjB5PxVBKtwCsAkT3VxyJznF4Y', 1, 0, 0, NULL, NULL, NULL, 4.2),
	('706bc30f-68fd-4dab-9517-6ac7285d4e33', 0, NULL, 'laker767', 'laker767', 'https://ptbcoxaguvbwprxdundz.supabase.co/storage/v1/object/sign/user_images/imagen2.jpg?token=eyJraWQiOiJzdG9yYWdlLXVybC1zaWduaW5nLWtleV8yMjM0MDRlMi1hNmFhLTRhN2QtYWMwMi0xNjE1MzBhN2UyZTIiLCJhbGciOiJIUzI1NiJ9.eyJ1cmwiOiJ1c2VyX2ltYWdlcy9pbWFnZW4yLmpwZyIsImlhdCI6MTc3NjEyNzA5NiwiZXhwIjoxODA3NjYzMDk2fQ.n4405JOdG6qogDVQfh8uLTLM_cbEv9yyvSl_9-el22I', NULL, 0, 0, NULL, NULL, NULL, 4.50),
	('dd1eef03-ac09-4708-b010-5c78adb953d0', 1, NULL, 'Admin', 'admin', 'https://ptbcoxaguvbwprxdundz.supabase.co/storage/v1/object/public/user_images/avatars/dd1eef03-ac09-4708-b010-5c78adb953d0-1776219944518.png', NULL, 1000, 100, true, true, true, 5.0),
	('165c8626-2c35-4ebe-aac1-bc0c797a1376', 0, '2026-04-16', 'PlayerOne', 'player1', 'https://ptbcoxaguvbwprxdundz.supabase.co/storage/v1/object/public/user_images/avatars/165c8626-2c35-4ebe-aac1-bc0c797a1376-1776151963151.jpg', 0, 120, 2, true, true, true, 4.4),
	('3f3e4d60-f9e9-4c0b-8856-dbff1a66e8b2', 0, NULL, 'Hooper', 'hooper', 'https://ptbcoxaguvbwprxdundz.supabase.co/storage/v1/object/public/user_images/avatars/3f3e4d60-f9e9-4c0b-8856-dbff1a66e8b2-1776173704611.jpg', NULL, 170, 4, true, true, true, 4.8),
	('e9c9fa0e-6179-4023-80d3-03d4475ccdd6', 0, NULL, 'PlayerTwo', 'player2', 'https://ptbcoxaguvbwprxdundz.supabase.co/storage/v1/object/public/user_images/avatars/e9c9fa0e-6179-4023-80d3-03d4475ccdd6-1776173839126.png', NULL, 130, 2, true, true, true, 4.3),
	('372280a1-c9b3-4a10-8204-b24cfe617994', 0, NULL, 'FastBreak', 'fastbreak', 'https://ptbcoxaguvbwprxdundz.supabase.co/storage/v1/object/public/user_images/avatars/372280a1-c9b3-4a10-8204-b24cfe617994-1776174065926.png', NULL, 150, 3, true, true, true, 4.6),
	('9b2b2585-8e2c-4209-b316-fbb24748eba6', 0, NULL, 'SixthMan', 'sixthman', 'https://ptbcoxaguvbwprxdundz.supabase.co/storage/v1/object/public/user_images/avatars/9b2b2585-8e2c-4209-b316-fbb24748eba6-1776174309642.jpg', NULL, 160, 6, true, true, true, 4.9),
	('5737ff41-0d3c-4dfb-913a-4d93732447b2', 0, NULL, 'adolfo2', 'adolfogv', 'https://ptbcoxaguvbwprxdundz.supabase.co/storage/v1/object/public/user_images/profile_picture_default.png', NULL, 0, 0, NULL, NULL, NULL, 0),
	('bdd6cbce-77d3-46a2-baee-09221eed2a40', 0, '2000-05-15', 'Regigi', 'regigi', 'https://ptbcoxaguvbwprxdundz.supabase.co/storage/v1/object/public/user_images/avatars/bdd6cbce-77d3-46a2-baee-09221eed2a40-1776174445643.jpeg', NULL, 500, 12, true, true, true, 4.7),
	('5d5af46e-4edb-4dff-b4ed-cb94c7be5d86', 0, NULL, 'Clutch', 'clutch', 'https://ptbcoxaguvbwprxdundz.supabase.co/storage/v1/object/public/user_images/avatars/5d5af46e-4edb-4dff-b4ed-cb94c7be5d86-1776174109177.jpg', NULL, 180, 5, true, true, true, 4.7),
	('793219d5-fe72-4e77-b733-a94beb340b69', 0, NULL, 'TripleThreat', 'triplethreat', 'https://ptbcoxaguvbwprxdundz.supabase.co/storage/v1/object/public/user_images/avatars/793219d5-fe72-4e77-b733-a94beb340b69-1776174172292.png', NULL, 190, 8, true, true, true, 4.8),
	('ac3a5447-1b6f-4324-8830-5ddc2d7b2c47', 0, '2005-02-17', 'ampsss', 'ampsss', 'https://ptbcoxaguvbwprxdundz.supabase.co/storage/v1/object/sign/user_images/Amparo_LOGO.png?token=eyJraWQiOiJzdG9yYWdlLXVybC1zaWduaW5nLWtleV8yMjM0MDRlMi1hNmFhLTRhN2QtYWMwMi0xNjE1MzBhN2UyZTIiLCJhbGciOiJIUzI1NiJ9.eyJ1cmwiOiJ1c2VyX2ltYWdlcy9BbXBhcm9fTE9HTy5wbmciLCJpYXQiOjE3NzYxMjMxNjMsImV4cCI6MTgwNzY1OTE2M30.phmeavlaMtr0Ea9wbFn7aGi3qHCcqTJqnijDq7XTF1c', 0, 520, 0, true, false, true, 4.83),
	('af5ed49a-4fd9-415d-9429-013e51f65a08', 0, '2003-08-22', 'Gali', 'galili', 'https://ptbcoxaguvbwprxdundz.supabase.co/storage/v1/object/public/user_images/avatars/af5ed49a-4fd9-415d-9429-013e51f65a08-1776174499792.jpg', NULL, 650, 18, true, true, true, 4.9),
	('b6ceb5fa-017d-4582-b23a-128ab1bda35a', 0, NULL, 'Baller', 'baller', 'https://ptbcoxaguvbwprxdundz.supabase.co/storage/v1/object/public/user_images/avatars/b6ceb5fa-017d-4582-b23a-128ab1bda35a-1776173928827.png', NULL, 200, 10, true, true, true, 4.5),
	('c7855248-e94f-4651-bad5-c48592e5c269', 0, '2004-08-19', 'adolfo', 'adolfoGOD', 'https://ptbcoxaguvbwprxdundz.supabase.co/storage/v1/object/sign/user_images/adolfo.png?token=eyJraWQiOiJzdG9yYWdlLXVybC1zaWduaW5nLWtleV8yMjM0MDRlMi1hNmFhLTRhN2QtYWMwMi0xNjE1MzBhN2UyZTIiLCJhbGciOiJIUzI1NiJ9.eyJ1cmwiOiJ1c2VyX2ltYWdlcy9hZG9sZm8ucG5nIiwiaWF0IjoxNzc2MDQ0Nzc2LCJleHAiOjE4MDc1ODA3NzZ9.Wv-xIL0Tr5rIoMl8peCy1KSnHCjk86fW7Adxjv604TI', 1, 432, 64, true, false, true, 4.25),
	('e4c6c3f4-46ab-4b25-b8e5-52419db25d3f', 0, '2005-07-25', 'cielito', 'skymaligna', 'https://ptbcoxaguvbwprxdundz.supabase.co/storage/v1/object/sign/user_images/skymaligna.jpg?token=eyJraWQiOiJzdG9yYWdlLXVybC1zaWduaW5nLWtleV8yMjM0MDRlMi1hNmFhLTRhN2QtYWMwMi0xNjE1MzBhN2UyZTIiLCJhbGciOiJIUzI1NiJ9.eyJ1cmwiOiJ1c2VyX2ltYWdlcy9za3ltYWxpZ25hLmpwZyIsImlhdCI6MTc3NjA0MzU0NCwiZXhwIjoxODA3NTc5NTQ0fQ.aAMFKkBMQoWEyPL0E46gwdwtNpLqqmNFfhv7AiwqEzU', 0, 302, 5, true, false, true, 4.67),
	('9eec2cc7-0552-4f95-945d-866aa3de4faa', 0, '2005-07-16', 'moni', 'bicilover', 'https://ptbcoxaguvbwprxdundz.supabase.co/storage/v1/object/sign/user_images/bicilover.jpg?token=eyJraWQiOiJzdG9yYWdlLXVybC1zaWduaW5nLWtleV8yMjM0MDRlMi1hNmFhLTRhN2QtYWMwMi0xNjE1MzBhN2UyZTIiLCJhbGciOiJIUzI1NiJ9.eyJ1cmwiOiJ1c2VyX2ltYWdlcy9iaWNpbG92ZXIuanBnIiwiaWF0IjoxNzc2MDQ0MDc1LCJleHAiOjE4MDc1ODAwNzV9._k77VdMfjUyhSJRt466qnLvcPH7f1JT2RF8L0C4Tu38', 0, 678, 34, true, false, true, 5.00);


--
-- Data for Name: friendship; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."friendship" ("friendship_id", "user1", "user2") VALUES
	(1, 'ac3a5447-1b6f-4324-8830-5ddc2d7b2c47', '16870c9b-33e7-4aed-8f70-5936e823deb2'),
	(2, 'a8c3b01e-febc-470c-aaca-37a679fee2db', 'e4c6c3f4-46ab-4b25-b8e5-52419db25d3f'),
	(3, 'a8c3b01e-febc-470c-aaca-37a679fee2db', 'fbaaa5cf-814b-4d65-b4e7-7ec19fcd94ee'),
	(4, 'a8c3b01e-febc-470c-aaca-37a679fee2db', '9eec2cc7-0552-4f95-945d-866aa3de4faa'),
	(5, 'a8c3b01e-febc-470c-aaca-37a679fee2db', 'c7855248-e94f-4651-bad5-c48592e5c269'),
	(6, 'a8c3b01e-febc-470c-aaca-37a679fee2db', '3f3e4d60-f9e9-4c0b-8856-dbff1a66e8b2'),
	(7, 'a8c3b01e-febc-470c-aaca-37a679fee2db', 'b6ceb5fa-017d-4582-b23a-128ab1bda35a'),
	(8, 'a8c3b01e-febc-470c-aaca-37a679fee2db', '372280a1-c9b3-4a10-8204-b24cfe617994'),
	(9, 'a8c3b01e-febc-470c-aaca-37a679fee2db', 'ac3a5447-1b6f-4324-8830-5ddc2d7b2c47'),
	(10, 'a8c3b01e-febc-470c-aaca-37a679fee2db', 'bdd6cbce-77d3-46a2-baee-09221eed2a40'),
	(11, 'a8c3b01e-febc-470c-aaca-37a679fee2db', 'af5ed49a-4fd9-415d-9429-013e51f65a08'),
	(12, 'a8c3b01e-febc-470c-aaca-37a679fee2db', 'd6aa5592-1373-4398-90ee-e5e45cd4a287'),
	(13, 'a8c3b01e-febc-470c-aaca-37a679fee2db', '5d5af46e-4edb-4dff-b4ed-cb94c7be5d86'),
	(14, 'a8c3b01e-febc-470c-aaca-37a679fee2db', '793219d5-fe72-4e77-b733-a94beb340b69'),
	(15, 'a8c3b01e-febc-470c-aaca-37a679fee2db', '165c8626-2c35-4ebe-aac1-bc0c797a1376'),
	(16, 'a8c3b01e-febc-470c-aaca-37a679fee2db', 'e9c9fa0e-6179-4023-80d3-03d4475ccdd6'),
	(17, 'a8c3b01e-febc-470c-aaca-37a679fee2db', '9b2b2585-8e2c-4209-b316-fbb24748eba6'),
	(18, 'a8c3b01e-febc-470c-aaca-37a679fee2db', '16870c9b-33e7-4aed-8f70-5936e823deb2');


--
-- Data for Name: conversation; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."conversation" ("conversation_id", "friendship_id", "created_at") VALUES
	(1, 2, '2026-04-14 01:57:15.019344+00'),
	(2, 3, '2026-04-14 01:57:15.019344+00'),
	(3, 4, '2026-04-14 01:57:15.019344+00'),
	(4, 5, '2026-04-14 01:57:15.019344+00');


--
-- Data for Name: court; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."court" ("court_id", "name", "direction", "longitude", "latitude", "allow_court") VALUES
	(1, 'Homecourt', 'LA', -100.29101, 25.646013, true),
	(2, 'Gimnasio Casanova', 'Av. Eugenio Garza Sada 2501, Monterrey', -100.2958, 25.6512, true),
	(3, 'Deportivo Cumbres', 'Av. R├│mulo Garza, Cumbres, Garc├¡a', -100.3521, 25.7012, true),
	(4, 'UANL Deportivo', 'Av. Universidad S/N, San Nicol├ís de los Garza', -100.2524, 25.7285, true),
	(5, 'Parque Ni├▒os H├®roes', 'Av. Madero Ote., Centro, Monterrey', -100.3123, 25.6714, true),
	(6, 'Deportivo Santa Catarina', 'Blvd. D├¡az Ordaz, Santa Catarina', -100.4512, 25.6734, true),
	(7, 'Cancha El Obispo', 'Av. Constituci├│n, Monterrey', -100.3214, 25.6623, true),
	(8, 'Arena Monterrey (exteriores)', 'Av. Dr. Jos├® Eleuterio Gonz├ílez 300', -100.2891, 25.6498, true),
	(9, 'Parque Fundidora', 'Av. Fundidora, Obrera, Monterrey', -100.2745, 25.6701, true);


--
-- Data for Name: skill_level; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."skill_level" ("skill_level_id", "description") VALUES
	(1, 'Open'),
	(2, 'Begginer');


--
-- Data for Name: event; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."event" ("event_id", "event_name", "date", "max_players", "min_age", "max_age", "allow_event", "court_id", "skill_level_id", "created_user_id") VALUES
	(1, 'Bday friendly game!', '2026-03-13 22:30:00+00', 20, 15, 80, true, 1, NULL, 'ac3a5447-1b6f-4324-8830-5ddc2d7b2c47'),
	(42, 'Pickup Game', '2026-04-13 00:00:00+00', 20, 18, 50, true, 6, NULL, '9eec2cc7-0552-4f95-945d-866aa3de4faa'),
	(21, '3V3 Tournament', '2026-04-30 01:10:00+00', 15, 15, 20, true, 5, NULL, 'c7855248-e94f-4651-bad5-c48592e5c269'),
	(19, '5v5 League', '2026-02-17 21:20:00+00', 20, 12, 16, true, 9, NULL, 'e4c6c3f4-46ab-4b25-b8e5-52419db25d3f'),
	(37, 'Lakers Themed Game!', '2026-03-13 00:00:00+00', 15, 30, 60, true, 1, NULL, 'ac3a5447-1b6f-4324-8830-5ddc2d7b2c47'),
	(38, 'Mini Lakers Fans', '2026-04-08 00:00:00+00', 15, 12, 15, true, 1, NULL, 'ac3a5447-1b6f-4324-8830-5ddc2d7b2c47'),
	(39, 'Practice Game', '2026-04-11 17:58:56.209978+00', 6, 18, 27, true, 1, 1, '706bc30f-68fd-4dab-9517-6ac7285d4e33'),
	(43, 'Pickup Game Downtown', '2026-04-20 18:00:00+00', 10, NULL, NULL, true, 1, 1, 'a8c3b01e-febc-470c-aaca-37a679fee2db'),
	(44, 'Lakers 2v2', '2026-04-22 20:00:00+00', 15, NULL, NULL, true, 1, 1, 'a8c3b01e-febc-470c-aaca-37a679fee2db'),
	(45, 'Weekend Shootaround', '2026-04-25 10:00:00+00', 8, NULL, NULL, true, 1, 1, 'a8c3b01e-febc-470c-aaca-37a679fee2db'),
	(46, 'Monica Testing', '2026-04-18 00:40:49+00', 10, NULL, NULL, true, NULL, NULL, '9eec2cc7-0552-4f95-945d-866aa3de4faa');


--
-- Data for Name: event_participant; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."event_participant" ("event_participant_id", "event_id", "user_id") OVERRIDING SYSTEM VALUE VALUES
	(1, 1, 'ac3a5447-1b6f-4324-8830-5ddc2d7b2c47'),
	(2, 37, 'ac3a5447-1b6f-4324-8830-5ddc2d7b2c47'),
	(3, 38, 'ac3a5447-1b6f-4324-8830-5ddc2d7b2c47'),
	(4, 1, '16870c9b-33e7-4aed-8f70-5936e823deb2'),
	(5, 38, '16870c9b-33e7-4aed-8f70-5936e823deb2'),
	(6, 39, '706bc30f-68fd-4dab-9517-6ac7285d4e33'),
	(7, 39, 'ac3a5447-1b6f-4324-8830-5ddc2d7b2c47'),
	(8, 39, 'c7855248-e94f-4651-bad5-c48592e5c269'),
	(9, 39, 'e4c6c3f4-46ab-4b25-b8e5-52419db25d3f'),
	(10, 39, 'a8c3b01e-febc-470c-aaca-37a679fee2db'),
	(11, 39, '9eec2cc7-0552-4f95-945d-866aa3de4faa'),
	(12, 1, 'a8c3b01e-febc-470c-aaca-37a679fee2db'),
	(13, 21, 'a8c3b01e-febc-470c-aaca-37a679fee2db'),
	(14, 19, 'a8c3b01e-febc-470c-aaca-37a679fee2db'),
	(15, 37, 'a8c3b01e-febc-470c-aaca-37a679fee2db'),
	(16, 38, 'a8c3b01e-febc-470c-aaca-37a679fee2db'),
	(17, 42, 'a8c3b01e-febc-470c-aaca-37a679fee2db');


--
-- Data for Name: event_report; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."event_report" ("ereport_id", "event_id", "reporter_user_id", "comment", "priority", "status", "created_at") VALUES
	(345, 42, '9eec2cc7-0552-4f95-945d-866aa3de4faa', 'Said it was an event for minors and yet the 40 year old host wanted to play too', 'High', 'Pending', '2026-04-13 02:54:25+00'),
	(671, 19, 'fbaaa5cf-814b-4d65-b4e7-7ec19fcd94ee', 'The event location was changed last minute without proper notice to all participants.', 'Medium', 'Pending', '2026-04-17 04:45:56+00'),
	(454, 19, '9eec2cc7-0552-4f95-945d-866aa3de4faa', 'Multiple participants reported feeling unsafe during this event due to lack of supervision.', 'High', 'Reviewed', '2026-04-13 04:47:50.472489+00'),
	(211, 21, 'e4c6c3f4-46ab-4b25-b8e5-52419db25d3f', 'Event was poorly organized and started over an hour late with no explanation', 'Low', 'Pending', '2026-04-01 04:50:39+00'),
	(657, 21, 'd6aa5592-1373-4398-90ee-e5e45cd4a287', 'Several players complained about unfair team assignments and biased refereeing', 'Low', 'Pending', '2026-04-13 04:48:56.526942+00');


--
-- Data for Name: team; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."team" ("team_id", "team_name", "logo_url") VALUES
	(1, 'Los Angeles Lakers', 'https://supabasekong.a0gv.tech/storage/v1/object/public/team-logos/Los_Angeles_Lakers_logo.svg.png'),
	(2, 'Golden State Warriors', 'https://supabasekong.a0gv.tech/storage/v1/object/public/team-logos/Golden_State_Warriors_logo.svg.png'),
	(3, 'Boston Celtics', 'https://static.wikia.nocookie.net/nba/images/f/f4/Celtics1.png/revision/latest?cb=20230130175136&path-prefix=es'),
	(4, 'Denver Nuggets', 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/nba/500/den.png');


--
-- Data for Name: game; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."game" ("game_id", "opposing_team_id", "home", "attended", "venue", "start_date", "current_quarter_start", "current_quarter", "game_end_time", "defense") VALUES
	(1, 2, true, NULL, 'Crypto.com Arena', '2026-03-12 20:00:00+00', '2026-03-12 20:35:00+00', 2, NULL, false),
	(2, 3, true, NULL, 'IDK', '2026-04-08 03:03:22+00', NULL, 0, NULL, false),
	(3, 4, false, NULL, 'IDK PT2', '2026-04-12 03:07:16+00', NULL, 0, NULL, false);


--
-- Data for Name: message; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."message" ("message_id", "conversation_id", "user_id", "message", "sent") VALUES
	(1, 1, 'e4c6c3f4-46ab-4b25-b8e5-52419db25d3f', 'Hola! viste el juego de anoche?', '2026-04-13 23:57:36.974614+00'),
	(2, 1, 'a8c3b01e-febc-470c-aaca-37a679fee2db', 'Si estuvo increible LeBron monstruo', '2026-04-14 00:07:36.974614+00'),
	(3, 1, 'e4c6c3f4-46ab-4b25-b8e5-52419db25d3f', 'AD tambien la rompi├│ con 30 puntos', '2026-04-14 00:17:36.974614+00'),
	(4, 1, 'a8c3b01e-febc-470c-aaca-37a679fee2db', 'Este equipo va por el campeonato ­ƒÅå', '2026-04-14 00:57:36.974614+00'),
	(5, 2, 'a8c3b01e-febc-470c-aaca-37a679fee2db', 'Wicho vas al evento del sabado?', '2026-04-13 22:57:36.974614+00'),
	(6, 2, 'fbaaa5cf-814b-4d65-b4e7-7ec19fcd94ee', 'Sim├│n ah├¡ voy, a qu├® hora empieza?', '2026-04-13 23:27:36.974614+00'),
	(7, 2, 'a8c3b01e-febc-470c-aaca-37a679fee2db', 'A las 6, nos vemos en la cancha norte', '2026-04-13 23:57:36.974614+00'),
	(8, 3, '9eec2cc7-0552-4f95-945d-866aa3de4faa', 'Ya viste el bracket de esta semana?', '2026-04-13 20:57:36.974614+00'),
	(9, 3, 'a8c3b01e-febc-470c-aaca-37a679fee2db', 'S├¡, vot├® por LeBron obviamente jaja', '2026-04-13 21:12:36.974614+00'),
	(10, 4, 'c7855248-e94f-4651-bad5-c48592e5c269', 'Bro conseguiste boletos para el siguiente juego?', '2026-04-13 01:57:36.974614+00'),
	(11, 4, 'a8c3b01e-febc-470c-aaca-37a679fee2db', 'Todav├¡a no, est├ín car├¡simos ­ƒÿ¡', '2026-04-13 02:57:36.974614+00'),
	(12, 4, 'c7855248-e94f-4651-bad5-c48592e5c269', 'Yo conozco a alguien que puede conseguir, te aviso', '2026-04-13 03:57:36.974614+00'),
	(13, 1, 'a8c3b01e-febc-470c-aaca-37a679fee2db', 'hola', '2026-04-14 08:34:26.713+00'),
	(14, 1, 'a8c3b01e-febc-470c-aaca-37a679fee2db', 'como andas?', '2026-04-14 08:49:53.064+00'),
	(15, 1, 'a8c3b01e-febc-470c-aaca-37a679fee2db', 'oyeee, cuando inciia el partido?', '2026-04-14 08:51:41.836+00'),
	(16, 1, 'e4c6c3f4-46ab-4b25-b8e5-52419db25d3f', 'a las 5', '2026-04-14 14:08:19.584+00'),
	(17, 1, 'a8c3b01e-febc-470c-aaca-37a679fee2db', 'ah buenooo', '2026-04-14 14:08:30.691+00'),
	(18, 3, 'a8c3b01e-febc-470c-aaca-37a679fee2db', 'moni, ya viste la nueva pregunta?', '2026-04-14 14:30:23.197+00'),
	(19, 1, 'e4c6c3f4-46ab-4b25-b8e5-52419db25d3f', 'Hola', '2026-04-14 17:55:26.253+00'),
	(20, 1, 'e4c6c3f4-46ab-4b25-b8e5-52419db25d3f', 'Soy yo otra vez', '2026-04-14 17:55:30.749+00'),
	(21, 1, 'a8c3b01e-febc-470c-aaca-37a679fee2db', 'Hola regina', '2026-04-14 17:55:31.459+00'),
	(22, 1, 'e4c6c3f4-46ab-4b25-b8e5-52419db25d3f', 'Siiii', '2026-04-14 17:55:34.479+00'),
	(23, 2, 'a8c3b01e-febc-470c-aaca-37a679fee2db', 'Super! nos vemos', '2026-04-17 22:50:09.197+00'),
	(24, 3, 'a8c3b01e-febc-470c-aaca-37a679fee2db', 'Dime, tu por quien votaste?', '2026-04-17 22:53:36.704+00'),
	(25, 3, '9eec2cc7-0552-4f95-945d-866aa3de4faa', 'Tu mam├í', '2026-04-19 16:37:49.837+00');


--
-- Data for Name: team_player; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."team_player" ("team_player_id", "first_name", "last_name", "team_id", "photo_url") VALUES
	(1, 'Deandre', 'Ayton', 1, 'https://a.espncdn.com/combiner/i?img=/i/headshots/nba/players/full/4278129.png&w=350&h=254'),
	(2, 'Kobe', 'Bufkin', 1, 'https://www.espn.com.mx/basquetbol/nba/jugador/_/id/4683736/kobe-bufkin'),
	(4, 'Rui', 'Hachimura', 1, 'https://a.espncdn.com/combiner/i?img=/i/headshots/nba/players/full/4066648.png'),
	(5, 'Jaxson', 'Hayes', 1, 'https://a.espncdn.com/combiner/i?img=/i/headshots/nba/players/full/4397077.png&w=350&h=254'),
	(6, 'Bronny', 'James', 1, 'https://a.espncdn.com/combiner/i?img=/i/headshots/nba/players/full/4683774.png&w=350&h=254'),
	(7, 'LeBron', 'James', 1, 'https://cdn.nba.com/headshots/nba/latest/1040x760/2544.png'),
	(8, 'Luke', 'Kennard', 1, 'https://a.espncdn.com/combiner/i?img=/i/headshots/nba/players/full/3913174.png'),
	(9, 'Maxi', 'Kleber', 1, 'https://a.espncdn.com/combiner/i?img=/i/headshots/nba/players/full/2960236.png'),
	(10, 'Dalton', 'Knecht', 1, 'https://a.espncdn.com/combiner/i?img=/i/headshots/nba/players/full/4897943.png'),
	(11, 'Jake', 'LaRavia', 1, 'https://a.espncdn.com/combiner/i?img=/i/headshots/nba/players/full/4592691.png'),
	(12, 'Chris', 'Manon', 1, 'https://a.espncdn.com/i/headshots/nba/players/full/4702972.png'),
	(13, 'Austin', 'Reaves', 1, 'https://a.espncdn.com/combiner/i?img=/i/headshots/nba/players/full/4066457.png'),
	(14, 'Marcus', 'Smart', 1, 'https://a.espncdn.com/combiner/i?img=/i/headshots/nba/players/full/2990992.png'),
	(15, 'Nick', 'Smith Jr.', 1, 'https://a.espncdn.com/combiner/i?img=/i/headshots/nba/players/full/4683686.png&w=350&h=254'),
	(16, 'Adou', 'Thiero', 1, 'https://a.espncdn.com/combiner/i?img=/i/headshots/nba/players/full/5060631.png&w=350&h=254'),
	(17, 'Drew', 'Timme', 1, 'https://a.espncdn.com/combiner/i?img=/i/headshots/nba/players/full/4431695.png'),
	(18, 'Jarred', 'Vanderbilt', 1, 'https://a.espncdn.com/combiner/i?img=/i/headshots/nba/players/full/4278077.png'),
	(19, 'Golden State', 'Warriors', 2, 'https://upload.wikimedia.org/wikipedia/en/thumb/0/01/Golden_State_Warriors_logo.svg/1280px-Golden_State_Warriors_logo.svg.png'),
	(20, 'Boston', 'Celtics', 3, 'https://static.wikia.nocookie.net/nba/images/f/f4/Celtics1.png/revision/latest?cb=20230130175136&path-prefix=es'),
	(21, 'Denver', 'Nuggets', 4, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/nba/500/den.png'),
	(3, 'Luka', 'Doncic', 1, 'https://a.espncdn.com/combiner/i?img=/i/headshots/nba/players/full/3945274.png&w=350&h=254');


--
-- Data for Name: team_player_stats; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."team_player_stats" ("team_player_stats_id", "game_id", "team_player_id", "minutes", "points", "rebounds", "assists", "steals", "turnovers", "field_made", "field_attempted") VALUES
	(41, 1, 3, '34:45:00', 32, 14, 3, 1, 2, 12, 19),
	(42, 1, 13, '32:08:00', 18, 4, 6, 1, 1, 7, 14),
	(43, 1, 4, '26:50:00', 16, 5, 2, 1, 1, 6, 11),
	(44, 1, 1, '28:33:00', 14, 9, 3, 2, 2, 5, 12),
	(45, 1, 18, '22:17:00', 6, 9, 2, 3, 0, 2, 5),
	(46, 1, 14, '20:40:00', 12, 3, 4, 2, 1, 4, 9),
	(47, 1, 9, '18:22:00', 8, 7, 1, 0, 2, 3, 7),
	(48, 1, 10, '16:55:00', 11, 2, 1, 1, 1, 4, 9),
	(49, 1, 8, '14:30:00', 6, 2, 2, 1, 0, 2, 5),
	(50, 1, 5, '12:18:00', 4, 3, 0, 1, 1, 2, 4),
	(51, 1, 6, '10:05:00', 3, 1, 1, 0, 0, 1, 3),
	(52, 1, 16, '07:25:00', 2, 2, 0, 0, 0, 1, 2),
	(53, 2, 7, '37:00:00', 35, 7, 11, 3, 4, 13, 25),
	(54, 2, 3, '33:18:00', 24, 12, 5, 1, 3, 9, 18),
	(55, 2, 13, '31:42:00', 22, 5, 5, 0, 2, 8, 15),
	(56, 2, 1, '29:50:00', 19, 11, 2, 2, 1, 7, 14),
	(57, 2, 4, '25:30:00', 10, 4, 1, 2, 1, 4, 10),
	(58, 2, 18, '23:44:00', 4, 11, 1, 2, 1, 2, 4),
	(59, 2, 14, '19:15:00', 9, 2, 6, 1, 0, 3, 8),
	(60, 2, 9, '17:50:00', 7, 6, 1, 0, 1, 3, 6),
	(61, 2, 10, '20:10:00', 14, 3, 2, 1, 2, 5, 11),
	(62, 2, 8, '13:25:00', 6, 1, 3, 0, 0, 2, 6),
	(63, 2, 5, '11:20:00', 6, 4, 1, 0, 2, 3, 5),
	(64, 2, 6, '15:38:00', 5, 2, 2, 1, 0, 2, 5),
	(65, 2, 16, '08:10:00', 0, 3, 0, 1, 0, 0, 2),
	(66, 3, 7, '38:30:00', 22, 10, 13, 1, 5, 8, 19),
	(67, 3, 3, '35:55:00', 29, 10, 8, 2, 2, 11, 20),
	(68, 3, 13, '33:20:00', 20, 3, 7, 2, 1, 7, 13),
	(69, 3, 1, '30:10:00', 17, 13, 2, 1, 2, 6, 12),
	(70, 3, 4, '24:15:00', 13, 6, 2, 1, 0, 5, 10),
	(71, 3, 18, '21:00:00', 5, 10, 3, 4, 1, 2, 4),
	(72, 3, 14, '18:45:00', 8, 3, 7, 2, 1, 3, 8),
	(73, 3, 9, '20:30:00', 6, 7, 1, 1, 0, 2, 6),
	(74, 3, 10, '15:00:00', 16, 3, 1, 0, 1, 6, 12),
	(75, 3, 8, '17:22:00', 9, 2, 3, 1, 0, 3, 7),
	(76, 3, 5, '09:33:00', 3, 5, 0, 2, 1, 1, 3),
	(77, 3, 6, '11:48:00', 4, 2, 2, 1, 0, 2, 5),
	(78, 3, 16, '06:15:00', 2, 2, 1, 0, 0, 1, 2),
	(81, 2, 20, '00:00:01', 20, 20, 20, 20, 20, 20, 20),
	(40, 1, 7, '36:12:00', 28, 8, 9, 2, 3, 11, 22),
	(79, 1, 19, '00:01:40', 100, 10, 20, 15, 100, 100, 100);


--
-- Data for Name: user_achievement; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."user_achievement" ("user_id", "achievement_id", "date_unlocked") VALUES
	('ac3a5447-1b6f-4324-8830-5ddc2d7b2c47', 1, '2026-04-14 00:28:09.160732+00'),
	('ac3a5447-1b6f-4324-8830-5ddc2d7b2c47', 2, '2026-04-14 00:28:09.160732+00'),
	('ac3a5447-1b6f-4324-8830-5ddc2d7b2c47', 3, '2026-04-14 00:28:09.160732+00'),
	('ac3a5447-1b6f-4324-8830-5ddc2d7b2c47', 4, '2026-04-14 00:28:09.160732+00'),
	('ac3a5447-1b6f-4324-8830-5ddc2d7b2c47', 5, '2026-04-14 00:28:09.160732+00'),
	('ac3a5447-1b6f-4324-8830-5ddc2d7b2c47', 6, '2026-04-14 00:28:09.160732+00'),
	('a8c3b01e-febc-470c-aaca-37a679fee2db', 1, '2026-01-15 14:30:00+00'),
	('a8c3b01e-febc-470c-aaca-37a679fee2db', 2, '2026-02-20 18:45:00+00'),
	('a8c3b01e-febc-470c-aaca-37a679fee2db', 3, '2026-03-10 12:00:00+00'),
	('a8c3b01e-febc-470c-aaca-37a679fee2db', 6, '2026-04-01 20:15:00+00');


--
-- Data for Name: user_card; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."user_card" ("user_id", "unlocked", "card_id") VALUES
	('ac3a5447-1b6f-4324-8830-5ddc2d7b2c47', true, 'f06f105c-b191-4757-a21e-8ccbb3768e98'),
	('ac3a5447-1b6f-4324-8830-5ddc2d7b2c47', true, 'b3f0f18c-a30c-4c7d-83e6-27fa4bae5cbb'),
	('a8c3b01e-febc-470c-aaca-37a679fee2db', true, 'f06f105c-b191-4757-a21e-8ccbb3768e98'),
	('a8c3b01e-febc-470c-aaca-37a679fee2db', true, 'b3f0f18c-a30c-4c7d-83e6-27fa4bae5cbb');


--
-- Data for Name: user_event; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."user_event" ("user_event_id", "user_id", "event_id", "result", "user_score", "opponent_score", "points", "rebounds", "assists", "rated_others") OVERRIDING SYSTEM VALUE VALUES
	(2, 'ac3a5447-1b6f-4324-8830-5ddc2d7b2c47', 39, NULL, NULL, NULL, NULL, NULL, NULL, false),
	(4, 'e4c6c3f4-46ab-4b25-b8e5-52419db25d3f', 39, NULL, NULL, NULL, NULL, NULL, NULL, false),
	(6, '9eec2cc7-0552-4f95-945d-866aa3de4faa', 39, NULL, NULL, NULL, NULL, NULL, NULL, false),
	(1, '706bc30f-68fd-4dab-9517-6ac7285d4e33', 39, NULL, NULL, NULL, NULL, NULL, NULL, true),
	(3, 'c7855248-e94f-4651-bad5-c48592e5c269', 39, NULL, NULL, NULL, NULL, NULL, NULL, true),
	(5, 'a8c3b01e-febc-470c-aaca-37a679fee2db', 39, NULL, NULL, NULL, NULL, NULL, NULL, false),
	(12, '9eec2cc7-0552-4f95-945d-866aa3de4faa', 21, NULL, NULL, NULL, NULL, NULL, NULL, false);


--
-- Data for Name: user_event_ratings; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."user_event_ratings" ("user_event_rating_id", "user_event_id", "rated_user_id", "rating", "date_rated") OVERRIDING SYSTEM VALUE VALUES
	(11, 1, 'a8c3b01e-febc-470c-aaca-37a679fee2db', 5.00, '2026-04-14 00:23:41.889404+00'),
	(12, 1, 'c7855248-e94f-4651-bad5-c48592e5c269', 5.00, '2026-04-14 00:23:42.279721+00'),
	(15, 1, 'ac3a5447-1b6f-4324-8830-5ddc2d7b2c47', 5.00, '2026-04-14 00:23:46.03655+00'),
	(21, 3, 'a8c3b01e-febc-470c-aaca-37a679fee2db', 4.00, '2026-04-14 01:22:18.691194+00'),
	(22, 3, 'ac3a5447-1b6f-4324-8830-5ddc2d7b2c47', 5.00, '2026-04-14 01:22:18.697635+00'),
	(24, 3, '706bc30f-68fd-4dab-9517-6ac7285d4e33', 5.00, '2026-04-14 01:22:18.716066+00'),
	(25, 3, '9eec2cc7-0552-4f95-945d-866aa3de4faa', 5.00, '2026-04-14 01:22:18.711204+00'),
	(23, 3, 'e4c6c3f4-46ab-4b25-b8e5-52419db25d3f', 5.00, '2026-04-14 01:22:18.664639+00'),
	(14, 1, '9eec2cc7-0552-4f95-945d-866aa3de4faa', 5.00, '2026-04-14 00:23:45.822106+00'),
	(13, 1, 'e4c6c3f4-46ab-4b25-b8e5-52419db25d3f', 5.00, '2026-04-14 00:23:45.89769+00');


--
-- Data for Name: user_report; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."user_report" ("ureport_id", "event_id", "reported_user_id", "reporter_user_id", "comment", "priority", "status", "created_at", "key_words") VALUES
	(210, 42, 'fbaaa5cf-814b-4d65-b4e7-7ec19fcd94ee', '9eec2cc7-0552-4f95-945d-866aa3de4faa', 'They didn''t follow any of the rules.', 'Low', 'Pending', '2026-04-14 21:34:55+00', NULL),
	(342, 1, 'ac3a5447-1b6f-4324-8830-5ddc2d7b2c47', 'd6aa5592-1373-4398-90ee-e5e45cd4a287', 'She didn''t apologize when she hit me.', 'Low', 'Pending', '2026-04-23 03:41:15+00', '{Aggressive,Toxic}'),
	(421, 21, '16870c9b-33e7-4aed-8f70-5936e823deb2', 'c7855248-e94f-4651-bad5-c48592e5c269', 'They play dirty.', 'Medium', 'Pending', '2026-04-13 02:31:45+00', '{Toxic}'),
	(653, 19, 'e4c6c3f4-46ab-4b25-b8e5-52419db25d3f', '9eec2cc7-0552-4f95-945d-866aa3de4faa', 'The player kept insulting their teammates and even pulled someoneÔÇÖs hair. They played very rough.', 'High', 'Reviewed', '2026-04-07 23:33:26+00', '{Aggressive,Insulting,Toxic}'),
	(645, 42, '16870c9b-33e7-4aed-8f70-5936e823deb2', '9eec2cc7-0552-4f95-945d-866aa3de4faa', 'he was being a bully!!', 'Medium', 'Pending', '2026-04-08 02:45:38+00', '{Aggressive,Insulting,Toxic}');


--
-- Data for Name: user_vote; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."user_vote" ("id", "user_id", "bracket_id", "bracket_question_id_voted", "date_voted", "won") VALUES
	(1, 'ac3a5447-1b6f-4324-8830-5ddc2d7b2c47', 1, 1, '2026-04-12 17:15:52.568677+00', NULL),
	(2, 'a8c3b01e-febc-470c-aaca-37a679fee2db', 1, 1, '2026-04-12 18:30:00+00', NULL),
	(3, 'a8c3b01e-febc-470c-aaca-37a679fee2db', 2, 5, '2026-04-03 14:20:00+00', true),
	(4, 'a8c3b01e-febc-470c-aaca-37a679fee2db', 3, 3, '2026-04-14 09:00:00+00', NULL),
	(5, '3f3e4d60-f9e9-4c0b-8856-dbff1a66e8b2', 3, 4, '2026-04-14 10:00:00+00', NULL),
	(6, 'b6ceb5fa-017d-4582-b23a-128ab1bda35a', 3, 4, '2026-04-14 11:00:00+00', NULL),
	(7, '372280a1-c9b3-4a10-8204-b24cfe617994', 3, 3, '2026-04-14 12:00:00+00', NULL);


--
-- Data for Name: team; Type: TABLE DATA; Schema: simulacion_juego; Owner: postgres
--

INSERT INTO "simulacion_juego"."team" ("team_id", "team_name", "logo_url", "abreviatura") VALUES
	(1, 'Los Angeles Lakers', 'https://ptbcoxaguvbwprxdundz.supabase.co/storage/v1/object/public/team-logos/Los_Angeles_Lakers_logo.svg.png', 'LA'),
	(2, 'Golden State Warriors', 'https://ptbcoxaguvbwprxdundz.supabase.co/storage/v1/object/public/team-logos/warriors.png', 'GSW'),
	(3, 'Oklahoma City Thunder', 'https://ptbcoxaguvbwprxdundz.supabase.co/storage/v1/object/public/team-logos/OklahomaCity.png', 'OKC'),
	(4, 'Denver Nuggets', 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/nba/500/den.png', 'DEN');


--
-- Data for Name: game; Type: TABLE DATA; Schema: simulacion_juego; Owner: postgres
--

INSERT INTO "simulacion_juego"."game" ("game_id", "opposing_team_id", "home", "attended", "venue", "start_date", "current_quarter_start", "current_quarter", "game_end_time", "defense", "won") VALUES
	(7, 3, true, 13230, 'Professional Fields', '2025-04-05 02:25:00+00', '2025-04-05 02:25:00+00', 5, '2025-04-05 03:56:32+00', false, false),
	(2, 2, false, NULL, 'Mi cada', '2026-04-02 16:41:35+00', '2026-04-02 18:47:40+00', 5, '2026-04-02 18:47:40+00', false, false),
	(3, 3, false, 18997, 'crypto.com Arena', '2026-04-07 20:30:00+00', '2026-04-07 21:37:00+00', 5, '2026-04-07 21:37:00+00', false, true),
	(5, 3, false, NULL, 'en mi casa', '2026-04-15 19:55:48+00', '2026-04-15 21:12:40+00', 0, '2026-04-15 21:12:40+00', false, false),
	(4, 2, true, NULL, 'Arena', '2026-04-27 00:30:30+00', NULL, 0, NULL, false, false),
	(6, 3, false, NULL, 'Sport Arena', '2026-05-20 02:00:00+00', '2026-05-20 02:00:00+00', 0, NULL, false, false),
	(1, 2, true, 17071, 'Crypto.com Arena', '2026-04-17 11:34:10+00', NULL, 1, NULL, false, true);


--
-- Data for Name: team_player; Type: TABLE DATA; Schema: simulacion_juego; Owner: postgres
--

INSERT INTO "simulacion_juego"."team_player" ("team_player_id", "first_name", "last_name", "team_id", "photo_url") VALUES
	(1, 'Deandre', 'Ayton', 1, 'https://a.espncdn.com/combiner/i?img=/i/headshots/nba/players/full/4278129.png&w=350&h=254'),
	(2, 'Kobe', 'Bufkin', 1, 'https://a.espncdn.com/combiner/i?img=/i/headshots/nba/players/full/4278129.png&w=350&h=254'),
	(3, 'Luka', 'Doncic', 1, 'https://a.espncdn.com/combiner/i?img=/i/headshots/nba/players/full/3945274.png&w=350&h=254'),
	(4, 'Rui', 'Hachimura', 1, 'https://a.espncdn.com/combiner/i?img=/i/headshots/nba/players/full/4066648.png'),
	(5, 'Jaxson', 'Hayes', 1, 'https://a.espncdn.com/combiner/i?img=/i/headshots/nba/players/full/4397077.png&w=350&h=254'),
	(6, 'Bronny', 'James', 1, 'https://a.espncdn.com/combiner/i?img=/i/headshots/nba/players/full/4683774.png&w=350&h=254'),
	(7, 'LeBron', 'James', 1, 'https://cdn.nba.com/headshots/nba/latest/1040x760/2544.png'),
	(8, 'Luke', 'Kennard', 1, 'https://a.espncdn.com/combiner/i?img=/i/headshots/nba/players/full/3913174.png'),
	(9, 'Maxi', 'Kleber', 1, 'https://a.espncdn.com/combiner/i?img=/i/headshots/nba/players/full/2960236.png'),
	(10, 'Dalton', 'Knecht', 1, 'https://a.espncdn.com/combiner/i?img=/i/headshots/nba/players/full/4897943.png'),
	(11, 'Jake', 'LaRavia', 1, 'https://a.espncdn.com/combiner/i?img=/i/headshots/nba/players/full/4683774.png&w=350&h=254'),
	(12, 'Chris', 'Manon', 1, 'https://a.espncdn.com/combiner/i?img=/i/headshots/nba/players/full/4683774.png&w=350&h=254'),
	(13, 'Austin', 'Reaves', 1, 'https://a.espncdn.com/combiner/i?img=/i/headshots/nba/players/full/4066457.png'),
	(14, 'Marcus', 'Smart', 1, 'https://a.espncdn.com/combiner/i?img=/i/headshots/nba/players/full/2990992.png'),
	(15, 'Nick', 'Smith Jr.', 1, 'https://a.espncdn.com/combiner/i?img=/i/headshots/nba/players/full/4683774.png&w=350&h=254'),
	(16, 'Adou', 'Thiero', 1, 'https://a.espncdn.com/combiner/i?img=/i/headshots/nba/players/full/5060631.png&w=350&h=254'),
	(17, 'Drew', 'Timme', 1, 'https://a.espncdn.com/combiner/i?img=/i/headshots/nba/players/full/4683774.png&w=350&h=254'),
	(18, 'Jarred', 'Vanderbilt', 1, 'https://a.espncdn.com/combiner/i?img=/i/headshots/nba/players/full/4278077.png'),
	(19, 'Golden State', 'Warriors', 2, NULL),
	(20, 'Oklahoma City', 'Thunder', 3, NULL),
	(21, 'Denver', 'Nuggets', 4, NULL);


--
-- Data for Name: team_player_stats; Type: TABLE DATA; Schema: simulacion_juego; Owner: postgres
--

INSERT INTO "simulacion_juego"."team_player_stats" ("team_player_stats_id", "game_id", "team_player_id", "minutes", "points", "rebounds", "assists", "steals", "turnovers", "field_made", "field_attempted") VALUES
	(7, 1, 7, '36:12:00', 33, 8, 9, 2, 3, 11, 22),
	(8, 1, 3, '34:45:00', 32, 14, 3, 1, 2, 12, 19),
	(9, 1, 13, '32:08:00', 18, 4, 6, 1, 1, 7, 14),
	(10, 1, 4, '26:50:00', 16, 5, 2, 1, 1, 6, 11),
	(11, 1, 1, '28:33:00', 14, 9, 3, 2, 2, 5, 12),
	(12, 1, 18, '22:17:00', 6, 9, 2, 3, 0, 2, 5),
	(13, 1, 14, '20:40:00', 12, 3, 4, 2, 1, 4, 9),
	(14, 1, 9, '18:22:00', 8, 7, 1, 0, 2, 3, 7),
	(15, 1, 10, '16:55:00', 11, 2, 1, 1, 1, 4, 9),
	(16, 1, 8, '14:30:00', 6, 2, 2, 1, 0, 2, 5),
	(17, 1, 5, '12:18:00', 4, 3, 0, 1, 1, 2, 4),
	(18, 1, 6, '10:05:00', 3, 1, 1, 0, 0, 1, 3),
	(19, 1, 16, '07:25:00', 2, 2, 0, 0, 0, 1, 2),
	(20, 2, 7, '37:00:00', 35, 7, 11, 3, 4, 13, 25),
	(21, 2, 3, '33:18:00', 24, 12, 5, 1, 3, 9, 18),
	(22, 2, 13, '31:42:00', 22, 5, 5, 0, 2, 8, 15),
	(23, 2, 1, '29:50:00', 19, 11, 2, 2, 1, 7, 14),
	(24, 2, 4, '25:30:00', 10, 4, 1, 2, 1, 4, 10),
	(25, 2, 18, '23:44:00', 4, 11, 1, 2, 1, 2, 4),
	(26, 2, 14, '19:15:00', 9, 2, 6, 1, 0, 3, 8),
	(27, 2, 9, '17:50:00', 7, 6, 1, 0, 1, 3, 6),
	(28, 2, 10, '20:10:00', 14, 3, 2, 1, 2, 5, 11),
	(29, 2, 8, '13:25:00', 6, 1, 3, 0, 0, 2, 6),
	(30, 2, 5, '11:20:00', 6, 4, 1, 0, 2, 3, 5),
	(31, 2, 6, '15:38:00', 5, 2, 2, 1, 0, 2, 5),
	(32, 2, 16, '08:10:00', 0, 3, 0, 1, 0, 0, 2),
	(33, 3, 7, '38:30:00', 22, 10, 13, 1, 5, 8, 19),
	(34, 3, 3, '35:55:00', 29, 10, 8, 2, 2, 11, 20),
	(35, 3, 13, '33:20:00', 20, 3, 7, 2, 1, 7, 13),
	(36, 3, 1, '30:10:00', 17, 13, 2, 1, 2, 6, 12),
	(37, 3, 4, '24:15:00', 13, 6, 2, 1, 0, 5, 10),
	(38, 3, 18, '21:00:00', 5, 10, 3, 4, 1, 2, 4),
	(39, 3, 14, '18:45:00', 8, 3, 7, 2, 1, 3, 8),
	(40, 3, 9, '20:30:00', 6, 7, 1, 1, 0, 2, 6),
	(41, 3, 10, '15:00:00', 16, 3, 1, 0, 1, 6, 12),
	(42, 3, 8, '17:22:00', 9, 2, 3, 1, 0, 3, 7),
	(43, 3, 5, '09:33:00', 3, 5, 0, 2, 1, 1, 3),
	(44, 3, 6, '11:48:00', 4, 2, 2, 1, 0, 2, 5),
	(45, 3, 16, '06:15:00', 2, 2, 1, 0, 0, 1, 2),
	(48, 3, 20, '00:01:40', 67, 12, 7, 43, 13, 41, 51),
	(47, 1, 19, '00:01:40', 100, 100, 100, 100, 100, 100, 100),
	(49, 2, 20, '00:00:12', 1, 1, 1, 1, 1, 1, 1),
	(50, 4, 3, '00:00:36', 32, 8, 9, 2, 3, 12, 22),
	(51, 4, 7, '00:00:34', 28, 9, 8, 2, 4, 11, 21),
	(52, 4, 13, '00:00:32', 20, 5, 6, 1, 2, 8, 16),
	(53, 4, 1, '00:00:28', 16, 11, 2, 1, 1, 7, 13),
	(54, 4, 4, '00:00:26', 13, 6, 3, 1, 1, 5, 11),
	(55, 4, 18, '00:00:22', 9, 8, 2, 2, 1, 4, 9),
	(56, 4, 8, '00:00:18', 8, 3, 2, 1, 1, 3, 7),
	(57, 4, 14, '00:00:18', 10, 4, 4, 2, 2, 4, 8),
	(58, 4, 10, '00:00:14', 6, 2, 1, 1, 1, 2, 5),
	(59, 4, 9, '00:00:14', 5, 4, 1, 0, 1, 2, 4),
	(60, 4, 17, '00:00:12', 4, 3, 1, 0, 1, 2, 4),
	(61, 4, 16, '00:00:06', 2, 1, 0, 0, 0, 1, 2),
	(62, 4, 19, '00:04:00', 105, 44, 25, 9, 13, 39, 88),
	(63, 5, 3, '00:00:37', 34, 7, 10, 2, 3, 13, 23),
	(64, 5, 7, '00:00:35', 30, 8, 9, 3, 2, 12, 22),
	(65, 5, 13, '00:00:33', 22, 5, 5, 1, 2, 9, 18),
	(66, 5, 1, '00:00:29', 18, 12, 1, 1, 1, 7, 13),
	(67, 5, 4, '00:00:27', 14, 5, 4, 1, 2, 6, 12),
	(68, 5, 18, '00:00:23', 10, 9, 3, 2, 1, 5, 10),
	(69, 5, 8, '00:00:20', 9, 3, 2, 1, 1, 4, 8),
	(70, 5, 10, '00:00:18', 8, 2, 1, 1, 1, 3, 7),
	(71, 5, 9, '00:00:14', 6, 4, 1, 0, 1, 2, 5),
	(72, 5, 17, '00:00:12', 5, 3, 1, 0, 1, 2, 4),
	(73, 5, 16, '00:00:08', 3, 2, 0, 0, 0, 1, 3),
	(74, 5, 6, '00:00:04', 2, 1, 1, 0, 0, 1, 2),
	(75, 5, 20, '00:04:00', 110, 46, 27, 10, 14, 41, 90),
	(76, 6, 3, '00:00:38', 36, 8, 11, 2, 4, 14, 25),
	(77, 6, 7, '00:00:36', 31, 10, 9, 3, 3, 12, 23),
	(78, 6, 13, '00:00:34', 24, 5, 6, 2, 2, 10, 19),
	(79, 6, 1, '00:00:30', 18, 13, 2, 1, 1, 8, 14),
	(80, 6, 18, '00:00:26', 11, 10, 3, 2, 1, 5, 10),
	(81, 6, 14, '00:00:24', 13, 4, 4, 2, 2, 5, 10),
	(82, 6, 8, '00:00:20', 9, 3, 2, 1, 1, 4, 8),
	(83, 6, 10, '00:00:18', 8, 2, 1, 1, 1, 3, 7),
	(84, 6, 9, '00:00:16', 7, 4, 1, 0, 1, 3, 6),
	(85, 6, 17, '00:00:12', 5, 3, 1, 0, 1, 2, 4),
	(86, 6, 16, '00:00:08', 3, 2, 0, 0, 0, 1, 3),
	(87, 6, 6, '00:00:04', 2, 1, 1, 0, 0, 1, 2),
	(88, 6, 20, '00:04:00', 108, 45, 25, 8, 12, 40, 87),
	(89, 7, 3, '00:00:40', 38, 9, 12, 3, 3, 15, 27),
	(90, 7, 7, '00:00:38', 34, 11, 10, 2, 4, 13, 24),
	(91, 7, 13, '00:00:35', 26, 6, 7, 2, 2, 11, 20),
	(92, 7, 1, '00:00:31', 20, 14, 2, 1, 1, 8, 15),
	(93, 7, 4, '00:00:28', 14, 6, 4, 1, 2, 6, 12),
	(94, 7, 18, '00:00:25', 11, 10, 3, 2, 1, 5, 9),
	(95, 7, 8, '00:00:22', 10, 3, 2, 1, 1, 4, 8),
	(96, 7, 14, '00:00:20', 12, 4, 4, 2, 2, 5, 9),
	(97, 7, 10, '00:00:16', 8, 2, 1, 1, 1, 3, 7),
	(98, 7, 9, '00:00:14', 6, 4, 1, 0, 1, 2, 5),
	(99, 7, 17, '00:00:10', 4, 3, 1, 0, 1, 2, 4),
	(100, 7, 16, '00:00:06', 3, 2, 0, 0, 0, 1, 3),
	(101, 7, 20, '00:04:00', 112, 48, 27, 11, 15, 42, 92);


--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

INSERT INTO "storage"."buckets" ("id", "name", "owner", "created_at", "updated_at", "public", "avif_autodetection", "file_size_limit", "allowed_mime_types", "owner_id", "type") VALUES
	('team-logos', 'team-logos', NULL, '2026-03-12 20:03:28.275604+00', '2026-03-12 20:03:28.275604+00', true, false, NULL, NULL, NULL, 'STANDARD'),
	('videogame', 'videogame', NULL, '2026-03-12 20:15:38.964476+00', '2026-03-12 20:15:38.964476+00', false, false, NULL, NULL, NULL, 'STANDARD'),
	('user_images', 'user_images', NULL, '2026-03-12 20:11:26.36832+00', '2026-03-12 20:11:26.36832+00', true, false, NULL, NULL, NULL, 'STANDARD');


--
-- Data for Name: buckets_analytics; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: buckets_vectors; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

INSERT INTO "storage"."objects" ("id", "bucket_id", "name", "owner", "created_at", "updated_at", "last_accessed_at", "metadata", "version", "owner_id", "user_metadata") VALUES
	('4fa83874-a88f-4234-855d-8bf2795d60b6', 'team-logos', 'Los_Angeles_Lakers_logo.svg.png', NULL, '2026-03-12 20:03:38.067092+00', '2026-03-12 20:03:38.067092+00', '2026-03-12 20:03:38.067092+00', '{"eTag": "\"9f877b1a451a56d15fd326d2872daa42-1\"", "size": 434983, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-03-12T20:03:38.000Z", "contentLength": 434983, "httpStatusCode": 200}', '4e2ec07c-cb68-405f-baa8-6d4786173e24', NULL, NULL),
	('5c4c1274-5096-4ce2-b890-110bcd9a4757', 'team-logos', 'Golden_State_Warriors_logo.svg.png', NULL, '2026-03-12 20:03:42.179964+00', '2026-03-12 20:03:42.179964+00', '2026-03-12 20:03:42.179964+00', '{"eTag": "\"f9db7a58e1d6a2d7584c6df4ae0c28cf-1\"", "size": 225125, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-03-12T20:03:42.000Z", "contentLength": 225125, "httpStatusCode": 200}', '8a405cb3-aecb-4b53-95c0-00edced9de26', NULL, NULL),
	('ca7ac626-0e63-4484-a419-cce67a8e7fde', 'user_images', 'imagen1.jpg', NULL, '2026-03-12 20:11:54.740638+00', '2026-03-12 20:11:54.740638+00', '2026-03-12 20:11:54.740638+00', '{"eTag": "\"a0f1dc441aa950e90294099264940e42-1\"", "size": 104605, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-03-12T20:11:55.000Z", "contentLength": 104605, "httpStatusCode": 200}', 'a3546e68-23ae-469d-8b14-a915de12cfa7', NULL, NULL),
	('01465462-89ff-466c-ab07-b0c678710433', 'videogame', 'lebron.jpg', NULL, '2026-03-12 20:15:48.704568+00', '2026-03-12 20:15:48.704568+00', '2026-03-12 20:15:48.704568+00', '{"eTag": "\"68a0b69fb758ed536d98a7cab00cc77d-1\"", "size": 30200, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-03-12T20:15:49.000Z", "contentLength": 30200, "httpStatusCode": 200}', '8cf6ddab-46db-4f34-a60b-7cbbf9705e48', NULL, NULL),
	('50851246-4a08-46a7-a057-1719434a90b1', 'videogame', 'pixel_lebron.png', NULL, '2026-03-12 20:15:48.929551+00', '2026-03-12 20:15:48.929551+00', '2026-03-12 20:15:48.929551+00', '{"eTag": "\"46e57b0e7de17ba4f70eb5f9eb29c638-1\"", "size": 1307923, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-03-12T20:15:49.000Z", "contentLength": 1307923, "httpStatusCode": 200}', '5a920025-261d-48ba-b9d1-7168d4bfcd1b', NULL, NULL),
	('deec04b5-fe8d-4864-a0ee-183c8f90fab3', 'videogame', 'pixel_jake_laravia.jpeg', NULL, '2026-03-12 22:57:47.463591+00', '2026-03-12 22:57:47.463591+00', '2026-03-12 22:57:47.463591+00', '{"eTag": "\"4cd4fbf48a82e6d84c818eabce2fa0bf-1\"", "size": 49433, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-03-12T22:57:48.000Z", "contentLength": 49433, "httpStatusCode": 200}', 'bb4dbab9-6127-48c0-ac4a-42e46b1a29c2', NULL, NULL),
	('835395e2-fae1-4832-8fbb-9eed28a03687', 'videogame', 'jake_laravia.png', NULL, '2026-03-12 22:57:47.618012+00', '2026-03-12 22:57:47.618012+00', '2026-03-12 22:57:47.618012+00', '{"eTag": "\"e2ae89a5799d54f63143ec57fcfd41c3-1\"", "size": 230308, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-03-12T22:57:48.000Z", "contentLength": 230308, "httpStatusCode": 200}', '500af738-b8c2-460b-9f74-3ff0ce84ccd6', NULL, NULL),
	('c5c3913b-b898-4ed2-8177-e761ab22967b', 'team-logos', 'OklahomaCity.png', NULL, '2026-04-08 18:37:47.643566+00', '2026-04-08 18:37:47.643566+00', '2026-04-08 18:37:47.643566+00', '{"eTag": "\"5aa4569a9461836b7be795ad9a59eed2-1\"", "size": 15708, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-04-08T18:37:48.000Z", "contentLength": 15708, "httpStatusCode": 200}', '0669cf0f-57db-4ebf-a66a-85818b09874d', NULL, NULL),
	('a509034e-ac11-461f-99aa-25e8ae7ae8c5', 'team-logos', 'lakers.png', NULL, '2026-04-10 00:39:59.304445+00', '2026-04-10 00:39:59.304445+00', '2026-04-10 00:39:59.304445+00', '{"eTag": "\"8bce4d60202c35c732c416d1ae7b4ae9-1\"", "size": 15905, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-04-10T00:39:59.000Z", "contentLength": 15905, "httpStatusCode": 200}', 'dec9df8d-d842-4514-a8ff-8ed04d8e7bdb', NULL, NULL),
	('c2e09339-9d17-47c6-80a5-81833c6c35f1', 'team-logos', 'warriors.png', NULL, '2026-04-10 00:41:05.760585+00', '2026-04-10 00:41:05.760585+00', '2026-04-10 00:41:05.760585+00', '{"eTag": "\"ccc4ca07ac380d6d28ee5ff97dfda394-1\"", "size": 19414, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-04-10T00:41:06.000Z", "contentLength": 19414, "httpStatusCode": 200}', '24148a6a-48b3-4829-8993-2839af368c0a', NULL, NULL),
	('661bd4b2-dfdc-4b61-b69f-41367ec1742b', 'user_images', 'skymaligna.jpg', NULL, '2026-04-13 01:25:18.460918+00', '2026-04-13 01:25:18.460918+00', '2026-04-13 01:25:18.460918+00', '{"eTag": "\"9528f6f2730f5017e1cf040cfc4b93ec-1\"", "size": 23959, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-04-13T01:25:19.000Z", "contentLength": 23959, "httpStatusCode": 200}', '3f1fb612-02d5-416c-81f4-7a36b6b235a8', NULL, NULL),
	('f8af336f-3266-4bc7-9e1a-a32a09330cab', 'user_images', 'bicilover.jpg', NULL, '2026-04-13 01:34:30.048192+00', '2026-04-13 01:34:30.048192+00', '2026-04-13 01:34:30.048192+00', '{"eTag": "\"152facf548b595c0b7f641bdf1500402-1\"", "size": 257269, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-04-13T01:34:30.000Z", "contentLength": 257269, "httpStatusCode": 200}', 'b76d7417-04f8-4086-8728-4ccf8ddaf376', NULL, NULL),
	('baeecec6-70ff-43a2-bf5d-860d763c3d30', 'user_images', 'rockythebeagle.jpg', NULL, '2026-04-13 01:39:14.935085+00', '2026-04-13 01:39:14.935085+00', '2026-04-13 01:39:14.935085+00', '{"eTag": "\"e0a136b46cbb6618311002c1877821e7-1\"", "size": 220561, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-04-13T01:39:15.000Z", "contentLength": 220561, "httpStatusCode": 200}', '5ba7fdd0-41cc-4894-a5a1-f0b08ac92d5c', NULL, NULL),
	('94fde547-185b-4963-8c71-dddc3174d1c6', 'user_images', 'adolfo.png', NULL, '2026-04-13 01:46:10.854037+00', '2026-04-13 01:46:10.854037+00', '2026-04-13 01:46:10.854037+00', '{"eTag": "\"fb2cde8638092151135b15aea04312d3-1\"", "size": 5264, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-04-13T01:46:11.000Z", "contentLength": 5264, "httpStatusCode": 200}', 'b9966565-22ad-45f2-8734-b37c124c82ee', NULL, NULL),
	('640c854d-ce86-47f0-a52e-d38886a27b0d', 'user_images', 'thegoat.jpg', NULL, '2026-04-13 01:52:54.674566+00', '2026-04-13 01:52:54.674566+00', '2026-04-13 01:52:54.674566+00', '{"eTag": "\"ef5fce51d9f6994c0183f606064656d3-1\"", "size": 37231, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-04-13T01:52:55.000Z", "contentLength": 37231, "httpStatusCode": 200}', 'cb5c33f6-8613-48c9-af21-aa58dba12153', NULL, NULL),
	('cb275a8e-41c2-4af5-8733-10390cd3dde7', 'user_images', 'lebron.jpg', NULL, '2026-04-13 01:58:23.136407+00', '2026-04-13 01:58:23.136407+00', '2026-04-13 01:58:23.136407+00', '{"eTag": "\"bc9fa8ca494f09c96cabfc6d952a3a88-1\"", "size": 59769, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-04-13T01:58:23.000Z", "contentLength": 59769, "httpStatusCode": 200}', '29a68179-5d1a-46cc-8af0-8d773bbef75d', NULL, NULL),
	('6f42f35b-2712-40ab-aebe-363a775331bf', 'user_images', 'avatars/ac3a5447-1b6f-4324-8830-5ddc2d7b2c47-1776121547361.jpg', 'a8c3b01e-febc-470c-aaca-37a679fee2db', '2026-04-13 23:05:48.151447+00', '2026-04-13 23:05:48.151447+00', '2026-04-13 23:05:48.151447+00', '{"eTag": "\"ec9a11be5347fb4688e501a60e66136d\"", "size": 83176, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-04-13T23:05:49.000Z", "contentLength": 83176, "httpStatusCode": 200}', 'f5b4a71a-17de-4a76-ad8f-c1d9a45e9855', 'a8c3b01e-febc-470c-aaca-37a679fee2db', '{}'),
	('8a018cb5-32da-49b4-82e6-8114456b4e0a', 'user_images', 'Amparo_LOGO.png', NULL, '2026-04-13 23:32:29.212553+00', '2026-04-13 23:32:29.212553+00', '2026-04-13 23:32:29.212553+00', '{"eTag": "\"1b96cbf894a16455eec6e16d3e6caa73-1\"", "size": 237717, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-04-13T23:32:29.000Z", "contentLength": 237717, "httpStatusCode": 200}', 'f1ae04af-7a38-4dc6-9414-dc7d77d19d24', NULL, NULL),
	('30f243f4-3091-4f2f-a498-8fef95b2923f', 'user_images', 'imagen2.jpg', NULL, '2026-04-14 00:38:09.503821+00', '2026-04-14 00:38:09.503821+00', '2026-04-14 00:38:09.503821+00', '{"eTag": "\"a3248e7cb56ef1600ab7ebb51417afc8-1\"", "size": 35802, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-04-14T00:38:10.000Z", "contentLength": 35802, "httpStatusCode": 200}', '97ba3dd8-1d39-4636-b885-88323b05cf34', NULL, NULL),
	('61192d8c-2245-4b60-827e-baba4bd0962f', 'user_images', 'profile_picture_default.png', NULL, '2026-04-14 03:00:55.793095+00', '2026-04-14 03:00:55.793095+00', '2026-04-14 03:00:55.793095+00', '{"eTag": "\"ff8f8e3da2e9ae2dfacd09ea3b9955b7-1\"", "size": 2872, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-04-14T03:00:56.000Z", "contentLength": 2872, "httpStatusCode": 200}', 'e08bd777-6eaf-4d71-9968-aea5aeb147a5', NULL, NULL),
	('c0569166-c153-48b2-9dec-dbe0bd6d7fc5', 'user_images', 'avatars/165c8626-2c35-4ebe-aac1-bc0c797a1376-1776151963151.jpg', '165c8626-2c35-4ebe-aac1-bc0c797a1376', '2026-04-14 07:32:43.718659+00', '2026-04-14 07:32:43.718659+00', '2026-04-14 07:32:43.718659+00', '{"eTag": "\"027b82c108a1d264dd63220ed7b2f15f\"", "size": 32964, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-04-14T07:32:44.000Z", "contentLength": 32964, "httpStatusCode": 200}', '96bdcc08-0c16-44ec-b794-5c4f59a68592', '165c8626-2c35-4ebe-aac1-bc0c797a1376', '{}'),
	('3f6f3149-2d13-4b46-b3a6-959c0fad3b8a', 'user_images', 'avatars/a8c3b01e-febc-470c-aaca-37a679fee2db-1776155756817.png', 'a8c3b01e-febc-470c-aaca-37a679fee2db', '2026-04-14 08:35:57.764101+00', '2026-04-14 08:35:57.764101+00', '2026-04-14 08:35:57.764101+00', '{"eTag": "\"bb08146d586ff050b17b1fa953f5bdce\"", "size": 2608483, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-04-14T08:35:58.000Z", "contentLength": 2608483, "httpStatusCode": 200}', '3454f0da-c6fc-4114-a622-0b97151b6aef', 'a8c3b01e-febc-470c-aaca-37a679fee2db', '{}'),
	('db4de612-aef9-45e2-bc1f-f438432014f7', 'user_images', 'avatars/3f3e4d60-f9e9-4c0b-8856-dbff1a66e8b2-1776173704611.jpg', '3f3e4d60-f9e9-4c0b-8856-dbff1a66e8b2', '2026-04-14 13:35:05.454914+00', '2026-04-14 13:35:05.454914+00', '2026-04-14 13:35:05.454914+00', '{"eTag": "\"bb4dcb7a91e59744e0ac55b97a98498e\"", "size": 58738, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-04-14T13:35:06.000Z", "contentLength": 58738, "httpStatusCode": 200}', '72f83222-8b60-44b2-9539-4537595305a3', '3f3e4d60-f9e9-4c0b-8856-dbff1a66e8b2', '{}'),
	('315871ae-69e6-4fa3-80ba-5fb5873ce48e', 'user_images', 'avatars/e9c9fa0e-6179-4023-80d3-03d4475ccdd6-1776173839126.png', 'e9c9fa0e-6179-4023-80d3-03d4475ccdd6', '2026-04-14 13:37:24.423277+00', '2026-04-14 13:37:24.423277+00', '2026-04-14 13:37:24.423277+00', '{"eTag": "\"e732abf7936b84f35119c9cae84ed1a5\"", "size": 1481542, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-04-14T13:37:25.000Z", "contentLength": 1481542, "httpStatusCode": 200}', 'e75c06b4-4990-4b1e-9f11-84e3fc40d762', 'e9c9fa0e-6179-4023-80d3-03d4475ccdd6', '{}'),
	('4dfd225e-c245-4709-a7f5-69bc5904c519', 'user_images', 'avatars/b6ceb5fa-017d-4582-b23a-128ab1bda35a-1776173928827.png', 'b6ceb5fa-017d-4582-b23a-128ab1bda35a', '2026-04-14 13:38:50.196363+00', '2026-04-14 13:38:50.196363+00', '2026-04-14 13:38:50.196363+00', '{"eTag": "\"e89cc27ba51028b70d285f324d66e648\"", "size": 164282, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-04-14T13:38:51.000Z", "contentLength": 164282, "httpStatusCode": 200}', 'af716414-e674-4117-a03d-85f48408519e', 'b6ceb5fa-017d-4582-b23a-128ab1bda35a', '{}'),
	('91d7bf38-dd9d-477f-be51-b17166b70653', 'user_images', 'avatars/372280a1-c9b3-4a10-8204-b24cfe617994-1776174065926.png', '372280a1-c9b3-4a10-8204-b24cfe617994', '2026-04-14 13:41:08.174607+00', '2026-04-14 13:41:08.174607+00', '2026-04-14 13:41:08.174607+00', '{"eTag": "\"7293abf10ba22c211092a040894a9f6e\"", "size": 497515, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-04-14T13:41:09.000Z", "contentLength": 497515, "httpStatusCode": 200}', '97d47e12-3f6f-46ca-84b8-22614ccf0ab6', '372280a1-c9b3-4a10-8204-b24cfe617994', '{}'),
	('623d3e50-e94f-4ffb-b2e7-c7c03cdda04a', 'user_images', 'avatars/5d5af46e-4edb-4dff-b4ed-cb94c7be5d86-1776174109177.jpg', '5d5af46e-4edb-4dff-b4ed-cb94c7be5d86', '2026-04-14 13:41:50.468343+00', '2026-04-14 13:41:50.468343+00', '2026-04-14 13:41:50.468343+00', '{"eTag": "\"a42d8c38366133897bba9da663674749\"", "size": 64849, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-04-14T13:41:51.000Z", "contentLength": 64849, "httpStatusCode": 200}', '05aea8e1-bc03-4221-b963-f4143ec7d876', '5d5af46e-4edb-4dff-b4ed-cb94c7be5d86', '{}'),
	('af20e724-ce44-4f16-a93b-c8898ae75fe3', 'user_images', 'avatars/793219d5-fe72-4e77-b733-a94beb340b69-1776174172292.png', '793219d5-fe72-4e77-b733-a94beb340b69', '2026-04-14 13:42:53.974871+00', '2026-04-14 13:42:53.974871+00', '2026-04-14 13:42:53.974871+00', '{"eTag": "\"529c72f44b63b2e049425dd75a7bd4a4\"", "size": 384066, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-04-14T13:42:54.000Z", "contentLength": 384066, "httpStatusCode": 200}', '7e7ea3f3-88f7-4a1d-8b02-1bce1628f38e', '793219d5-fe72-4e77-b733-a94beb340b69', '{}'),
	('f6466f92-8c7e-49bd-ae1d-80c71d04114d', 'user_images', 'avatars/9b2b2585-8e2c-4209-b316-fbb24748eba6-1776174309642.jpg', '9b2b2585-8e2c-4209-b316-fbb24748eba6', '2026-04-14 13:45:11.001283+00', '2026-04-14 13:45:11.001283+00', '2026-04-14 13:45:11.001283+00', '{"eTag": "\"dcaea6a25b269b40c4f7e3960ca8192e\"", "size": 73732, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-04-14T13:45:11.000Z", "contentLength": 73732, "httpStatusCode": 200}', '1b9a7c6e-99b8-4e2a-80f1-8a672d3ddb71', '9b2b2585-8e2c-4209-b316-fbb24748eba6', '{}'),
	('da2e5d55-8ef2-4514-94b8-0746e6f1d815', 'user_images', 'avatars/bdd6cbce-77d3-46a2-baee-09221eed2a40-1776174445643.jpeg', 'bdd6cbce-77d3-46a2-baee-09221eed2a40', '2026-04-14 13:47:27.070833+00', '2026-04-14 13:47:27.070833+00', '2026-04-14 13:47:27.070833+00', '{"eTag": "\"d11971505f7f505230ef1a38c6ed4003\"", "size": 130759, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-04-14T13:47:27.000Z", "contentLength": 130759, "httpStatusCode": 200}', '4855b3df-8991-4307-8cdc-5789fc41ae6e', 'bdd6cbce-77d3-46a2-baee-09221eed2a40', '{}'),
	('4c565136-5d3c-4d93-a3e8-e5d14e54d552', 'user_images', 'avatars/af5ed49a-4fd9-415d-9429-013e51f65a08-1776174499792.jpg', 'af5ed49a-4fd9-415d-9429-013e51f65a08', '2026-04-14 13:48:25.950342+00', '2026-04-14 13:48:25.950342+00', '2026-04-14 13:48:25.950342+00', '{"eTag": "\"8eb796fbf559b6ba8c106aab6922890c\"", "size": 1758200, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-04-14T13:48:26.000Z", "contentLength": 1758200, "httpStatusCode": 200}', 'e09ac6f1-6fc4-4cac-a2f4-a3440397aaab', 'af5ed49a-4fd9-415d-9429-013e51f65a08', '{}'),
	('0314e15d-3d39-4b67-965d-ad7f69407965', 'user_images', 'avatars/a8c3b01e-febc-470c-aaca-37a679fee2db-1776189631865.png', 'a8c3b01e-febc-470c-aaca-37a679fee2db', '2026-04-14 18:00:32.310172+00', '2026-04-14 18:00:32.310172+00', '2026-04-14 18:00:32.310172+00', '{"eTag": "\"f08fec8721f1761a9339eae8683cd50c\"", "size": 15905, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-04-14T18:00:33.000Z", "contentLength": 15905, "httpStatusCode": 200}', '85a91653-331c-4ed3-85ce-b101b6288e03', 'a8c3b01e-febc-470c-aaca-37a679fee2db', '{}'),
	('62cde951-6aad-4ff7-8bec-403c97ea3164', 'user_images', 'avatars/dd1eef03-ac09-4708-b010-5c78adb953d0-1776219944518.png', 'dd1eef03-ac09-4708-b010-5c78adb953d0', '2026-04-15 02:25:44.701306+00', '2026-04-15 02:25:44.701306+00', '2026-04-15 02:25:44.701306+00', '{"eTag": "\"de002740ca6bd7756c3d42f1292f8d35\"", "size": 634160, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-04-15T02:25:45.000Z", "contentLength": 634160, "httpStatusCode": 200}', 'a7e9b863-09b3-4269-aa98-84ed34908797', 'dd1eef03-ac09-4708-b010-5c78adb953d0', '{}');


--
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: vector_indexes; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('"auth"."refresh_tokens_id_seq"', 349, true);


--
-- Name: achievement_achievement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."achievement_achievement_id_seq"', 8, true);


--
-- Name: bracket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."bracket_id_seq"', 3, true);


--
-- Name: bracket_question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."bracket_question_id_seq"', 6, true);


--
-- Name: conversation_conversation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."conversation_conversation_id_seq"', 4, true);


--
-- Name: court_court_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."court_court_id_seq"', 9, true);


--
-- Name: event_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."event_event_id_seq"', 46, true);


--
-- Name: event_participant_event_participant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."event_participant_event_participant_id_seq"', 17, true);


--
-- Name: event_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."event_report_id_seq"', 1, false);


--
-- Name: friendship_friendship_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."friendship_friendship_id_seq"', 19, true);


--
-- Name: game_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."game_game_id_seq"', 2, true);


--
-- Name: gender_gender_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."gender_gender_id_seq"', 1, false);


--
-- Name: message_message_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."message_message_id_seq"', 25, true);


--
-- Name: skill_level_skill_level_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."skill_level_skill_level_id_seq"', 1, false);


--
-- Name: team_player_stats_team_player_stats_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."team_player_stats_team_player_stats_id_seq"', 81, true);


--
-- Name: team_player_team_player_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."team_player_team_player_id_seq"', 2, true);


--
-- Name: team_player_team_player_id_seq1; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."team_player_team_player_id_seq1"', 4, true);


--
-- Name: team_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."team_team_id_seq"', 1, false);


--
-- Name: user_event_ratings_user_event_rating_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."user_event_ratings_user_event_rating_id_seq"', 42, true);


--
-- Name: user_event_user_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."user_event_user_event_id_seq"', 12, true);


--
-- Name: user_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."user_report_id_seq"', 1, false);


--
-- Name: user_type_user_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."user_type_user_type_id_seq"', 1, false);


--
-- Name: user_vote_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."user_vote_id_seq"', 7, true);


--
-- Name: game_game_id_seq; Type: SEQUENCE SET; Schema: simulacion_juego; Owner: postgres
--

SELECT pg_catalog.setval('"simulacion_juego"."game_game_id_seq"', 3, true);


--
-- Name: team_player_stats_team_player_stats_id_seq; Type: SEQUENCE SET; Schema: simulacion_juego; Owner: postgres
--

SELECT pg_catalog.setval('"simulacion_juego"."team_player_stats_team_player_stats_id_seq"', 101, true);


--
-- Name: team_player_team_player_id_seq; Type: SEQUENCE SET; Schema: simulacion_juego; Owner: postgres
--

SELECT pg_catalog.setval('"simulacion_juego"."team_player_team_player_id_seq"', 5, true);


--
-- Name: team_team_id_seq; Type: SEQUENCE SET; Schema: simulacion_juego; Owner: postgres
--

SELECT pg_catalog.setval('"simulacion_juego"."team_team_id_seq"', 4, true);


--
-- PostgreSQL database dump complete
--

-- \unrestrict 4BFl1RxMeklosAPxSXwg1n1JgDqrJPQifseYR2RtmgSAxpFHIP48T6AFzinGzo7

RESET ALL;
