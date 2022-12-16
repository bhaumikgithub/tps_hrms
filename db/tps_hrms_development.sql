--
-- PostgreSQL database dump
--

-- Dumped from database version 10.22 (Ubuntu 10.22-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.22 (Ubuntu 10.22-0ubuntu0.18.04.1)

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

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: tps
--

CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.active_storage_attachments OWNER TO tps;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: tps
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_attachments_id_seq OWNER TO tps;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tps
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: tps
--

CREATE TABLE public.active_storage_blobs (
    id bigint NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    byte_size bigint NOT NULL,
    checksum character varying NOT NULL,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.active_storage_blobs OWNER TO tps;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: tps
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_blobs_id_seq OWNER TO tps;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tps
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: tps
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO tps;

--
-- Name: arrange_sessions; Type: TABLE; Schema: public; Owner: tps
--

CREATE TABLE public.arrange_sessions (
    id bigint NOT NULL,
    topic character varying,
    description character varying,
    date timestamp without time zone,
    timing time without time zone,
    speaker character varying,
    user_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    place character varying,
    applicants character varying
);


ALTER TABLE public.arrange_sessions OWNER TO tps;

--
-- Name: arrange_sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: tps
--

CREATE SEQUENCE public.arrange_sessions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.arrange_sessions_id_seq OWNER TO tps;

--
-- Name: arrange_sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tps
--

ALTER SEQUENCE public.arrange_sessions_id_seq OWNED BY public.arrange_sessions.id;


--
-- Name: asset_histories; Type: TABLE; Schema: public; Owner: tps
--

CREATE TABLE public.asset_histories (
    id bigint NOT NULL,
    user_id bigint,
    asset_id bigint,
    from_date timestamp without time zone,
    to_date timestamp without time zone,
    active boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    till_today boolean DEFAULT false
);


ALTER TABLE public.asset_histories OWNER TO tps;

--
-- Name: asset_histories_id_seq; Type: SEQUENCE; Schema: public; Owner: tps
--

CREATE SEQUENCE public.asset_histories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asset_histories_id_seq OWNER TO tps;

--
-- Name: asset_histories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tps
--

ALTER SEQUENCE public.asset_histories_id_seq OWNED BY public.asset_histories.id;


--
-- Name: asset_types; Type: TABLE; Schema: public; Owner: tps
--

CREATE TABLE public.asset_types (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.asset_types OWNER TO tps;

--
-- Name: asset_types_id_seq; Type: SEQUENCE; Schema: public; Owner: tps
--

CREATE SEQUENCE public.asset_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asset_types_id_seq OWNER TO tps;

--
-- Name: asset_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tps
--

ALTER SEQUENCE public.asset_types_id_seq OWNED BY public.asset_types.id;


--
-- Name: assets; Type: TABLE; Schema: public; Owner: tps
--

CREATE TABLE public.assets (
    id bigint NOT NULL,
    name character varying,
    bought_type character varying,
    code character varying,
    price character varying,
    specification text,
    current_status character varying,
    notes character varying,
    asset_type_id bigint,
    bill_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    warranty character varying
);


ALTER TABLE public.assets OWNER TO tps;

--
-- Name: assets_id_seq; Type: SEQUENCE; Schema: public; Owner: tps
--

CREATE SEQUENCE public.assets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.assets_id_seq OWNER TO tps;

--
-- Name: assets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tps
--

ALTER SEQUENCE public.assets_id_seq OWNED BY public.assets.id;


--
-- Name: audits; Type: TABLE; Schema: public; Owner: tps
--

CREATE TABLE public.audits (
    id bigint NOT NULL,
    auditable_id integer,
    auditable_type character varying,
    associated_id integer,
    associated_type character varying,
    user_id integer,
    user_type character varying,
    username character varying,
    action character varying,
    audited_changes text,
    version integer DEFAULT 0,
    comment character varying,
    remote_address character varying,
    request_uuid character varying,
    created_at timestamp without time zone
);


ALTER TABLE public.audits OWNER TO tps;

--
-- Name: audits_id_seq; Type: SEQUENCE; Schema: public; Owner: tps
--

CREATE SEQUENCE public.audits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.audits_id_seq OWNER TO tps;

--
-- Name: audits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tps
--

ALTER SEQUENCE public.audits_id_seq OWNED BY public.audits.id;


--
-- Name: bills; Type: TABLE; Schema: public; Owner: tps
--

CREATE TABLE public.bills (
    id bigint NOT NULL,
    number character varying,
    bill_date timestamp without time zone,
    discription character varying,
    amount numeric,
    status integer,
    paid_amount numeric,
    paid_from character varying,
    paid_via character varying,
    paid_notes text,
    gst_bill boolean,
    gst_uploaded timestamp without time zone,
    vendor_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.bills OWNER TO tps;

--
-- Name: bills_id_seq; Type: SEQUENCE; Schema: public; Owner: tps
--

CREATE SEQUENCE public.bills_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bills_id_seq OWNER TO tps;

--
-- Name: bills_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tps
--

ALTER SEQUENCE public.bills_id_seq OWNED BY public.bills.id;


--
-- Name: checklist_item_users; Type: TABLE; Schema: public; Owner: tps
--

CREATE TABLE public.checklist_item_users (
    id bigint NOT NULL,
    user_id bigint,
    checklist_item_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.checklist_item_users OWNER TO tps;

--
-- Name: checklist_item_users_id_seq; Type: SEQUENCE; Schema: public; Owner: tps
--

CREATE SEQUENCE public.checklist_item_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.checklist_item_users_id_seq OWNER TO tps;

--
-- Name: checklist_item_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tps
--

ALTER SEQUENCE public.checklist_item_users_id_seq OWNED BY public.checklist_item_users.id;


--
-- Name: checklist_items; Type: TABLE; Schema: public; Owner: tps
--

CREATE TABLE public.checklist_items (
    id bigint NOT NULL,
    name character varying,
    checklist_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.checklist_items OWNER TO tps;

--
-- Name: checklist_items_id_seq; Type: SEQUENCE; Schema: public; Owner: tps
--

CREATE SEQUENCE public.checklist_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.checklist_items_id_seq OWNER TO tps;

--
-- Name: checklist_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tps
--

ALTER SEQUENCE public.checklist_items_id_seq OWNED BY public.checklist_items.id;


--
-- Name: checklist_users; Type: TABLE; Schema: public; Owner: tps
--

CREATE TABLE public.checklist_users (
    id bigint NOT NULL,
    user_id bigint,
    checklist_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.checklist_users OWNER TO tps;

--
-- Name: checklist_users_id_seq; Type: SEQUENCE; Schema: public; Owner: tps
--

CREATE SEQUENCE public.checklist_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.checklist_users_id_seq OWNER TO tps;

--
-- Name: checklist_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tps
--

ALTER SEQUENCE public.checklist_users_id_seq OWNED BY public.checklist_users.id;


--
-- Name: checklists; Type: TABLE; Schema: public; Owner: tps
--

CREATE TABLE public.checklists (
    id bigint NOT NULL,
    category character varying,
    status integer DEFAULT 0,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    "position" integer
);


ALTER TABLE public.checklists OWNER TO tps;

--
-- Name: checklists_id_seq; Type: SEQUENCE; Schema: public; Owner: tps
--

CREATE SEQUENCE public.checklists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.checklists_id_seq OWNER TO tps;

--
-- Name: checklists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tps
--

ALTER SEQUENCE public.checklists_id_seq OWNED BY public.checklists.id;


--
-- Name: companies; Type: TABLE; Schema: public; Owner: tps
--

CREATE TABLE public.companies (
    id bigint NOT NULL,
    comp_name character varying,
    comp_address text,
    comp_contact character varying,
    comp_email character varying,
    website_link character varying,
    subdomain character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.companies OWNER TO tps;

--
-- Name: companies_id_seq; Type: SEQUENCE; Schema: public; Owner: tps
--

CREATE SEQUENCE public.companies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.companies_id_seq OWNER TO tps;

--
-- Name: companies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tps
--

ALTER SEQUENCE public.companies_id_seq OWNED BY public.companies.id;


--
-- Name: consultant_handbooks; Type: TABLE; Schema: public; Owner: tps
--

CREATE TABLE public.consultant_handbooks (
    id bigint NOT NULL,
    section character varying,
    content text,
    "position" integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.consultant_handbooks OWNER TO tps;

--
-- Name: consultant_handbooks_id_seq; Type: SEQUENCE; Schema: public; Owner: tps
--

CREATE SEQUENCE public.consultant_handbooks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.consultant_handbooks_id_seq OWNER TO tps;

--
-- Name: consultant_handbooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tps
--

ALTER SEQUENCE public.consultant_handbooks_id_seq OWNED BY public.consultant_handbooks.id;


--
-- Name: credential_types; Type: TABLE; Schema: public; Owner: tps
--

CREATE TABLE public.credential_types (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.credential_types OWNER TO tps;

--
-- Name: credential_types_id_seq; Type: SEQUENCE; Schema: public; Owner: tps
--

CREATE SEQUENCE public.credential_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.credential_types_id_seq OWNER TO tps;

--
-- Name: credential_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tps
--

ALTER SEQUENCE public.credential_types_id_seq OWNED BY public.credential_types.id;


--
-- Name: credentials; Type: TABLE; Schema: public; Owner: tps
--

CREATE TABLE public.credentials (
    id bigint NOT NULL,
    project_name character varying,
    notes text,
    last_updated_by character varying,
    credential_type_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    email character varying,
    password character varying,
    username character varying,
    link character varying
);


ALTER TABLE public.credentials OWNER TO tps;

--
-- Name: credentials_id_seq; Type: SEQUENCE; Schema: public; Owner: tps
--

CREATE SEQUENCE public.credentials_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.credentials_id_seq OWNER TO tps;

--
-- Name: credentials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tps
--

ALTER SEQUENCE public.credentials_id_seq OWNED BY public.credentials.id;


--
-- Name: degrees; Type: TABLE; Schema: public; Owner: tps
--

CREATE TABLE public.degrees (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id bigint
);


ALTER TABLE public.degrees OWNER TO tps;

--
-- Name: degrees_id_seq; Type: SEQUENCE; Schema: public; Owner: tps
--

CREATE SEQUENCE public.degrees_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.degrees_id_seq OWNER TO tps;

--
-- Name: degrees_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tps
--

ALTER SEQUENCE public.degrees_id_seq OWNED BY public.degrees.id;


--
-- Name: departments; Type: TABLE; Schema: public; Owner: tps
--

CREATE TABLE public.departments (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id bigint
);


ALTER TABLE public.departments OWNER TO tps;

--
-- Name: departments_id_seq; Type: SEQUENCE; Schema: public; Owner: tps
--

CREATE SEQUENCE public.departments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.departments_id_seq OWNER TO tps;

--
-- Name: departments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tps
--

ALTER SEQUENCE public.departments_id_seq OWNED BY public.departments.id;


--
-- Name: designations; Type: TABLE; Schema: public; Owner: tps
--

CREATE TABLE public.designations (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id bigint
);


ALTER TABLE public.designations OWNER TO tps;

--
-- Name: designations_id_seq; Type: SEQUENCE; Schema: public; Owner: tps
--

CREATE SEQUENCE public.designations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.designations_id_seq OWNER TO tps;

--
-- Name: designations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tps
--

ALTER SEQUENCE public.designations_id_seq OWNED BY public.designations.id;


--
-- Name: documents; Type: TABLE; Schema: public; Owner: tps
--

CREATE TABLE public.documents (
    id bigint NOT NULL,
    name character varying,
    user_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.documents OWNER TO tps;

--
-- Name: documents_id_seq; Type: SEQUENCE; Schema: public; Owner: tps
--

CREATE SEQUENCE public.documents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.documents_id_seq OWNER TO tps;

--
-- Name: documents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tps
--

ALTER SEQUENCE public.documents_id_seq OWNED BY public.documents.id;


--
-- Name: educations; Type: TABLE; Schema: public; Owner: tps
--

CREATE TABLE public.educations (
    id bigint NOT NULL,
    college character varying,
    university character varying,
    "from" timestamp without time zone,
    "to" timestamp without time zone,
    is_current boolean DEFAULT false,
    user_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    degree_id bigint
);


ALTER TABLE public.educations OWNER TO tps;

--
-- Name: educations_id_seq; Type: SEQUENCE; Schema: public; Owner: tps
--

CREATE SEQUENCE public.educations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.educations_id_seq OWNER TO tps;

--
-- Name: educations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tps
--

ALTER SEQUENCE public.educations_id_seq OWNED BY public.educations.id;


--
-- Name: employee_handbooks; Type: TABLE; Schema: public; Owner: tps
--

CREATE TABLE public.employee_handbooks (
    id bigint NOT NULL,
    section character varying,
    content text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    "position" integer
);


ALTER TABLE public.employee_handbooks OWNER TO tps;

--
-- Name: employee_handbooks_id_seq; Type: SEQUENCE; Schema: public; Owner: tps
--

CREATE SEQUENCE public.employee_handbooks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employee_handbooks_id_seq OWNER TO tps;

--
-- Name: employee_handbooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tps
--

ALTER SEQUENCE public.employee_handbooks_id_seq OWNED BY public.employee_handbooks.id;


--
-- Name: event_categories; Type: TABLE; Schema: public; Owner: tps
--

CREATE TABLE public.event_categories (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.event_categories OWNER TO tps;

--
-- Name: event_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: tps
--

CREATE SEQUENCE public.event_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.event_categories_id_seq OWNER TO tps;

--
-- Name: event_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tps
--

ALTER SEQUENCE public.event_categories_id_seq OWNED BY public.event_categories.id;


--
-- Name: event_links; Type: TABLE; Schema: public; Owner: tps
--

CREATE TABLE public.event_links (
    id bigint NOT NULL,
    title character varying,
    description text,
    link character varying,
    user_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    event_date date,
    event_category_id bigint
);


ALTER TABLE public.event_links OWNER TO tps;

--
-- Name: event_links_id_seq; Type: SEQUENCE; Schema: public; Owner: tps
--

CREATE SEQUENCE public.event_links_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.event_links_id_seq OWNER TO tps;

--
-- Name: event_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tps
--

ALTER SEQUENCE public.event_links_id_seq OWNED BY public.event_links.id;


--
-- Name: free_leaves; Type: TABLE; Schema: public; Owner: tps
--

CREATE TABLE public.free_leaves (
    id bigint NOT NULL,
    user_id bigint,
    extra_leave double precision,
    reason text,
    leave_month date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.free_leaves OWNER TO tps;

--
-- Name: free_leaves_id_seq; Type: SEQUENCE; Schema: public; Owner: tps
--

CREATE SEQUENCE public.free_leaves_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.free_leaves_id_seq OWNER TO tps;

--
-- Name: free_leaves_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tps
--

ALTER SEQUENCE public.free_leaves_id_seq OWNED BY public.free_leaves.id;


--
-- Name: holidays; Type: TABLE; Schema: public; Owner: tps
--

CREATE TABLE public.holidays (
    id bigint NOT NULL,
    holiday_name character varying,
    holiday_date timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.holidays OWNER TO tps;

--
-- Name: holidays_id_seq; Type: SEQUENCE; Schema: public; Owner: tps
--

CREATE SEQUENCE public.holidays_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.holidays_id_seq OWNER TO tps;

--
-- Name: holidays_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tps
--

ALTER SEQUENCE public.holidays_id_seq OWNED BY public.holidays.id;


--
-- Name: leave_reports; Type: TABLE; Schema: public; Owner: tps
--

CREATE TABLE public.leave_reports (
    id bigint NOT NULL,
    user_id bigint,
    start_month date,
    end_month date,
    prev_month_leave_bal double precision,
    free_leave double precision,
    taken_leave double precision,
    current_leave_bal double precision,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.leave_reports OWNER TO tps;

--
-- Name: leave_reports_id_seq; Type: SEQUENCE; Schema: public; Owner: tps
--

CREATE SEQUENCE public.leave_reports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.leave_reports_id_seq OWNER TO tps;

--
-- Name: leave_reports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tps
--

ALTER SEQUENCE public.leave_reports_id_seq OWNED BY public.leave_reports.id;


--
-- Name: leaves; Type: TABLE; Schema: public; Owner: tps
--

CREATE TABLE public.leaves (
    id bigint NOT NULL,
    leave_type character varying,
    user_id bigint,
    leave_date timestamp without time zone,
    approved_by_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    end_date date,
    color character varying,
    status character varying
);


ALTER TABLE public.leaves OWNER TO tps;

--
-- Name: leaves_id_seq; Type: SEQUENCE; Schema: public; Owner: tps
--

CREATE SEQUENCE public.leaves_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.leaves_id_seq OWNER TO tps;

--
-- Name: leaves_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tps
--

ALTER SEQUENCE public.leaves_id_seq OWNED BY public.leaves.id;


--
-- Name: permissions; Type: TABLE; Schema: public; Owner: tps
--

CREATE TABLE public.permissions (
    id bigint NOT NULL,
    subject_class character varying,
    action character varying,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.permissions OWNER TO tps;

--
-- Name: permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: tps
--

CREATE SEQUENCE public.permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permissions_id_seq OWNER TO tps;

--
-- Name: permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tps
--

ALTER SEQUENCE public.permissions_id_seq OWNED BY public.permissions.id;


--
-- Name: project_members; Type: TABLE; Schema: public; Owner: tps
--

CREATE TABLE public.project_members (
    id bigint NOT NULL,
    project_id bigint,
    user_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.project_members OWNER TO tps;

--
-- Name: project_members_id_seq; Type: SEQUENCE; Schema: public; Owner: tps
--

CREATE SEQUENCE public.project_members_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.project_members_id_seq OWNER TO tps;

--
-- Name: project_members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tps
--

ALTER SEQUENCE public.project_members_id_seq OWNED BY public.project_members.id;


--
-- Name: projects; Type: TABLE; Schema: public; Owner: tps
--

CREATE TABLE public.projects (
    id bigint NOT NULL,
    name character varying,
    description text,
    department_id bigint,
    manager character varying,
    client_name character varying,
    start_date date,
    end_date date,
    status character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.projects OWNER TO tps;

--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: tps
--

CREATE SEQUENCE public.projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.projects_id_seq OWNER TO tps;

--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tps
--

ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.id;


--
-- Name: role_permissions; Type: TABLE; Schema: public; Owner: tps
--

CREATE TABLE public.role_permissions (
    id bigint NOT NULL,
    permission_id bigint,
    role_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.role_permissions OWNER TO tps;

--
-- Name: role_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: tps
--

CREATE SEQUENCE public.role_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.role_permissions_id_seq OWNER TO tps;

--
-- Name: role_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tps
--

ALTER SEQUENCE public.role_permissions_id_seq OWNED BY public.role_permissions.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: tps
--

CREATE TABLE public.roles (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.roles OWNER TO tps;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: tps
--

CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO tps;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tps
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: tps
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO tps;

--
-- Name: user_designations; Type: TABLE; Schema: public; Owner: tps
--

CREATE TABLE public.user_designations (
    id bigint NOT NULL,
    designation_id bigint,
    department_id bigint,
    mentor character varying,
    start_date timestamp without time zone,
    end_date timestamp without time zone,
    user_id bigint,
    is_current boolean DEFAULT false,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.user_designations OWNER TO tps;

--
-- Name: user_designations_id_seq; Type: SEQUENCE; Schema: public; Owner: tps
--

CREATE SEQUENCE public.user_designations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_designations_id_seq OWNER TO tps;

--
-- Name: user_designations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tps
--

ALTER SEQUENCE public.user_designations_id_seq OWNED BY public.user_designations.id;


--
-- Name: user_reports; Type: TABLE; Schema: public; Owner: tps
--

CREATE TABLE public.user_reports (
    id bigint NOT NULL,
    start_time time without time zone,
    end_time time without time zone,
    date date,
    detail text,
    total_hours character varying,
    project_member_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.user_reports OWNER TO tps;

--
-- Name: user_reports_id_seq; Type: SEQUENCE; Schema: public; Owner: tps
--

CREATE SEQUENCE public.user_reports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_reports_id_seq OWNER TO tps;

--
-- Name: user_reports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tps
--

ALTER SEQUENCE public.user_reports_id_seq OWNED BY public.user_reports.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: tps
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    first_name character varying,
    last_name character varying,
    personal_email character varying,
    comp_email character varying,
    emergency_contact character varying,
    contact character varying,
    birthday timestamp without time zone,
    marital_status character varying,
    anniversary_date timestamp without time zone,
    join_date timestamp without time zone,
    job_status character varying,
    address character varying,
    college character varying,
    mentor character varying,
    adhar_no character varying,
    pan_no character varying,
    user_type character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    role_id bigint,
    company_id bigint,
    leave_bal double precision,
    leave_added_on timestamp without time zone,
    experience double precision,
    gender character varying,
    emp_code character varying,
    degree_id integer,
    department_id integer,
    designation_id integer,
    leave_report_added_on timestamp without time zone,
    is_event_manager boolean DEFAULT false,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying,
    last_sign_in_ip character varying,
    resign_date timestamp without time zone,
    resign_reason text
);


ALTER TABLE public.users OWNER TO tps;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: tps
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO tps;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tps
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: vendors; Type: TABLE; Schema: public; Owner: tps
--

CREATE TABLE public.vendors (
    id bigint NOT NULL,
    name character varying,
    services character varying,
    contact_person character varying,
    mobile character varying,
    email character varying,
    gst character varying,
    pan character varying,
    tan character varying,
    address text,
    city character varying,
    state character varying,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    register_date timestamp without time zone,
    status integer DEFAULT 0
);


ALTER TABLE public.vendors OWNER TO tps;

--
-- Name: vendors_id_seq; Type: SEQUENCE; Schema: public; Owner: tps
--

CREATE SEQUENCE public.vendors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vendors_id_seq OWNER TO tps;

--
-- Name: vendors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tps
--

ALTER SEQUENCE public.vendors_id_seq OWNED BY public.vendors.id;


--
-- Name: work_histories; Type: TABLE; Schema: public; Owner: tps
--

CREATE TABLE public.work_histories (
    id bigint NOT NULL,
    year text,
    mentor text,
    peer text,
    team_member text,
    user_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.work_histories OWNER TO tps;

--
-- Name: work_histories_id_seq; Type: SEQUENCE; Schema: public; Owner: tps
--

CREATE SEQUENCE public.work_histories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.work_histories_id_seq OWNER TO tps;

--
-- Name: work_histories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tps
--

ALTER SEQUENCE public.work_histories_id_seq OWNED BY public.work_histories.id;


--
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- Name: arrange_sessions id; Type: DEFAULT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.arrange_sessions ALTER COLUMN id SET DEFAULT nextval('public.arrange_sessions_id_seq'::regclass);


--
-- Name: asset_histories id; Type: DEFAULT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.asset_histories ALTER COLUMN id SET DEFAULT nextval('public.asset_histories_id_seq'::regclass);


--
-- Name: asset_types id; Type: DEFAULT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.asset_types ALTER COLUMN id SET DEFAULT nextval('public.asset_types_id_seq'::regclass);


--
-- Name: assets id; Type: DEFAULT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.assets ALTER COLUMN id SET DEFAULT nextval('public.assets_id_seq'::regclass);


--
-- Name: audits id; Type: DEFAULT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.audits ALTER COLUMN id SET DEFAULT nextval('public.audits_id_seq'::regclass);


--
-- Name: bills id; Type: DEFAULT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.bills ALTER COLUMN id SET DEFAULT nextval('public.bills_id_seq'::regclass);


--
-- Name: checklist_item_users id; Type: DEFAULT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.checklist_item_users ALTER COLUMN id SET DEFAULT nextval('public.checklist_item_users_id_seq'::regclass);


--
-- Name: checklist_items id; Type: DEFAULT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.checklist_items ALTER COLUMN id SET DEFAULT nextval('public.checklist_items_id_seq'::regclass);


--
-- Name: checklist_users id; Type: DEFAULT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.checklist_users ALTER COLUMN id SET DEFAULT nextval('public.checklist_users_id_seq'::regclass);


--
-- Name: checklists id; Type: DEFAULT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.checklists ALTER COLUMN id SET DEFAULT nextval('public.checklists_id_seq'::regclass);


--
-- Name: companies id; Type: DEFAULT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.companies ALTER COLUMN id SET DEFAULT nextval('public.companies_id_seq'::regclass);


--
-- Name: consultant_handbooks id; Type: DEFAULT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.consultant_handbooks ALTER COLUMN id SET DEFAULT nextval('public.consultant_handbooks_id_seq'::regclass);


--
-- Name: credential_types id; Type: DEFAULT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.credential_types ALTER COLUMN id SET DEFAULT nextval('public.credential_types_id_seq'::regclass);


--
-- Name: credentials id; Type: DEFAULT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.credentials ALTER COLUMN id SET DEFAULT nextval('public.credentials_id_seq'::regclass);


--
-- Name: degrees id; Type: DEFAULT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.degrees ALTER COLUMN id SET DEFAULT nextval('public.degrees_id_seq'::regclass);


--
-- Name: departments id; Type: DEFAULT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.departments ALTER COLUMN id SET DEFAULT nextval('public.departments_id_seq'::regclass);


--
-- Name: designations id; Type: DEFAULT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.designations ALTER COLUMN id SET DEFAULT nextval('public.designations_id_seq'::regclass);


--
-- Name: documents id; Type: DEFAULT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.documents ALTER COLUMN id SET DEFAULT nextval('public.documents_id_seq'::regclass);


--
-- Name: educations id; Type: DEFAULT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.educations ALTER COLUMN id SET DEFAULT nextval('public.educations_id_seq'::regclass);


--
-- Name: employee_handbooks id; Type: DEFAULT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.employee_handbooks ALTER COLUMN id SET DEFAULT nextval('public.employee_handbooks_id_seq'::regclass);


--
-- Name: event_categories id; Type: DEFAULT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.event_categories ALTER COLUMN id SET DEFAULT nextval('public.event_categories_id_seq'::regclass);


--
-- Name: event_links id; Type: DEFAULT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.event_links ALTER COLUMN id SET DEFAULT nextval('public.event_links_id_seq'::regclass);


--
-- Name: free_leaves id; Type: DEFAULT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.free_leaves ALTER COLUMN id SET DEFAULT nextval('public.free_leaves_id_seq'::regclass);


--
-- Name: holidays id; Type: DEFAULT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.holidays ALTER COLUMN id SET DEFAULT nextval('public.holidays_id_seq'::regclass);


--
-- Name: leave_reports id; Type: DEFAULT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.leave_reports ALTER COLUMN id SET DEFAULT nextval('public.leave_reports_id_seq'::regclass);


--
-- Name: leaves id; Type: DEFAULT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.leaves ALTER COLUMN id SET DEFAULT nextval('public.leaves_id_seq'::regclass);


--
-- Name: permissions id; Type: DEFAULT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.permissions ALTER COLUMN id SET DEFAULT nextval('public.permissions_id_seq'::regclass);


--
-- Name: project_members id; Type: DEFAULT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.project_members ALTER COLUMN id SET DEFAULT nextval('public.project_members_id_seq'::regclass);


--
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);


--
-- Name: role_permissions id; Type: DEFAULT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.role_permissions ALTER COLUMN id SET DEFAULT nextval('public.role_permissions_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: user_designations id; Type: DEFAULT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.user_designations ALTER COLUMN id SET DEFAULT nextval('public.user_designations_id_seq'::regclass);


--
-- Name: user_reports id; Type: DEFAULT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.user_reports ALTER COLUMN id SET DEFAULT nextval('public.user_reports_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: vendors id; Type: DEFAULT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.vendors ALTER COLUMN id SET DEFAULT nextval('public.vendors_id_seq'::regclass);


--
-- Name: work_histories id; Type: DEFAULT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.work_histories ALTER COLUMN id SET DEFAULT nextval('public.work_histories_id_seq'::regclass);


--
-- Data for Name: active_storage_attachments; Type: TABLE DATA; Schema: public; Owner: tps
--

COPY public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) FROM stdin;
18	profile_picture	User	15	18	2019-10-17 08:30:56.283859
24	profile_picture	User	1	24	2019-10-24 11:32:35.947026
33	profile_picture	User	54	33	2019-12-10 14:17:05.026834
34	profile_picture	User	55	34	2019-12-10 14:17:28.209475
35	profile_picture	User	56	35	2019-12-10 14:21:13.275736
36	profile_picture	User	57	36	2019-12-10 14:27:03.293597
37	profile_picture	User	65	37	2019-12-13 10:03:27.152066
38	profile_picture	User	64	38	2019-12-13 10:03:50.987981
39	profile_picture	User	59	39	2019-12-13 10:04:17.601294
40	profile_picture	User	61	40	2019-12-13 10:04:31.812721
42	profile_picture	User	66	42	2019-12-13 10:05:48.078591
53	profile_picture	User	63	53	2020-01-07 08:40:36.118148
55	profile_picture	User	62	55	2020-01-08 13:20:13.286314
89	document	Document	3	89	2020-01-16 09:58:49.263376
91	profile_picture	User	67	91	2020-01-21 13:21:03.352427
92	profile_picture	User	51	92	2020-01-22 09:21:31.605481
106	profile_picture	User	52	106	2020-01-30 10:22:11.464453
108	profile_picture	User	53	108	2020-01-30 10:28:22.857209
109	profile_picture	User	58	109	2020-01-30 12:20:42.07698
110	profile_picture	User	68	110	2020-02-03 10:29:42.508388
111	profile_picture	User	14	111	2020-02-03 10:43:11.71518
114	document	Document	4	114	2020-05-15 13:24:29.799168
116	profile_picture	User	69	116	2020-05-21 07:58:03.617508
119	profile_picture	User	16	119	2020-05-22 09:05:21.615273
120	profile_picture	User	17	120	2020-06-01 12:40:24.389199
121	document	Document	5	121	2020-06-05 11:54:17.007554
122	document	Document	6	122	2020-06-17 09:05:16.551055
123	document	Document	7	123	2020-06-17 09:08:48.495706
124	document	Document	8	124	2020-06-17 09:15:34.484174
125	document	Document	9	125	2020-06-17 09:20:26.602011
126	document	Document	10	126	2020-06-17 09:27:46.913525
127	document	Document	11	127	2020-06-17 09:29:05.067584
128	document	Document	12	128	2020-06-17 09:29:32.576187
129	document	Document	13	129	2020-06-17 09:30:13.060872
130	document	Document	14	130	2020-06-17 09:32:34.90315
131	document	Document	15	131	2020-06-17 09:35:52.080325
132	document	Document	16	132	2020-06-17 09:36:56.29787
133	document	Document	17	133	2020-06-17 09:39:31.967038
134	document	Document	18	134	2020-06-17 09:41:23.685513
135	document	Document	19	135	2020-06-17 09:51:01.231206
136	document	Document	20	136	2020-06-17 09:53:14.598652
137	document	Document	21	137	2020-06-17 10:02:22.135455
138	document	Document	22	138	2020-06-17 11:10:06.364087
139	document	Document	23	139	2020-06-17 11:13:10.997635
140	document	Document	24	140	2020-06-17 11:19:13.768725
141	document	Document	25	141	2020-06-17 11:40:37.21077
142	document	Document	26	142	2020-06-17 13:41:41.034002
143	document	Document	27	143	2020-06-17 13:43:55.006745
144	document	Document	28	144	2020-06-17 14:04:17.350797
145	document	Document	29	145	2020-06-17 14:05:24.25579
146	document	Document	30	146	2020-06-17 14:07:06.202726
147	document	Document	31	147	2020-06-17 14:09:22.249088
148	document	Document	32	148	2020-06-17 14:10:13.100323
149	document	Document	33	149	2020-06-17 14:11:01.434472
150	document	Document	34	150	2020-06-17 14:12:48.923009
151	document	Document	35	151	2020-06-17 14:13:13.039835
152	document	Document	36	152	2020-06-17 14:13:45.922369
153	document	Document	37	153	2020-06-17 14:14:02.069511
154	document	Document	38	154	2020-06-17 14:20:43.917323
155	document	Document	39	155	2020-06-17 14:21:09.22499
156	document	Document	40	156	2020-06-17 14:33:38.346286
157	document	Document	41	157	2020-06-17 14:34:00.412751
158	document	Document	42	158	2020-06-17 14:34:15.441853
159	document	Document	43	159	2020-06-17 14:34:56.812037
160	files	Bill	1	161	2020-06-23 20:20:20.56675
161	files	Bill	2	163	2020-06-23 20:50:32.481633
162	files	Bill	3	165	2020-07-29 07:32:27.184939
163	files	Bill	4	167	2020-07-29 07:36:32.813873
164	files	Bill	5	169	2020-07-29 08:30:20.061478
165	files	Bill	6	171	2020-07-29 08:48:20.826805
169	files	Bill	6	177	2020-07-29 13:12:02.81422
171	files	Bill	10	181	2020-07-30 08:48:11.419003
172	files	Bill	11	183	2020-07-30 08:49:39.336302
173	files	Bill	12	185	2020-07-30 08:55:43.565646
174	files	Bill	13	187	2020-07-30 08:59:57.940088
175	files	Bill	13	188	2020-07-30 09:00:38.448359
176	files	Bill	12	189	2020-07-30 09:21:37.95345
179	files	Bill	16	195	2020-07-31 10:53:36.87536
180	files	Bill	17	197	2020-07-31 11:01:18.13006
181	files	Bill	18	199	2020-07-31 11:52:18.241764
182	files	Bill	19	201	2020-09-08 10:58:53.103108
215	files	Bill	52	234	2020-11-18 10:36:38.141765
216	profile_picture	User	13	235	2020-11-18 10:50:43.266507
217	files	Bill	53	237	2020-12-22 09:25:25.057989
218	files	Bill	54	239	2020-12-22 09:38:24.283158
219	files	Bill	55	241	2021-01-19 10:27:12.528573
220	files	Bill	56	243	2021-01-22 11:04:46.482536
221	profile_picture	User	60	244	2022-07-22 06:06:20.242531
\.


--
-- Data for Name: active_storage_blobs; Type: TABLE DATA; Schema: public; Owner: tps
--

COPY public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) FROM stdin;
24	ffp3tGYPdc7hkKfYdSBNt9RB	profile_picture.jpg	image/jpeg	{"identified":true,"width":219,"height":219,"analyzed":true}	27420	mpSoJQm8uibymniyv+Onjw==	2019-10-24 11:32:35.939436
10	qY8Y82AijbGeJg1cfhTsoWfG	image1.jpeg	image/jpeg	{"identified":true,"width":275,"height":183,"analyzed":true}	7156	pgD/EX8Q7UwrcsAxUm79zw==	2019-09-03 05:07:21.077
39	L8XzKAc5pTuPZjmm3jiLobS3	profile_picture.jpg	image/jpeg	{"identified":true,"width":312,"height":312,"analyzed":true}	23341	feG9433cnYaB4Xp7e2JJbA==	2019-12-13 10:04:17.596113
14	Nq9ALhYeE9Mq1gkNYrATxSKp	IMG_20171229_133812.jpg	image/jpeg	{"identified":true,"width":2340,"height":4160,"analyzed":true}	2490608	Bkkjtb9keRubzDF2KDEC6w==	2019-10-11 10:31:25.301352
15	VvDgrzGLMYjKadVjJHjTVA48	IMG_20170114_163126.jpg	image/jpeg	{"identified":true,"width":1836,"height":3264,"analyzed":true}	1528009	DOXhNEWsT8mfZpVtS4/6pA==	2019-10-11 10:34:22.297397
18	nkXR99ybEEAgKMLEGd7uLeDu	IMG_20190414_125240.jpg	image/jpeg	{"identified":true,"width":2752,"height":2064,"analyzed":true}	1387500	bx/fZ8rNqCvRNIzbUPktbA==	2019-10-17 08:30:56.274841
20	bxBNBTobKxEzhi5FkSBs6LyM	IMG_20190413_153633.jpg	image/jpeg	{"identified":true,"width":2064,"height":2752,"analyzed":true}	1386036	GYUrP1bEkTbOPvfir63LTQ==	2019-10-22 09:36:14.013734
40	iuHEdA7E1qNEjeC9TVKzxn3F	profile_picture.jpg	image/jpeg	{"identified":true,"width":311,"height":311,"analyzed":true}	24945	28GdU2Y0GRluRR3YhaclUw==	2019-12-13 10:04:31.806524
33	XU4iZoDiK3bnEx9K4g92MvSJ	profile_picture.jpg	image/jpeg	{"identified":true,"width":312,"height":312,"analyzed":true}	19506	hOFA070t6/ZKzlfr5Vm7bA==	2019-12-10 14:17:05.00277
34	j55ag1xDXFf49gAtCxUDopvH	profile_picture.jpg	image/jpeg	{"identified":true,"width":311,"height":311,"analyzed":true}	16282	Wcyhle4LFbZ+LlnaCF0wrg==	2019-12-10 14:17:28.197237
35	U7wzC549Dk3BFH13AzfFHjNg	profile_picture.jpg	image/jpeg	{"identified":true,"width":323,"height":323,"analyzed":true}	22109	kfZugbN7jsbeOpvivX/xJg==	2019-12-10 14:21:13.266061
36	8D4KgMSBoF5PHCcC6cpZWCH9	profile_picture.jpg	image/jpeg	{"identified":true,"width":311,"height":311,"analyzed":true}	35964	2wbGL54otIBlCDE3SSyMcg==	2019-12-10 14:27:03.281552
37	PeWoN1i5YQ12oX9qeBeMoNVA	profile_picture.jpg	image/jpeg	{"identified":true,"width":311,"height":311,"analyzed":true}	26422	10+KYZC0nJVhmjIs0hXzTg==	2019-12-13 10:03:27.14063
38	cq3uTedYy4g7rD9yYCb3vmaQ	profile_picture.jpg	image/jpeg	{"identified":true,"width":312,"height":312,"analyzed":true}	23317	YPKYwBRpbcR9BiwL1mTWxQ==	2019-12-13 10:03:50.982956
42	ki54nzaf1urTuCY2Cre6oA6w	profile_picture.jpg	image/jpeg	{"identified":true,"width":263,"height":263,"analyzed":true}	19510	Gee6FFyJt3dAj+jOSJbH/g==	2019-12-13 10:05:48.068724
53	HFgDw243US5KK3bSjyhufaGd	profile_picture.jpg	image/jpeg	{"identified":true,"width":873,"height":873,"analyzed":true}	158622	xRN2VRs+AInyApKxg2xGXA==	2020-01-07 08:40:36.103596
55	QiGCcUr1iTEwNJRRAEVzhZm5	profile_picture.jpg	image/jpeg	{"identified":true,"width":310,"height":310,"analyzed":true}	30764	YK9iUHjmPgNbppDedJAWpQ==	2020-01-08 13:20:13.271047
121	pcgqYQ5yrrFTLBcdm7kn3Bbt	API-Documentation-Cheers-On-Demand_1.pdf	application/pdf	{"identified":true,"analyzed":true}	496003	nY51oNrm8I+6yvTSdWLdrA==	2020-06-05 11:54:16.990337
89	hfUgkD69Fyd1YNyuTHA6X35i	Akshay_adharcard.pdf	application/pdf	{"identified":true,"analyzed":true}	174127	dG9h1Q3dtrVcgstbEhU1dQ==	2020-01-16 09:58:49.245355
91	XbSKEny93QqrcoASrax5XBJN	profile_picture.jpg	image/jpeg	{"identified":true,"width":768,"height":768,"analyzed":true}	197657	uHQG5gMDTvinvCTm+4X3mg==	2020-01-21 13:21:03.307948
92	peCbrC2PaKpm3aNmVCZa52Kj	profile_picture.jpg	image/jpeg	{"identified":true,"width":696,"height":696,"analyzed":true}	65930	NmS7lm6kmizfvRp5qYRx6Q==	2020-01-22 09:21:31.591055
110	7dHjnCZYc1nxMCjbgKsAcFh3	profile_picture.jpg	image/jpeg	{"identified":true,"width":960,"height":960,"analyzed":true}	207067	uNVpyQE3C3P0A5VfdvXREw==	2020-02-03 10:29:42.49943
106	8AiASRwJuc7S8QndTiDNn2W4	profile_picture.jpg	image/jpeg	{"identified":true,"width":899,"height":899,"analyzed":true}	98413	IKe0CazbNvsXs/Y8Sbio/Q==	2020-01-30 10:22:11.456455
108	bRD2nWEmj5S5VPkE2N5Pep62	profile_picture.jpg	image/jpeg	{"identified":true,"width":531,"height":531,"analyzed":true}	60842	syM31HKls9HYXdIfyR26nQ==	2020-01-30 10:28:22.850147
109	uA6LsuSAUEK8BDEeaLAkXHaJ	profile_picture.jpg	image/jpeg	{"identified":true,"width":2969,"height":2969,"analyzed":true}	2006802	0t35oyY6ieV0DSh7erReHA==	2020-01-30 12:20:42.051342
111	rriYxteESVa86MH6n7mmkRnL	profile_picture.jpg	image/jpeg	{"identified":true,"width":1865,"height":1865,"analyzed":true}	550195	zsCZmqk8mm3E2WpafP4sQA==	2020-02-03 10:43:11.707089
114	C1E5m323VJBTpKqKGzviQJPY	Kinjal_Thakkar_Pancard.jpg	image/jpeg	{"identified":true,"width":3120,"height":4160,"analyzed":true}	1498093	ckIqbs+5weJWEGawjsYU0A==	2020-05-15 13:24:29.74171
116	pwee7ufT3BQ3tM64iwpho1g1	profile_picture.jpg	image/jpeg	{"identified":true,"width":1399,"height":1399,"analyzed":true}	251454	tjAL+J8gPR1gJCoLGcSPzw==	2020-05-21 07:58:03.608836
119	rKybLqeV4o8MbvuUE2bwUFDf	profile_picture.jpg	image/jpeg	{"identified":true,"width":397,"height":397,"analyzed":true}	42608	cUrdFrJkF0udlEV9pCi13A==	2020-05-22 09:05:21.608042
120	Us4rgz3FUZAS1WLj2AwRAxKu	profile_picture.jpg	image/jpeg	{"identified":true,"width":3421,"height":3421,"analyzed":true}	2038100	wyFIvJ/AODxTFUa6FSDGcw==	2020-06-01 12:40:24.361322
122	K3w2JuYphRKGnsYY2wzmDAQK	Akshay_Pancard.pdf	application/pdf	{"identified":true,"analyzed":true}	316258	VvQOaBmX+v6OTzAQKYKeFQ==	2020-06-17 09:05:16.505867
123	t64rg81JfsW3LEmSmV4CfLVU	Bhavin_pancard.jpg	image/jpeg	{"identified":true,"width":1539,"height":936,"analyzed":true}	348610	BplhpwzhrZ0ZnQ/56o4ydQ==	2020-06-17 09:08:48.442993
124	kECufAWm36knLGuodj59zkC1	Binoli_Pancard.jpg	image/jpeg	{"identified":true,"width":265,"height":164,"analyzed":true}	40658	U9lXDJOL1Qnroh6EVtp/nA==	2020-06-17 09:15:34.464739
125	EnM5i6Xg1G59xsLThiT6AKDU	Chintan_pancard.jpg	image/jpeg	{"identified":true,"width":3853,"height":2599,"analyzed":true}	3334397	3tE6l7oqFWS8MqOaRFY7ug==	2020-06-17 09:20:26.574898
126	VHUZYnzTQU6LZmFYRZEWPYsA	Dipesh- Pancard.jpg	image/jpeg	{"identified":true,"width":2833,"height":1806,"analyzed":true}	1127436	WMBF45g6v4uLya3H9R0CPw==	2020-06-17 09:27:46.890192
127	g9h1ArnqNajSs4BSy49TiyKu	DIPESH-ADHARCARD-1.jpg	image/jpeg	{"identified":true,"width":2448,"height":3264,"analyzed":true}	1819892	lKF7De1f39dThir9oJExTQ==	2020-06-17 09:29:05.048998
128	tsvjeNvwjTksJ663mxkEfq7e	dipesh sukhiya - resume.pdf	application/pdf	{"identified":true,"analyzed":true}	372663	jL0fMSrt/HhxEyru8B01KQ==	2020-06-17 09:29:32.545297
129	4yqdfo7C3kCvp8zRGti1NHNp	Honey_Pancard.jpg	image/jpeg	{"identified":true,"width":1280,"height":960,"analyzed":true}	117738	gd1n93yS91g61kg9rSQtQw==	2020-06-17 09:30:13.024245
130	GU3A2tRbdu8DaLS3YZD3MvdG	Jigar_patel_pancard.pdf	application/pdf	{"identified":true,"analyzed":true}	350426	Qw7fxLb3vnL4kXhOdCmFBg==	2020-06-17 09:32:34.862688
131	E3ryseSqPWJaZXegfgGy6Qyi	Jigar_patel_adharcard.pdf	application/pdf	{"identified":true,"analyzed":true}	396439	jxEz7qf6EeNAXd28A/lUbw==	2020-06-17 09:35:52.045846
132	Yy6yRdXckQBbkma3BmadZZkj	jigar_patel_resume.pdf	application/pdf	{"identified":true,"analyzed":true}	32449	FeGBntc3r0ny8/1PnUQXmg==	2020-06-17 09:36:56.267212
133	VWRv1Zn4RXzo5PkjaPR4BnGD	Karan_Pancard.jpg	image/jpeg	{"identified":true,"width":3748,"height":2403,"analyzed":true}	1142419	IQcXoGjWUqjNPDvYNxfa0w==	2020-06-17 09:39:31.948562
134	S9ziGWFjPxmdDq7zmia9Ddtk	Karan_Dave_Resume.pdf	application/pdf	{"identified":true,"analyzed":true}	708095	0w5p9bssQSVgDu5m5Aon2A==	2020-06-17 09:41:23.657384
135	PWxnHXDwM1FzvM2S86ufKDrr	LABDHI-PANCARD.pdf	application/pdf	{"identified":true,"analyzed":true}	85784	sl09rcv9E2FTUonaqbBTTg==	2020-06-17 09:51:01.201913
136	vbPW27w48bYmd9kjzsLXxDq7	Labdhi_Shah-Adharcard.pdf	application/pdf	{"identified":true,"analyzed":true}	210190	g+ECOpAHZkOArz/x4NRy4w==	2020-06-17 09:53:14.582006
137	3jyMSHvKemC6TKT9ux7GXp8G	Neha_Pancard.jpg	image/jpeg	{"identified":true,"width":2624,"height":1664,"analyzed":true}	3067651	kiiszWEpkyy2pZs55V6Sbw==	2020-06-17 10:02:22.106852
138	jCYWcSmSzSPmbC6ruwFfncNY	Nency_Pancard.jpg	image/jpeg	{"identified":true,"width":3595,"height":2007,"analyzed":true}	2224833	A/2R43C8+0wxdzJkvzOwfg==	2020-06-17 11:10:06.350472
139	rH6Bb7GuXUHC1kkbhToBxcTV	Nikita-pancard_1.jpg	image/jpeg	{"identified":true,"width":1380,"height":854,"analyzed":true}	180233	zGDBnAs+1cIS3t6/8pQhwA==	2020-06-17 11:13:10.987624
140	xcohfqaWvpx36KQS8kWLknos	Adharcard_Nikita.pdf	application/pdf	{"identified":true,"analyzed":true}	2366022	BoQo2mTYW/JXHCfZsUoAxQ==	2020-06-17 11:19:13.7576
141	dX6frMm53fjekxcsoLYZnohZ	Honey_Adharcard.pdf	application/pdf	{"identified":true,"analyzed":true}	197977	JptoWbJJJSx3mqoHfBIMqg==	2020-06-17 11:40:37.198945
142	nDbPAzEezKcs7fMbxMwXWXXJ	Paresh_Gandhi_pancard.pdf	application/pdf	{"identified":true,"analyzed":true}	389755	hanhts5pKZ+6aqI6Kz2brA==	2020-06-17 13:41:41.007708
143	J42zmTcaCPfK7ufJNZhzw7Ww	Paresh_Gandhi_adharcard.pdf	application/pdf	{"identified":true,"analyzed":true}	659360	4ghAlpROzzUmfScHsN+e1w==	2020-06-17 13:43:54.973652
144	MxPTp5swDTCUBgcz6iF8tjci	Parul-Pancard.jpg	image/jpeg	{"identified":true,"width":3124,"height":1936,"analyzed":true}	407456	L1HkWH7nnn6MveHRaSaf7Q==	2020-06-17 14:04:17.299664
145	Ksp4ThgjmUrciHh5CgDNZbL2	Parul kanani - resume.pdf	application/pdf	{"identified":true,"analyzed":true}	884322	pHjistyQ3bf4xlnJJ2foHw==	2020-06-17 14:05:24.219148
146	HeNKPXgpBS4itnxeMpAyWCv9	Raheshree_Adharcard.jpeg	image/jpeg	{"identified":true,"width":720,"height":869,"analyzed":true}	316623	sxpNdl+gpY8FfyiVPVVyRA==	2020-06-17 14:07:06.034969
147	uHHdVd9foTa3DSw4tmhetD9G	Pancard_Rajesharee.JPEG	image/jpeg	{"identified":true,"width":2048,"height":1136,"analyzed":true}	126196	24lfDMSGlvC+lJ5Z3Cuz1Q==	2020-06-17 14:09:22.224215
148	6mZhx9mbzgmGDoZMX9CjkcU2	Richa- Pancard.jpg	image/jpeg	{"identified":true,"width":4160,"height":3120,"analyzed":true}	3458734	mOfIzP0uFPm3AaC00venTA==	2020-06-17 14:10:13.062461
149	BaE3PWgqShkTiXN1Wu1TKUDX	Richa desai_resume.pdf	application/pdf	{"identified":true,"analyzed":true}	881514	MLfy115KST/aY41Uhnrczw==	2020-06-17 14:11:01.383296
150	EvHmVCP2a4PvWevvDbfpjEBi	Tanay_Pancard.JPEG	image/jpeg	{"identified":true,"width":439,"height":277,"analyzed":true}	53611	YP5OcSIbZO+fXZD7LnB7Zw==	2020-06-17 14:12:48.893003
151	2sXNSuU3BuUJNauuLvMEdegD	Tanay_Resume.pdf	application/pdf	{"identified":true,"analyzed":true}	136411	ahL3WSUWmL2wXeZ+5ev30A==	2020-06-17 14:13:13.010721
152	8Ej6keY3TCtPx2WgEgTb6yjb	unnati-pancard_1.jpg	image/jpeg	{"identified":true,"width":2020,"height":1304,"analyzed":true}	338979	w53M/q9E+ZGQHwrUaK9H+w==	2020-06-17 14:13:45.866408
153	2iokVpMbwcvvkCXUWsfug6UF	Shah_Unnati-Adharcard.pdf	application/pdf	{"identified":true,"analyzed":true}	237243	S/uDhNkV8BuXiTnx1e2BwQ==	2020-06-17 14:14:02.048672
154	L2QFTcTt5vqfrjpSL789Jki7	Vatsal-pancard.jpg	image/jpeg	{"identified":true,"width":2156,"height":1320,"analyzed":true}	672325	uv5ar2t/OWG2dhrSKiBB/w==	2020-06-17 14:20:43.892977
155	27YCh85a1foTadzxCwirpXgD	Vatsal_Adharcard.pdf	application/pdf	{"identified":true,"analyzed":true}	447421	jiDrcwdzNYXQO5emsJHoIA==	2020-06-17 14:21:09.19368
156	ab2HnT4isDkDswfJxfMr1Tqc	Vikesha _Pancard.pdf	application/pdf	{"identified":true,"analyzed":true}	555650	GTz7w9WmSjLhTuFiC0p2Sw==	2020-06-17 14:33:38.31679
157	GCBhKGdEnNRrd29b6CxVDYMz	Vikesha_Adharcard.pdf	application/pdf	{"identified":true,"analyzed":true}	388127	qvfCExXHhESg+rV+hx7m1w==	2020-06-17 14:34:00.359037
158	KL83SGh6nXH3GEeXsRDoR7jG	Vikesha_Resume.pdf	application/pdf	{"identified":true,"analyzed":true}	506473	x3dxmf48BLgWW7MUOOUilg==	2020-06-17 14:34:15.417558
159	KeagSjL4mvEZ3Zy6tcRNaAiN	Viral_pancard.jpg	image/jpeg	{"identified":true,"width":1331,"height":851,"analyzed":true}	533157	ZKtk7/Xplu18y2JUXZG4PA==	2020-06-17 14:34:56.792646
160	neSQ13svLm1W92yUjPEi6fHV	saair-bill.pdf	application/pdf	{"identified":true}	461488	pFNOIu4A/nEbXUJbLVIjwg==	2020-06-23 20:20:19.980351
161	2Na3SkdvV3PjStd6PqHGKZeU	saair-bill.pdf	application/pdf	{"identified":true,"analyzed":true}	461488	pFNOIu4A/nEbXUJbLVIjwg==	2020-06-23 20:20:20.553947
162	5hrGWsKz9FGUJFfeU2KcBoYR	8b4a336f-8bce-4330-80cc-fb2af91ae404.jpg	image/jpeg	{"identified":true}	71700	1EhGgWqheqdjY6hYXBUb3Q==	2020-06-23 20:50:31.896715
163	24nSP29WYZkaV7b6aLeqGLoV	8b4a336f-8bce-4330-80cc-fb2af91ae404.jpg	image/jpeg	{"identified":true,"width":648,"height":1152,"analyzed":true}	71700	1EhGgWqheqdjY6hYXBUb3Q==	2020-06-23 20:50:32.47052
164	HrpawfJMq5yNzH7hiYUeZebX	Cool Wings.pdf	application/pdf	{"identified":true}	271886	EgV+qbiyYXtJVrLs1Zdglw==	2020-07-29 07:32:26.66523
165	9btfJf2UiY6xSBUm3cyrvvfD	Cool Wings.pdf	application/pdf	{"identified":true,"analyzed":true}	271886	EgV+qbiyYXtJVrLs1Zdglw==	2020-07-29 07:32:27.173743
166	yc2GAwurVLiiVfByT1BYx3T8	Crystal Technology.pdf	application/pdf	{"identified":true}	68294	ifPOxYg+OK5QYlcN/EkMMQ==	2020-07-29 07:36:32.400253
167	7ChVYueHDHBSufgHhkxxz4g6	Crystal Technology.pdf	application/pdf	{"identified":true,"analyzed":true}	68294	ifPOxYg+OK5QYlcN/EkMMQ==	2020-07-29 07:36:32.800898
168	c634QAz6buv35qC23w535SiN	Laptop_Invoice_I3_CMR_SMB_1410424823_2019-12-21.pdf	application/pdf	{"identified":true}	198293	3iIJU5gemM0hautVmMnDwA==	2020-07-29 08:30:19.472657
169	u12x947JDtuZwKiPakaPn1dW	Laptop_Invoice_I3_CMR_SMB_1410424823_2019-12-21.pdf	application/pdf	{"identified":true,"analyzed":true}	198293	3iIJU5gemM0hautVmMnDwA==	2020-07-29 08:30:19.967416
170	eVvVbveEYYShpY6wjuE7TeLZ	pepperfry-sofa-gst-invoice.pdf	application/pdf	{"identified":true}	64801	dGClTNB6/P7WvR73UbwOlg==	2020-07-29 08:48:20.489046
171	WnhSy4JwuXFiSzXD9PL3AYeK	pepperfry-sofa-gst-invoice.pdf	application/pdf	{"identified":true,"analyzed":true}	64801	dGClTNB6/P7WvR73UbwOlg==	2020-07-29 08:48:20.815053
172	8yH6tbY4LkZw6tA4oJai3bBz	BoAt Headphone-bill.pdf	application/pdf	{"identified":true}	67203	sCVypGy5xcue+A4P/IjGog==	2020-07-29 11:58:55.243575
194	EiXGrATth1Q92FkKpmvQ6Hok	Keyboard-Invoice_.pdf	application/pdf	{"identified":true}	134469	DXaYpSJv1R4m9L2yVyJ5zg==	2020-07-31 10:53:36.454192
174	teneUDDzPsm7y59aaN7E9dRy	boAt headphone_16-03-2020.png	image/png	{"identified":true}	138806	plkjMkDcB1e/TIiZPEu+iA==	2020-07-29 12:45:11.178908
195	cxtNhxki9Kwb4VExzLZLVdk6	Keyboard-Invoice_.pdf	application/pdf	{"identified":true,"analyzed":true}	134469	DXaYpSJv1R4m9L2yVyJ5zg==	2020-07-31 10:53:36.831693
177	5JTWrR1s5XjZoBwPrM8yEUSh	pepperfry-sofa-gst-invoice.pdf	application/pdf	{"identified":true,"analyzed":true}	64801	dGClTNB6/P7WvR73UbwOlg==	2020-07-29 13:12:02.727241
178	TA1YKmiVQ2rdsjp263CA7v45	Keyboard-Invoice_.pdf	application/pdf	{"identified":true}	134469	DXaYpSJv1R4m9L2yVyJ5zg==	2020-07-29 13:18:42.831381
196	VTkwx6ZaHGLGg55G9DpcHvZV	Keyboard-Invoice_.pdf	application/pdf	{"identified":true}	134469	DXaYpSJv1R4m9L2yVyJ5zg==	2020-07-31 11:01:17.807105
180	hqPrhMMWkMSsfC74hh633yvz	boAt headphone_16-03-2020.png	image/png	{"identified":true}	138806	plkjMkDcB1e/TIiZPEu+iA==	2020-07-30 08:48:10.693635
181	PxLP3Ns4BdSAayZZFmyADBs5	boAt headphone_16-03-2020.png	image/png	{"identified":true,"width":787,"height":574,"analyzed":true}	138806	plkjMkDcB1e/TIiZPEu+iA==	2020-07-30 08:48:11.405255
182	oKHNyBKLJVJz7xpV7Nfab2Jg	BoAt Headphone-bill.pdf	application/pdf	{"identified":true}	67203	sCVypGy5xcue+A4P/IjGog==	2020-07-30 08:49:39.041147
183	AHVrjX2VYFKQLSqS5VjAit4D	BoAt Headphone-bill.pdf	application/pdf	{"identified":true,"analyzed":true}	67203	sCVypGy5xcue+A4P/IjGog==	2020-07-30 08:49:39.326721
184	XDckNHcX2wexTja8e7KyDWYP	Keyboard-03rd-July-2019.pdf	application/pdf	{"identified":true}	134431	UJmxnWU+7MdR+XHjBtex9w==	2020-07-30 08:55:43.214456
185	6MQga5p96ks8S3Ax2oGBEKgt	Keyboard-03rd-July-2019.pdf	application/pdf	{"identified":true,"analyzed":true}	134431	UJmxnWU+7MdR+XHjBtex9w==	2020-07-30 08:55:43.514495
186	Npz7REuobtw8YDTKrjHw1Yt6	Keyboard-03rd-July-2019.pdf	application/pdf	{"identified":true}	134431	UJmxnWU+7MdR+XHjBtex9w==	2020-07-30 08:59:57.600414
187	Uc3fDqHg9nyztzuXuAYWWWmg	Keyboard-03rd-July-2019.pdf	application/pdf	{"identified":true,"analyzed":true}	134431	UJmxnWU+7MdR+XHjBtex9w==	2020-07-30 08:59:57.930496
188	qos1NLN3WbDeSAt5rTyYvkCh	Keyboard-03rd-July-2019.pdf	application/pdf	{"identified":true,"analyzed":true}	134431	UJmxnWU+7MdR+XHjBtex9w==	2020-07-30 09:00:38.444017
189	XaSGogehJmUoAiLjGfVdpQ2X	Keyboard-03rd-July-2019.pdf	application/pdf	{"identified":true,"analyzed":true}	134431	UJmxnWU+7MdR+XHjBtex9w==	2020-07-30 09:21:37.949812
190	6f61uu16kWAqn813LHLQ9ChF	Keyboard-Invoice_.pdf	application/pdf	{"identified":true}	134469	DXaYpSJv1R4m9L2yVyJ5zg==	2020-07-30 09:29:05.618294
238	qqieh5Ni98P4vCHXxPWCsD3F	macbook-charger-gst.pdf	application/pdf	{"identified":true}	405733	QZ2oFXODOB2XtRfPW76a6w==	2020-12-22 09:38:23.851151
192	iCWDt9avKQzU8rVNBqq1Dhsh	Keyboard-Invoice_.pdf	application/pdf	{"identified":true}	134469	DXaYpSJv1R4m9L2yVyJ5zg==	2020-07-31 09:56:27.826158
197	ZhkjWQnV5i5uoisxycAyK1df	Keyboard-Invoice_.pdf	application/pdf	{"identified":true,"analyzed":true}	134469	DXaYpSJv1R4m9L2yVyJ5zg==	2020-07-31 11:01:18.116263
198	p6ipC78RHPbHM4fPHz26NJnE	S.A.Airconditions.pdf	application/pdf	{"identified":true}	319222	KH6gp9T64YOrBRHUtUSCnA==	2020-07-31 11:52:17.805855
199	NSk6wn2pCrF3DNCRCLyHq9WW	S.A.Airconditions.pdf	application/pdf	{"identified":true,"analyzed":true}	319222	KH6gp9T64YOrBRHUtUSCnA==	2020-07-31 11:52:18.222373
200	mduFKAnCbgeQjZz6BpvQ1jys	REG20-21506 (1).pdf	application/pdf	{"identified":true}	107174	HH24e6I28Ps4O987p/tnDg==	2020-09-08 10:58:52.736979
201	7E2yNX9JAyBgLCYftYdTHrNZ	REG20-21506 (1).pdf	application/pdf	{"identified":true,"analyzed":true}	107174	HH24e6I28Ps4O987p/tnDg==	2020-09-08 10:58:53.091079
233	42KtGGqjdgMsBVkL2G24oSVt	iphone-12-mini-bill.pdf	application/pdf	{"identified":true}	400765	JLv5jsJJma0s+2qZapUpcA==	2020-11-18 10:36:37.662395
234	YxUuPRXMt7PbJgLKQzVdb2kR	iphone-12-mini-bill.pdf	application/pdf	{"identified":true,"analyzed":true}	400765	JLv5jsJJma0s+2qZapUpcA==	2020-11-18 10:36:38.126402
235	V7XrPX15Yfz4G8objwk1c65q	profile_picture.jpg	image/jpeg	{"identified":true,"width":1654,"height":1654,"analyzed":true}	656007	pDyZHqZKUt6Zl0dO8OL29g==	2020-11-18 10:50:43.255464
236	Y81r4QB26jR6JxyrtQPAH7TE	samsung-a7-tab.pdf	application/pdf	{"identified":true}	346226	jLQ90xwXsdOTGgddJl4VDQ==	2020-12-22 09:25:24.613527
237	nycqciDKPqHBQWD9P6PHz45T	samsung-a7-tab.pdf	application/pdf	{"identified":true,"analyzed":true}	346226	jLQ90xwXsdOTGgddJl4VDQ==	2020-12-22 09:25:25.040885
239	9gtNuz43s6nTFaGyoxJsXgKX	macbook-charger-gst.pdf	application/pdf	{"identified":true,"analyzed":true}	405733	QZ2oFXODOB2XtRfPW76a6w==	2020-12-22 09:38:24.264968
240	9G66zyy7cCYH3zd5wWd4nUtX	OneplusBill.pdf	application/pdf	{"identified":true}	49313	YimaBsGDGE03e5b7I3x7Sw==	2021-01-19 10:27:11.881884
241	1zW1SqVWSgG74qZZtsUvLn3a	OneplusBill.pdf	application/pdf	{"identified":true,"analyzed":true}	49313	YimaBsGDGE03e5b7I3x7Sw==	2021-01-19 10:27:12.513383
242	vyX5PB2KH4mxSEBEEbLfXdzv	DELL LAPTOP.jpeg	image/jpeg	{"identified":true}	46988	Ti8JILFAjYL7nP9T8ZDmbQ==	2021-01-22 11:04:46.174682
243	a1XejqC1Ghyo19eitaJkTSEb	DELL LAPTOP.jpeg	image/jpeg	{"identified":true,"width":585,"height":1040,"analyzed":true}	46988	Ti8JILFAjYL7nP9T8ZDmbQ==	2021-01-22 11:04:46.465163
244	Acp6wKKRAUzE9J3GFk6TMRxF	profile_picture.jpg	image/jpeg	{"identified":true,"width":280,"height":280,"analyzed":true}	38390	MaogT1n8hyk4vnSA5RsjEQ==	2022-07-22 06:06:20.199603
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: tps
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2019-08-28 10:31:50.696031	2021-05-27 11:28:22.251691
\.


--
-- Data for Name: arrange_sessions; Type: TABLE DATA; Schema: public; Owner: tps
--

COPY public.arrange_sessions (id, topic, description, date, timing, speaker, user_id, created_at, updated_at, place, applicants) FROM stdin;
\.


--
-- Data for Name: asset_histories; Type: TABLE DATA; Schema: public; Owner: tps
--

COPY public.asset_histories (id, user_id, asset_id, from_date, to_date, active, created_at, updated_at, till_today) FROM stdin;
5	51	12	2019-12-21 00:00:00	\N	\N	2020-07-31 14:43:09.730793	2020-07-31 14:43:09.730793	t
4	\N	4	2020-02-29 00:00:00	\N	\N	2020-07-28 10:49:03.002692	2020-08-06 06:07:13.072502	\N
6	\N	17	2019-09-23 00:00:00	\N	\N	2020-08-06 06:10:31.259728	2020-08-06 06:10:31.259728	t
7	\N	16	2019-09-23 00:00:00	\N	\N	2020-08-06 06:11:12.860179	2020-08-06 06:11:12.860179	t
8	\N	15	2019-09-23 00:00:00	\N	\N	2020-08-06 06:21:09.010689	2020-08-06 06:21:09.010689	t
9	\N	13	2019-09-23 00:00:00	\N	\N	2020-08-06 06:21:32.008069	2020-08-06 06:21:32.008069	t
\.


--
-- Data for Name: asset_types; Type: TABLE DATA; Schema: public; Owner: tps
--

COPY public.asset_types (id, name, created_at, updated_at) FROM stdin;
1	Mobile	2020-07-09 05:29:04.074153	2020-07-09 05:29:04.074153
2	iPad	2020-07-09 05:29:12.234914	2020-07-09 05:29:12.234914
3	TV	2020-07-16 09:28:18.707078	2020-07-16 09:28:18.707078
4	Keyboard	2020-07-24 05:52:15.099919	2020-07-24 05:52:15.099919
5	Monitor	2020-07-24 05:52:21.463432	2020-07-24 05:52:21.463432
6	CPU	2020-07-24 05:52:27.921065	2020-07-24 05:52:27.921065
7	Mouse	2020-07-24 05:52:35.77498	2020-07-24 05:52:35.77498
8	Keyboard-Mouse Combo	2020-07-24 05:52:46.555802	2020-07-24 05:52:46.555802
9	Laptop	2020-07-24 05:52:54.39828	2020-07-24 05:52:54.39828
10	Router	2020-07-24 05:53:07.70208	2020-07-24 05:53:07.70208
11	Switch	2020-07-24 05:53:13.229859	2020-07-24 05:53:13.229859
12	Mobile Phone	2020-07-24 05:53:26.149656	2020-07-24 05:53:26.149656
13	Pendrive	2020-07-24 05:53:45.256501	2020-07-24 05:53:45.256501
14	Headphone	2020-07-29 12:47:30.471239	2020-07-29 12:47:30.471239
15	AC	2020-07-31 11:40:47.218057	2020-07-31 11:40:47.218057
16	Tablet	2020-12-22 09:25:51.77193	2020-12-22 09:25:51.77193
17	Charger	2020-12-22 09:39:38.509258	2020-12-22 09:39:38.509258
\.


--
-- Data for Name: assets; Type: TABLE DATA; Schema: public; Owner: tps
--

COPY public.assets (id, name, bought_type, code, price, specification, current_status, notes, asset_type_id, bill_id, created_at, updated_at, warranty) FROM stdin;
54	iPhone 12 mini	Brand new	-	73500		Active		1	52	2020-11-18 10:39:03.01491	2020-11-18 10:39:03.01491	
55	Samusng : T505N TAB A7 GREY TABLET	Brand new	TPS/TAB/	21999		Active		16	53	2020-12-22 09:27:32.890721	2020-12-22 09:27:32.890721	1 year warranty
56	[MD506HN/A] APL 85W MAGSAFE 2 POWER ADAPTER - MD506HN/A	Brand new	TPS/CHR/	7500		Active	PAID	17	54	2020-12-22 09:42:12.866089	2020-12-22 09:42:12.866089	1 YEAR STANDER MANUFACTURER WARRANTY
57	OnePlus 8T Lunar Silver 12+256GB	Brand new	-	45999		Active		1	55	2021-01-19 10:28:35.758278	2021-01-19 10:28:35.758278	
17	Misubishi-AC-Split-1.0tr-MS-GK13VA-3star	Brand new	40731	₹ 31171		Active	2 Services done. Service validity - 20 - September - 2020	15	18	2020-07-31 13:01:35.489603	2020-07-31 14:51:44.362128	1 Year
6	 HP C2500 Wired Combo keyboard and Mouse	Brand new	-	₹ 699		Active		8	12	2020-07-31 11:06:46.090115	2020-07-31 14:51:57.831781	1 year warranty
18	boAt BassHeads 900 Super Extrabass Wired Headset 	Brand new	-	₹ 749		Active		14	10	2020-07-31 13:04:39.479867	2020-07-31 14:52:09.354084	1 year warranty
19	boAt BassHeads 900 Super Extrabass Wired Headset - White	Brand new	-	₹ 749		Active		14	11	2020-07-31 13:12:02.623404	2020-07-31 14:52:17.847519	1 year warranty
12	Dell Laptop	Brand new	-	₹ 41146	Bhaumik's Laptop	Active	Paresh is using this Laptop. We have added ram of 4 GB	9	5	2020-07-31 11:38:17.025697	2020-07-31 14:52:40.766657	1 year warranty
11	HP C2500 Wired Combo keyboard and Mouse	Brand new	-	₹ 699		Active		8	17	2020-07-31 11:34:15.123128	2020-07-31 14:52:54.953649	1 year warranty
7	HP C2500 Wired Combo keyboard and Mouse	Brand new	-	₹ 699		Active		8	13	2020-07-31 11:31:07.628091	2020-07-31 14:53:13.630461	1 year warranty
20	Logitech B100 Wired Optical Mouse	Brand new	-	₹ 274		Active		7	16	2020-07-31 13:14:53.065726	2020-07-31 14:53:52.408266	
10	Logitech B100 Wired Optical Mouse	Brand new	-	₹ 274		Active		7	16	2020-07-31 11:33:30.281705	2020-07-31 14:54:01.23098	1 year warranty
9	Logitech B100 Wired Optical Mouse	Brand new	-	₹ 274		Active		7	16	2020-07-31 11:33:03.94822	2020-07-31 14:54:12.637663	1 year warranty
8	Logitech B100 Wired Optical Mouse	Brand new	-	₹ 274		Active		7	16	2020-07-31 11:32:34.168031	2020-07-31 14:54:24.908618	1 year warranty
16	Misubishi-AC-Split-1.5tr-MS-GK18VA-3star	Brand new	40732	₹ 38296		Active	Last date 20 September 2020	15	18	2020-07-31 13:00:58.877836	2020-07-31 15:01:47.59056	1 Year
15	Misubishi-AC-Split-2.0tr-MS-GK24VA-D1-3star	Brand new	40733	₹ 50730		Active	Warranty till 20 Sept 2020. Left side in big room.	15	18	2020-07-31 12:59:35.336461	2020-07-31 15:06:26.364736	1 Year
13	Misubishi-AC-Split-2.0tr-MS-GK24VA-D1-3star	Brand new	40734	₹ 50730		Active	In big room. Right side. 20 September 2020 warranty expired. 4th service panding.	15	18	2020-07-31 11:57:55.331388	2020-07-31 15:07:31.910671	1 Year
4	MI TV	Brand new	-	₹ 30000	55 Inches Android TV	Active	test	3	2	2020-07-16 09:32:04.587918	2020-07-31 19:56:43.295996	1 Year
21	10.2-inch iPad Wi-Fi 32GB - Silver	Brand new	APPLE-IPAD-02/2020-09	28000	10.2-inch iPad Wi-Fi 32GB - Silver\r\nSKU : MW752HN/A\r\nSDMPD65S3MF3N	Active	Paid	2	19	2020-09-08 11:00:04.353156	2020-09-08 12:12:40.077901	
\.


--
-- Data for Name: audits; Type: TABLE DATA; Schema: public; Owner: tps
--

COPY public.audits (id, auditable_id, auditable_type, associated_id, associated_type, user_id, user_type, username, action, audited_changes, version, comment, remote_address, request_uuid, created_at) FROM stdin;
1	17	User	\N	\N	18	User	\N	update	---\nuser_type:\n- Employee\n- Consultant\n	1	\N	::1	fa239a42-c71e-47a9-ade9-b15057b3e25e	2021-05-27 12:46:21.372854
2	17	User	\N	\N	18	User	\N	update	---\nuser_type:\n- Consultant\n- Trainee\n	2	\N	::1	0ac1b330-1efd-4d4e-bd5b-f8db9eedad68	2021-05-27 12:46:36.215721
3	17	User	\N	\N	18	User	\N	update	---\nuser_type:\n- Trainee\n- Employee\n	3	\N	::1	ffde33ce-9520-4511-a6ed-e831fa8294f2	2021-05-27 12:46:50.802148
4	17	User	\N	\N	18	User	\N	update	---\nuser_type:\n- Employee\n- Consultant\n	4	\N	::1	4d3258fd-bad7-4740-aa5a-77363939bad6	2022-06-24 05:46:20.417278
\.


--
-- Data for Name: bills; Type: TABLE DATA; Schema: public; Owner: tps
--

COPY public.bills (id, number, bill_date, discription, amount, status, paid_amount, paid_from, paid_via, paid_notes, gst_bill, gst_uploaded, vendor_id, created_at, updated_at) FROM stdin;
1	SA/20-21/330	2020-06-02 00:00:00	Mitshubishi AC Split 1.5 Ton. MS-GK18VA-3Star	44500.0	0	44500.0	HDFC BANK	CHEQUE	Paid	t	\N	1	2020-06-23 20:20:20.563722	2020-06-23 20:20:20.572584
2	SMN0074022000882	2020-02-29 00:00:00	MI TV 4X - 50 Inches | Black | 	30998.0	0	30998.0	HDFC PVT	Debit Card	Serial Number - 22154/121100066135	t	\N	2	2020-06-23 20:50:32.478665	2020-06-23 20:50:32.483814
3	2019-20/625	2019-09-25 00:00:00	WATER COOLER	20650.0	0	20650.0	-	CASH	CASH PAYMENT	t	\N	3	2020-07-29 07:32:27.181365	2020-07-29 07:32:27.188961
5	1410424823	2019-12-21 00:00:00	LAPTOP	41146.61	0	41146.61	BANK	NEFT	Neft	t	\N	5	2020-07-29 08:30:20.053365	2020-07-29 08:30:20.06738
17	FACR8Q2000478933	2019-07-01 00:00:00	HP C2500 Wired Combo keyboard and Mouse -  Warranty: 1 Years By Hp   	699.0	0	699.0	Credi Card	HDFC Credit Card	Paid	t	\N	10	2020-07-31 11:01:18.126735	2020-07-31 11:01:18.132474
11	 FABV4D2000349274	2020-03-11 00:00:00	boAt BassHeads 900 Super Extra Bass Wired Headset	749.0	0	749.0	Credi Card	Axis Cc	Paid	t	\N	10	2020-07-30 08:49:39.334257	2020-07-30 08:49:39.337719
16	FAAAAB2001898095	2019-07-01 00:00:00	Logitech B100 Wired Optical Mouse	822.0	0	822.0	Credi Card	HDFC Credit Card	Paid	t	\N	10	2020-07-31 10:53:36.871277	2020-07-31 13:16:18.842898
13	FACRBQ2000478616	2019-07-01 00:00:00	HP C2500 Wired Combo keyboard and Mouse	699.0	0	699.0	Credi Card	HDFC Credit Card	Paid	t	\N	10	2020-07-30 08:59:57.937499	2020-07-30 09:00:38.450171
12	FACRBQ2000478614	2019-07-01 00:00:00	HP C2500 Wired Combo keyboard and Mouse	699.0	0	699.0	Credi Card	HDFC Credit Card	paid	t	\N	10	2020-07-30 08:55:43.562453	2020-07-30 09:21:37.955201
10	FABV4D20003553280	2020-03-16 00:00:00	boAt BassHeads 900 Super Extra Bass Wired Headset	749.0	0	749.0	Credi Card	Axis Cc	Paid	t	\N	11	2020-07-30 08:48:11.415414	2020-07-30 10:15:01.497309
18	SA/19-20/1725	2019-09-23 00:00:00	Mistibishi-AC-Split-2.0tr-MS-GK24VA-D1-3Star	192000.0	0	192000.0	HDFC PVT LTD	CHEQUE	Paid	t	\N	12	2020-07-31 11:52:18.237188	2020-07-31 19:42:11.757235
4	19-20/340	2020-01-08 00:00:00	4GB DDR4 LAPTOP RAM	2500.0	0	2500.0	HDFC PVT LTD	NEFT	NEFT	t	\N	4	2020-07-29 07:36:32.810373	2020-07-31 19:50:28.405151
6	PLBMH19200001655	2019-10-17 00:00:00	Shophie 2 Seater Sofa in Rust Colour by CasaCraft	24499.0	0	24499.0	HDFC Credit Card 	HDFC CREDIT CARD & CASH	PAID	t	\N	6	2020-07-29 08:48:20.823763	2020-07-31 19:55:36.513208
19	RE/G/20-21/506	2020-09-08 00:00:00	10.2-inch iPad Wi-Fi 32GB - Silver	28000.0	0	28000.0	BANK	NEFT	Paid	t	\N	14	2020-09-08 10:58:53.098167	2020-09-08 10:58:53.1077
52	RE/G/20-21/992	2020-11-13 00:00:00	iPhone 12 mini	73500.0	0	73500.0	HDFC Credit Card 	HDFC Credit Card	paid	t	\N	14	2020-11-18 10:36:38.136938	2020-11-18 10:36:38.149796
53	SI/KCPNR/1164	2020-12-15 00:00:00	SAMSUNG : T505N TAB A7 GREY TABLET	21999.0	0	21999.0	HDFC Credit Card 	HDFC Credit Card	paid	t	\N	47	2020-12-22 09:25:25.05269	2020-12-22 09:25:25.063762
54	43/20-21/1720	2020-12-22 00:00:00	[MD506HN/A] APL 85W MAGSAFE 2 POWER ADAPTER - MD506HN/A	7500.0	0	7500.0	HDFC Credit Card 	Credit Card 	PAID	t	\N	48	2020-12-22 09:38:24.277171	2020-12-22 09:38:24.28768
55	GJASAA2021008763	2021-01-16 00:00:00	OnePlus 8T Lunar Silver 12+256GB	45999.0	0	45999.0	Credi Card	Credit Card 	Paid	t	\N	49	2021-01-19 10:27:12.523185	2021-01-19 10:27:12.534411
56	SLA228050005399	2021-01-18 00:00:00	DELL LAPTOP	166894.1	0	165895.0	HDFC NEFT	HDFC BANK	Paid	t	\N	50	2021-01-22 11:04:46.478814	2021-01-22 11:04:46.485551
\.


--
-- Data for Name: checklist_item_users; Type: TABLE DATA; Schema: public; Owner: tps
--

COPY public.checklist_item_users (id, user_id, checklist_item_id, created_at, updated_at) FROM stdin;
2	18	1	2022-06-22 07:16:46.903304	2022-06-22 07:16:46.903304
64	17	2	2022-06-24 06:21:06.125668	2022-06-24 06:21:06.125668
66	17	40	2022-06-24 06:32:23.344475	2022-06-24 06:32:23.344475
67	17	41	2022-06-24 06:32:24.417622	2022-06-24 06:32:24.417622
68	17	42	2022-06-24 06:32:25.440923	2022-06-24 06:32:25.440923
70	60	2	2022-06-24 07:11:50.568596	2022-06-24 07:11:50.568596
71	60	39	2022-06-24 07:11:52.443625	2022-06-24 07:11:52.443625
72	60	40	2022-06-24 07:11:52.947855	2022-06-24 07:11:52.947855
73	60	41	2022-06-24 07:11:53.582713	2022-06-24 07:11:53.582713
74	60	42	2022-06-24 07:11:54.060803	2022-06-24 07:11:54.060803
75	60	45	2022-06-24 07:11:54.949207	2022-06-24 07:11:54.949207
76	60	46	2022-06-24 07:11:55.43837	2022-06-24 07:11:55.43837
79	58	39	2022-06-29 04:56:43.573639	2022-06-29 04:56:43.573639
80	58	40	2022-06-29 04:56:44.104484	2022-06-29 04:56:44.104484
81	58	41	2022-06-29 04:56:44.654348	2022-06-29 04:56:44.654348
82	58	42	2022-06-29 04:56:45.112108	2022-06-29 04:56:45.112108
83	58	2	2022-06-29 04:56:48.648832	2022-06-29 04:56:48.648832
85	58	1	2022-06-29 05:06:56.090812	2022-06-29 05:06:56.090812
\.


--
-- Data for Name: checklist_items; Type: TABLE DATA; Schema: public; Owner: tps
--

COPY public.checklist_items (id, name, checklist_id, created_at, updated_at) FROM stdin;
1	checklist item 1	2	2022-06-14 06:21:29.21118	2022-06-14 06:21:29.21118
2	checklist item 2	2	2022-06-14 06:21:33.954271	2022-06-14 06:21:33.954271
39	Make Resume	5	2022-06-24 06:31:57.185755	2022-06-24 06:31:57.185755
40	Give resume to Hemali/Laura	5	2022-06-24 06:31:57.213356	2022-06-24 06:31:57.213356
41	Create EMail id + Skype id	5	2022-06-24 06:31:57.216424	2022-06-24 06:31:57.216424
42	Ask photos from the relative consultant/company	5	2022-06-24 06:31:57.219511	2022-06-24 06:31:57.219511
45	test 	7	2022-06-24 07:04:40.774228	2022-06-24 07:04:40.774228
46	test 2	7	2022-06-24 07:04:40.776253	2022-06-24 07:04:40.776253
\.


--
-- Data for Name: checklist_users; Type: TABLE DATA; Schema: public; Owner: tps
--

COPY public.checklist_users (id, user_id, checklist_id, created_at, updated_at) FROM stdin;
1	14	7	2022-06-24 07:04:40.81586	2022-06-24 07:04:40.81586
2	56	7	2022-06-24 07:04:40.825776	2022-06-24 07:04:40.825776
3	62	7	2022-06-24 07:04:40.84101	2022-06-24 07:04:40.84101
4	66	7	2022-06-24 07:04:40.854888	2022-06-24 07:04:40.854888
5	63	7	2022-06-24 07:04:40.86607	2022-06-24 07:04:40.86607
7	53	7	2022-06-24 07:04:40.889393	2022-06-24 07:04:40.889393
8	64	7	2022-06-24 07:04:40.899774	2022-06-24 07:04:40.899774
10	52	7	2022-06-24 07:04:40.912348	2022-06-24 07:04:40.912348
11	55	7	2022-06-24 07:04:40.926828	2022-06-24 07:04:40.926828
12	67	7	2022-06-24 07:04:40.935552	2022-06-24 07:04:40.935552
13	51	7	2022-06-24 07:04:40.941149	2022-06-24 07:04:40.941149
14	54	7	2022-06-24 07:04:40.945997	2022-06-24 07:04:40.945997
15	1	7	2022-06-24 07:04:40.958025	2022-06-24 07:04:40.958025
16	65	7	2022-06-24 07:04:40.969051	2022-06-24 07:04:40.969051
17	16	7	2022-06-24 07:04:40.973825	2022-06-24 07:04:40.973825
18	13	7	2022-06-24 07:04:40.978081	2022-06-24 07:04:40.978081
19	68	7	2022-06-24 07:04:40.986256	2022-06-24 07:04:40.986256
20	61	7	2022-06-24 07:04:40.993442	2022-06-24 07:04:40.993442
21	15	7	2022-06-24 07:04:41.004558	2022-06-24 07:04:41.004558
25	18	7	2022-06-24 07:04:41.028735	2022-06-24 07:04:41.028735
27	14	2	2022-06-24 07:05:39.401831	2022-06-24 07:05:39.401831
28	14	5	2022-06-24 07:05:39.435059	2022-06-24 07:05:39.435059
29	56	2	2022-06-24 07:05:39.459075	2022-06-24 07:05:39.459075
30	56	5	2022-06-24 07:05:39.476473	2022-06-24 07:05:39.476473
31	62	2	2022-06-24 07:05:39.488232	2022-06-24 07:05:39.488232
32	62	5	2022-06-24 07:05:39.498003	2022-06-24 07:05:39.498003
33	66	2	2022-06-24 07:05:39.509711	2022-06-24 07:05:39.509711
34	66	5	2022-06-24 07:05:39.519889	2022-06-24 07:05:39.519889
35	63	2	2022-06-24 07:05:39.535306	2022-06-24 07:05:39.535306
36	63	5	2022-06-24 07:05:39.554387	2022-06-24 07:05:39.554387
38	59	5	2022-06-24 07:05:39.587636	2022-06-24 07:05:39.587636
39	53	2	2022-06-24 07:05:39.600164	2022-06-24 07:05:39.600164
40	53	5	2022-06-24 07:05:39.621697	2022-06-24 07:05:39.621697
41	64	2	2022-06-24 07:05:39.644041	2022-06-24 07:05:39.644041
42	64	5	2022-06-24 07:05:39.670329	2022-06-24 07:05:39.670329
43	57	2	2022-06-24 07:05:39.688736	2022-06-24 07:05:39.688736
44	57	5	2022-06-24 07:05:39.70739	2022-06-24 07:05:39.70739
45	52	2	2022-06-24 07:05:39.720432	2022-06-24 07:05:39.720432
46	52	5	2022-06-24 07:05:39.729922	2022-06-24 07:05:39.729922
47	55	2	2022-06-24 07:05:39.741569	2022-06-24 07:05:39.741569
48	55	5	2022-06-24 07:05:39.755287	2022-06-24 07:05:39.755287
49	67	2	2022-06-24 07:05:39.777041	2022-06-24 07:05:39.777041
50	67	5	2022-06-24 07:05:39.797681	2022-06-24 07:05:39.797681
51	51	2	2022-06-24 07:05:39.807962	2022-06-24 07:05:39.807962
52	51	5	2022-06-24 07:05:39.81866	2022-06-24 07:05:39.81866
53	54	2	2022-06-24 07:05:39.832369	2022-06-24 07:05:39.832369
54	54	5	2022-06-24 07:05:39.853866	2022-06-24 07:05:39.853866
55	1	2	2022-06-24 07:05:39.877463	2022-06-24 07:05:39.877463
56	1	5	2022-06-24 07:05:39.90635	2022-06-24 07:05:39.90635
57	65	2	2022-06-24 07:05:39.922263	2022-06-24 07:05:39.922263
58	65	5	2022-06-24 07:05:39.939821	2022-06-24 07:05:39.939821
59	16	2	2022-06-24 07:05:39.955742	2022-06-24 07:05:39.955742
60	16	5	2022-06-24 07:05:39.973353	2022-06-24 07:05:39.973353
61	13	2	2022-06-24 07:05:39.986724	2022-06-24 07:05:39.986724
62	13	5	2022-06-24 07:05:39.994304	2022-06-24 07:05:39.994304
63	68	2	2022-06-24 07:05:40.007843	2022-06-24 07:05:40.007843
64	68	5	2022-06-24 07:05:40.062181	2022-06-24 07:05:40.062181
65	61	2	2022-06-24 07:05:40.07646	2022-06-24 07:05:40.07646
66	61	5	2022-06-24 07:05:40.097136	2022-06-24 07:05:40.097136
67	15	2	2022-06-24 07:05:40.110112	2022-06-24 07:05:40.110112
68	15	5	2022-06-24 07:05:40.13009	2022-06-24 07:05:40.13009
70	69	5	2022-06-24 07:05:40.151319	2022-06-24 07:05:40.151319
71	58	2	2022-06-24 07:05:40.162449	2022-06-24 07:05:40.162449
72	58	5	2022-06-24 07:05:40.184832	2022-06-24 07:05:40.184832
74	60	5	2022-06-24 07:05:40.205694	2022-06-24 07:05:40.205694
75	18	2	2022-06-24 07:05:40.219883	2022-06-24 07:05:40.219883
76	18	5	2022-06-24 07:05:40.238359	2022-06-24 07:05:40.238359
77	17	2	2022-06-24 07:05:40.253367	2022-06-24 07:05:40.253367
78	17	5	2022-06-24 07:05:40.272472	2022-06-24 07:05:40.272472
\.


--
-- Data for Name: checklists; Type: TABLE DATA; Schema: public; Owner: tps
--

COPY public.checklists (id, category, status, created_at, updated_at, "position") FROM stdin;
7	cate 	0	2022-06-24 07:04:40.771212	2022-06-24 07:04:40.771212	1
2	category 1	0	2022-06-14 06:20:34.406644	2022-06-14 06:20:34.406644	2
5	Upwork Consultant Onboarding	0	2022-06-24 06:31:57.108176	2022-06-24 06:31:57.108176	3
\.


--
-- Data for Name: companies; Type: TABLE DATA; Schema: public; Owner: tps
--

COPY public.companies (id, comp_name, comp_address, comp_contact, comp_email, website_link, subdomain, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: consultant_handbooks; Type: TABLE DATA; Schema: public; Owner: tps
--

COPY public.consultant_handbooks (id, section, content, "position", created_at, updated_at) FROM stdin;
1	Consultant 1	<p><span style="font-size:12px"><span style="font-family:Arial,Helvetica,sans-serif">Consultant 1</span></span></p>\r\n\r\n<p><span style="font-size:12px"><span style="font-family:Arial,Helvetica,sans-serif">Consultant 1</span></span></p>\r\n\r\n<p><span style="font-size:12px"><span style="font-family:Arial,Helvetica,sans-serif">Consultant 1</span></span></p>\r\n\r\n<p><span style="font-size:12px"><span style="font-family:Arial,Helvetica,sans-serif">Consultant 1</span></span></p>\r\n	1	2022-06-06 04:44:37.645731	2022-06-06 04:46:52.670549
2	Consultant 2	<p><span style="font-size:12px"><span style="font-family:Arial,Helvetica,sans-serif">consultant 2&nbsp;consultant 2&nbsp;consultant 2</span></span></p>\r\n\r\n<p><span style="font-size:12px"><span style="font-family:Arial,Helvetica,sans-serif">consultant 2</span></span></p>\r\n\r\n<p><span style="font-size:12px"><span style="font-family:Arial,Helvetica,sans-serif">consultant 2</span></span></p>\r\n	2	2022-06-06 04:44:55.988758	2022-06-06 04:47:08.213916
\.


--
-- Data for Name: credential_types; Type: TABLE DATA; Schema: public; Owner: tps
--

COPY public.credential_types (id, name, created_at, updated_at) FROM stdin;
1	Upwork	2020-06-09 12:29:47.465557	2020-06-09 12:29:47.465557
2	Slack	2020-06-09 12:29:54.107125	2020-06-09 12:29:54.107125
4	Jira	2020-06-11 21:00:49.02781	2020-06-11 21:00:49.02781
5	Outlook	2020-06-13 09:36:12.035863	2020-06-13 09:36:12.035863
6	Slack, Jira, Outlook	2020-06-13 09:39:46.245715	2020-06-13 09:39:46.245715
7	Project	2020-06-13 09:44:34.721721	2020-06-13 09:44:34.721721
8	Wordpress Admin	2020-06-13 09:46:36.453251	2020-06-13 09:46:36.453251
9	Cpanel	2020-06-13 09:49:11.404183	2020-06-13 09:49:11.404183
10	Hosting	2020-06-13 09:50:28.866922	2020-06-13 09:50:37.787571
11	Booking Admin	2020-06-13 09:52:20.659218	2020-06-13 09:52:20.659218
12	Staging	2020-06-13 09:57:53.620984	2020-06-13 09:57:53.620984
13	Production	2020-06-13 09:58:01.571194	2020-06-13 09:58:01.571194
14	Google Doc	2020-06-16 05:32:49.83832	2020-06-16 05:32:49.83832
15	Gmail	2020-06-25 12:40:20.962353	2020-06-25 12:40:20.962353
16	Github	2020-06-25 12:42:52.666549	2020-06-25 12:42:52.666549
17	SMS Gateway	2020-07-16 06:05:26.222281	2020-07-16 06:05:26.222281
18	All	2020-08-11 15:06:03.288586	2020-08-11 15:06:03.288586
19	Apple ID	2020-09-08 11:11:00.857212	2020-09-08 11:11:00.857212
\.


--
-- Data for Name: credentials; Type: TABLE DATA; Schema: public; Owner: tps
--

COPY public.credentials (id, project_name, notes, last_updated_by, credential_type_id, created_at, updated_at, email, password, username, link) FROM stdin;
16	Guniguru	<p>mayur@fotonvr.com<br />\r\nmayurfotonvr<br />\r\n<br />\r\nmehulpatel888@gmail.com<br />\r\nmehulfotonvr<br />\r\n<br />\r\nAdmin- admin@gmail.com<br />\r\nguniguru@321<br />\r\n<br />\r\nInstructor- bhaumik_instructor@yopmail.com<br />\r\ntechplus123<br />\r\n<br />\r\nStudent - poojapatel.kachhua@gmail.com<br />\r\npoojafotonvr</p>\r\n	Bhaumik Gadani	13	2020-07-01 11:50:22.513625	2020-07-10 06:37:23.592923	admin@gmail.com	guniguru@321	\N	www.guniguru.com
2	Brian	<p>Jira Credential</p>\r\n\r\n<p>viral@techplusteam.com</p>\r\n\r\n<p>techplus123 \\</p>\r\n\r\n<p>Slack viralp@protovate.com techplus123</p>\r\n	Bhaumik Gadani	6	2020-06-13 09:37:33.735956	2020-10-29 18:44:44.659574	Viral Account	techplus123		
53	TPSTracker	<p>Url - bluehost.com<br />\r\nUsername - tpstracker.com<br />\r\nPassword - U4REs|iG&gt;@_8c</p>\r\n	Bhaumik Gadani	9	2020-07-16 06:35:20.607846	2020-07-16 06:35:20.607846	tpstracker.com	U4REs|iG>@_8c	\N	bluehost.com
9	Tatvasoft	Docasdsadasd asDocasdsadasd asDocasdsadasd asDocasdsadasd asDocasdsadasd asDocasdsadasd asDocasdsadasd asDocasdsadasd asDocasdsadasd asDocasdsadasd asDocasdsadasd asDocasdsadasd asDocasdsadasd asDocasdsadasd asDocasdsadasd asDocasdsadasd asDocasdsadasd asDocasdsadasd asDocasdsadasd asDocasdsadasd asDocasdsadasd asDocasdsadasd asDocasdsadasd asDocasdsadasd asDocasdsadasd asDocasdsadasd asDocasdsadasd asDocasdsadasd asDocasdsadasd asDocasdsadasd asDocasdsadasd asDocasdsadasd asDocasdsadasd asDocasdsadasd asDocasdsadasd asvvv	Bhaumik Gadani	14	2020-06-16 05:33:24.893421	2020-06-19 22:02:57.673393	test@test.com	test123		https://docs.google.com/spreadsheets/d/1-LtGMOihBC3I89usApNPb3hLxct_GJCh8hE-ZbpR_3E/edit?ts=5e4bb88c&pli=1#gid=1350115957
13	Chintan	chintan-github\r\nchintanukworks@gmail.com\r\nBhaumik609	Bhaumik Gadani	16	2020-06-25 12:43:21.750013	2020-06-25 12:43:21.750013	chintanukworks@gmail.com	Bhaumik609	\N	
15	Ortho	Staging url	Bhaumik Gadani	12	2020-06-30 05:37:17.168566	2020-06-30 05:37:17.168566	admin@gmail.com	admin123	\N	http://104.251.216.241/demo/ortho/login
17	Timelapsed	<p><b>bluehost.com </b></p>\r\n\r\n<p>previewphoto.com<br />\r\nZ&lt;rw*\\0vsur</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><b>NEW Time lapsed server : </b></p>\r\n\r\n<p>www.bluehost.com<br />\r\nusername : focalwire.com<br />\r\npassword : 8c(iZvU$7F</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><b>== SSH Access ==</b><br />\r\nssh preview8@previewphoto.com<br />\r\n%BgxWxH8yEh</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><b>WHM</b><br />\r\n<a href="https://previewphoto.com:2087/">https://previewphoto.com:2087/</a><br />\r\nroot<br />\r\nQBzLy6Nz8!!</p>\r\n\r\n<p>&nbsp;</p>\r\n	Bhaumik Gadani	13	2020-07-02 05:30:35.289547	2020-08-26 13:00:29.317844			\N	previewphoto.com & www.bluehost.com
19	Upwork	>> Dipesh:- \r\n   > Slack, Jira, gitlab : dipesh@techplusteam.com /techplus123\r\n   > Upwork  : bhavingtps / techplus123\r\n--------------------------------\r\n>> Nikita:- \r\n   > Upwork & Slack : ravinatps@gmail.com /  techplus123\r\n----------------------------------\r\n>> Khyati:- \r\n   > Upwork : Bhaviktps/techplus123\r\n---------------------------------\r\n>> Karan:- \r\n   > Upwork : karantps/ techplus123\r\n   >*Slack, JIRA, Gitlab* : karan@techplusteam.com/ techplus123\r\n---------------------------------\r\n>> Bhavin\r\n   > Slack & JIra  : bhavin@techplusteam.com / techplus123        \r\n   > upwork : bhavingtps/techplus123\r\n-------------------------------------\r\n>> Rajeshree:- \r\n   > Slack : sohamworktps@gmail.com/techplus123\r\n   > upwork :  sohamtps/ Techplus123\r\n   > git :  sohamtps  |   sohamworktps@gmail.com\r\n        techplus123 |  Soham@tech123\r\n    > jira :  sohamtps/teshplus123\r\n-------------------------------------\r\n>> Jigarbhai:- \r\n  > Upwork : viraltps/techplus123\r\n  > Email \r\n     www.outlook.office.com \r\n     viralp@protovate.com/PLwdd925\r\n> Slack & Jira : viral@techplusteam.com/techplus123\r\n-----------------------------------------\r\n>> Khushbu:- \r\n   > upwork : khushbutps/khushi@786\r\n  > slack : khushbu.tps1@gmail.com/khushi@786\r\n  > JEERA : khushbu.tps1@gmail.com/khushi123\r\n--------------------------------------------\r\n>> Prashant:- \r\n   > Upwork :  prashanttps/techplus123\r\n   > JIRA & Slack : prashant@techplusteam.com/techplus123\r\n---------------------------------------------\r\n>> Labdhi:- \r\n  > Upwork : jigartps/ techplus123\r\n  > Slack : unnati@techplusteam.com / techplus123\r\n  > JIRA : unnati@techplusteam.com / Techplus123\r\n------------------------------------------------\r\n>> Unnati:- \r\n   > Upwork : Unnatitps/techplus123\r\n   >*Slack* : unnati@techplusteam.com/ techplus123\r\n   > JIRA : unnati@techplusteam.com/ Techplus123\r\n--------------------------------------------------\r\n>> Chintan :- \r\n  >*Upwork* : tanay@techplusteam.com/ techplus123\r\n----------------------------------------------\r\n>> Richa:- \r\n  > Upwork : chintantps/ techplus123\r\n > slack : chintank.tps@gmail.com/techplus123\r\n------------------------------------\r\n>> Kinjal Upadhyay:- \r\n   > gitlab : sagarrabadiyatps@gmail.com/ sagar1234\r\n   > Upwork  : sagartps1/ techplus123\r\n-------------------------------------\r\n>> Dhara pradhan :- \r\n   > Upwork - hardiktps/techplus123\r\n   > Slack\\Jira - honey@techplusteam.com/techplus123\r\n--------------------------------------\r\n>> Honey:- \r\n   > Upwork : honeytps/ techplus123\r\n   > Slack : honey@techplusteam.com/ techplus123\r\n   > JIRA :  honey@techplusteam.com/ techplus123\r\n--------------------------------------\r\n>> Binoli :- \r\n  > Upwork : Binolitps/Binoli@123#\r\n  > slack & JIRA : binoli@techplusteam.com / binoli123\r\n-----------------------------------------\r\nLabdhi: \r\nUpwork : labdhitps/techplus123\r\nSlack & JIRA : labdhitps@outlook.com/techplus123	Bhaumik Gadani	1	2020-07-07 06:22:56.966233	2020-07-07 06:22:56.966233	All	All	\N	All
54	test	<p>test</p>\r\n	Bhaumik Gadani	9	2020-07-16 06:35:49.403717	2020-07-16 06:35:49.403717	test	test	\N	test
14	Ortho	<p>Ortho project&#39;s other url virtualceo.in.cp-in-20.webhostbox.net/patients</p>\r\n\r\n<p>Production URL :&nbsp;http://cp-in-20.whb.tempwebhost.net/~virturqj/login</p>\r\n\r\n<p>Cpanel Details :</p>\r\n\r\n<p>Username: virturqj<br />\r\nPassword: wHe*^1A5B0Rm5~6#</p>\r\n	Bhaumik Gadani	13	2020-06-30 05:36:08.559976	2020-11-23 06:10:47.105876	admin@gmail.com	admin123	\N	http://cp-in-20.whb.tempwebhost.net/~virturqj/login
11	Alphainvoice	<p><b>NEW Godaddy login -</b></p>\r\n\r\n<p>info@nyloncage.com<br />\r\nalpha+2019</p>\r\n\r\n<p><b>Cpanel</b></p>\r\n\r\n<p>http://alphaengn.in/cpanel<br />\r\nltoewqvkez44/Alpha+2019</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><b>Website URL</b></p>\r\n\r\n<p>alphainvoice OLD - http://alphainvoice.alphaengn.in/<br />\r\nAlpha invoice - Inspection &nbsp;http://alphainsp.alphaengn.in/<br />\r\nalphav2 NEW(react + Laravel) - http://alphav2.alphaengn.in/</p>\r\n	Bhaumik Gadani	10	2020-06-22 09:53:34.899895	2020-08-31 13:30:33.758427	info@nyloncage.com	alpha+2019	\N	www.godaddy.com
18	Smartprint	<p><b>Test Customer Login &ndash; </b></p>\r\n\r\n<p>http://104.251.216.241/demo/smartprint/</p>\r\n\r\n<p>Mobile number &ndash; 1234567890</p>\r\n\r\n<p>Password &ndash; 123123123</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><b>Admin Link</b></p>\r\n\r\n<p>http://104.251.216.241/demo/smartprint/admin/login</p>\r\n\r\n<p>admin@gmail.com</p>\r\n\r\n<p><em>admin123</em></p>\r\n	Bhaumik Gadani	12	2020-07-02 11:29:01.157897	2020-07-30 10:13:23.361053	Check notes	Check Notes	\N	Check Notes
52	SMS Indori	<p><b>Reseller</b></p>\r\n\r\n<p>techplus/12345</p>\r\n\r\n<p>---------------------------------</p>\r\n\r\n<p><b>ShreejiOrtho</b></p>\r\n\r\n<p>Shreejiortho<br />\r\njk95501@gmail.com<br />\r\n12345</p>\r\n\r\n<p>-----------------------------</p>\r\n\r\n<p><b>SmartPrint</b></p>\r\n\r\n<p>smartprint<br />\r\n9879544950<br />\r\nhitesh@smartprintsolution.com</p>\r\n\r\n<p>-----------------------------</p>\r\n\r\n<p>New JIO REIGSTERATION KYC</p>\r\n\r\n<p><b>Techplus</b></p>\r\n\r\n<p>Header : TECHPL</p>\r\n\r\n<p>https://trueconnect.jio.com/#/</p>\r\n\r\n<p>https://trueconnect.jio.com/#/header/principal-header-summary</p>\r\n\r\n<p>info@techplussoftware.com</p>\r\n\r\n<ul>\r\n\t<li>SRJORT</li>\r\n\t<li>SPCAFE</li>\r\n\t<li>TECHPL</li>\r\n</ul>\r\n	Bhaumik Gadani	17	2020-07-16 06:11:15.645041	2020-09-12 07:17:57.165416	techplus	12345	\N	http://sms.smsindori.com/Dashboard.php?page=user
55	Etyme	<p><b>Super Admin</b></p>\r\n\r\n<p><a href="https://app.etyme.com/sadmin/login">https://app.etyme.com/sadmin/login</a></p>\r\n\r\n<p>sharath@demoetyme.com</p>\r\n\r\n<p>testing1234</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><b>AWS</b></p>\r\n\r\n<p>icodeforme@gmail.com : root@09109</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><b>Staging Job creator</b></p>\r\n\r\n<p>https://cloudepa.demoetyme.com/jobs?type=Job&nbsp;</p>\r\n\r\n<p>hradmin@cloudepa.com</p>\r\n\r\n<p>cloudepa123@</p>\r\n	Bhaumik Gadani	18	2020-08-13 10:45:14.958746	2020-08-13 10:45:14.958746			\N	https://app.etyme.com/sadmin/login
5	Adam Wilkey	<p><b>Wordpress:</b><br />\r\nhttp://adamwilkeychiropractor.com/wp-admin<br />\r\nadmin<br />\r\nadam+2019</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><b>Cpanel:</b><br />\r\nUrl: http://adamwilkeychiropractor.com/cpanel<br />\r\nUser: adamwilk<br />\r\nPass:&nbsp;<s>R#}B~)]u_RTC</s><br />\r\nNew Password (31 July 2020 onward)&nbsp; : &amp;&amp;39hQs9vP</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><b>Server Guy:</b><br />\r\nmarkgorey@gmail.com</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><b>Live Booking Admin:</b><br />\r\nLink- http://adamwilkeychiropractor.com/booking/login<br />\r\nEmail : admin@gmail.com<br />\r\nPassword : Awcol99sn!<br />\r\n&nbsp;</p>\r\n\r\n<p><b>Hosting&nbsp;</b><br />\r\nHosting - freestart.com<br />\r\nwww.adamwilkeychiropractor.com<br />\r\nadam.wilkey<br />\r\nj8cab8k8</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><b>Live user login (for test)</b><br />\r\nchintanukworks@gmail.com<br />\r\ntechplus123</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><b>FTP</b></p>\r\n\r\n<p>host:&nbsp;<a href="http://ftp.adamwilkeychiropractor.com/" target="_blank">ftp.adamwilkeychiropractor.com</a></p>\r\n\r\n<p>user:&nbsp;<a href="mailto:chintanworks@adamwilkeychiropractor.com" target="_blank">chintanworks@adamwilkeychiropractor.com</a></p>\r\n\r\n<p>pw:&nbsp;~@]BziX&amp;E{pw</p>\r\n	Bhaumik Gadani	18	2020-06-13 09:47:23.063429	2020-08-27 13:28:28.826592	View Notes	View Notes		http://adamwilkeychiropractor.com
57	Kalpana's Creations	<p><b>bluehost.com</b></p>\r\n\r\n<p>kalpanascreations.com</p>\r\n\r\n<p>Techplus_kc_123</p>\r\n\r\n<p>R</p>\r\n	Bhaumik Gadani	10	2020-09-01 06:00:50.116715	2020-09-01 06:11:24.964941	kalpanascreations.com	Techplus_kc_123	\N	bluehost.com RENEWAL on 9 APRIL 2021
58	Apple ID	<p><b>2020 Apple ID&nbsp;</b></p>\r\n\r\n<p>seo@techplussoftware.com<br />\r\n123Techplus@<br />\r\n&nbsp;</p>\r\n\r\n<p>Above ID is being used for new iPad purchased on 09sept.</p>\r\n\r\n<p>Its UDID is :&nbsp;08ff27627b8eed8de813582aa07fe69c7c65a0ff</p>\r\n	Bhaumik Gadani	19	2020-09-08 11:12:02.697271	2020-09-08 12:21:21.799162	seo@techplussoftware.com	123Techplus@	\N	
91	Kitchner	<p>http://104.251.216.241/demo/kitchener/wp-admin/<br />\r\nkitchener_immi / KI@tcheNER!IMM</p>\r\n	Bhaumik Gadani	8	2020-12-11 11:30:10.994139	2020-12-11 11:30:10.994139	kitchener_immi 	KI@tcheNER!IMM	\N	http://104.251.216.241/demo/kitchener/wp-admin/
92	ECard	<p><b>CPANEL :&nbsp;</b></p>\r\n\r\n<p>https://www.siteground.com/</p>\r\n\r\n<p>https://ecard.chubb.com:8443/</p>\r\n\r\n<p>username: alan@daker.com.sg<br />\r\npassword: %o^b4H4@*v3]</p>\r\n\r\n<p><b>Login URL</b></p>\r\n\r\n<p>http://ecard.chubb.com/greetings</p>\r\n\r\n<p>http://ecard.chubb.com/hk-life/public/user</p>\r\n\r\n<p>bhaumikwork@gmail.com/123456</p>\r\n\r\n<p><b>Admin</b></p>\r\n\r\n<p>username : admin@ecard.chubb.com<br />\r\npassword : chubb@si@888</p>\r\n\r\n<p><b>Non Admin&nbsp;</b></p>\r\n\r\n<p>bhaumikwork@gmail.com/123456</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><b>SSL</b></p>\r\n\r\n<p>ssh chubbasia@117.120.7.79<br />\r\nchubb@si@888</p>\r\n	Bhaumik Gadani	18	2020-12-17 12:23:35.650341	2020-12-17 12:30:30.315126	alan@daker.com.sg	%o^b4H4@*v3]	\N	https://www.siteground.com/
\.


--
-- Data for Name: degrees; Type: TABLE DATA; Schema: public; Owner: tps
--

COPY public.degrees (id, name, created_at, updated_at, user_id) FROM stdin;
2	MCA	2019-10-04 13:07:15.125578	2019-10-04 13:07:15.125578	\N
6	BCA	2019-10-10 14:12:07.168326	2019-10-10 14:12:07.168326	\N
4	B.Com	2019-10-10 14:11:18.306908	2019-10-15 06:56:32.458646	\N
3	M.Com	2019-10-10 14:10:33.921018	2019-10-15 06:56:39.751656	\N
10	M.SC.(CA&IT)	2019-12-18 11:27:30.91176	2019-12-18 11:27:30.91176	\N
7	B.tech	2019-10-10 14:12:30.228718	2020-01-08 12:49:11.524118	\N
11	B.E.IT	2020-01-08 13:28:30.83137	2020-01-08 13:28:30.83137	\N
44	B.E.CE	2020-05-21 11:52:21.401647	2020-05-21 11:52:21.401647	\N
\.


--
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: tps
--

COPY public.departments (id, name, created_at, updated_at, user_id) FROM stdin;
1	ROR	2019-10-04 13:07:23.453983	2019-10-04 13:07:23.453983	\N
2	QA	2019-10-04 13:07:29.166939	2019-10-04 13:07:29.166939	\N
3	PHP	2019-10-04 13:07:41.212012	2019-10-04 13:07:41.212012	\N
4	Admin	2019-10-10 14:13:00.565027	2019-10-10 14:13:00.565027	\N
5	Account	2019-10-10 14:18:01.03988	2019-10-10 14:18:01.03988	\N
7	Unity	2019-10-15 06:59:43.127374	2019-10-15 06:59:43.127374	\N
8	Project Manager	2019-10-17 09:06:16.134734	2019-10-17 09:06:16.134734	\N
10	Consultant	2019-10-17 09:06:53.412695	2019-10-17 09:06:53.412695	\N
9	Frontend	2019-10-17 09:06:31.698013	2019-10-24 11:40:06.408881	\N
11	Designer	2020-01-29 12:48:05.947444	2020-01-29 12:48:05.947444	\N
\.


--
-- Data for Name: designations; Type: TABLE DATA; Schema: public; Owner: tps
--

COPY public.designations (id, name, created_at, updated_at, user_id) FROM stdin;
1	Manager	2019-10-04 13:06:27.988914	2019-10-04 13:06:27.988914	\N
2	Team Leader	2019-10-04 13:06:38.539432	2019-10-04 13:06:38.539432	\N
3	Sr. Web developer	2019-10-04 13:06:49.149085	2019-10-15 06:39:09.579355	\N
4	Sr. Project Manager	2019-10-17 08:33:17.515108	2019-10-17 08:33:17.515108	\N
5	Jr. Project Leader	2019-10-17 08:33:37.852871	2019-10-17 08:33:37.852871	\N
6	Jr. Web Developer	2019-10-17 08:34:07.265977	2019-10-17 08:34:07.265977	\N
7	Sr. Frontend + Assistant Project Manager	2019-10-17 08:34:26.215912	2019-10-17 08:34:26.215912	\N
8	Sr. Frontend Developer	2019-10-17 08:38:06.64104	2019-10-17 08:38:06.64104	\N
9	Sr. Fronend Dev + Unity Developer	2019-10-17 08:38:23.336616	2019-10-17 08:38:23.336616	\N
10	Jr. Unity Developer	2019-10-17 08:38:32.091384	2019-10-17 08:38:32.091384	\N
11	Sr. Quality Analyst	2019-10-17 08:39:00.995861	2019-10-17 08:39:00.995861	\N
12	Jr.Quality Analyst	2019-10-17 09:03:38.886708	2019-10-17 09:03:38.886708	\N
13	Sr. Accountant + Support	2019-10-17 09:03:57.520369	2019-10-17 09:03:57.520369	\N
14	Director	2019-10-17 09:04:07.975306	2019-10-17 09:04:07.975306	\N
15	Sr. Laravel Developer	2019-10-17 09:04:38.472883	2019-10-17 09:04:38.472883	\N
16	Sr. Android Developer	2019-10-17 09:04:54.333368	2019-10-17 09:04:54.333368	\N
17	Jr. Android Developer	2019-10-17 09:05:06.956404	2019-10-17 09:05:06.956404	\N
18	Sr. Tech Lead	2019-10-17 09:05:20.395848	2019-10-17 09:05:20.395848	\N
19	Sales Manager (Canada)	2019-10-17 09:05:39.026755	2019-10-17 09:05:39.026755	\N
20	Sr. Project Leader	2020-01-08 13:13:23.622326	2020-01-08 13:13:23.622326	\N
53	Sr. Web Developer	2020-01-29 12:42:21.029841	2020-01-29 12:42:21.029841	\N
54	Jr. Designer	2020-01-29 12:46:31.44706	2020-01-29 12:46:31.44706	\N
55	Sr. Developer	2020-01-29 12:51:38.144566	2020-01-29 12:51:38.144566	\N
56	Jr. Developer	2020-01-29 12:54:35.756181	2020-01-29 12:54:35.756181	\N
57	Account/Admin	2020-01-29 13:34:11.49429	2020-01-29 13:34:11.49429	\N
58	Sr. Project Manager / QA Leader	2020-01-29 13:40:35.0094	2020-01-29 13:40:35.0094	\N
59	Frontend Developer	2020-02-03 11:17:19.917965	2020-02-03 11:17:19.917965	\N
60	Jr. Project Manager	2020-06-03 10:20:08.831747	2020-06-03 10:20:08.831747	\N
61	Sr. Unity Developer + Jr Project Leader	2020-06-03 10:20:30.56114	2020-06-03 10:20:30.56114	\N
62	Tech Lead	2020-06-03 10:20:43.038983	2020-06-03 10:20:43.038983	\N
\.


--
-- Data for Name: documents; Type: TABLE DATA; Schema: public; Owner: tps
--

COPY public.documents (id, name, user_id, created_at, updated_at) FROM stdin;
3	Adharcard	69	2020-01-16 09:58:49.259699	2020-01-16 09:58:49.266399
4	Pan card	15	2020-05-15 13:24:29.788067	2020-05-15 13:24:29.805774
5	Test	16	2020-06-05 11:54:17.002779	2020-06-05 11:54:17.010668
6	Pancard	69	2020-06-17 09:05:16.543122	2020-06-17 09:05:16.556905
7	Pancard	61	2020-06-17 09:08:48.482923	2020-06-17 09:08:48.561378
8	Pancard	57	2020-06-17 09:15:34.480148	2020-06-17 09:15:34.48868
9	Pancard	55	2020-06-17 09:20:26.598048	2020-06-17 09:20:26.605096
10	Pancard	60	2020-06-17 09:27:46.908518	2020-06-17 09:27:46.917946
11	Adharcard	60	2020-06-17 09:29:05.064438	2020-06-17 09:29:05.070416
12	Resume	60	2020-06-17 09:29:32.571554	2020-06-17 09:29:32.582297
13	Pancard	66	2020-06-17 09:30:13.055418	2020-06-17 09:30:13.063959
14	Pancard	54	2020-06-17 09:32:34.891926	2020-06-17 09:32:34.907831
15	Adharcard	54	2020-06-17 09:35:52.074079	2020-06-17 09:35:52.085107
16	Resume	54	2020-06-17 09:36:56.290723	2020-06-17 09:36:56.302002
17	Pancard	59	2020-06-17 09:39:31.96391	2020-06-17 09:39:31.969607
18	Resume	59	2020-06-17 09:41:23.680665	2020-06-17 09:41:23.689147
19	Pancard	67	2020-06-17 09:51:01.225044	2020-06-17 09:51:01.236222
20	Adharcard	67	2020-06-17 09:53:14.595258	2020-06-17 09:53:14.601586
21	Pancard	13	2020-06-17 10:02:22.131473	2020-06-17 10:02:22.143119
22	Pancard	16	2020-06-17 11:10:06.361068	2020-06-17 11:10:06.366114
23	Pancard	63	2020-06-17 11:13:10.99572	2020-06-17 11:13:10.999327
24	Adharcard	63	2020-06-17 11:19:13.76655	2020-06-17 11:19:13.770653
25	Adharcard	66	2020-06-17 11:40:37.208745	2020-06-17 11:40:37.213035
26	Pancard	51	2020-06-17 13:41:41.027538	2020-06-17 13:41:41.037473
27	Adharcard	51	2020-06-17 13:43:54.998001	2020-06-17 13:43:55.025846
28	Pancard	17	2020-06-17 14:04:17.339835	2020-06-17 14:04:17.362695
29	Resume	17	2020-06-17 14:05:24.247004	2020-06-17 14:05:24.26156
30	Adharcard	53	2020-06-17 14:07:06.185613	2020-06-17 14:07:06.221063
31	Pancard	53	2020-06-17 14:09:22.243259	2020-06-17 14:09:22.251882
32	Pancard	58	2020-06-17 14:10:13.089424	2020-06-17 14:10:13.113803
33	Resume	58	2020-06-17 14:11:01.419942	2020-06-17 14:11:01.43829
34	Pancard	14	2020-06-17 14:12:48.918496	2020-06-17 14:12:48.92747
35	Resume	14	2020-06-17 14:13:13.035469	2020-06-17 14:13:13.042798
36	Pancard	65	2020-06-17 14:13:45.911921	2020-06-17 14:13:45.930353
37	Adharcard	65	2020-06-17 14:14:02.0658	2020-06-17 14:14:02.072807
38	Pancard	64	2020-06-17 14:20:43.912416	2020-06-17 14:20:43.921725
39	Adharcard	64	2020-06-17 14:21:09.217628	2020-06-17 14:21:09.230125
40	Pancard	68	2020-06-17 14:33:38.338471	2020-06-17 14:33:38.35354
41	Adharcard	68	2020-06-17 14:34:00.383556	2020-06-17 14:34:00.420158
42	Resume	68	2020-06-17 14:34:15.437649	2020-06-17 14:34:15.445245
43	Pancard	52	2020-06-17 14:34:56.808523	2020-06-17 14:34:56.814816
\.


--
-- Data for Name: educations; Type: TABLE DATA; Schema: public; Owner: tps
--

COPY public.educations (id, college, university, "from", "to", is_current, user_id, created_at, updated_at, degree_id) FROM stdin;
5	K. S. School Of Business Management	Gujarat University	2012-06-01 00:00:00	2017-04-01 00:00:00	f	61	2020-05-21 07:24:21.790363	2020-05-21 07:32:15.938224	10
6	K.S. School Of Management	Gujarat University 	2010-06-01 00:00:00	2015-04-01 00:00:00	\N	55	2020-05-21 08:06:33.208907	2020-05-21 08:06:33.208907	10
7	K.S. School Of Management	Gujarat University	2012-06-01 00:00:00	2017-04-01 00:00:00	\N	60	2020-05-21 08:08:19.102877	2020-05-21 08:08:19.102877	10
10	LDRP Institute of Technology and Research	Gandhinagar	2020-05-01 00:00:00	\N	\N	59	2020-05-21 08:24:31.938746	2020-05-21 08:24:31.938746	10
11	External	Gujarat University	2016-05-01 00:00:00	2018-05-01 00:00:00	\N	13	2020-05-21 08:34:26.670786	2020-05-21 08:34:26.670786	3
2	K.S. School of business management	Gujarat University	2011-05-01 00:00:00	2016-05-01 00:00:00	f	16	2020-01-13 13:23:00.039606	2020-05-21 08:36:47.663657	10
12	IMA	NWMDI/IMA	2008-05-01 00:00:00	2010-06-01 00:00:00	\N	69	2020-05-21 10:51:31.130932	2020-05-21 10:51:31.130932	2
13	K S School of Business Management 	Gujarat University	2011-06-01 00:00:00	2016-05-01 00:00:00	\N	57	2020-05-21 10:52:34.822679	2020-05-21 10:52:34.822679	10
14	K.S. School Of Management	Gujarat University	2013-06-01 00:00:00	2018-05-01 00:00:00	\N	66	2020-05-21 11:05:37.856239	2020-05-21 11:05:37.856239	10
18	Apollo in Institute Engineering	Gujarat Technological University	2016-06-01 00:00:00	2019-06-01 00:00:00	\N	63	2020-05-21 11:12:12.526001	2020-05-21 11:12:12.526001	11
21	Vadodara Institute of Engineering 	Gujarat Technological University	2009-05-01 00:00:00	2013-06-01 00:00:00	\N	58	2020-05-21 11:27:34.420692	2020-05-21 11:27:34.420692	11
22	Global Institute of Technology	Rajasthan Technical University	2011-08-01 00:00:00	2015-06-01 00:00:00	\N	14	2020-05-21 11:29:38.397933	2020-05-21 11:29:38.397933	7
23	K S School of Business Management 	Gujarat University	2013-06-01 00:00:00	2018-05-01 00:00:00	\N	65	2020-05-21 11:34:34.199331	2020-05-21 11:34:34.199331	10
24	K S School of Business Management 	Gujarat University	2016-05-01 00:00:00	2018-05-01 00:00:00	\N	64	2020-05-21 11:37:40.692573	2020-05-21 11:37:40.692573	10
26	K S School of Business Management 	Gujarat University	2011-06-01 00:00:00	2016-04-01 00:00:00	\N	52	2020-05-21 11:49:58.604253	2020-05-21 11:49:58.604253	10
17	 Vishwakarma Government Engineering College	Gujarat Technological University	2020-05-01 00:00:00	2017-05-01 00:00:00	f	67	2020-05-21 11:09:02.759678	2020-05-21 11:52:40.980204	44
25	Vishwakarma Government Engineering College	Gujarat Technological University	2014-08-01 00:00:00	2017-06-01 00:00:00	f	68	2020-05-21 11:47:40.861025	2020-05-21 11:53:51.392081	11
15	IGNOU	Gandhinagar	2008-05-01 00:00:00	2011-05-01 00:00:00	f	54	2020-05-21 11:06:13.263755	2020-05-21 11:54:55.439291	2
20	Som-Lalit Collage of Computer Application	Gujarat University	2014-06-01 00:00:00	2017-04-01 00:00:00	f	53	2020-05-21 11:25:17.361463	2020-05-22 07:35:55.716221	6
4	LDRP Institute of Technology and Research	KSV University	2015-02-01 00:00:00	2017-02-01 00:00:00	f	17	2020-02-13 09:27:11.492435	2020-05-25 12:45:15.39148	2
19	Gujarat Collage	Gujarat University	2003-06-01 00:00:00	2006-05-01 00:00:00	f	51	2020-05-21 11:23:30.897665	2020-06-03 10:18:14.0486	4
16	K.S. School Of Management	Gujarat University	2011-07-01 00:00:00	2016-05-01 00:00:00	f	15	2020-05-21 11:07:29.062432	2020-08-13 13:41:38.664351	10
\.


--
-- Data for Name: employee_handbooks; Type: TABLE DATA; Schema: public; Owner: tps
--

COPY public.employee_handbooks (id, section, content, created_at, updated_at, "position") FROM stdin;
5	Steps for accessing techplusteam.com email :	<ol>\r\n\t<li><span style="font-size:14px;">Step 1 : Open <a href="https://mail.yandex.com/" target="_blank">https://mail.yandex.com/</a></span></li>\r\n\t<li><span style="font-size:14px;">Step 2 : Username - your emai id which you can find on the <a href="designation.html" target="_blank">designation.html</a></span></li>\r\n\t<li><span style="font-size:14px;">Step 3 : Password as abc@123_4</span></li>\r\n\t<li><span style="font-size:14px;">Step 4 : Fill all the correct information</span></li>\r\n\t<li><span style="font-size:14px;">Step 5 : After checking inbox, go to My Profile from top right user icon.</span></li>\r\n\t<li><span style="font-size:14px;">Step 6 : Click on change password. Change to your desired secure password and re-login</span></li>\r\n\t<li><span style="font-size:14px;">Step 7 : Done</span></li>\r\n\t<li><span style="font-size:14px;">Use email regularly because following announcement will be broadcasted</span>\r\n\t<ol>\r\n\t\t<li><span style="font-size:14px;">Salary mail/Salary slip will come on this email id</span></li>\r\n\t\t<li><span style="font-size:14px;">Birthday, New Joining and other announcment</span></li>\r\n\t\t<li><span style="font-size:14px;">Use this id for the techplus purpose and change in tpstracker too</span></li>\r\n\t\t<li><span style="font-size:14px;">You can download application yandex in mobile if you want to access.</span></li>\r\n\t</ol>\r\n\t</li>\r\n</ol>\r\n	2019-10-25 11:13:26.482465	2019-10-25 11:33:04.246606	10
12	In-Out Timings and office hours :	<ol>\r\n\t<li><span style="font-size:14px;">Ideal in-time is: 9:30 AM to 10:15 AM. Late by late in-time can be 10:30 AM. Due to some circumstances if you want to come late, you need to take prior approval from the mentors.</span></li>\r\n\t<li><span style="font-size:14px;">It is compulsory to complete 8:30 working hours from the In-time, excluding lunch break or any other break.</span></li>\r\n</ol>\r\n	2019-10-25 11:22:09.96036	2019-10-25 11:31:35.329823	2
9	Notice period :	<ol>\r\n\t<li><span style="font-size:14px;">Everyone has 2 Months notice period</span></li>\r\n\t<li><span style="font-size:14px;">Whenever you put your resignation, your leave balance will become 0 and no leave will be allowed during notice period.</span></li>\r\n\t<li><span style="font-size:14px;">The leave which you&rsquo;ve taken during notice period will be deducted from salary and we can extend your leaving date to number of taken leaves.</span></li>\r\n\t<li><span style="font-size:14px;">If you leave the job before 2 Months notice period, you are not eligible to receive an experience letter from the Company.</span></li>\r\n\t<li><span style="font-size:14px;">If your 10% deducted credits are with us and you place resignation before the given refund-date, you are not eligible to receive deducted amount.</span></li>\r\n</ol>\r\n	2019-10-25 11:20:09.253721	2019-10-25 11:32:15.01535	6
8	Salary, Performance, Bonus and Appraisal  :	<ol>\r\n\t<li><span style="font-size:14px;">Generally salary will be done in between 5th to 10th Day of the Month.</span></li>\r\n\t<li><span style="font-size:14px;">It will happen once in a year. In special cases, we can do appraisal middle of it any time which is not fixed.</span></li>\r\n\t<li><span style="font-size:14px;">Bonus is dependent on the client&rsquo;s feedback, mentor&lsquo;s evaluation and director&rsquo;s decision.</span></li>\r\n\t<li><span style="font-size:14px;">Asking or sharing your salary with any of the team members is strictly restricted. We may take action against the person who will be victim of this</span></li>\r\n\t<li><span style="font-size:14px;">We do not provide additional pay (bonus) during Diwali.</span></li>\r\n</ol>\r\n	2019-10-25 11:19:34.986863	2019-10-25 11:32:28.174812	7
13	Use of Mobile, Skype (internal/external unnecessary chats) and Social sites :	<ol>\r\n\t<li><span style="font-size:14px;">Do not use Mobile extensively during working hours.</span></li>\r\n\t<li><span style="font-size:14px;">Unnecessary chat (skype/whatsapp) in between the friends (internal or external) is not allowed during the working hours.</span></li>\r\n\t<li><span style="font-size:14px;">All social media websites (Example: facebook/youtube/whatsapp/twitter) for the entertainment purpose are not allowed during working hours.</span></li>\r\n\t<li><span style="font-size:14px;">If you&rsquo;ve been found using it during the working hours without any genuine reason, you will get 2 warnings in private and 3rd warning will be in public and still if there are no improvements, we may have to take serious action against the person.</span></li>\r\n</ol>\r\n	2019-10-25 11:23:11.050958	2019-10-25 11:31:20.78915	1
14	Source code :	<ol>\r\n\t<li disc="" list-style-type:=""><span style="font-size:14px;">Please avoid to use Source code and Live URL of any of the project that you have developed at Techplus Software Pvt. Ltd.</span></li>\r\n\t<li disc="" list-style-type:=""><span style="font-size:14px;">In-case you need to share somewhere e.g Your own Portfolio/CV, please make sure that you get our permission.</span></li>\r\n\t<li disc="" list-style-type:=""><span style="font-size:14px;">If you&rsquo;ve been found using it without our permission, we may take strict action against the person who used it.</span></li>\r\n\t<li disc="" list-style-type:=""><span style="font-size:14px;">Reason : Many of our Clients have signed a legal NDA with us and we should respect the IT Policy for the same.</span></li>\r\n</ol>\r\n	2019-10-25 11:24:10.812356	2019-10-25 11:35:20.395131	3
11	Holidays and Saturday off :	<ol>\r\n\t<li><span style="font-size:14px;">As per Company Policy, All Saturdays &amp; Sundays of the Month will be an off day.</span></li>\r\n\t<li><span style="font-size:14px;">National holiday list - </span><a href="https://tps-hrms.herokuapp.com/holidays">https://tps-hrms.herokuapp.com/holidays</a></li>\r\n</ol>\r\n	2019-10-25 11:21:42.407683	2020-01-16 06:09:33.078404	4
10	Leaves :	<ol>\r\n\t<li><span style="font-size:14px;">Conditions</span>\r\n\t<ol>\r\n\t\t<li><span style="font-size:14px;">Genuine sick leave and emergency leave can be taken immediately.</span></li>\r\n\t\t<li><span style="font-size:14px;">For any other leaves, approval is required 5 working days prior the leaves.</span></li>\r\n\t\t<li><span style="font-size:14px;">Every month, each person gets 1 free leave. If you do not take leave in that month, it will be carried forward to the next month.</span></li>\r\n\t\t<li><span style="font-size:14px;">When you place your resignation, and when you are being considered under Notice Period, your leave Balance will turn to 0. You won&rsquo;t get monthly free leave during the notice period.</span></li>\r\n\t\t<li><span style="font-size:14px;">If you are on leave for continuously 10 calendar days Covered Saturday/Sunday/Holidays will be counted as leave.</span></li>\r\n\t\t<li><span style="font-size:14px;">If you are on leave for continuously 10 calendar days containing 1 or more half days Saturday/Sunday/Holidays will be counted as leave.</span></li>\r\n\t</ol>\r\n\t</li>\r\n\t<li><span style="font-size:14px;">We may ask team or individual to come on Saturday</span>\r\n\t<ol>\r\n\t\t<li><span style="font-size:14px;">In case of emergency or unavoidable situation.</span></li>\r\n\t\t<li><span style="font-size:14px;">Replacement of leaves / Holidays (e.g if 15th Aug is on weekday then we may activate one of the Saturdays to cover up the pending work.)</span></li>\r\n\t\t<li><span style="font-size:14px;">Client&rsquo;s request due to deadline</span></li>\r\n\t\t<li><span style="font-size:14px;">Events or Picnic arrangement</span></li>\r\n\t</ol>\r\n\t</li>\r\n\t<li><span style="font-size:14px;">Decision</span>\r\n\t<ol>\r\n\t\t<li><span style="font-size:14px;">If Leave will be approved then it will be deducted from your leave balance. If leave balance is not sufficient, it will be deducted from the salary. 1 leave amount = total salary amount(on paper) / 30 days.</span></li>\r\n\t\t<li><span style="font-size:14px;">If leave is rejected and still you have to take a leave, number of rejected leaves will be deducted from the leave balance and also from the salary.</span></li>\r\n\t\t<li><span style="font-size:14px;">The approval and rejection of the leave is completely based on the situation of the project in which you are involved and/or mentor&rsquo;s decision based on your situation/performance/time of taking leave.</span></li>\r\n\t</ol>\r\n\t</li>\r\n\t<li><span style="font-size:14px;">Half Day Consideration</span>\r\n\t<ol>\r\n\t\t<li><span style="font-size:14px;">7:30 working hours or less will be counted as half day.</span></li>\r\n\t\t<li><span style="font-size:14px;">If you have taken half day leave, then you must have to complete 4:15 working hours. (Lunch break will not be considered as working hours). If you work &lt; 4:15 hours, it will be considered as Full Day Leave in-place of Half-day.</span></li>\r\n\t\t<li><span style="font-size:14px;">For special cases, discuss time flexibility for half/full day with your mentors.</span></li>\r\n\t</ol>\r\n\t</li>\r\n\t<li><span style="font-size:14px;">Special leaves</span>\r\n\t<ol>\r\n\t\t<li><span style="font-size:14px;">Funeral Leaves (Parents/Children/Spouse/Siblings) will be allowed for 5 days in 1 Month. These will neither be deducted from leave balance or salary will not be deducted too.</span></li>\r\n\t\t<li><span style="font-size:14px;">3 free Leaves will be allowed for Your Marriage. These will neither be deducted from leave balance or salary will not be deducted too.</span></li>\r\n\t\t<li><span style="font-size:14px;">3 free leaves for the new born baby. These will neither be deducted from leave balance or salary will not be deducted too.</span></li>\r\n\t\t<li><span style="font-size:14px;">If you have not taken these special leaves then these leaves will not be added as leave balance.</span></li>\r\n\t</ol>\r\n\t</li>\r\n</ol>\r\n	2019-10-25 11:20:48.551122	2019-10-25 11:32:02.171551	5
40	test 	<p>testtttttttttttt</p>\r\n	2021-07-27 05:36:19.862193	2021-07-27 05:36:19.862193	11
7	Other activities  :	<ol>\r\n\t<li><span style="font-size:14px;">If you want to participate in any group please add your nomination in the suggestion box/complain box. We have following positions available:</span>\r\n\t<ol>\r\n\t\t<li><span style="font-size:14px;">Manage Events &ndash; Handle birthday celebration, Saturday event, new year event, tours etc</span></li>\r\n\t\t<li><span style="font-size:14px;">Session- Handle session arrangement, survey for the session, arrange session, take feedback of session, bring participants</span></li>\r\n\t\t<li><span style="font-size:14px;">Marketing &ndash; Handle the social media and other marketing stuff of TPS</span></li>\r\n\t\t<li><span style="font-size:14px;">Networking - Solve network related issues of TPS</span></li>\r\n\t\t<li><span style="font-size:14px;">Training &ndash; Interview during training, allocate leaders, find projects, assign project and technology, provide proper certificate, choose schedule, handle queries, follow up projects, arrange demo session</span></li>\r\n\t\t<li><span style="font-size:14px;">Advisor &ndash; Team which take advice from the team to improve company&rsquo;s culture and environment and convey to the Directors or Mentors. Do the one-to-one meeting with the team members for the opinion.</span></li>\r\n\t</ol>\r\n\t</li>\r\n</ol>\r\n	2019-10-25 11:18:41.909862	2019-10-25 11:32:38.560122	8
6	General Ethics :	<ol>\r\n\t<li><span style="font-size:14px;">Help each other to grow together</span></li>\r\n\t<li><span style="font-size:14px;">Work as a team not as an individual</span></li>\r\n\t<li><span style="font-size:14px;">Give respect to clients and their requirements.</span></li>\r\n\t<li><span style="font-size:14px;">Do not compromise with quality</span></li>\r\n\t<li><span style="font-size:14px;">Do not give up for challenging tasks. Successful completion of challenging task makes us standout from crowd.</span></li>\r\n\t<li><span style="font-size:14px;">Do work within realistic deadline</span></li>\r\n\t<li><span style="font-size:14px;">You should not feel annoyed with the repetitive tasks.</span></li>\r\n\t<li><span style="font-size:14px;">In Idle time, keep inform to your mentor</span></li>\r\n\t<li><span style="font-size:14px;">Do the smart work.</span></li>\r\n\t<li><span style="font-size:14px;">Re-use your code to improve your speed.</span></li>\r\n\t<li><span style="font-size:14px;">Involve mentor when you tried at least 4-5 different ways to solve an issue</span></li>\r\n\t<li><span style="font-size:14px;">Do best in communication.</span></li>\r\n\t<li><span style="font-size:14px;">Keep inform about status of work to mentors and client everyday.</span></li>\r\n\t<li><span style="font-size:14px;">If you learn new things, share it with the collegues. You can ask mentor to arrange session.</span></li>\r\n\t<li><span style="font-size:14px;">If you want to learn something, ask your mentor to arrange session for the same</span></li>\r\n\t<li><span style="font-size:14px;">If you are not happy with the company or any member or you are angry, discuss with the mentors in private only. If you are angry with mentor, you can discuss with mentor&rsquo;s mentor. If you are angry with director, write in a complain box/suggestion box.</span></li>\r\n</ol>\r\n	2019-10-25 11:17:29.962922	2019-10-25 11:32:51.517107	9
\.


--
-- Data for Name: event_categories; Type: TABLE DATA; Schema: public; Owner: tps
--

COPY public.event_categories (id, name, created_at, updated_at) FROM stdin;
1	Festivals	2020-06-19 11:51:57.67283	2020-06-19 11:51:57.67283
2	Wednesday Wonder	2020-06-19 11:52:03.502122	2020-06-19 11:52:03.502122
3	Birthday	2020-06-19 11:52:08.287809	2020-06-19 11:52:08.287809
4	Picnics	2020-06-19 22:05:01.245569	2020-06-19 22:05:06.248808
5	Office Photos	2020-06-19 22:06:30.310386	2020-06-19 22:06:30.310386
\.


--
-- Data for Name: event_links; Type: TABLE DATA; Schema: public; Owner: tps
--

COPY public.event_links (id, title, description, link, user_id, created_at, updated_at, event_date, event_category_id) FROM stdin;
7	Chintan (29th-Jan-2020)		https://drive.google.com/open?id=1A7sINuRfAQHtGc1I3gS4eLLefdznuTNd	51	2020-02-04 04:41:05.045139	2020-02-04 04:41:05.045139	2020-01-29	\N
16	Diu Trip	Diu Trip	http://www.afterclix.com/sites/techplus/portfolio/picnic-2019	18	2020-06-13 11:02:11.033531	2020-06-19 22:05:42.778022	2019-04-27	4
5	Halloween Day > 30-Dec-2019		https://drive.google.com/folderview?id=1jzjVsYY3w_5Ve4XNZVr-0Tk_MmVv-Ngr	51	2020-01-30 13:07:35.760482	2020-02-04 04:41:41.746012	2019-12-30	\N
6	Injury Day > 31-Dec-2019		https://drive.google.com/folderview?id=1--7U4pnFBXd8sRvQSGMOGwq4hYlSj_3F	51	2020-01-30 13:08:04.807379	2020-02-04 04:41:57.91588	2020-01-31	\N
4	StateTheme Day > 27-Dec-2019		https://drive.google.com/open?id=1lGuIG3VmNWxB_C5tiuR_IJSTUEhAhaRk	51	2020-01-30 13:07:05.215965	2020-02-04 04:42:15.050364	2019-12-27	\N
3	Tapori Day> 26-Dec-2019		https://drive.google.com/open?id=1j1kkY1MEUukWvIYCqc6mO7naOR4xyn2X	51	2020-01-30 13:06:24.058976	2020-02-04 04:42:30.41065	2019-12-26	\N
2	Christmas Day > 25-Dec-2019		https://drive.google.com/open?id=1O5R4FuxAta3Tq_NcwKZu0euFdq8l5o-u	51	2020-01-30 13:05:41.239851	2020-02-04 04:43:05.467299	2019-12-25	\N
8	Vinit (14th-Jan-2020)		https://drive.google.com/open?id=1Tj73U_OXQQSbGZlas5W7g6AWPdIxqhfx	51	2020-02-04 04:45:13.075434	2020-02-04 04:45:13.075434	2020-01-14	\N
10	Flip Cup Tic Tac Toe (22nd Jan 2020)		https://drive.google.com/open?id=13ZzjF8ITRVLjY7bZmUgQfm335CNTzbqE	51	2020-02-04 04:47:06.287004	2020-02-04 04:47:06.287004	2020-01-22	\N
9	Glass & Balloons Game (08th-Jan-2020)		https://drive.google.com/open?id=1mWst7RhFVf7bPl_vgwMoh8nKif1R3cur	51	2020-02-04 04:46:12.268819	2020-02-04 04:47:20.484321	2020-01-08	\N
11	Dipesh Birthday (04-Feb-2020)		https://drive.google.com/open?id=1ghWyKe6mQbXGnD2-ziIxm4lKUzM8peCz	51	2020-02-20 11:53:17.335865	2020-02-20 11:53:17.335865	2020-02-04	\N
12	Dumb Sheraz (19 Feb 2020)		https://drive.google.com/open?id=1uwsKDr-0rfGNmREk-aC9waSgjIt785zJ	51	2020-02-20 12:03:53.215582	2020-02-20 12:03:53.215582	2020-02-19	\N
13	Random Clicks		https://drive.google.com/open?id=1oWATAVZIG6wistJ7pb9VoLkTw5Qa6liK	51	2020-02-27 12:07:40.503482	2020-02-27 12:07:40.503482	2020-02-27	\N
23	Straw and Throw Balls		https://drive.google.com/drive/folders/1ZJU-OlCGA26btRO3Qwx9_d55pRKpbZJM	18	2020-06-13 11:35:01.285591	2020-06-19 11:52:28.13325	2019-12-04	2
14	Vikesha Birthday (27th Feb 2020)		https://drive.google.com/open?id=1ue2kZipAq5tHusirh4dpdBTGHA7-uoT2	18	2020-02-27 12:08:36.457565	2020-06-19 11:52:53.628287	2020-02-27	3
22	Office Photos (2020)		https://drive.google.com/drive/folders/1o0KuRYlL9gEGYcMPXELtYxdCgFjMk4gb	18	2020-06-13 11:32:53.614114	2020-06-19 11:53:09.332556	2020-02-05	1
21	Injury Day	Injury Day	https://drive.google.com/folderview?id=1--7U4pnFBXd8sRvQSGMOGwq4hYlSj_3F	18	2020-06-13 11:24:31.502284	2020-06-19 11:53:18.794255	2019-12-31	1
20	Halloween day	Halloween Day - Fency dress	https://drive.google.com/folderview?id=1jzjVsYY3w_5Ve4XNZVr-0Tk_MmVv-Ngr	18	2020-06-13 11:23:58.542511	2020-06-19 11:53:28.427059	2019-12-30	1
19	State Theme	State theme fancy dress	https://drive.google.com/open?id=1lGuIG3VmNWxB_C5tiuR_IJSTUEhAhaRk	18	2020-06-13 11:23:30.428019	2020-06-19 11:53:37.267345	2019-12-27	1
18	Tapori-day	Tapori Day	https://drive.google.com/open?id=1j1kkY1MEUukWvIYCqc6mO7naOR4xyn2X	18	2020-06-13 11:22:56.52893	2020-06-19 11:53:45.563647	2019-12-26	1
17	Christmas-day		https://drive.google.com/open?id=1O5R4FuxAta3Tq_NcwKZu0euFdq8l5o-u	18	2020-06-13 11:22:25.167518	2020-06-19 11:53:52.602446	2019-12-25	1
15	Holi - 2020 	Holi Celebration on 9 March	http://www.afterclix.com/sites/techplus/shared_album/holi-2020	18	2020-03-28 11:36:58.936106	2020-06-19 11:54:29.313959	2020-03-09	1
\.


--
-- Data for Name: free_leaves; Type: TABLE DATA; Schema: public; Owner: tps
--

COPY public.free_leaves (id, user_id, extra_leave, reason, leave_month, created_at, updated_at) FROM stdin;
1	55	3	Born Baby 	2019-12-01	2019-12-31 09:06:54.717595	2019-12-31 09:06:54.717595
2	17	3	Marriage	2020-02-01	2020-02-19 13:15:30.216611	2020-02-19 13:15:30.216611
3	67	3	Marriage	2020-12-01	2021-01-05 11:25:09.78144	2021-01-05 11:25:09.78144
4	64	3	Marriage	2020-12-01	2021-01-05 11:26:23.496675	2021-01-05 11:26:23.496675
5	61	3	Born baby	2021-01-01	2021-01-20 09:50:03.874632	2021-01-20 09:50:03.874632
\.


--
-- Data for Name: holidays; Type: TABLE DATA; Schema: public; Owner: tps
--

COPY public.holidays (id, holiday_name, holiday_date, created_at, updated_at) FROM stdin;
1	Uttarayan	2020-01-14 00:00:00	2019-09-01 18:56:56.155355	2019-09-01 18:56:56.155355
2	Vasi Uttarayan	2020-01-15 00:00:00	2019-09-01 18:57:13.695122	2019-09-01 18:57:13.695122
3	Republic day	2020-01-26 00:00:00	2019-09-01 18:57:31.726892	2019-09-01 18:57:31.726892
4	Dhuleti	2020-03-10 00:00:00	2019-09-01 18:57:53.068215	2019-09-01 18:57:53.068215
5	Independence day	2020-08-15 00:00:00	2019-09-01 18:58:10.375573	2019-09-01 18:58:10.375573
6	Rakshabandhan	2019-08-03 00:00:00	2019-09-01 18:58:35.545633	2019-09-01 18:58:35.545633
7	Dusherra	2020-10-25 00:00:00	2019-09-01 18:59:22.325798	2019-09-01 18:59:22.325798
9	Dusherra	2019-10-08 00:00:00	2019-09-23 07:16:30.700445	2019-09-23 07:16:30.700445
11	Hindu New Year	2019-10-28 00:00:00	2019-09-23 07:17:18.009645	2019-09-23 07:17:18.009645
8	Diwali	2019-10-27 00:00:00	2019-09-01 19:00:10.177117	2019-10-15 06:42:23.148107
12	Bhai Duj	2019-10-29 00:00:00	2019-10-23 13:13:57.716856	2019-10-23 13:13:57.716856
13	Rakshabandhan	2020-08-03 00:00:00	2020-01-08 12:31:59.717295	2020-01-08 12:31:59.717295
14	Diwali	2020-11-14 00:00:00	2020-01-08 12:32:57.481006	2020-01-08 12:32:57.481006
15	New Year	2020-11-15 00:00:00	2020-01-08 12:33:23.340214	2020-01-08 12:33:23.340214
16	Bhai Duj	2020-11-16 00:00:00	2020-01-08 12:33:39.407301	2020-01-08 12:33:39.407301
46	Uttarayan	2021-01-14 00:00:00	2020-11-19 12:52:06.239037	2020-11-19 12:52:06.239037
47	Vasi Uttarayan	2021-01-15 00:00:00	2020-11-19 12:52:40.240085	2020-11-19 12:52:40.240085
48	Dhuleti	2021-03-29 00:00:00	2020-11-19 12:53:17.573061	2020-11-19 12:53:17.573061
49	Independence day	2021-08-15 00:00:00	2020-11-19 12:53:42.341477	2020-11-19 12:53:42.341477
50	Rakshabandhan	2021-08-22 00:00:00	2020-11-19 12:54:06.323328	2020-11-19 12:54:06.323328
51	Dusherra	2021-10-15 00:00:00	2020-11-19 12:55:42.157322	2020-11-19 12:55:42.157322
52	Diwali	2021-11-04 00:00:00	2020-11-19 12:56:17.151896	2020-11-19 12:56:17.151896
53	New Year	2021-11-05 00:00:00	2020-11-19 12:56:40.653753	2020-11-19 12:56:40.653753
54	Bhai Duj	2021-11-06 00:00:00	2020-11-19 12:57:24.005489	2020-11-19 12:57:24.005489
55	Republic day	2021-01-26 00:00:00	2020-12-24 13:09:15.773182	2020-12-24 13:09:15.773182
\.


--
-- Data for Name: leave_reports; Type: TABLE DATA; Schema: public; Owner: tps
--

COPY public.leave_reports (id, user_id, start_month, end_month, prev_month_leave_bal, free_leave, taken_leave, current_leave_bal, created_at, updated_at) FROM stdin;
1	13	2019-04-01	2019-04-30	0	1	0	1	2019-12-27 08:45:13.433627	2019-12-27 08:45:13.433627
2	14	2019-04-01	2019-04-30	1.5	1	0	2.5	2019-12-27 08:45:13.448522	2019-12-27 08:45:13.448522
3	15	2019-04-01	2019-04-30	6.5	1	0	7.5	2019-12-27 08:45:13.460997	2019-12-27 08:45:13.460997
4	16	2019-04-01	2019-04-30	0	1	1	0	2019-12-27 08:45:13.477549	2019-12-27 08:45:13.477549
5	17	2019-04-01	2019-04-30	2	1	1	2	2019-12-27 08:45:13.496639	2019-12-27 08:45:13.496639
6	51	2019-04-01	2019-04-30	20	1	1	20	2019-12-27 08:45:13.512172	2019-12-27 08:45:13.512172
7	52	2019-04-01	2019-04-30	0.5	1	0.5	1	2019-12-27 08:45:13.526839	2019-12-27 08:45:13.526839
8	54	2019-04-01	2019-04-30	12	1	0	13	2019-12-27 08:45:13.538584	2019-12-27 08:45:13.538584
9	55	2019-04-01	2019-04-30	2.5	1	1	2.5	2019-12-27 08:45:13.553062	2019-12-27 08:45:13.553062
10	56	2019-04-01	2019-04-30	0	1	1	0	2019-12-27 08:45:13.567563	2019-12-27 08:45:13.567563
11	57	2019-04-01	2019-04-30	0.5	1	1	0.5	2019-12-27 08:45:13.587971	2019-12-27 08:45:13.587971
12	58	2019-04-01	2019-04-30	1	1	0.5	1.5	2019-12-27 08:45:13.606491	2019-12-27 08:45:13.606491
13	59	2019-04-01	2019-04-30	5.5	1	5	1.5	2019-12-27 08:45:13.623586	2019-12-27 08:45:13.623586
14	60	2019-04-01	2019-04-30	5	1	0	6	2019-12-27 08:45:13.634671	2019-12-27 08:45:13.634671
15	61	2019-04-01	2019-04-30	5	1	1	5	2019-12-27 08:45:13.644688	2019-12-27 08:45:13.644688
16	62	2019-04-01	2019-04-30	0	1	0	1	2019-12-27 08:45:13.654493	2019-12-27 08:45:13.654493
17	63	2019-04-01	2019-04-30	0	1	0.5	0.5	2019-12-27 08:45:13.66645	2019-12-27 08:45:13.66645
18	64	2019-04-01	2019-04-30	0	1	2.5	-1.5	2019-12-27 08:45:13.678412	2019-12-27 08:45:13.678412
19	65	2019-04-01	2019-04-30	2	1	1	2	2019-12-27 08:45:13.690449	2019-12-27 08:45:13.690449
20	66	2019-04-01	2019-04-30	2	1	0.5	2.5	2019-12-27 08:45:13.701831	2019-12-27 08:45:13.701831
21	67	2019-04-01	2019-04-30	0	1	0	1	2019-12-27 08:45:13.713488	2019-12-27 08:45:13.713488
22	13	2019-05-01	2019-05-31	1	1	1	1	2019-12-27 08:45:48.344757	2019-12-27 08:45:48.344757
23	14	2019-05-01	2019-05-31	2.5	1	0	3.5	2019-12-27 08:45:48.355455	2019-12-27 08:45:48.355455
24	15	2019-05-01	2019-05-31	7.5	1	0	8.5	2019-12-27 08:45:48.364937	2019-12-27 08:45:48.364937
25	16	2019-05-01	2019-05-31	0	1	1	0	2019-12-27 08:45:48.375773	2019-12-27 08:45:48.375773
26	17	2019-05-01	2019-05-31	2	1	3	0	2019-12-27 08:45:48.385775	2019-12-27 08:45:48.385775
27	51	2019-05-01	2019-05-31	20	1	1	20	2019-12-27 08:45:48.395436	2019-12-27 08:45:48.395436
28	52	2019-05-01	2019-05-31	1	1	0	2	2019-12-27 08:45:48.405094	2019-12-27 08:45:48.405094
29	54	2019-05-01	2019-05-31	13	1	2	12	2019-12-27 08:45:48.415891	2019-12-27 08:45:48.415891
30	55	2019-05-01	2019-05-31	2.5	1	0.5	3	2019-12-27 08:45:48.42667	2019-12-27 08:45:48.42667
31	56	2019-05-01	2019-05-31	0	1	1	0	2019-12-27 08:45:48.437788	2019-12-27 08:45:48.437788
32	57	2019-05-01	2019-05-31	0.5	1	0	1.5	2019-12-27 08:45:48.452463	2019-12-27 08:45:48.452463
33	58	2019-05-01	2019-05-31	1.5	1	0	2.5	2019-12-27 08:45:48.465683	2019-12-27 08:45:48.465683
34	59	2019-05-01	2019-05-31	1.5	1	0	2.5	2019-12-27 08:45:48.477405	2019-12-27 08:45:48.477405
35	60	2019-05-01	2019-05-31	6	1	0	7	2019-12-27 08:45:48.487928	2019-12-27 08:45:48.487928
36	61	2019-05-01	2019-05-31	5	4	5	4	2019-12-27 08:45:48.497052	2019-12-27 08:45:48.497052
37	62	2019-05-01	2019-05-31	1	1	0	2	2019-12-27 08:45:48.507011	2019-12-27 08:45:48.507011
38	63	2019-05-01	2019-05-31	0.5	1	3	-1.5	2019-12-27 08:45:48.516893	2019-12-27 08:45:48.516893
39	64	2019-05-01	2019-05-31	0	1	1	0	2019-12-27 08:45:48.528536	2019-12-27 08:45:48.528536
40	65	2019-05-01	2019-05-31	2	1	2.5	0.5	2019-12-27 08:45:48.541023	2019-12-27 08:45:48.541023
41	66	2019-05-01	2019-05-31	2.5	1	0	3.5	2019-12-27 08:45:48.553525	2019-12-27 08:45:48.553525
42	67	2019-05-01	2019-05-31	1	1	2	0	2019-12-27 08:45:48.566988	2019-12-27 08:45:48.566988
43	13	2019-06-01	2019-06-30	1	1	0.5	1.5	2019-12-27 08:46:15.239286	2019-12-27 08:46:15.239286
44	14	2019-06-01	2019-06-30	3.5	1	2	2.5	2019-12-27 08:46:15.248984	2019-12-27 08:46:15.248984
45	15	2019-06-01	2019-06-30	8.5	1	0	9.5	2019-12-27 08:46:15.257989	2019-12-27 08:46:15.257989
46	16	2019-06-01	2019-06-30	0	1	0	1	2019-12-27 08:46:15.267512	2019-12-27 08:46:15.267512
47	17	2019-06-01	2019-06-30	0	1	0	1	2019-12-27 08:46:15.277509	2019-12-27 08:46:15.277509
48	51	2019-06-01	2019-06-30	20	1	0	21	2019-12-27 08:46:15.287776	2019-12-27 08:46:15.287776
49	52	2019-06-01	2019-06-30	2	1	1	2	2019-12-27 08:46:15.297637	2019-12-27 08:46:15.297637
50	54	2019-06-01	2019-06-30	12	1	0	13	2019-12-27 08:46:15.307979	2019-12-27 08:46:15.307979
51	55	2019-06-01	2019-06-30	3	1	0	4	2019-12-27 08:46:15.323077	2019-12-27 08:46:15.323077
52	56	2019-06-01	2019-06-30	0	1	2	-1	2019-12-27 08:46:15.332779	2019-12-27 08:46:15.332779
53	57	2019-06-01	2019-06-30	1.5	1	4	-1.5	2019-12-27 08:46:15.341776	2019-12-27 08:46:15.341776
54	58	2019-06-01	2019-06-30	2.5	1	0	3.5	2019-12-27 08:46:15.351393	2019-12-27 08:46:15.351393
55	59	2019-06-01	2019-06-30	2.5	1	2	1.5	2019-12-27 08:46:15.361012	2019-12-27 08:46:15.361012
56	60	2019-06-01	2019-06-30	7	1	0	8	2019-12-27 08:46:15.370484	2019-12-27 08:46:15.370484
57	61	2019-06-01	2019-06-30	4	1	1	4	2019-12-27 08:46:15.379747	2019-12-27 08:46:15.379747
58	62	2019-06-01	2019-06-30	2	1	4	-1	2019-12-27 08:46:15.388695	2019-12-27 08:46:15.388695
59	63	2019-06-01	2019-06-30	0	1	1	0	2019-12-27 08:46:15.397609	2019-12-27 08:46:15.397609
60	64	2019-06-01	2019-06-30	0	1	5	-4	2019-12-27 08:46:15.406952	2019-12-27 08:46:15.406952
61	65	2019-06-01	2019-06-30	0.5	1	1	0.5	2019-12-27 08:46:15.416612	2019-12-27 08:46:15.416612
62	66	2019-06-01	2019-06-30	3.5	1	1	3.5	2019-12-27 08:46:15.427903	2019-12-27 08:46:15.427903
63	67	2019-06-01	2019-06-30	0	1	1	0	2019-12-27 08:46:15.441849	2019-12-27 08:46:15.441849
64	13	2019-07-01	2019-07-31	1.5	1	2	0.5	2019-12-27 08:47:55.108018	2019-12-27 08:47:55.108018
65	14	2019-07-01	2019-07-31	2.5	1	1	2.5	2019-12-27 08:47:55.117749	2019-12-27 08:47:55.117749
66	15	2019-07-01	2019-07-31	9.5	1	2	8.5	2019-12-27 08:47:55.126896	2019-12-27 08:47:55.126896
67	16	2019-07-01	2019-07-31	1	1	1.5	0.5	2019-12-27 08:47:55.136062	2019-12-27 08:47:55.136062
68	17	2019-07-01	2019-07-31	1	1	2.5	-0.5	2019-12-27 08:47:55.145574	2019-12-27 08:47:55.145574
69	51	2019-07-01	2019-07-31	21	1	0	22	2019-12-27 08:47:55.154754	2019-12-27 08:47:55.154754
70	52	2019-07-01	2019-07-31	2	1	0	3	2019-12-27 08:47:55.164559	2019-12-27 08:47:55.164559
71	54	2019-07-01	2019-07-31	13	1	1	13	2019-12-27 08:47:55.173669	2019-12-27 08:47:55.173669
72	55	2019-07-01	2019-07-31	4	1	1.5	3.5	2019-12-27 08:47:55.185595	2019-12-27 08:47:55.185595
73	56	2019-07-01	2019-07-31	0	1	2	-1	2019-12-27 08:47:55.194889	2019-12-27 08:47:55.194889
74	57	2019-07-01	2019-07-31	0	1	1	0	2019-12-27 08:47:55.203939	2019-12-27 08:47:55.203939
75	58	2019-07-01	2019-07-31	3.5	1	1.5	3	2019-12-27 08:47:55.213341	2019-12-27 08:47:55.213341
76	59	2019-07-01	2019-07-31	1.5	1	0	2.5	2019-12-27 08:47:55.222646	2019-12-27 08:47:55.222646
77	60	2019-07-01	2019-07-31	8	1	0	9	2019-12-27 08:47:55.231604	2019-12-27 08:47:55.231604
78	61	2019-07-01	2019-07-31	4	1	2	3	2019-12-27 08:47:55.240479	2019-12-27 08:47:55.240479
79	62	2019-07-01	2019-07-31	0	1	0	1	2019-12-27 08:47:55.249324	2019-12-27 08:47:55.249324
80	63	2019-07-01	2019-07-31	0	1	1	0	2019-12-27 08:47:55.258015	2019-12-27 08:47:55.258015
81	64	2019-07-01	2019-07-31	0	1	0	1	2019-12-27 08:47:55.26848	2019-12-27 08:47:55.26848
82	65	2019-07-01	2019-07-31	0.5	1	0	1.5	2019-12-27 08:47:55.279511	2019-12-27 08:47:55.279511
83	66	2019-07-01	2019-07-31	3.5	1	0	4.5	2019-12-27 08:47:55.291905	2019-12-27 08:47:55.291905
84	67	2019-07-01	2019-07-31	0	1	0	1	2019-12-27 08:47:55.300735	2019-12-27 08:47:55.300735
85	13	2019-08-01	2019-08-31	0.5	1	0	1.5	2019-12-27 08:48:39.507284	2019-12-27 08:48:39.507284
86	14	2019-08-01	2019-08-31	2.5	1	0	3.5	2019-12-27 08:48:39.52036	2019-12-27 08:48:39.52036
87	15	2019-08-01	2019-08-31	8.5	1	0.5	9	2019-12-27 08:48:39.531237	2019-12-27 08:48:39.531237
88	16	2019-08-01	2019-08-31	0.5	1	0	1.5	2019-12-27 08:48:39.542599	2019-12-27 08:48:39.542599
89	17	2019-08-01	2019-08-31	0	1	1.5	-0.5	2019-12-27 08:48:39.561537	2019-12-27 08:48:39.561537
90	51	2019-08-01	2019-08-31	22	1	0	23	2019-12-27 08:48:39.578277	2019-12-27 08:48:39.578277
91	52	2019-08-01	2019-08-31	3	1	0	4	2019-12-27 08:48:39.597233	2019-12-27 08:48:39.597233
92	54	2019-08-01	2019-08-31	13	1	1	13	2019-12-27 08:48:39.611925	2019-12-27 08:48:39.611925
93	55	2019-08-01	2019-08-31	3.5	1	1	3.5	2019-12-27 08:48:39.629744	2019-12-27 08:48:39.629744
94	56	2019-08-01	2019-08-31	0	1	2	-1	2019-12-27 08:48:39.643212	2019-12-27 08:48:39.643212
95	57	2019-08-01	2019-08-31	0	1	0.5	0.5	2019-12-27 08:48:39.655775	2019-12-27 08:48:39.655775
96	58	2019-08-01	2019-08-31	3	1	1	3	2019-12-27 08:48:39.669341	2019-12-27 08:48:39.669341
97	59	2019-08-01	2019-08-31	2.5	1	1	2.5	2019-12-27 08:48:39.682828	2019-12-27 08:48:39.682828
98	60	2019-08-01	2019-08-31	9	1	0	10	2019-12-27 08:48:39.698305	2019-12-27 08:48:39.698305
99	61	2019-08-01	2019-08-31	3	1	2	2	2019-12-27 08:48:39.711446	2019-12-27 08:48:39.711446
100	62	2019-08-01	2019-08-31	1	1	1	1	2019-12-27 08:48:39.725715	2019-12-27 08:48:39.725715
101	63	2019-08-01	2019-08-31	0	1	0	1	2019-12-27 08:48:39.74156	2019-12-27 08:48:39.74156
102	64	2019-08-01	2019-08-31	1	1	10	-8	2019-12-27 08:48:39.761474	2019-12-27 08:48:39.761474
103	65	2019-08-01	2019-08-31	1.5	1	0.5	2	2019-12-27 08:48:39.778961	2019-12-27 08:48:39.778961
104	66	2019-08-01	2019-08-31	4.5	1	0	5.5	2019-12-27 08:48:39.794662	2019-12-27 08:48:39.794662
105	67	2019-08-01	2019-08-31	1	1	0	2	2019-12-27 08:48:39.811261	2019-12-27 08:48:39.811261
106	13	2019-09-01	2019-09-30	1.5	1	1	1.5	2019-12-27 08:48:54.927942	2019-12-27 08:48:54.927942
107	14	2019-09-01	2019-09-30	3.5	1	1	3.5	2019-12-27 08:48:54.942534	2019-12-27 08:48:54.942534
108	15	2019-09-01	2019-09-30	9	1	0.5	9.5	2019-12-27 08:48:54.954478	2019-12-27 08:48:54.954478
109	16	2019-09-01	2019-09-30	1.5	1	0	2.5	2019-12-27 08:48:54.966215	2019-12-27 08:48:54.966215
110	17	2019-09-01	2019-09-30	0	1	1	0	2019-12-27 08:48:54.978696	2019-12-27 08:48:54.978696
111	51	2019-09-01	2019-09-30	23	1	0	24	2019-12-27 08:48:54.992834	2019-12-27 08:48:54.992834
112	52	2019-09-01	2019-09-30	4	1	1	4	2019-12-27 08:48:55.006656	2019-12-27 08:48:55.006656
113	53	2019-09-01	2019-09-30	0	1	0	1	2019-12-27 08:48:55.022303	2019-12-27 08:48:55.022303
114	54	2019-09-01	2019-09-30	13	1	0	14	2019-12-27 08:48:55.036845	2019-12-27 08:48:55.036845
115	55	2019-09-01	2019-09-30	3.5	1	0	4.5	2019-12-27 08:48:55.050289	2019-12-27 08:48:55.050289
116	56	2019-09-01	2019-09-30	0	1	1.5	-0.5	2019-12-27 08:48:55.065178	2019-12-27 08:48:55.065178
117	57	2019-09-01	2019-09-30	0.5	1	1.5	0	2019-12-27 08:48:55.078312	2019-12-27 08:48:55.078312
118	58	2019-09-01	2019-09-30	3	1	1	3	2019-12-27 08:48:55.091343	2019-12-27 08:48:55.091343
119	59	2019-09-01	2019-09-30	2.5	1	0	3.5	2019-12-27 08:48:55.105304	2019-12-27 08:48:55.105304
120	60	2019-09-01	2019-09-30	10	1	0	11	2019-12-27 08:48:55.119264	2019-12-27 08:48:55.119264
121	61	2019-09-01	2019-09-30	2	1	0	3	2019-12-27 08:48:55.133082	2019-12-27 08:48:55.133082
123	63	2019-09-01	2019-09-30	1	1	0.5	1.5	2019-12-27 08:48:55.161808	2019-12-27 08:48:55.161808
125	65	2019-09-01	2019-09-30	2	1	2	1	2019-12-27 08:48:55.182882	2019-12-27 08:48:55.182882
126	66	2019-09-01	2019-09-30	5.5	1	2	4.5	2019-12-27 08:48:55.194752	2019-12-27 08:48:55.194752
127	67	2019-09-01	2019-09-30	2	1	1	2	2019-12-27 08:48:55.205036	2019-12-27 08:48:55.205036
128	13	2019-10-01	2019-10-31	1.5	1	2.5	0	2019-12-27 08:49:15.786831	2019-12-27 08:49:15.786831
129	14	2019-10-01	2019-10-31	3.5	1	1.5	3	2019-12-27 08:49:15.796814	2019-12-27 08:49:15.796814
130	15	2019-10-01	2019-10-31	9.5	1	2	8.5	2019-12-27 08:49:15.806543	2019-12-27 08:49:15.806543
131	16	2019-10-01	2019-10-31	2.5	1	1	2.5	2019-12-27 08:49:15.815786	2019-12-27 08:49:15.815786
132	17	2019-10-01	2019-10-31	0	1	2	-1	2019-12-27 08:49:15.82629	2019-12-27 08:49:15.82629
133	51	2019-10-01	2019-10-31	24	1	0	25	2019-12-27 08:49:15.838048	2019-12-27 08:49:15.838048
134	52	2019-10-01	2019-10-31	4	1	4	1	2019-12-27 08:49:15.847689	2019-12-27 08:49:15.847689
135	53	2019-10-01	2019-10-31	1	1	2	0	2019-12-27 08:49:15.858922	2019-12-27 08:49:15.858922
136	54	2019-10-01	2019-10-31	14	1	1	14	2019-12-27 08:49:15.869545	2019-12-27 08:49:15.869545
137	55	2019-10-01	2019-10-31	4.5	1	0	5.5	2019-12-27 08:49:15.87981	2019-12-27 08:49:15.87981
138	56	2019-10-01	2019-10-31	0	1	2	-1	2019-12-27 08:49:15.88961	2019-12-27 08:49:15.88961
139	57	2019-10-01	2019-10-31	0	1	0	1	2019-12-27 08:49:15.900202	2019-12-27 08:49:15.900202
140	58	2019-10-01	2019-10-31	3	1	1.5	2.5	2019-12-27 08:49:15.909299	2019-12-27 08:49:15.909299
141	59	2019-10-01	2019-10-31	3.5	1	2	2.5	2019-12-27 08:49:15.920446	2019-12-27 08:49:15.920446
142	60	2019-10-01	2019-10-31	11	1	0	12	2019-12-27 08:49:15.930237	2019-12-27 08:49:15.930237
143	61	2019-10-01	2019-10-31	3	1	0	4	2019-12-27 08:49:15.94016	2019-12-27 08:49:15.94016
145	63	2019-10-01	2019-10-31	1.5	1	2.5	0	2019-12-27 08:49:15.95949	2019-12-27 08:49:15.95949
147	65	2019-10-01	2019-10-31	1	1	2	0	2019-12-27 08:49:15.977948	2019-12-27 08:49:15.977948
148	66	2019-10-01	2019-10-31	4.5	1	0	5.5	2019-12-27 08:49:15.98759	2019-12-27 08:49:15.98759
149	67	2019-10-01	2019-10-31	2	1	2.5	0.5	2019-12-27 08:49:15.997253	2019-12-27 08:49:15.997253
150	13	2019-11-01	2019-11-30	0	1	0.5	0.5	2019-12-27 08:50:09.11507	2019-12-27 08:50:09.11507
151	14	2019-11-01	2019-11-30	3	1	2	2	2019-12-27 08:50:09.134855	2019-12-27 08:50:09.134855
152	15	2019-11-01	2019-11-30	8.5	1	1	8.5	2019-12-27 08:50:09.147934	2019-12-27 08:50:09.147934
153	16	2019-11-01	2019-11-30	2.5	1	5.5	-2	2019-12-27 08:50:09.161067	2019-12-27 08:50:09.161067
154	17	2019-11-01	2019-11-30	0	1	0	1	2019-12-27 08:50:09.174002	2019-12-27 08:50:09.174002
155	51	2019-11-01	2019-11-30	25	1	1.5	24.5	2019-12-27 08:50:09.187417	2019-12-27 08:50:09.187417
156	52	2019-11-01	2019-11-30	1	1	0	2	2019-12-27 08:50:09.201417	2019-12-27 08:50:09.201417
157	53	2019-11-01	2019-11-30	0	1	0	1	2019-12-27 08:50:09.22427	2019-12-27 08:50:09.22427
158	54	2019-11-01	2019-11-30	14	1	0	15	2019-12-27 08:50:09.239016	2019-12-27 08:50:09.239016
159	55	2019-11-01	2019-11-30	5.5	1	1.5	5	2019-12-27 08:50:09.251855	2019-12-27 08:50:09.251855
160	56	2019-11-01	2019-11-30	0	0	1.5	-1.5	2019-12-27 08:50:09.261167	2019-12-27 08:50:09.261167
161	57	2019-11-01	2019-11-30	1	1	0	2	2019-12-27 08:50:09.271998	2019-12-27 08:50:09.271998
162	58	2019-11-01	2019-11-30	2.5	1	1	2.5	2019-12-27 08:50:09.283656	2019-12-27 08:50:09.283656
146	64	2019-10-01	2019-10-31	1	1	22	-20	2019-12-27 08:49:15.968777	2019-12-31 04:42:00.058066
163	59	2019-11-01	2019-11-30	2.5	1	1	2.5	2019-12-27 08:50:09.294548	2019-12-27 08:50:09.294548
144	62	2019-10-01	2019-10-31	1	1	2	0	2019-12-27 08:49:15.949263	2020-03-11 12:17:07.526632
164	60	2019-11-01	2019-11-30	12	1	1	12	2019-12-27 08:50:09.304601	2019-12-27 08:50:09.304601
165	61	2019-11-01	2019-11-30	4	1	0	5	2019-12-27 08:50:09.318227	2019-12-27 08:50:09.318227
167	63	2019-11-01	2019-11-30	1.5	1	1	0	2019-12-27 08:50:09.342901	2019-12-27 08:50:09.342901
168	64	2019-11-01	2019-11-30	0	1	2	-1	2019-12-27 08:50:09.356452	2019-12-27 08:50:09.356452
169	65	2019-11-01	2019-11-30	0	1	0.5	0.5	2019-12-27 08:50:09.369924	2019-12-27 08:50:09.369924
170	66	2019-11-01	2019-11-30	5.5	1	4	2.5	2019-12-27 08:50:09.383307	2019-12-27 08:50:09.383307
171	67	2019-11-01	2019-11-30	0.5	1	1	0.5	2019-12-27 08:50:09.396749	2019-12-27 08:50:09.396749
172	68	2019-11-01	2019-11-30	0	1	1	0	2019-12-27 08:50:09.412026	2019-12-27 08:50:09.412026
124	64	2019-09-01	2019-09-30	0	1	0	1	2019-12-27 08:48:55.171774	2019-12-31 04:40:56.464698
173	58	2019-12-01	2019-12-31	2.5	1	1.5	2	2020-01-01 09:14:26.72986	2020-01-01 09:14:26.72986
175	16	2019-12-01	2019-12-31	0	1	0	1	2020-01-01 09:14:26.976569	2020-01-01 09:14:26.976569
176	55	2019-12-01	2019-12-31	5	4	3	6	2020-01-01 09:14:27.128438	2020-01-01 09:14:27.128438
177	63	2019-12-01	2019-12-31	0	1	0	1	2020-01-01 09:14:27.2777	2020-01-01 09:14:27.2777
178	54	2019-12-01	2019-12-31	15	1	3.5	12.5	2020-01-01 09:14:27.375384	2020-01-01 09:14:27.375384
179	14	2019-12-01	2019-12-31	2	1	0	3	2020-01-01 09:14:27.498698	2020-01-01 09:14:27.498698
180	57	2019-12-01	2019-12-31	2	1	1	2	2020-01-01 09:14:27.589841	2020-01-01 09:14:27.589841
181	17	2019-12-01	2019-12-31	1	1	0	2	2020-01-01 09:14:27.701304	2020-01-01 09:14:27.701304
182	52	2019-12-01	2019-12-31	2	1	0.5	2.5	2020-01-01 09:14:27.828983	2020-01-01 09:14:27.828983
183	61	2019-12-01	2019-12-31	5	1	0.5	5.5	2020-01-01 09:14:27.93294	2020-01-01 09:14:27.93294
184	15	2019-12-01	2019-12-31	8.5	1	1	8.5	2020-01-01 09:14:28.082685	2020-01-01 09:14:28.082685
185	60	2019-12-01	2019-12-31	12	1	0	13	2020-01-01 09:14:28.297174	2020-01-01 09:14:28.297174
186	53	2019-12-01	2019-12-31	1	1	0.5	1.5	2020-01-01 09:14:28.527052	2020-01-01 09:14:28.527052
187	59	2019-12-01	2019-12-31	2.5	1	0	3.5	2020-01-01 09:14:28.68171	2020-01-01 09:14:28.68171
188	64	2019-12-01	2019-12-31	0	1	1	0	2020-01-01 09:14:28.90604	2020-01-01 09:14:28.90604
189	51	2019-12-01	2019-12-31	24.5	1	3.5	22	2020-01-01 09:14:29.154604	2020-01-01 09:14:29.154604
190	68	2019-12-01	2019-12-31	0	1	0	1	2020-01-01 09:14:29.366632	2020-01-01 09:14:29.366632
191	66	2019-12-01	2019-12-31	2.5	1	1	2.5	2020-01-01 09:14:29.55474	2020-01-01 09:14:29.55474
192	67	2019-12-01	2019-12-31	0.5	1	1	0.5	2020-01-01 09:14:29.713449	2020-01-01 09:14:29.713449
193	65	2019-12-01	2019-12-31	0.5	1	6	-4.5	2020-01-01 09:14:29.897147	2020-01-01 09:14:29.897147
194	13	2019-12-01	2019-12-31	0.5	1	8	-6.5	2020-01-01 09:14:30.106525	2020-01-01 09:14:30.106525
195	57	2020-01-01	2020-01-31	2	1	1	2	2020-02-03 11:27:18.309131	2020-02-03 11:27:18.309131
196	67	2020-01-01	2020-01-31	0.5	1	1	0.5	2020-02-03 11:27:18.359754	2020-02-03 11:27:18.359754
197	63	2020-01-01	2020-01-31	1	1	0	2	2020-02-03 11:27:18.397361	2020-02-03 11:27:18.397361
198	60	2020-01-01	2020-01-31	13	1	2	12	2020-02-03 11:27:18.451154	2020-02-03 11:27:18.451154
199	59	2020-01-01	2020-01-31	3.5	1	2	2.5	2020-02-03 11:27:18.484477	2020-02-03 11:27:18.484477
200	66	2020-01-01	2020-01-31	2.5	1	0	3.5	2020-02-03 11:27:18.519977	2020-02-03 11:27:18.519977
201	17	2020-01-01	2020-01-31	2	1	1	2	2020-02-03 11:27:18.567898	2020-02-03 11:27:18.567898
203	53	2020-01-01	2020-01-31	1.5	1	3	-0.5	2020-02-03 11:27:18.64195	2020-02-03 11:27:18.64195
204	64	2020-01-01	2020-01-31	0	1	3.5	-2.5	2020-02-03 11:27:18.695998	2020-02-03 11:27:18.695998
205	61	2020-01-01	2020-01-31	5.5	1	1	5.5	2020-02-03 11:27:18.742704	2020-02-03 11:27:18.742704
206	54	2020-01-01	2020-01-31	12.5	1	0.5	13	2020-02-03 11:27:18.774862	2020-02-03 11:27:18.774862
207	55	2020-01-01	2020-01-31	6	1	0	7	2020-02-03 11:27:18.803257	2020-02-03 11:27:18.803257
208	52	2020-01-01	2020-01-31	2.5	1	1	2.5	2020-02-03 11:27:18.845838	2020-02-03 11:27:18.845838
209	16	2020-01-01	2020-01-31	1	1	0	2	2020-02-03 11:27:18.879125	2020-02-03 11:27:18.879125
210	51	2020-01-01	2020-01-31	22	1	0	23	2020-02-03 11:27:18.937166	2020-02-03 11:27:18.937166
211	68	2020-01-01	2020-01-31	1	1	2	0	2020-02-03 11:27:18.973731	2020-02-03 11:27:18.973731
212	14	2020-01-01	2020-01-31	3	1	5	-1	2020-02-03 11:27:19.009653	2020-02-03 11:27:19.009653
213	13	2020-01-01	2020-01-31	0	1	1	0	2020-02-03 11:27:19.065211	2020-02-03 11:27:19.065211
214	69	2020-01-01	2020-01-31	0	1	1	0	2020-02-03 11:27:19.11046	2020-02-03 11:27:19.11046
215	15	2020-01-01	2020-01-31	8.5	1	1.5	8	2020-02-03 11:27:19.149358	2020-02-03 11:27:19.149358
216	58	2020-01-01	2020-01-31	2	1	1	2	2020-02-03 11:27:19.185683	2020-02-03 11:27:19.185683
217	65	2020-01-01	2020-01-31	0	1	0.5	0.5	2020-02-03 11:27:19.224711	2020-02-03 11:27:19.224711
218	67	2020-02-01	2020-02-29	0.5	1	0	1.5	2020-03-03 07:48:22.585151	2020-03-03 07:48:22.585151
219	53	2020-02-01	2020-02-29	0	1	5	-4	2020-03-03 07:48:22.66294	2020-03-03 07:48:22.66294
220	16	2020-02-01	2020-02-29	2	1	2	1	2020-03-03 07:48:22.718711	2020-03-03 07:48:22.718711
221	14	2020-02-01	2020-02-29	0	1	1	0	2020-03-03 07:48:22.756944	2020-03-03 07:48:22.756944
222	66	2020-02-01	2020-02-29	3.5	1	0	4.5	2020-03-03 07:48:22.802992	2020-03-03 07:48:22.802992
223	51	2020-02-01	2020-02-29	23	1	3	21	2020-03-03 07:48:22.86333	2020-03-03 07:48:22.86333
224	64	2020-02-01	2020-02-29	0	1	12	-11	2020-03-03 07:48:22.901695	2020-03-03 07:48:22.901695
225	68	2020-02-01	2020-02-29	0	1	0.5	0.5	2020-03-03 07:48:22.957975	2020-03-03 07:48:22.957975
226	17	2020-02-01	2020-02-29	2	4	24	-18	2020-03-03 07:48:23.030583	2020-03-03 07:48:23.030583
227	57	2020-02-01	2020-02-29	2	1	8.5	-5.5	2020-03-03 07:48:23.102556	2020-03-03 07:48:23.102556
228	60	2020-02-01	2020-02-29	12	1	0	13	2020-03-03 07:48:23.149185	2020-03-03 07:48:23.149185
229	54	2020-02-01	2020-02-29	13	1	0	14	2020-03-03 07:48:23.193933	2020-03-03 07:48:23.193933
230	63	2020-02-01	2020-02-29	2	1	0	3	2020-03-03 07:48:23.240233	2020-03-03 07:48:23.240233
231	59	2020-02-01	2020-02-29	2.5	1	2	1.5	2020-03-03 07:48:23.286076	2020-03-03 07:48:23.286076
233	52	2020-02-01	2020-02-29	2.5	1	1.5	2	2020-03-03 07:48:23.393189	2020-03-03 07:48:23.393189
234	55	2020-02-01	2020-02-29	7	1	1.5	6.5	2020-03-03 07:48:23.456037	2020-03-03 07:48:23.456037
235	58	2020-02-01	2020-02-29	2	1	1.5	1.5	2020-03-03 07:48:23.508657	2020-03-03 07:48:23.508657
236	65	2020-02-01	2020-02-29	0.5	1	0.5	1	2020-03-03 07:48:23.584613	2020-03-03 07:48:23.584613
237	15	2020-02-01	2020-02-29	8	1	0.5	8.5	2020-03-03 07:48:23.662979	2020-03-03 07:48:23.662979
238	13	2020-02-01	2020-02-29	0	1	3.5	-2.5	2020-03-03 07:48:23.750129	2020-03-03 07:48:23.750129
239	69	2020-02-01	2020-02-29	0	1	3.5	-2.5	2020-03-03 07:48:23.851256	2020-03-03 07:48:23.851256
240	61	2020-02-01	2020-02-29	5.5	1	5	1.5	2020-03-03 07:48:23.958659	2020-03-03 07:48:23.958659
122	62	2019-09-01	2019-09-30	1	1	1	1	2019-12-27 08:48:55.146553	2020-03-11 12:14:19.261587
166	62	2019-11-01	2019-11-30	0	1	1	0	2019-12-27 08:50:09.331748	2020-03-11 12:17:53.471523
174	62	2019-12-01	2019-12-31	0	1	0	1	2020-01-01 09:14:26.861436	2020-03-11 12:18:37.048791
202	62	2020-01-01	2020-01-31	1	1	0	2	2020-02-03 11:27:18.608864	2020-03-11 12:35:16.957308
232	62	2020-02-01	2020-02-29	2	1	1	2	2020-03-03 07:48:23.327907	2020-03-11 12:36:08.340859
241	64	2020-03-01	2020-03-31	0	1	0	1	2020-04-06 14:10:05.532425	2020-04-06 14:10:05.532425
242	68	2020-03-01	2020-03-31	0.5	1	0	1.5	2020-04-06 14:10:05.570663	2020-04-06 14:10:05.570663
243	14	2020-03-01	2020-03-31	0	1	0	1	2020-04-06 14:10:05.619895	2020-04-06 14:10:05.619895
244	66	2020-03-01	2020-03-31	4.5	1	0	5.5	2020-04-06 14:10:05.648356	2020-04-06 14:10:05.648356
245	17	2020-03-01	2020-03-31	0	1	5	-4	2020-04-06 14:10:05.68623	2020-04-06 14:10:05.68623
246	67	2020-03-01	2020-03-31	1.5	1	0	2.5	2020-04-06 14:10:05.718082	2020-04-06 14:10:05.718082
247	60	2020-03-01	2020-03-31	13	1	5	9	2020-04-06 14:10:05.753268	2020-04-06 14:10:05.753268
248	55	2020-03-01	2020-03-31	6.5	1	0.5	7	2020-04-06 14:10:05.783784	2020-04-06 14:10:05.783784
249	62	2020-03-01	2020-03-31	2	1	3	0	2020-04-06 14:10:05.816391	2020-04-06 14:10:05.816391
250	51	2020-03-01	2020-03-31	21	1	0	22	2020-04-06 14:10:05.844128	2020-04-06 14:10:05.844128
251	57	2020-03-01	2020-03-31	0	1	0	1	2020-04-06 14:10:05.872107	2020-04-06 14:10:05.872107
252	63	2020-03-01	2020-03-31	3	1	0	4	2020-04-06 14:10:05.905411	2020-04-06 14:10:05.905411
253	59	2020-03-01	2020-03-31	1.5	1	0	2.5	2020-04-06 14:10:05.932553	2020-04-06 14:10:05.932553
254	53	2020-03-01	2020-03-31	0	1	0	1	2020-04-06 14:10:05.961715	2020-04-06 14:10:05.961715
255	54	2020-03-01	2020-03-31	14	1	1	14	2020-04-06 14:10:05.993978	2020-04-06 14:10:05.993978
256	52	2020-03-01	2020-03-31	2	1	0	3	2020-04-06 14:10:06.020462	2020-04-06 14:10:06.020462
257	16	2020-03-01	2020-03-31	1	1	0	2	2020-04-06 14:10:06.057394	2020-04-06 14:10:06.057394
258	61	2020-03-01	2020-03-31	1.5	1	0	2.5	2020-04-06 14:10:06.094452	2020-04-06 14:10:06.094452
259	65	2020-03-01	2020-03-31	1	1	2	0	2020-04-06 14:10:06.127203	2020-04-06 14:10:06.127203
260	69	2020-03-01	2020-03-31	0	1	11	-10	2020-04-06 14:10:06.160396	2020-04-06 14:10:06.160396
261	13	2020-03-01	2020-03-31	0	1	2	-1	2020-04-06 14:10:06.191762	2020-04-06 14:10:06.191762
262	15	2020-03-01	2020-03-31	8.5	1	0	9.5	2020-04-06 14:10:06.220738	2020-04-06 14:10:06.220738
263	58	2020-03-01	2020-03-31	1.5	1	1	1.5	2020-04-06 14:10:06.253839	2020-04-06 14:10:06.253839
274	68	2020-04-01	2020-04-30	1.5	1	0	2.5	2020-05-07 07:05:57.537819	2020-05-07 07:05:57.537819
275	64	2020-04-01	2020-04-30	1	1	0	2	2020-05-07 07:05:57.740424	2020-05-07 07:05:57.740424
276	59	2020-04-01	2020-04-30	2.5	1	0.5	3	2020-05-07 07:05:58.03338	2020-05-07 07:05:58.03338
277	66	2020-04-01	2020-04-30	5.5	1	0	6.5	2020-05-07 07:05:58.149477	2020-05-07 07:05:58.149477
278	14	2020-04-01	2020-04-30	1	1	1	1	2020-05-07 07:05:58.295403	2020-05-07 07:05:58.295403
279	16	2020-04-01	2020-04-30	2	1	0.5	2.5	2020-05-07 07:05:58.491145	2020-05-07 07:05:58.491145
280	62	2020-04-01	2020-04-30	0	1	0	1	2020-05-07 07:05:58.605821	2020-05-07 07:05:58.605821
281	52	2020-04-01	2020-04-30	3	1	0.5	3.5	2020-05-07 07:05:58.768804	2020-05-07 07:05:58.768804
282	57	2020-04-01	2020-04-30	1	1	0	2	2020-05-07 07:05:58.925666	2020-05-07 07:05:58.925666
283	17	2020-04-01	2020-04-30	0	1	0	1	2020-05-07 07:05:59.087072	2020-05-07 07:05:59.087072
284	55	2020-04-01	2020-04-30	7	1	2	6	2020-05-07 07:05:59.242536	2020-05-07 07:05:59.242536
285	53	2020-04-01	2020-04-30	1	1	0	2	2020-05-07 07:05:59.510759	2020-05-07 07:05:59.510759
286	63	2020-04-01	2020-04-30	4	1	0	5	2020-05-07 07:05:59.616772	2020-05-07 07:05:59.616772
287	54	2020-04-01	2020-04-30	14	1	0	15	2020-05-07 07:05:59.853937	2020-05-07 07:05:59.853937
288	51	2020-04-01	2020-04-30	22	1	0	23	2020-05-07 07:06:00.062084	2020-05-07 07:06:00.062084
289	67	2020-04-01	2020-04-30	2.5	1	0	3.5	2020-05-07 07:06:00.2732	2020-05-07 07:06:00.2732
290	60	2020-04-01	2020-04-30	9	1	0	10	2020-05-07 07:06:00.474702	2020-05-07 07:06:00.474702
291	58	2020-04-01	2020-04-30	1.5	1	0	2.5	2020-05-07 07:06:00.664676	2020-05-07 07:06:00.664676
292	13	2020-04-01	2020-04-30	0	1	0	1	2020-05-07 07:06:00.937935	2020-05-07 07:06:00.937935
293	15	2020-04-01	2020-04-30	9.5	1	1	9.5	2020-05-07 07:06:01.201411	2020-05-07 07:06:01.201411
294	61	2020-04-01	2020-04-30	2.5	1	0	3.5	2020-05-07 07:06:01.347163	2020-05-07 07:06:01.347163
295	65	2020-04-01	2020-04-30	0	1	0	1	2020-05-07 07:06:01.513853	2020-05-07 07:06:01.513853
296	69	2020-04-01	2020-04-30	0	1	0	1	2020-05-07 07:06:01.715869	2020-05-07 07:06:01.715869
297	16	2020-05-01	2020-05-31	2.5	1	0	3.5	2020-06-01 10:56:19.142347	2020-06-01 10:56:19.142347
298	64	2020-05-01	2020-05-31	2	1	0	3	2020-06-01 10:56:19.204522	2020-06-01 10:56:19.204522
299	66	2020-05-01	2020-05-31	6.5	1	0	7.5	2020-06-01 10:56:19.253416	2020-06-01 10:56:19.253416
300	55	2020-05-01	2020-05-31	6	1	0	7	2020-06-01 10:56:19.307058	2020-06-01 10:56:19.307058
301	63	2020-05-01	2020-05-31	5	1	0	6	2020-06-01 10:56:19.397922	2020-06-01 10:56:19.397922
302	60	2020-05-01	2020-05-31	10	1	0	11	2020-06-01 10:56:19.480885	2020-06-01 10:56:19.480885
303	53	2020-05-01	2020-05-31	2	1	0	3	2020-06-01 10:56:19.552835	2020-06-01 10:56:19.552835
304	17	2020-05-01	2020-05-31	1	1	0	2	2020-06-01 10:56:19.650498	2020-06-01 10:56:19.650498
305	67	2020-05-01	2020-05-31	3.5	1	0	4.5	2020-06-01 10:56:19.713136	2020-06-01 10:56:19.713136
306	51	2020-05-01	2020-05-31	23	1	0	24	2020-06-01 10:56:19.796655	2020-06-01 10:56:19.796655
307	14	2020-05-01	2020-05-31	1	1	0	2	2020-06-01 10:56:19.868233	2020-06-01 10:56:19.868233
308	68	2020-05-01	2020-05-31	2.5	1	0	3.5	2020-06-01 10:56:19.947408	2020-06-01 10:56:19.947408
309	59	2020-05-01	2020-05-31	3	1	0	4	2020-06-01 10:56:20.007035	2020-06-01 10:56:20.007035
310	52	2020-05-01	2020-05-31	3.5	1	0	4.5	2020-06-01 10:56:20.068067	2020-06-01 10:56:20.068067
311	57	2020-05-01	2020-05-31	2	1	0	3	2020-06-01 10:56:20.137079	2020-06-01 10:56:20.137079
312	54	2020-05-01	2020-05-31	15	1	0	16	2020-06-01 10:56:20.19584	2020-06-01 10:56:20.19584
313	58	2020-05-01	2020-05-31	2.5	1	0	3.5	2020-06-01 10:56:20.2569	2020-06-01 10:56:20.2569
314	69	2020-05-01	2020-05-31	1	1	0	2	2020-06-01 10:56:20.336255	2020-06-01 10:56:20.336255
315	61	2020-05-01	2020-05-31	3.5	1	0	4.5	2020-06-01 10:56:20.40588	2020-06-01 10:56:20.40588
316	15	2020-05-01	2020-05-31	9.5	1	0	10.5	2020-06-01 10:56:20.476345	2020-06-01 10:56:20.476345
317	13	2020-05-01	2020-05-31	1	1	0	2	2020-06-01 10:56:20.540365	2020-06-01 10:56:20.540365
318	65	2020-05-01	2020-05-31	1	1	0	2	2020-06-01 10:56:20.59802	2020-06-01 10:56:20.59802
319	17	2020-06-01	2020-06-30	2	1	0	3	2020-07-02 10:06:36.987902	2020-07-02 10:06:36.987902
320	60	2020-06-01	2020-06-30	11	1	0	12	2020-07-02 10:06:37.02664	2020-07-02 10:06:37.02664
321	55	2020-06-01	2020-06-30	7	1	0	8	2020-07-02 10:06:37.06257	2020-07-02 10:06:37.06257
322	67	2020-06-01	2020-06-30	4.5	1	1.5	4	2020-07-02 10:06:37.109943	2020-07-02 10:06:37.109943
323	53	2020-06-01	2020-06-30	3	1	1	3	2020-07-02 10:06:37.150191	2020-07-02 10:06:37.150191
324	64	2020-06-01	2020-06-30	3	1	0.5	3.5	2020-07-02 10:06:37.192991	2020-07-02 10:06:37.192991
325	66	2020-06-01	2020-06-30	7.5	1	0	8.5	2020-07-02 10:06:37.248044	2020-07-02 10:06:37.248044
326	52	2020-06-01	2020-06-30	4.5	1	1	4.5	2020-07-02 10:06:37.297948	2020-07-02 10:06:37.297948
327	54	2020-06-01	2020-06-30	16	1	0	17	2020-07-02 10:06:37.364037	2020-07-02 10:06:37.364037
328	14	2020-06-01	2020-06-30	2	1	0	3	2020-07-02 10:06:37.404896	2020-07-02 10:06:37.404896
329	68	2020-06-01	2020-06-30	3.5	1	0	4.5	2020-07-02 10:06:37.444787	2020-07-02 10:06:37.444787
330	51	2020-06-01	2020-06-30	24	1	0	25	2020-07-02 10:06:37.487192	2020-07-02 10:06:37.487192
331	57	2020-06-01	2020-06-30	3	1	0	4	2020-07-02 10:06:37.550412	2020-07-02 10:06:37.550412
332	59	2020-06-01	2020-06-30	4	1	0	5	2020-07-02 10:06:37.61581	2020-07-02 10:06:37.61581
333	63	2020-06-01	2020-06-30	6	1	0.5	6.5	2020-07-02 10:06:37.689929	2020-07-02 10:06:37.689929
334	16	2020-06-01	2020-06-30	3.5	1	0	4.5	2020-07-02 10:06:37.749868	2020-07-02 10:06:37.749868
335	65	2020-06-01	2020-06-30	2	1	0.5	2.5	2020-07-02 10:06:37.817557	2020-07-02 10:06:37.817557
336	15	2020-06-01	2020-06-30	10.5	1	0	11.5	2020-07-02 10:06:37.8779	2020-07-02 10:06:37.8779
337	69	2020-06-01	2020-06-30	2	1	0	3	2020-07-02 10:06:37.93248	2020-07-02 10:06:37.93248
338	58	2020-06-01	2020-06-30	3.5	1	4	0.5	2020-07-02 10:06:38.01075	2020-07-02 10:06:38.01075
339	61	2020-06-01	2020-06-30	4.5	1	0	5.5	2020-07-02 10:06:38.048902	2020-07-02 10:06:38.048902
340	13	2020-06-01	2020-06-30	2	1	1	2	2020-07-02 10:06:38.091905	2020-07-02 10:06:38.091905
341	14	2020-07-01	2020-07-31	3	1	0	4	2020-08-04 13:38:01.43292	2020-08-04 13:38:01.43292
342	66	2020-07-01	2020-07-31	8.5	1	0	9.5	2020-08-04 13:38:01.484359	2020-08-04 13:38:01.484359
343	53	2020-07-01	2020-07-31	3	1	0	4	2020-08-04 13:38:01.51977	2020-08-04 13:38:01.51977
344	63	2020-07-01	2020-07-31	6.5	1	0.5	7	2020-08-04 13:38:01.567313	2020-08-04 13:38:01.567313
345	52	2020-07-01	2020-07-31	4.5	1	0.5	5	2020-08-04 13:38:01.615861	2020-08-04 13:38:01.615861
346	67	2020-07-01	2020-07-31	4	1	5	0	2020-08-04 13:38:01.675743	2020-08-04 13:38:01.675743
347	55	2020-07-01	2020-07-31	8	1	3.5	5.5	2020-08-04 13:38:01.72253	2020-08-04 13:38:01.72253
348	60	2020-07-01	2020-07-31	12	1	0	13	2020-08-04 13:38:01.765467	2020-08-04 13:38:01.765467
349	51	2020-07-01	2020-07-31	25	1	1	25	2020-08-04 13:38:01.804607	2020-08-04 13:38:01.804607
350	68	2020-07-01	2020-07-31	4.5	1	0	5.5	2020-08-04 13:38:01.856267	2020-08-04 13:38:01.856267
351	17	2020-07-01	2020-07-31	3	1	0	4	2020-08-04 13:38:01.905556	2020-08-04 13:38:01.905556
352	54	2020-07-01	2020-07-31	17	1	0.5	17.5	2020-08-04 13:38:01.960009	2020-08-04 13:38:01.960009
353	59	2020-07-01	2020-07-31	5	1	0	6	2020-08-04 13:38:02.000025	2020-08-04 13:38:02.000025
354	64	2020-07-01	2020-07-31	3.5	1	1.5	3	2020-08-04 13:38:02.057187	2020-08-04 13:38:02.057187
355	57	2020-07-01	2020-07-31	4	1	0.5	4.5	2020-08-04 13:38:02.09597	2020-08-04 13:38:02.09597
356	69	2020-07-01	2020-07-31	3	1	2	2	2020-08-04 13:38:02.150378	2020-08-04 13:38:02.150378
357	13	2020-07-01	2020-07-31	2	1	0	3	2020-08-04 13:38:02.193388	2020-08-04 13:38:02.193388
358	65	2020-07-01	2020-07-31	2.5	1	0.5	3	2020-08-04 13:38:02.238349	2020-08-04 13:38:02.238349
359	16	2020-07-01	2020-07-31	4.5	1	0	5.5	2020-08-04 13:38:02.274029	2020-08-04 13:38:02.274029
360	15	2020-07-01	2020-07-31	11.5	1	3	9.5	2020-08-04 13:38:02.330041	2020-08-04 13:38:02.330041
361	58	2020-07-01	2020-07-31	0.5	1	0	1.5	2020-08-04 13:38:02.366493	2020-08-04 13:38:02.366493
362	61	2020-07-01	2020-07-31	5.5	1	1	5.5	2020-08-04 13:38:02.411612	2020-08-04 13:38:02.411612
374	66	2020-08-01	2020-08-31	9.5	1	0	10.5	2020-09-01 10:20:28.673358	2020-09-01 10:20:28.673358
375	64	2020-08-01	2020-08-31	3	1	1	3	2020-09-01 10:20:28.742204	2020-09-01 10:20:28.742204
376	60	2020-08-01	2020-08-31	13	1	0	14	2020-09-01 10:20:28.793296	2020-09-01 10:20:28.793296
377	52	2020-08-01	2020-08-31	5	1	0	6	2020-09-01 10:20:28.854894	2020-09-01 10:20:28.854894
378	51	2020-08-01	2020-08-31	25	1	0	26	2020-09-01 10:20:28.908955	2020-09-01 10:20:28.908955
379	54	2020-08-01	2020-08-31	17.5	1	1	17.5	2020-09-01 10:20:28.969471	2020-09-01 10:20:28.969471
380	63	2020-08-01	2020-08-31	7	1	1	7	2020-09-01 10:20:29.032657	2020-09-01 10:20:29.032657
381	67	2020-08-01	2020-08-31	0	1	1	0	2020-09-01 10:20:29.094916	2020-09-01 10:20:29.094916
382	68	2020-08-01	2020-08-31	5.5	1	0	6.5	2020-09-01 10:20:29.152235	2020-09-01 10:20:29.152235
383	17	2020-08-01	2020-08-31	4	1	0	5	2020-09-01 10:20:29.201713	2020-09-01 10:20:29.201713
384	55	2020-08-01	2020-08-31	5.5	1	1	5.5	2020-09-01 10:20:29.258366	2020-09-01 10:20:29.258366
385	59	2020-08-01	2020-08-31	6	1	0	7	2020-09-01 10:20:29.312315	2020-09-01 10:20:29.312315
386	14	2020-08-01	2020-08-31	4	1	0	5	2020-09-01 10:20:29.36494	2020-09-01 10:20:29.36494
387	53	2020-08-01	2020-08-31	4	1	0	5	2020-09-01 10:20:29.415228	2020-09-01 10:20:29.415228
388	57	2020-08-01	2020-08-31	4.5	1	0	5.5	2020-09-01 10:20:29.465997	2020-09-01 10:20:29.465997
389	58	2020-08-01	2020-08-31	1.5	1	0	2.5	2020-09-01 10:20:29.527168	2020-09-01 10:20:29.527168
390	69	2020-08-01	2020-08-31	2	1	1	2	2020-09-01 10:20:29.581013	2020-09-01 10:20:29.581013
391	65	2020-08-01	2020-08-31	3	1	0.5	3.5	2020-09-01 10:20:29.636218	2020-09-01 10:20:29.636218
392	15	2020-08-01	2020-08-31	9.5	1	0.5	10	2020-09-01 10:20:29.694555	2020-09-01 10:20:29.694555
393	13	2020-08-01	2020-08-31	3	1	1	3	2020-09-01 10:20:29.753447	2020-09-01 10:20:29.753447
394	61	2020-08-01	2020-08-31	5.5	1	0	6.5	2020-09-01 10:20:29.801242	2020-09-01 10:20:29.801242
395	16	2020-08-01	2020-08-31	5.5	1	0	6.5	2020-09-01 10:20:29.850543	2020-09-01 10:20:29.850543
396	17	2020-09-01	2020-09-30	5	1	1	5	2020-10-01 12:39:24.417593	2020-10-01 12:39:24.417593
397	64	2020-09-01	2020-09-30	3	1	0	4	2020-10-01 12:39:24.468823	2020-10-01 12:39:24.468823
398	60	2020-09-01	2020-09-30	14	1	0	15	2020-10-01 12:39:24.516828	2020-10-01 12:39:24.516828
399	51	2020-09-01	2020-09-30	26	1	1	26	2020-10-01 12:39:24.56988	2020-10-01 12:39:24.56988
400	54	2020-09-01	2020-09-30	17.5	1	0	18.5	2020-10-01 12:39:24.609544	2020-10-01 12:39:24.609544
401	68	2020-09-01	2020-09-30	6.5	1	0	7.5	2020-10-01 12:39:24.652595	2020-10-01 12:39:24.652595
402	53	2020-09-01	2020-09-30	5	1	1	5	2020-10-01 12:39:24.696588	2020-10-01 12:39:24.696588
403	55	2020-09-01	2020-09-30	5.5	1	0	6.5	2020-10-01 12:39:24.742789	2020-10-01 12:39:24.742789
404	59	2020-09-01	2020-09-30	7	1	0	8	2020-10-01 12:39:24.784803	2020-10-01 12:39:24.784803
405	57	2020-09-01	2020-09-30	5.5	1	0.5	6	2020-10-01 12:39:24.831386	2020-10-01 12:39:24.831386
406	67	2020-09-01	2020-09-30	0	1	3	-2	2020-10-01 12:39:24.878622	2020-10-01 12:39:24.878622
407	14	2020-09-01	2020-09-30	5	1	0	6	2020-10-01 12:39:24.923134	2020-10-01 12:39:24.923134
408	66	2020-09-01	2020-09-30	10.5	1	0	11.5	2020-10-01 12:39:24.967932	2020-10-01 12:39:24.967932
409	52	2020-09-01	2020-09-30	6	1	0.5	6.5	2020-10-01 12:39:25.014352	2020-10-01 12:39:25.014352
410	63	2020-09-01	2020-09-30	7	1	1.5	6.5	2020-10-01 12:39:25.058441	2020-10-01 12:39:25.058441
411	61	2020-09-01	2020-09-30	6.5	1	0	7.5	2020-10-01 12:39:25.098357	2020-10-01 12:39:25.098357
412	16	2020-09-01	2020-09-30	6.5	1	0	7.5	2020-10-01 12:39:25.143214	2020-10-01 12:39:25.143214
413	58	2020-09-01	2020-09-30	2.5	1	0.5	3	2020-10-01 12:39:25.186574	2020-10-01 12:39:25.186574
414	13	2020-09-01	2020-09-30	3	1	1.5	2.5	2020-10-01 12:39:25.234767	2020-10-01 12:39:25.234767
415	15	2020-09-01	2020-09-30	10	1	0.5	10.5	2020-10-01 12:39:25.280218	2020-10-01 12:39:25.280218
416	69	2020-09-01	2020-09-30	2	1	0	3	2020-10-01 12:39:25.330285	2020-10-01 12:39:25.330285
417	65	2020-09-01	2020-09-30	3.5	1	1.5	3	2020-10-01 12:39:25.400509	2020-10-01 12:39:25.400509
418	53	2020-10-01	2020-10-31	5	1	5	1	2020-11-02 13:30:01.661437	2020-11-02 13:30:01.661437
419	66	2020-10-01	2020-10-31	11.5	1	0	12.5	2020-11-02 13:30:01.730765	2020-11-02 13:30:01.730765
420	68	2020-10-01	2020-10-31	7.5	1	0	8.5	2020-11-02 13:30:01.804084	2020-11-02 13:30:01.804084
421	51	2020-10-01	2020-10-31	26	1	1	26	2020-11-02 13:30:01.867455	2020-11-02 13:30:01.867455
422	57	2020-10-01	2020-10-31	6	1	0.5	6.5	2020-11-02 13:30:01.933956	2020-11-02 13:30:01.933956
423	64	2020-10-01	2020-10-31	4	1	1	4	2020-11-02 13:30:01.994029	2020-11-02 13:30:01.994029
424	63	2020-10-01	2020-10-31	6.5	1	0.5	7	2020-11-02 13:30:02.051959	2020-11-02 13:30:02.051959
425	17	2020-10-01	2020-10-31	5	1	0	6	2020-11-02 13:30:02.104888	2020-11-02 13:30:02.104888
426	67	2020-10-01	2020-10-31	0	1	0	1	2020-11-02 13:30:02.158839	2020-11-02 13:30:02.158839
427	52	2020-10-01	2020-10-31	6.5	1	0.5	7	2020-11-02 13:30:02.219162	2020-11-02 13:30:02.219162
428	54	2020-10-01	2020-10-31	18.5	1	0	19.5	2020-11-02 13:30:02.265848	2020-11-02 13:30:02.265848
429	14	2020-10-01	2020-10-31	6	1	0	7	2020-11-02 13:30:02.302354	2020-11-02 13:30:02.302354
430	59	2020-10-01	2020-10-31	8	1	0	9	2020-11-02 13:30:02.344049	2020-11-02 13:30:02.344049
431	60	2020-10-01	2020-10-31	15	1	1	15	2020-11-02 13:30:02.387055	2020-11-02 13:30:02.387055
432	55	2020-10-01	2020-10-31	6.5	1	2	5.5	2020-11-02 13:30:02.431001	2020-11-02 13:30:02.431001
433	16	2020-10-01	2020-10-31	7.5	1	0.5	8	2020-11-02 13:30:02.467921	2020-11-02 13:30:02.467921
434	65	2020-10-01	2020-10-31	3	1	0.5	3.5	2020-11-02 13:30:02.502387	2020-11-02 13:30:02.502387
435	15	2020-10-01	2020-10-31	10.5	1	1	10.5	2020-11-02 13:30:02.540729	2020-11-02 13:30:02.540729
436	58	2020-10-01	2020-10-31	3	1	1	3	2020-11-02 13:30:02.579007	2020-11-02 13:30:02.579007
437	69	2020-10-01	2020-10-31	3	1	0.5	3.5	2020-11-02 13:30:02.637497	2020-11-02 13:30:02.637497
438	61	2020-10-01	2020-10-31	7.5	1	2	6.5	2020-11-02 13:30:02.689891	2020-11-02 13:30:02.689891
439	13	2020-10-01	2020-10-31	2.5	1	3.5	0	2020-11-02 13:30:02.734762	2020-11-02 13:30:02.734762
440	60	2020-11-01	2020-11-30	15	1	1	15	2020-12-03 10:42:05.926425	2020-12-03 10:42:05.926425
441	52	2020-11-01	2020-11-30	7	1	1	7	2020-12-03 10:42:05.986327	2020-12-03 10:42:05.986327
443	51	2020-11-01	2020-11-30	26	1	1	26	2020-12-03 10:42:06.091562	2020-12-03 10:42:06.091562
444	67	2020-11-01	2020-11-30	1	1	18.5	-16.5	2020-12-03 10:42:06.142796	2020-12-03 10:42:06.142796
445	63	2020-11-01	2020-11-30	7	1	0.5	7.5	2020-12-03 10:42:06.202853	2020-12-03 10:42:06.202853
447	17	2020-11-01	2020-11-30	6	1	1	6	2020-12-03 10:42:06.300608	2020-12-03 10:42:06.300608
448	66	2020-11-01	2020-11-30	12.5	1	1	12.5	2020-12-03 10:42:06.353792	2020-12-03 10:42:06.353792
449	55	2020-11-01	2020-11-30	5.5	1	0	6.5	2020-12-03 10:42:06.403478	2020-12-03 10:42:06.403478
450	59	2020-11-01	2020-11-30	9	1	0	10	2020-12-03 10:42:06.44711	2020-12-03 10:42:06.44711
451	53	2020-11-01	2020-11-30	1	1	2	0	2020-12-03 10:42:06.500522	2020-12-03 10:42:06.500522
452	68	2020-11-01	2020-11-30	8.5	1	0	9.5	2020-12-03 10:42:06.546215	2020-12-03 10:42:06.546215
453	54	2020-11-01	2020-11-30	19.5	1	2	18.5	2020-12-03 10:42:06.606844	2020-12-03 10:42:06.606844
454	13	2020-11-01	2020-11-30	0	1	0	1	2020-12-03 10:42:06.649844	2020-12-03 10:42:06.649844
455	65	2020-11-01	2020-11-30	3.5	1	0	4.5	2020-12-03 10:42:06.695541	2020-12-03 10:42:06.695541
456	16	2020-11-01	2020-11-30	8	1	2	7	2020-12-03 10:42:06.749346	2020-12-03 10:42:06.749346
457	58	2020-11-01	2020-11-30	3	1	0	4	2020-12-03 10:42:06.794805	2020-12-03 10:42:06.794805
458	15	2020-11-01	2020-11-30	10.5	1	4	7.5	2020-12-03 10:42:06.844016	2020-12-03 10:42:06.844016
459	61	2020-11-01	2020-11-30	6.5	1	0.5	7	2020-12-03 10:42:06.894204	2020-12-03 10:42:06.894204
460	69	2020-11-01	2020-11-30	3.5	1	1	3.5	2020-12-03 10:42:06.940326	2020-12-03 10:42:06.940326
446	64	2020-11-01	2020-11-30	4	1	3	2	2020-12-03 10:42:06.251306	2021-02-01 13:19:48.579501
442	57	2020-11-01	2020-11-30	6.5	1	0.5	7	2020-12-03 10:42:06.028499	2021-02-01 13:15:55.593799
588	66	2020-12-01	2020-12-31	12.5	1	2	11.5	2021-02-02 07:08:48.32527	2021-02-02 07:08:48.32527
589	63	2020-12-01	2020-12-31	7.5	1	1	7.5	2021-02-02 07:08:48.446736	2021-02-02 07:08:48.446736
590	59	2020-12-01	2020-12-31	10	1	0	11	2021-02-02 07:08:48.5026	2021-02-02 07:08:48.5026
591	67	2020-12-01	2020-12-31	0	4	20	-16	2021-02-02 07:08:48.57837	2021-02-02 07:08:48.57837
592	65	2020-12-01	2020-12-31	4.5	1	2.5	3	2021-02-02 07:08:48.64984	2021-02-02 07:08:48.64984
593	57	2020-12-01	2020-12-31	7	1	2.5	5.5	2021-02-02 07:08:49.027559	2021-02-02 07:08:49.027559
594	13	2020-12-01	2020-12-31	1	1	3	-1	2021-02-02 07:08:49.091506	2021-02-02 07:08:49.091506
595	53	2020-12-01	2020-12-31	0	1	31	-30	2021-02-02 07:08:49.170793	2021-02-02 07:08:49.170793
596	55	2020-12-01	2020-12-31	6.5	1	1	6.5	2021-02-02 07:08:49.248692	2021-02-02 07:08:49.248692
597	64	2020-12-01	2020-12-31	2	4	23	-17	2021-02-02 07:08:49.297104	2021-02-02 07:08:49.297104
598	51	2020-12-01	2020-12-31	26	1	0	27	2021-02-02 07:08:49.349404	2021-02-02 07:08:49.349404
599	54	2020-12-01	2020-12-31	18.5	1	1	18.5	2021-02-02 07:08:49.430179	2021-02-02 07:08:49.430179
600	52	2020-12-01	2020-12-31	7	1	0.5	7.5	2021-02-02 07:08:49.500559	2021-02-02 07:08:49.500559
601	16	2020-12-01	2020-12-31	7	1	3.5	4.5	2021-02-02 07:08:49.599613	2021-02-02 07:08:49.599613
602	60	2020-12-01	2020-12-31	15	1	1	15	2021-02-02 07:08:49.669746	2021-02-02 07:08:49.669746
603	58	2020-12-01	2020-12-31	4	1	0.5	4.5	2021-02-02 07:08:49.734104	2021-02-02 07:08:49.734104
604	69	2020-12-01	2020-12-31	3.5	1	3.5	1	2021-02-02 07:08:49.830462	2021-02-02 07:08:49.830462
605	61	2020-12-01	2020-12-31	7	1	0	8	2021-02-02 07:08:49.86868	2021-02-02 07:08:49.86868
606	17	2020-12-01	2020-12-31	6	1	5	2	2021-02-02 07:08:49.965746	2021-02-02 07:08:49.965746
607	15	2020-12-01	2020-12-31	7.5	1	1	7.5	2021-02-02 07:08:50.15037	2021-02-02 07:08:50.15037
608	68	2020-12-01	2020-12-31	9.5	1	6	4.5	2021-02-02 07:08:50.4217	2021-02-02 07:08:50.4217
631	66	2021-06-01	2021-06-30	0	1	0	1	2021-07-01 10:53:20.72314	2021-07-01 10:53:20.72314
632	63	2021-06-01	2021-06-30	0	1	0	1	2021-07-01 10:53:22.158253	2021-07-01 10:53:22.158253
633	59	2021-06-01	2021-06-30	0	1	0	1	2021-07-01 10:53:23.031127	2021-07-01 10:53:23.031127
634	67	2021-06-01	2021-06-30	0	1	30	-29	2021-07-01 10:53:24.02048	2021-07-01 10:53:24.02048
635	64	2021-06-01	2021-06-30	0	1	0	1	2021-07-01 10:53:25.415702	2021-07-01 10:53:25.415702
636	57	2021-06-01	2021-06-30	0	1	0	1	2021-07-01 10:53:26.218561	2021-07-01 10:53:26.218561
637	53	2021-06-01	2021-06-30	0	1	30	-29	2021-07-01 10:53:27.696625	2021-07-01 10:53:27.696625
638	52	2021-06-01	2021-06-30	0	1	0	1	2021-07-01 10:53:28.029872	2021-07-01 10:53:28.029872
639	55	2021-06-01	2021-06-30	0	1	0	1	2021-07-01 10:53:28.414296	2021-07-01 10:53:28.414296
640	51	2021-06-01	2021-06-30	0	1	0	1	2021-07-01 10:53:28.675269	2021-07-01 10:53:28.675269
641	54	2021-06-01	2021-06-30	0	1	0	1	2021-07-01 10:53:29.115205	2021-07-01 10:53:29.115205
642	65	2021-06-01	2021-06-30	0	1	0	1	2021-07-01 10:53:29.343241	2021-07-01 10:53:29.343241
643	16	2021-06-01	2021-06-30	0	1	0	1	2021-07-01 10:53:29.714297	2021-07-01 10:53:29.714297
644	13	2021-06-01	2021-06-30	0	1	0	1	2021-07-01 10:53:30.068086	2021-07-01 10:53:30.068086
645	15	2021-06-01	2021-06-30	0	1	0	1	2021-07-01 10:53:30.314334	2021-07-01 10:53:30.314334
646	58	2021-06-01	2021-06-30	0	1	0	1	2021-07-01 10:53:30.570459	2021-07-01 10:53:30.570459
647	17	2021-06-01	2021-06-30	0	1	0	1	2021-07-01 10:53:30.845074	2021-07-01 10:53:30.845074
648	68	2021-06-01	2021-06-30	0	1	0	1	2021-07-01 10:53:31.170681	2021-07-01 10:53:31.170681
649	61	2021-06-01	2021-06-30	0	1	0	1	2021-07-01 10:53:31.50072	2021-07-01 10:53:31.50072
650	69	2021-06-01	2021-06-30	0	1	0	1	2021-07-01 10:53:31.806109	2021-07-01 10:53:31.806109
651	60	2021-06-01	2021-06-30	0	1	0	1	2021-07-01 10:53:32.07782	2021-07-01 10:53:32.07782
652	66	2022-06-01	2022-06-30	0	1	0	1	2022-07-22 05:59:46.562834	2022-07-22 05:59:46.562834
653	63	2022-06-01	2022-06-30	0	1	0	1	2022-07-22 05:59:46.746346	2022-07-22 05:59:46.746346
654	59	2022-06-01	2022-06-30	0	1	0	1	2022-07-22 05:59:46.838006	2022-07-22 05:59:46.838006
655	53	2022-06-01	2022-06-30	0	1	0	1	2022-07-22 05:59:46.958771	2022-07-22 05:59:46.958771
656	64	2022-06-01	2022-06-30	0	1	0	1	2022-07-22 05:59:47.04637	2022-07-22 05:59:47.04637
657	57	2022-06-01	2022-06-30	0	1	0	1	2022-07-22 05:59:47.169106	2022-07-22 05:59:47.169106
658	52	2022-06-01	2022-06-30	0	1	0	1	2022-07-22 05:59:47.264736	2022-07-22 05:59:47.264736
659	55	2022-06-01	2022-06-30	0	1	0	1	2022-07-22 05:59:47.371985	2022-07-22 05:59:47.371985
660	67	2022-06-01	2022-06-30	0	1	0	1	2022-07-22 05:59:47.460525	2022-07-22 05:59:47.460525
661	51	2022-06-01	2022-06-30	0	1	0	1	2022-07-22 05:59:47.52956	2022-07-22 05:59:47.52956
662	54	2022-06-01	2022-06-30	0	1	0	1	2022-07-22 05:59:47.605714	2022-07-22 05:59:47.605714
663	65	2022-06-01	2022-06-30	0	1	0	1	2022-07-22 05:59:47.663515	2022-07-22 05:59:47.663515
664	16	2022-06-01	2022-06-30	0	1	0	1	2022-07-22 05:59:47.743012	2022-07-22 05:59:47.743012
665	13	2022-06-01	2022-06-30	0	1	0	1	2022-07-22 05:59:47.799303	2022-07-22 05:59:47.799303
666	68	2022-06-01	2022-06-30	0	1	0	1	2022-07-22 05:59:47.871757	2022-07-22 05:59:47.871757
667	61	2022-06-01	2022-06-30	0	1	0	1	2022-07-22 05:59:47.948315	2022-07-22 05:59:47.948315
668	15	2022-06-01	2022-06-30	0	1	0	1	2022-07-22 05:59:48.038419	2022-07-22 05:59:48.038419
669	69	2022-06-01	2022-06-30	0	1	0	1	2022-07-22 05:59:48.121944	2022-07-22 05:59:48.121944
670	58	2022-06-01	2022-06-30	0	1	0	1	2022-07-22 05:59:48.205805	2022-07-22 05:59:48.205805
671	60	2022-06-01	2022-06-30	0	1	0	1	2022-07-22 05:59:48.291667	2022-07-22 05:59:48.291667
672	17	2022-06-01	2022-06-30	0	1	0	1	2022-07-22 05:59:48.366517	2022-07-22 05:59:48.366517
\.


--
-- Data for Name: leaves; Type: TABLE DATA; Schema: public; Owner: tps
--

COPY public.leaves (id, leave_type, user_id, leave_date, approved_by_id, created_at, updated_at, end_date, color, status) FROM stdin;
106	full day	14	2019-06-05 00:00:00	16	2019-12-16 09:28:31.619091	2019-12-16 09:28:31.619091	2019-06-06	#0000FF	approved
107	full day	14	2019-07-22 00:00:00	16	2019-12-16 09:30:03.273782	2019-12-16 09:30:03.273782	2019-07-22	#0000FF	approved
108	full day	14	2019-09-06 00:00:00	16	2019-12-16 09:31:10.633027	2019-12-16 09:31:10.633027	2019-09-06	#0000FF	approved
109	second half	14	2019-10-24 00:00:00	16	2019-12-16 09:32:01.215431	2019-12-16 09:32:01.215431	2019-10-24	#000000	approved
110	full day	14	2019-10-30 00:00:00	16	2019-12-16 09:32:14.244675	2019-12-16 09:32:14.244675	2019-10-30	#0000FF	approved
111	full day	14	2019-11-07 00:00:00	16	2019-12-16 09:33:17.249643	2019-12-16 09:33:17.249643	2019-11-08	#0000FF	approved
112	full day	13	2019-05-30 00:00:00	18	2019-12-16 09:43:07.606422	2019-12-16 09:43:07.606422	2019-05-30	#0000FF	approved
113	second half	13	2019-06-24 00:00:00	18	2019-12-16 09:43:46.572344	2019-12-16 09:43:46.572344	2019-06-24	#000000	approved
114	full day	13	2019-07-09 00:00:00	18	2019-12-16 09:44:30.04012	2019-12-16 09:44:30.04012	2019-07-09	#0000FF	approved
115	full day	13	2019-07-26 00:00:00	18	2019-12-16 09:44:43.426031	2019-12-16 09:44:43.426031	2019-07-26	#0000FF	approved
116	full day	13	2019-09-20 00:00:00	18	2019-12-16 09:45:40.611311	2019-12-16 09:45:40.611311	2019-09-20	#0000FF	approved
117	second half	13	2019-10-09 00:00:00	18	2019-12-16 09:46:32.938765	2019-12-16 09:46:32.938765	2019-10-09	#000000	approved
118	full day	13	2019-10-21 00:00:00	18	2019-12-16 09:46:55.709761	2019-12-16 09:46:55.709761	2019-10-21	#0000FF	approved
119	full day	13	2019-10-30 00:00:00	18	2019-12-16 09:47:20.098888	2019-12-16 09:47:20.098888	2019-10-30	#0000FF	approved
120	second half	13	2019-11-29 00:00:00	18	2019-12-16 09:49:13.825383	2019-12-16 09:49:13.825383	2019-11-29	#000000	approved
121	wfh	61	2019-04-12 00:00:00	54	2019-12-17 09:19:27.524569	2019-12-17 09:19:27.524569	2019-04-12	#008000	approved
127	wfh	61	2019-08-01 00:00:00	54	2019-12-17 09:25:57.282147	2019-12-17 09:25:57.282147	2019-08-01	#008000	approved
129	wfh	61	2019-08-26 00:00:00	54	2019-12-17 09:26:55.651447	2019-12-17 09:26:55.651447	2019-08-26	#008000	approved
130	full day	61	2019-04-30 00:00:00	54	2019-12-17 09:32:22.624231	2019-12-17 09:32:22.624231	2019-04-30	#0000FF	approved
131	full day	61	2019-05-23 00:00:00	54	2019-12-17 09:33:21.406951	2019-12-17 09:33:21.406951	2019-05-29	#0000FF	approved
132	full day	61	2019-06-12 00:00:00	54	2019-12-17 09:34:41.70914	2019-12-17 09:34:41.70914	2019-06-12	#0000FF	approved
133	full day	61	2019-07-04 00:00:00	54	2019-12-17 09:35:33.242492	2019-12-17 09:35:33.242492	2019-07-04	#0000FF	approved
134	full day	61	2019-07-29 00:00:00	54	2019-12-17 09:36:05.384054	2019-12-17 09:36:05.384054	2019-07-29	#0000FF	approved
135	full day	61	2019-08-19 00:00:00	54	2019-12-17 09:37:37.40981	2019-12-17 09:37:37.40981	2019-08-20	#0000FF	approved
136	full day	55	2019-04-04 00:00:00	54	2019-12-17 09:40:25.586838	2019-12-17 09:40:25.586838	2019-04-04	#0000FF	approved
137	first half	55	2019-05-28 00:00:00	54	2019-12-17 09:40:57.52106	2019-12-17 09:40:57.52106	2019-05-28	#000000	approved
138	full day	55	2019-07-16 00:00:00	54	2019-12-17 09:41:49.281196	2019-12-17 09:41:49.281196	2019-07-16	#0000FF	approved
139	first half	55	2019-07-19 00:00:00	54	2019-12-17 09:42:09.701294	2019-12-17 09:42:09.701294	2019-07-19	#000000	approved
140	first half	55	2019-08-01 00:00:00	54	2019-12-17 09:43:02.79453	2019-12-17 09:43:02.79453	2019-08-01	#000000	approved
141	second half	55	2019-08-16 00:00:00	54	2019-12-17 09:43:19.537714	2019-12-17 09:43:19.537714	2019-08-16	#000000	approved
142	full day	55	2019-11-01 00:00:00	54	2019-12-17 09:44:55.811211	2019-12-17 09:44:55.811211	2019-11-01	#0000FF	approved
143	second half	55	2019-11-11 00:00:00	54	2019-12-17 09:46:21.863876	2019-12-17 09:46:21.863876	2019-11-11	#000000	approved
144	full day	60	2019-11-26 00:00:00	54	2019-12-17 09:50:23.310189	2019-12-17 09:50:23.310189	2019-11-26	#0000FF	approved
145	second half	66	2019-04-09 00:00:00	51	2019-12-17 09:52:20.887233	2019-12-17 09:52:20.887233	2019-04-09	#000000	approved
146	full day	66	2019-06-04 00:00:00	51	2019-12-17 09:52:59.944997	2019-12-17 09:52:59.944997	2019-06-04	#0000FF	approved
147	full day	66	2019-09-02 00:00:00	51	2019-12-17 09:54:01.077774	2019-12-17 09:54:01.077774	2019-09-03	#0000FF	approved
148	full day	66	2019-11-26 00:00:00	51	2019-12-17 09:55:16.594532	2019-12-17 09:55:16.594532	2019-11-29	#0000FF	approved
149	full day	54	2019-05-02 00:00:00	18	2019-12-17 09:57:12.818844	2019-12-17 09:57:12.818844	2019-05-02	#0000FF	approved
150	full day	54	2019-05-23 00:00:00	18	2019-12-17 09:57:25.796758	2019-12-17 09:57:25.796758	2019-05-23	#0000FF	approved
151	full day	54	2019-07-29 00:00:00	18	2019-12-17 09:58:39.677793	2019-12-17 09:58:39.677793	2019-07-29	#0000FF	approved
152	full day	54	2019-08-21 00:00:00	18	2019-12-17 09:59:13.427933	2019-12-17 09:59:13.427933	2019-08-21	#0000FF	approved
153	full day	54	2019-10-30 00:00:00	18	2019-12-17 09:59:50.648189	2019-12-17 09:59:50.648189	2019-10-30	#0000FF	approved
154	full day	59	2019-04-11 00:00:00	51	2019-12-17 10:10:49.449266	2019-12-17 10:10:49.449266	2019-04-16	#0000FF	approved
155	full day	59	2019-04-30 00:00:00	51	2019-12-17 10:12:43.53507	2019-12-17 10:12:43.53507	2019-04-30	#0000FF	approved
156	full day	59	2019-06-06 00:00:00	51	2019-12-17 10:13:30.514647	2019-12-17 10:13:30.514647	2019-06-07	#0000FF	approved
157	wfh	59	2019-06-11 00:00:00	51	2019-12-17 10:14:03.257138	2019-12-17 10:14:03.257138	2019-06-11	#008000	approved
158	wfh	59	2019-07-29 00:00:00	51	2019-12-17 10:15:23.508919	2019-12-17 10:15:23.508919	2019-07-31	#008000	approved
159	wfh	59	2019-08-09 00:00:00	51	2019-12-17 10:15:56.379012	2019-12-17 10:15:56.379012	2019-08-09	#008000	approved
160	wfh	59	2019-08-20 00:00:00	51	2019-12-17 10:16:25.711875	2019-12-17 10:16:25.711875	2019-08-20	#008000	approved
161	full day	59	2019-08-21 00:00:00	51	2019-12-17 10:16:39.592829	2019-12-17 10:16:39.592829	2019-08-21	#0000FF	approved
162	wfh	59	2019-08-22 00:00:00	51	2019-12-17 10:17:07.847036	2019-12-17 10:17:07.847036	2019-08-23	#008000	approved
75	full day	15	2019-07-08 00:00:00	16	2019-12-13 10:37:02.969359	2019-12-13 10:37:02.969359	2019-07-09	#0000FF	approved
76	first half	15	2019-08-07 00:00:00	16	2019-12-13 10:37:51.236429	2019-12-13 10:37:51.236429	2019-08-07	#000000	approved
77	second half	15	2019-09-02 00:00:00	16	2019-12-13 10:38:12.386503	2019-12-13 10:38:12.386503	2019-09-02	#000000	approved
78	full day	15	2019-10-30 00:00:00	16	2019-12-13 10:38:44.074924	2019-12-13 10:38:44.074924	2019-10-31	#0000FF	approved
79	full day	15	2019-11-18 00:00:00	16	2019-12-13 10:39:10.893189	2019-12-13 10:39:10.893189	2019-11-18	#0000FF	approved
80	full day	17	2019-04-17 00:00:00	16	2019-12-13 10:40:56.844915	2019-12-13 10:40:56.844915	2019-04-17	#0000FF	approved
81	full day	17	2019-05-07 00:00:00	16	2019-12-13 10:41:17.619903	2019-12-13 10:41:17.619903	2019-05-07	#0000FF	approved
82	full day	17	2019-05-17 00:00:00	16	2019-12-13 10:41:38.902103	2019-12-13 10:41:38.902103	2019-05-17	#0000FF	approved
83	full day	17	2019-05-20 00:00:00	16	2019-12-13 10:41:56.865	2019-12-13 10:41:56.865	2019-05-20	#0000FF	approved
84	full day	17	2019-07-15 00:00:00	16	2019-12-13 10:42:39.544403	2019-12-13 10:42:39.544403	2019-07-16	#0000FF	approved
85	second half	17	2019-07-19 00:00:00	16	2019-12-13 10:42:57.05293	2019-12-13 10:42:57.05293	2019-07-19	#000000	approved
86	second half	17	2019-08-21 00:00:00	16	2019-12-13 10:43:17.147407	2019-12-13 10:43:17.147407	2019-08-21	#000000	approved
87	full day	17	2019-08-23 00:00:00	16	2019-12-13 10:43:32.987461	2019-12-13 10:43:32.987461	2019-08-23	#0000FF	approved
88	full day	17	2019-09-20 00:00:00	16	2019-12-13 10:43:53.461746	2019-12-13 10:43:53.461746	2019-09-20	#0000FF	approved
89	full day	17	2019-10-30 00:00:00	16	2019-12-13 10:44:17.050507	2019-12-13 10:44:17.050507	2019-10-31	#0000FF	approved
163	wfh	59	2019-08-27 00:00:00	51	2019-12-17 10:17:39.043038	2019-12-17 10:17:39.043038	2019-08-27	#008000	approved
165	full day	59	2019-10-30 00:00:00	51	2019-12-17 10:18:55.807237	2019-12-17 10:18:55.807237	2019-10-31	#0000FF	approved
164	wfh	59	2019-09-10 00:00:00	51	2019-12-17 10:18:26.81819	2019-12-17 10:18:26.81819	2019-09-10	#008000	approved
166	full day	59	2019-11-01 00:00:00	51	2019-12-17 10:30:26.330287	2019-12-17 10:30:26.330287	2019-11-01	#0000FF	approved
167	full day	67	2019-05-15 00:00:00	51	2019-12-17 10:33:15.769307	2019-12-17 10:33:15.769307	2019-05-16	#0000FF	approved
168	full day	67	2019-06-10 00:00:00	51	2019-12-17 10:33:57.778757	2019-12-17 10:33:57.778757	2019-06-10	#0000FF	approved
169	full day	67	2019-09-02 00:00:00	51	2019-12-17 10:34:39.118298	2019-12-17 10:34:39.118298	2019-09-02	#0000FF	approved
170	second half	67	2019-10-14 00:00:00	51	2019-12-17 10:35:41.186801	2019-12-17 10:35:41.186801	2019-10-14	#000000	approved
171	full day	67	2019-10-30 00:00:00	51	2019-12-17 10:36:02.700476	2019-12-17 10:36:02.700476	2019-10-31	#0000FF	approved
172	second half	67	2019-11-14 00:00:00	51	2019-12-17 10:44:45.029327	2019-12-17 10:44:45.029327	2019-11-15	#000000	approved
173	wfh	67	2019-11-15 00:00:00	51	2019-12-17 10:45:01.276076	2019-12-17 10:45:01.276076	2019-11-15	#008000	approved
174	full day	51	2019-04-17 00:00:00	18	2019-12-17 10:46:30.606783	2019-12-17 10:46:30.606783	2019-04-17	#0000FF	approved
175	full day	51	2019-05-09 00:00:00	18	2019-12-17 10:47:06.809369	2019-12-17 10:47:06.809369	2019-05-09	#0000FF	approved
176	second half	51	2019-11-13 00:00:00	18	2019-12-17 10:51:12.611761	2019-12-17 10:51:12.611761	2019-11-13	#000000	approved
177	full day	51	2019-11-19 00:00:00	18	2019-12-17 10:51:30.301196	2019-12-17 10:51:30.301196	2019-11-19	#0000FF	approved
178	full day	53	2019-10-11 00:00:00	52	2019-12-17 10:53:52.437159	2019-12-17 10:53:52.437159	2019-10-11	#0000FF	approved
179	full day	53	2019-10-21 00:00:00	52	2019-12-17 10:54:05.734366	2019-12-17 10:54:05.734366	2019-10-21	#0000FF	approved
180	second half	58	2019-04-09 00:00:00	54	2019-12-17 10:57:24.307866	2019-12-17 10:57:24.307866	2019-04-09	#000000	approved
181	wfh	58	2019-04-12 00:00:00	54	2019-12-17 10:57:43.396632	2019-12-17 10:57:43.396632	2019-04-12	#008000	approved
182	wfh	58	2019-04-23 00:00:00	54	2019-12-17 10:58:01.528346	2019-12-17 10:58:01.528346	2019-04-24	#008000	approved
183	full day	58	2019-07-04 00:00:00	54	2019-12-17 10:59:52.540811	2019-12-17 10:59:52.540811	2019-07-04	#0000FF	approved
184	second half	58	2019-07-08 00:00:00	54	2019-12-17 11:00:15.687415	2019-12-17 11:00:15.687415	2019-07-08	#000000	approved
185	full day	58	2019-08-01 00:00:00	54	2019-12-17 11:01:00.524534	2019-12-17 11:01:00.524534	2019-08-01	#0000FF	approved
186	wfh	58	2019-08-05 00:00:00	54	2019-12-17 11:01:15.794664	2019-12-17 11:01:15.794664	2019-08-05	#008000	approved
187	wfh	58	2019-08-27 00:00:00	54	2019-12-17 11:01:34.171212	2019-12-17 11:01:34.171212	2019-08-27	#008000	approved
188	full day	58	2019-09-03 00:00:00	54	2019-12-17 11:02:24.965601	2019-12-17 11:02:24.965601	2019-09-03	#0000FF	approved
189	wfh	58	2019-09-23 00:00:00	54	2019-12-17 11:02:43.23438	2019-12-17 11:02:43.23438	2019-09-23	#008000	approved
190	second half	58	2019-10-18 00:00:00	54	2019-12-17 11:03:40.679454	2019-12-17 11:03:40.679454	2019-10-18	#000000	approved
191	full day	58	2019-10-30 00:00:00	54	2019-12-17 11:04:00.534822	2019-12-17 11:04:00.534822	2019-10-30	#0000FF	approved
192	wfh	58	2019-10-31 00:00:00	54	2019-12-17 11:04:16.154538	2019-12-17 11:04:16.154538	2019-10-31	#008000	approved
193	full day	58	2019-11-04 00:00:00	54	2019-12-17 11:05:02.629971	2019-12-17 11:05:02.629971	2019-11-04	#0000FF	approved
194	wfh	58	2019-11-19 00:00:00	54	2019-12-17 11:05:18.553663	2019-12-17 11:05:18.553663	2019-11-19	#008000	approved
195	full day	65	2019-04-30 00:00:00	51	2019-12-17 11:06:54.433512	2019-12-17 11:06:54.433512	2019-04-30	#0000FF	approved
196	second half	65	2019-05-15 00:00:00	51	2019-12-17 11:07:24.711046	2019-12-17 11:07:24.711046	2019-05-15	#000000	approved
197	second half	65	2019-05-23 00:00:00	51	2019-12-17 11:07:50.463217	2019-12-17 11:07:50.463217	2019-05-24	#000000	approved
198	full day	65	2019-05-29 00:00:00	51	2019-12-17 11:08:04.649375	2019-12-17 11:08:04.649375	2019-05-29	#0000FF	approved
199	full day	65	2019-06-13 00:00:00	51	2019-12-17 11:08:39.472148	2019-12-17 11:08:39.472148	2019-06-13	#0000FF	approved
200	second half	65	2019-08-09 00:00:00	51	2019-12-17 11:09:06.759004	2019-12-17 11:09:06.759004	2019-08-09	#000000	approved
201	full day	65	2019-09-02 00:00:00	51	2019-12-17 11:09:45.40413	2019-12-17 11:09:45.40413	2019-09-02	#0000FF	approved
202	wfh	65	2019-09-06 00:00:00	51	2019-12-17 11:10:01.512663	2019-12-17 11:10:01.512663	2019-09-06	#008000	approved
203	full day	65	2019-09-20 00:00:00	51	2019-12-17 11:10:25.391973	2019-12-17 11:10:25.391973	2019-09-20	#0000FF	approved
204	full day	65	2019-10-30 00:00:00	51	2019-12-17 11:10:59.591781	2019-12-17 11:10:59.591781	2019-10-31	#0000FF	approved
205	second half	65	2019-11-29 00:00:00	51	2019-12-17 11:11:42.969386	2019-12-17 11:11:42.969386	2019-11-29	#000000	approved
206	second half	68	2019-11-14 00:00:00	18	2019-12-17 11:13:29.265057	2019-12-17 11:13:29.265057	2019-11-14	#000000	approved
207	second half	68	2019-11-28 00:00:00	18	2019-12-17 11:13:44.738011	2019-12-17 11:13:44.738011	2019-11-28	#000000	approved
208	second half	52	2019-04-02 00:00:00	18	2019-12-17 11:14:59.335292	2019-12-17 11:14:59.335292	2019-04-02	#000000	approved
209	full day	52	2019-06-26 00:00:00	18	2019-12-17 11:16:05.816375	2019-12-17 11:16:05.816375	2019-06-26	#0000FF	approved
210	full day	52	2019-09-03 00:00:00	18	2019-12-17 11:16:37.330042	2019-12-17 11:16:37.330042	2019-09-03	#0000FF	approved
211	full day	52	2019-10-11 00:00:00	18	2019-12-17 11:17:20.892521	2019-12-17 11:17:20.892521	2019-10-15	#0000FF	approved
212	full day	52	2019-10-30 00:00:00	18	2019-12-17 11:17:35.80169	2019-12-17 11:17:35.80169	2019-10-30	#0000FF	approved
214	full day	57	2019-04-19 00:00:00	18	2019-12-17 11:27:55.825439	2019-12-17 11:27:55.825439	2019-04-19	#0000FF	approved
215	wfh	57	2019-06-10 00:00:00	18	2019-12-17 11:29:08.476537	2019-12-17 11:29:08.476537	2019-06-10	#008000	approved
218	full day	57	2019-06-11 00:00:00	18	2019-12-17 12:17:13.808209	2019-12-17 12:17:13.808209	2019-06-14	#0000FF	approved
219	full day	57	2019-07-22 00:00:00	18	2019-12-17 12:20:05.526162	2019-12-17 12:20:05.526162	2019-07-22	#0000FF	approved
220	wfh	57	2019-08-02 00:00:00	18	2019-12-17 12:20:50.723139	2019-12-17 12:20:50.723139	2019-08-02	#008000	approved
221	wfh	57	2019-08-16 00:00:00	18	2019-12-17 12:21:15.528138	2019-12-17 12:21:15.528138	2019-08-16	#008000	approved
222	second half	57	2019-08-19 00:00:00	18	2019-12-17 12:21:45.398413	2019-12-17 12:21:45.398413	2019-08-19	#000000	approved
223	wfh	57	2019-08-20 00:00:00	18	2019-12-17 12:22:53.501448	2019-12-17 12:22:53.501448	2019-08-21	#008000	approved
224	second half	57	2019-09-04 00:00:00	18	2019-12-17 12:23:53.476785	2019-12-17 12:23:53.476785	2019-09-04	#000000	approved
225	wfh	57	2019-09-10 00:00:00	18	2019-12-17 12:24:16.71795	2019-12-17 12:24:16.71795	2019-09-10	#008000	approved
226	full day	57	2019-09-20 00:00:00	18	2019-12-17 12:24:37.209604	2019-12-17 12:24:37.209604	2019-09-20	#0000FF	approved
227	wfh	57	2019-10-14 00:00:00	18	2019-12-17 12:25:15.311334	2019-12-17 12:25:15.311334	2019-10-14	#008000	approved
228	wfh	16	2019-04-10 00:00:00	18	2019-12-17 12:27:57.979213	2019-12-17 12:27:57.979213	2019-04-12	#008000	approved
229	full day	16	2019-04-18 00:00:00	18	2019-12-17 12:30:46.151359	2019-12-17 12:30:46.151359	2019-04-18	#0000FF	approved
230	wfh	16	2019-04-19 00:00:00	18	2019-12-17 12:31:02.742599	2019-12-17 12:31:02.742599	2019-04-19	#008000	approved
231	wfh	16	2019-04-30 00:00:00	18	2019-12-17 12:31:19.967408	2019-12-17 12:31:19.967408	2019-04-30	#008000	approved
232	wfh	16	2019-05-01 00:00:00	18	2019-12-17 12:31:39.70727	2019-12-17 12:31:39.70727	2019-05-01	#008000	approved
233	wfh	16	2019-05-08 00:00:00	18	2019-12-17 12:32:10.090144	2019-12-17 12:32:10.090144	2019-05-17	#008000	approved
234	full day	16	2019-05-24 00:00:00	18	2019-12-17 12:32:25.468047	2019-12-17 12:32:25.468047	2019-05-24	#0000FF	approved
235	wfh	16	2019-06-03 00:00:00	18	2019-12-17 12:33:53.010612	2019-12-17 12:33:53.010612	2019-06-05	#008000	approved
236	wfh	16	2019-06-10 00:00:00	18	2019-12-17 12:34:16.750629	2019-12-17 12:34:16.750629	2019-06-12	#008000	approved
237	wfh	16	2019-06-14 00:00:00	18	2019-12-17 12:34:37.475857	2019-12-17 12:34:37.475857	2019-06-14	#008000	approved
238	wfh	16	2019-06-20 00:00:00	18	2019-12-17 12:35:19.024532	2019-12-17 12:35:19.024532	2019-06-26	#008000	approved
239	wfh	16	2019-07-01 00:00:00	18	2019-12-17 12:37:34.979003	2019-12-17 12:37:34.979003	2019-07-03	#008000	approved
240	second half	16	2019-07-08 00:00:00	18	2019-12-17 12:37:58.765519	2019-12-17 12:37:58.765519	2019-07-09	#000000	approved
243	second half	16	2019-07-19 00:00:00	18	2019-12-17 12:38:49.069136	2019-12-17 12:38:49.069136	2019-07-19	#000000	approved
245	wfh	16	2019-07-29 00:00:00	18	2019-12-17 12:39:33.652816	2019-12-17 12:39:33.652816	2019-07-31	#008000	approved
247	wfh	16	2019-08-16 00:00:00	18	2019-12-17 12:40:54.197928	2019-12-17 12:40:54.197928	2019-08-19	#008000	approved
249	wfh	16	2019-09-03 00:00:00	18	2019-12-17 12:41:52.835544	2019-12-17 12:41:52.835544	2019-09-04	#008000	approved
251	wfh	16	2019-09-16 00:00:00	18	2019-12-17 12:42:46.816128	2019-12-17 12:42:46.816128	2019-09-17	#008000	approved
253	wfh	16	2019-10-21 00:00:00	18	2019-12-17 12:43:36.463978	2019-12-17 12:43:36.463978	2019-10-21	#008000	approved
241	wfh	16	2019-07-10 00:00:00	18	2019-12-17 12:38:11.517435	2019-12-17 12:38:11.517435	2019-07-10	#008000	approved
242	wfh	16	2019-07-15 00:00:00	18	2019-12-17 12:38:33.92507	2019-12-17 12:38:33.92507	2019-07-16	#008000	approved
244	wfh	16	2019-07-22 00:00:00	18	2019-12-17 12:39:08.974059	2019-12-17 12:39:08.974059	2019-07-24	#008000	approved
246	wfh	16	2019-08-12 00:00:00	18	2019-12-17 12:40:25.412289	2019-12-17 12:40:25.412289	2019-08-12	#008000	approved
248	wfh	16	2019-08-29 00:00:00	18	2019-12-17 12:41:20.727939	2019-12-17 12:41:20.727939	2019-08-29	#008000	approved
250	wfh	16	2019-09-09 00:00:00	18	2019-12-17 12:42:16.554655	2019-12-17 12:42:16.554655	2019-09-11	#008000	approved
252	wfh	16	2019-10-14 00:00:00	18	2019-12-17 12:43:10.682136	2019-12-17 12:43:10.682136	2019-10-16	#008000	approved
254	wfh	16	2019-10-23 00:00:00	18	2019-12-17 12:44:00.758049	2019-12-17 12:44:00.758049	2019-10-24	#008000	approved
255	full day	16	2019-10-30 00:00:00	18	2019-12-17 12:44:20.226261	2019-12-17 12:44:20.226261	2019-10-30	#0000FF	approved
256	full day	16	2019-11-01 00:00:00	18	2019-12-17 12:46:01.034672	2019-12-17 12:46:01.034672	2019-11-01	#0000FF	approved
257	wfh	16	2019-11-04 00:00:00	18	2019-12-17 12:46:18.75753	2019-12-17 12:46:18.75753	2019-11-05	#008000	approved
258	full day	16	2019-11-13 00:00:00	18	2019-12-17 12:47:27.877618	2019-12-17 12:47:27.877618	2019-11-13	#0000FF	approved
259	second half	16	2019-11-14 00:00:00	18	2019-12-17 12:47:45.892015	2019-12-17 12:47:45.892015	2019-11-14	#000000	approved
260	wfh	16	2019-11-18 00:00:00	18	2019-12-17 12:48:05.332402	2019-12-17 12:48:05.332402	2019-11-19	#008000	approved
261	full day	16	2019-11-20 00:00:00	18	2019-12-17 12:48:23.108602	2019-12-17 12:48:23.108602	2019-11-22	#0000FF	approved
262	wfh	16	2019-11-25 00:00:00	18	2019-12-17 12:52:47.937577	2019-12-17 12:52:47.937577	2019-11-25	#008000	approved
263	wfh	16	2019-11-27 00:00:00	18	2019-12-17 12:53:16.371381	2019-12-17 12:53:16.371381	2019-12-03	#008000	approved
264	wfh	63	2019-04-09 00:00:00	54	2019-12-17 12:55:35.230768	2019-12-17 12:55:35.230768	2019-04-12	#008000	approved
265	wfh	63	2019-04-16 00:00:00	54	2019-12-17 12:56:00.542013	2019-12-17 12:56:00.542013	2019-04-18	#008000	approved
266	wfh	63	2019-04-23 00:00:00	54	2019-12-17 12:56:15.726517	2019-12-17 12:56:15.726517	2019-04-23	#008000	approved
268	wfh	63	2019-04-30 00:00:00	54	2019-12-17 12:57:27.038835	2019-12-17 12:57:27.038835	2019-05-02	#008000	approved
269	wfh	63	2019-05-07 00:00:00	54	2019-12-17 12:57:52.309664	2019-12-17 12:57:52.309664	2019-05-09	#008000	approved
270	second half	63	2019-05-15 00:00:00	54	2019-12-17 12:59:39.306629	2019-12-17 12:59:39.306629	2019-05-15	#000000	approved
271	wfh	63	2019-05-16 00:00:00	54	2019-12-17 13:00:57.952412	2019-12-17 13:00:57.952412	2019-05-16	#008000	approved
273	second half	63	2019-05-17 00:00:00	54	2019-12-17 13:01:51.529269	2019-12-17 13:01:51.529269	2019-05-17	#000000	approved
274	full day	63	2019-05-30 00:00:00	54	2019-12-17 13:02:16.182914	2019-12-17 13:02:16.182914	2019-05-31	#0000FF	approved
275	second half	63	2019-04-25 00:00:00	54	2019-12-17 13:13:26.191298	2019-12-17 13:13:26.191298	2019-04-25	#000000	approved
276	full day	63	2019-06-28 00:00:00	54	2019-12-17 13:15:58.605774	2019-12-17 13:15:58.605774	2019-06-28	#0000FF	approved
277	wfh	63	2019-07-03 00:00:00	54	2019-12-17 13:16:25.595351	2019-12-17 13:16:25.595351	2019-07-04	#008000	approved
278	full day	63	2019-07-30 00:00:00	54	2019-12-17 13:16:40.330252	2019-12-17 13:16:40.330252	2019-07-30	#0000FF	approved
279	wfh	63	2019-08-01 00:00:00	54	2019-12-17 13:17:29.526945	2019-12-17 13:17:29.526945	2019-08-01	#008000	approved
280	wfh	63	2019-08-08 00:00:00	54	2019-12-17 13:17:49.457543	2019-12-17 13:17:49.457543	2019-08-08	#008000	approved
281	wfh	63	2019-08-16 00:00:00	54	2019-12-17 13:18:19.76631	2019-12-17 13:18:19.76631	2019-08-16	#008000	approved
282	wfh	63	2019-08-21 00:00:00	54	2019-12-17 13:18:38.053909	2019-12-17 13:18:38.053909	2019-08-21	#008000	approved
283	wfh	63	2019-08-27 00:00:00	54	2019-12-17 13:18:57.680891	2019-12-17 13:18:57.680891	2019-08-27	#008000	approved
284	wfh	63	2019-09-02 00:00:00	54	2019-12-17 13:19:18.288711	2019-12-17 13:19:18.288711	2019-09-02	#008000	approved
285	second half	63	2019-09-03 00:00:00	54	2019-12-17 13:19:53.883051	2019-12-17 13:19:53.883051	2019-09-03	#000000	approved
286	wfh	63	2019-09-10 00:00:00	54	2019-12-17 13:20:42.858533	2019-12-17 13:20:42.858533	2019-09-10	#008000	approved
287	wfh	63	2019-09-13 00:00:00	54	2019-12-17 13:20:57.392692	2019-12-17 13:20:57.392692	2019-09-13	#008000	approved
288	full day	63	2019-10-24 00:00:00	54	2019-12-17 13:25:34.233467	2019-12-17 13:25:34.233467	2019-10-25	#0000FF	approved
289	wfh	63	2019-10-30 00:00:00	54	2019-12-17 13:26:15.011531	2019-12-17 13:26:15.011531	2019-10-30	#008000	approved
290	second half	63	2019-10-31 00:00:00	54	2019-12-17 13:26:30.537116	2019-12-17 13:26:30.537116	2019-10-31	#000000	approved
291	full day	63	2019-11-01 00:00:00	54	2019-12-17 13:44:41.804368	2019-12-17 13:44:41.804368	2019-11-01	#0000FF	approved
292	wfh	63	2019-11-13 00:00:00	54	2019-12-17 13:45:02.176432	2019-12-17 13:45:02.176432	2019-11-13	#008000	approved
293	wfh	17	2019-04-08 00:00:00	18	2019-12-17 13:47:10.936052	2019-12-17 13:47:10.936052	2019-04-08	#008000	approved
294	wfh	17	2019-04-12 00:00:00	16	2019-12-17 13:47:35.439941	2019-12-17 13:47:35.439941	2019-04-15	#008000	approved
295	wfh	17	2019-05-08 00:00:00	16	2019-12-17 13:47:59.322512	2019-12-17 13:47:59.322512	2019-05-16	#008000	approved
296	wfh	17	2019-05-21 00:00:00	16	2019-12-17 13:48:16.889079	2019-12-17 13:48:16.889079	2019-05-21	#008000	approved
297	wfh	17	2019-07-17 00:00:00	16	2019-12-17 13:49:01.457859	2019-12-17 13:49:01.457859	2019-07-18	#008000	approved
298	wfh	17	2019-08-01 00:00:00	16	2019-12-17 13:49:21.199145	2019-12-17 13:49:21.199145	2019-08-01	#008000	approved
299	wfh	17	2019-08-09 00:00:00	16	2019-12-17 13:49:35.970932	2019-12-17 13:49:35.970932	2019-08-09	#008000	approved
300	wfh	17	2019-08-20 00:00:00	16	2019-12-17 13:49:51.859281	2019-12-17 13:49:51.859281	2019-08-20	#008000	approved
301	wfh	17	2019-08-22 00:00:00	16	2019-12-17 13:50:04.709529	2019-12-17 13:50:04.709529	2019-08-22	#008000	approved
302	wfh	17	2019-08-26 00:00:00	16	2019-12-17 13:50:23.651233	2019-12-17 13:50:23.651233	2019-08-27	#008000	approved
303	wfh	17	2019-09-10 00:00:00	16	2019-12-17 13:50:47.863259	2019-12-17 13:50:47.863259	2019-09-12	#008000	approved
304	wfh	17	2019-09-19 00:00:00	16	2019-12-17 13:51:00.824926	2019-12-17 13:51:00.824926	2019-09-19	#008000	approved
305	wfh	17	2019-11-01 00:00:00	16	2019-12-17 13:52:01.622282	2019-12-17 13:52:01.622282	2019-11-01	#008000	approved
306	wfh	17	2019-11-05 00:00:00	16	2019-12-17 13:52:31.931189	2019-12-17 13:52:31.931189	2019-11-13	#008000	approved
307	wfh	17	2019-11-18 00:00:00	16	2019-12-17 13:53:07.56052	2019-12-17 13:53:07.56052	2019-11-25	#008000	approved
308	wfh	17	2019-11-27 00:00:00	16	2019-12-17 13:53:54.126445	2019-12-17 13:53:54.126445	2019-11-29	#008000	approved
309	wfh	17	2019-12-02 00:00:00	16	2019-12-17 13:54:29.661393	2019-12-17 13:54:29.661393	2019-12-03	#008000	approved
310	wfh	17	2019-12-09 00:00:00	16	2019-12-17 13:54:55.242474	2019-12-17 13:54:55.242474	2019-12-11	#008000	approved
311	full day	62	2019-06-04 00:00:00	18	2019-12-17 13:56:43.013327	2019-12-17 13:56:43.013327	2019-06-07	#0000FF	approved
312	full day	62	2019-08-02 00:00:00	18	2019-12-17 13:57:58.060247	2019-12-17 13:57:58.060247	2019-08-02	#0000FF	approved
313	full day	62	2019-10-30 00:00:00	18	2019-12-17 13:58:21.803414	2019-12-17 13:58:21.803414	2019-10-31	#0000FF	approved
314	full day	62	2019-11-01 00:00:00	18	2019-12-17 13:58:42.269568	2019-12-17 13:58:42.269568	2019-11-01	#0000FF	approved
315	full day	56	2019-04-12 00:00:00	18	2019-12-17 14:00:09.355214	2019-12-17 14:00:09.355214	2019-04-12	#0000FF	approved
317	second half	56	2019-05-16 00:00:00	18	2019-12-17 14:00:45.499326	2019-12-17 14:00:45.499326	2019-05-16	#000000	approved
318	second half	56	2019-05-06 00:00:00	18	2019-12-17 14:01:47.399517	2019-12-17 14:01:47.399517	2019-05-06	#000000	approved
319	second half	56	2019-06-05 00:00:00	18	2019-12-17 14:02:48.110745	2019-12-17 14:02:48.110745	2019-06-05	#000000	approved
320	full day	56	2019-06-12 00:00:00	18	2019-12-17 14:03:01.394611	2019-12-17 14:03:01.394611	2019-06-12	#0000FF	approved
321	second half	56	2019-06-17 00:00:00	18	2019-12-17 14:03:17.883413	2019-12-17 14:03:17.883413	2019-06-17	#000000	approved
322	full day	56	2019-08-08 00:00:00	18	2019-12-17 14:05:09.034516	2019-12-17 14:05:09.034516	2019-08-08	#0000FF	approved
323	full day	56	2019-08-13 00:00:00	18	2019-12-17 14:05:21.016346	2019-12-17 14:05:21.016346	2019-08-13	#0000FF	approved
325	second half	56	2019-09-20 00:00:00	18	2019-12-17 14:06:32.964315	2019-12-17 14:06:32.964315	2019-09-20	#000000	approved
328	full day	56	2019-10-30 00:00:00	18	2019-12-17 14:08:08.212135	2019-12-17 14:08:08.212135	2019-10-30	#0000FF	approved
330	full day	56	2019-11-26 00:00:00	18	2019-12-17 14:09:07.553492	2019-12-17 14:09:07.553492	2019-11-26	#0000FF	approved
324	full day	56	2019-09-09 00:00:00	18	2019-12-17 14:06:19.737872	2019-12-17 14:06:19.737872	2019-09-09	#0000FF	approved
326	second half	56	2019-10-04 00:00:00	18	2019-12-17 14:07:40.2173	2019-12-17 14:07:40.2173	2019-10-04	#000000	approved
327	first half	56	2019-10-07 00:00:00	18	2019-12-17 14:07:55.048406	2019-12-17 14:07:55.048406	2019-10-07	#000000	approved
329	second half	56	2019-11-15 00:00:00	18	2019-12-17 14:08:56.062647	2019-12-17 14:08:56.062647	2019-11-15	#000000	approved
331	second half	64	2019-04-05 00:00:00	18	2019-12-17 14:17:29.916723	2019-12-17 14:17:29.916723	2019-04-05	#000000	approved
332	full day	64	2019-04-08 00:00:00	18	2019-12-17 14:17:44.030656	2019-12-17 14:17:44.030656	2019-04-08	#0000FF	approved
333	full day	64	2019-04-30 00:00:00	18	2019-12-17 14:17:55.95074	2019-12-17 14:17:55.95074	2019-04-30	#0000FF	approved
334	full day	64	2019-05-10 00:00:00	18	2019-12-17 14:19:05.546531	2019-12-17 14:19:05.546531	2019-05-10	#0000FF	approved
335	full day	64	2019-06-03 00:00:00	18	2019-12-17 14:19:24.069283	2019-12-17 14:19:24.069283	2019-06-07	#0000FF	approved
336	full day	64	2019-08-01 00:00:00	18	2019-12-17 14:20:25.22771	2019-12-17 14:20:25.22771	2019-08-08	#0000FF	approved
337	full day	64	2019-08-12 00:00:00	18	2019-12-17 14:20:42.201238	2019-12-17 14:20:42.201238	2019-08-14	#0000FF	approved
338	full day	64	2019-08-16 00:00:00	18	2019-12-17 14:20:54.075428	2019-12-17 14:20:54.075428	2019-08-16	#0000FF	approved
339	full day	64	2019-10-09 00:00:00	18	2019-12-17 14:25:11.461651	2019-12-17 14:25:11.461651	2019-10-30	#0000FF	approved
340	full day	64	2019-11-19 00:00:00	18	2019-12-17 14:27:44.703975	2019-12-17 14:27:44.703975	2019-11-19	#0000FF	approved
341	full day	64	2019-11-28 00:00:00	18	2019-12-17 14:28:00.14513	2019-12-17 14:28:00.14513	2019-11-28	#0000FF	approved
342	full day	57	2019-12-06 00:00:00	18	2019-12-19 10:19:55.550726	2019-12-19 10:19:55.550726	2019-12-06	#0000FF	approved
343	full day	66	2019-12-12 00:00:00	51	2019-12-19 10:20:10.34412	2019-12-19 10:20:10.34412	2019-12-12	#0000FF	approved
344	full day	54	2019-12-06 00:00:00	18	2019-12-19 10:23:31.91642	2019-12-19 10:23:31.91642	2019-12-06	#0000FF	approved
345	second half	54	2019-12-11 00:00:00	18	2019-12-19 10:23:52.528463	2019-12-19 10:23:52.528463	2019-12-11	#000000	approved
346	full day	54	2019-12-12 00:00:00	18	2019-12-19 10:24:10.60618	2019-12-19 10:24:10.60618	2019-12-13	#0000FF	approved
347	full day	15	2019-12-02 00:00:00	16	2019-12-19 10:27:35.731123	2019-12-19 10:27:35.731123	2019-12-02	#0000FF	approved
348	full day	67	2019-12-20 00:00:00	51	2019-12-19 10:28:00.681749	2019-12-19 10:28:00.681749	2019-12-20	#0000FF	approved
349	full day	13	2019-12-02 00:00:00	18	2019-12-19 10:28:18.496008	2019-12-19 10:28:18.496008	2019-12-02	#0000FF	approved
350	full day	13	2019-12-06 00:00:00	18	2019-12-19 10:28:31.039992	2019-12-19 10:28:31.039992	2019-12-06	#0000FF	approved
351	full day	13	2019-12-20 00:00:00	18	2019-12-19 10:28:50.918231	2019-12-19 10:28:50.918231	2019-12-26	#0000FF	approved
352	second half	51	2019-12-06 00:00:00	18	2019-12-19 10:29:10.683568	2019-12-19 10:29:10.683568	2019-12-06	#000000	approved
353	full day	51	2019-12-09 00:00:00	18	2019-12-19 10:29:30.650925	2019-12-19 10:29:30.650925	2019-12-09	#0000FF	approved
354	full day	51	2019-12-12 00:00:00	18	2019-12-19 10:30:11.000541	2019-12-19 10:30:11.000541	2019-12-12	#0000FF	approved
355	second half	58	2019-12-17 00:00:00	54	2019-12-19 10:30:54.36534	2019-12-19 10:30:54.36534	2019-12-17	#000000	approved
356	full day	65	2019-12-02 00:00:00	51	2019-12-19 10:31:26.98127	2019-12-19 10:31:26.98127	2019-12-05	#0000FF	approved
357	full day	65	2019-12-12 00:00:00	51	2019-12-19 10:31:38.855434	2019-12-19 10:31:38.855434	2019-12-12	#0000FF	approved
358	full day	64	2019-12-16 00:00:00	18	2019-12-19 10:31:54.710361	2019-12-19 10:31:54.710361	2019-12-16	#0000FF	approved
359	full day	58	2019-12-20 00:00:00	54	2019-12-19 13:00:39.483773	2019-12-19 13:00:39.483773	2019-12-20	#0000FF	approved
360	full day	55	2019-12-23 00:00:00	54	2019-12-31 08:58:12.853227	2019-12-31 08:58:12.853227	2019-12-25	#0000FF	approved
361	wfh	17	2019-12-20 00:00:00	16	2019-12-31 08:58:43.201308	2019-12-31 08:58:43.201308	2019-12-20	#008000	approved
363	full day	65	2019-12-30 00:00:00	51	2019-12-31 08:59:22.061411	2019-12-31 08:59:22.061411	2019-12-30	#0000FF	approved
364	second half	65	2020-01-08 00:00:00	51	2019-12-31 09:00:12.733666	2019-12-31 09:00:12.733666	2020-01-08	#000000	approved
365	full day	51	2019-12-26 00:00:00	18	2019-12-31 09:01:08.670062	2019-12-31 09:01:08.670062	2019-12-26	#0000FF	approved
366	full day	17	2020-01-07 00:00:00	16	2019-12-31 09:01:27.423967	2019-12-31 09:01:27.423967	2020-01-07	#0000FF	approved
369	full day	13	2019-12-27 00:00:00	18	2019-12-31 09:08:58.649789	2019-12-31 09:08:58.649789	2019-12-27	#0000FF	approved
370	second half	52	2019-12-23 00:00:00	18	2019-12-31 10:06:03.482486	2019-12-31 10:06:03.482486	2019-12-23	#000000	approved
371	second half	61	2019-12-31 00:00:00	54	2019-12-31 10:06:32.469042	2019-12-31 10:06:32.469042	2019-12-31	#000000	approved
372	second half	53	2019-12-31 00:00:00	52	2019-12-31 10:06:45.509281	2019-12-31 10:06:45.509281	2019-12-31	#000000	approved
373	full day	53	2020-01-01 00:00:00	52	2020-01-02 10:07:55.98558	2020-01-02 10:07:55.98558	2020-01-02	#0000FF	approved
376	full day	14	2020-01-27 00:00:00	16	2020-01-02 10:10:56.535159	2020-01-02 10:10:56.535159	2020-01-31	#0000FF	approved
377	second half	15	2020-01-03 00:00:00	16	2020-01-03 14:38:49.001199	2020-01-03 14:38:49.001199	2020-01-03	#000000	approved
379	full day	64	2020-01-13 00:00:00	54	2020-01-09 08:49:55.149293	2020-01-09 08:49:55.149293	2020-01-13	#0000FF	approved
380	wfh	17	2020-01-08 00:00:00	16	2020-01-09 08:50:23.538588	2020-01-09 08:50:23.538588	2020-02-05	#008000	approved
382	full day	58	2020-01-09 00:00:00	54	2020-01-09 08:51:09.260702	2020-01-09 08:51:09.260702	2020-01-09	#0000FF	approved
384	full day	67	2020-01-16 00:00:00	51	2020-01-09 13:50:58.026542	2020-01-09 13:50:58.026542	2020-01-16	#0000FF	approved
385	full day	69	2020-01-16 00:00:00	51	2020-01-13 13:34:09.998677	2020-01-13 13:34:09.998677	2020-01-16	#0000FF	approved
386	full day	68	2020-01-16 00:00:00	18	2020-01-13 13:39:17.008643	2020-01-13 13:39:17.008643	2020-01-16	#0000FF	approved
387	full day	59	2020-01-13 00:00:00	51	2020-01-16 06:51:15.43513	2020-01-16 06:51:15.43513	2020-01-13	#0000FF	approved
388	full day	59	2020-01-20 00:00:00	51	2020-01-16 06:51:29.163208	2020-01-16 06:51:29.163208	2020-01-20	#0000FF	approved
389	full day	53	2020-01-20 00:00:00	52	2020-01-16 07:00:09.363392	2020-01-16 07:00:09.363392	2020-01-20	#0000FF	approved
390	full day	61	2020-01-20 00:00:00	54	2020-01-17 08:01:06.014881	2020-01-17 08:01:06.014881	2020-01-20	#0000FF	approved
392	full day	60	2020-01-30 00:00:00	54	2020-01-17 08:02:02.77157	2020-01-17 08:02:02.77157	2020-01-31	#0000FF	approved
393	full day	13	2020-01-20 00:00:00	18	2020-01-17 09:12:25.647782	2020-01-17 09:12:25.647782	2020-01-20	#0000FF	approved
394	first half	57	2020-01-20 00:00:00	18	2020-01-21 07:41:03.624297	2020-01-21 07:41:03.624297	2020-01-21	#000000	approved
395	second half	64	2020-01-21 00:00:00	54	2020-01-21 07:41:46.418976	2020-01-21 07:41:46.418976	2020-01-21	#000000	approved
396	full day	14	2020-02-10 00:00:00	16	2020-01-22 14:59:24.287342	2020-01-22 14:59:24.287342	2020-02-10	#0000FF	approved
397	full day	15	2020-01-31 00:00:00	16	2020-01-24 07:22:07.886077	2020-01-24 07:22:07.886077	2020-01-31	#0000FF	approved
398	full day	52	2020-01-31 00:00:00	18	2020-01-28 13:49:34.74551	2020-01-28 13:49:34.74551	2020-01-31	#0000FF	approved
399	full day	57	2020-02-04 00:00:00	18	2020-01-28 13:53:19.689082	2020-01-28 13:53:19.689082	2020-02-04	#0000FF	approved
400	second half	57	2020-02-06 00:00:00	18	2020-01-28 13:53:38.222653	2020-01-28 13:53:38.222653	2020-02-06	#000000	approved
401	full day	64	2020-01-30 00:00:00	54	2020-01-29 13:37:05.487606	2020-01-29 13:37:05.487606	2020-01-31	#3a8bc5	approved
402	second half	54	2020-01-31 00:00:00	18	2020-01-31 13:14:25.106243	2020-01-31 13:14:25.106243	2020-01-31	#000000	approved
403	full day	59	2020-02-04 00:00:00	51	2020-01-31 13:14:59.137468	2020-01-31 13:14:59.137468	2020-02-04	#3a8bc5	approved
404	full day	68	2020-01-02 00:00:00	18	2020-02-03 11:25:05.237564	2020-02-03 11:25:05.237564	2020-01-02	#3a8bc5	approved
405	wfh	17	2020-01-06 00:00:00	16	2020-02-03 11:26:21.836324	2020-02-03 11:26:21.836324	2020-01-06	#008000	approved
406	wfh	63	2020-01-29 00:00:00	54	2020-02-03 11:29:38.467394	2020-02-03 11:29:38.467394	2020-01-29	#008000	approved
407	wfh	63	2020-01-30 00:00:00	54	2020-02-03 11:30:12.726505	2020-02-03 11:30:12.726505	2020-01-30	#008000	approved
408	second half	58	2020-02-03 00:00:00	54	2020-02-03 11:31:03.013453	2020-02-03 11:31:03.013453	2020-02-03	#000000	approved
409	wfh	16	2020-02-03 00:00:00	18	2020-02-03 11:31:35.840179	2020-02-03 11:31:35.840179	2020-02-03	#008000	approved
410	wfh	65	2020-02-04 00:00:00	51	2020-02-04 08:52:50.047329	2020-02-04 08:52:50.047329	2020-02-04	#008000	approved
412	full day	13	2020-02-13 00:00:00	18	2020-02-04 08:54:18.002451	2020-02-04 08:54:18.002451	2020-02-14	#3a8bc5	approved
413	second half	13	2020-02-10 00:00:00	18	2020-02-10 08:24:09.178548	2020-02-10 08:24:09.178548	2020-02-10	#000000	approved
414	full day	61	2020-02-17 00:00:00	54	2020-02-10 08:24:28.567375	2020-02-10 08:24:28.567375	2020-02-21	#3a8bc5	approved
415	full day	53	2020-02-17 00:00:00	52	2020-02-10 08:24:54.114041	2020-02-10 08:24:54.114041	2020-02-21	#3a8bc5	approved
416	full day	51	2020-02-10 00:00:00	18	2020-02-10 08:56:40.452513	2020-02-10 08:56:40.452513	2020-02-10	#3a8bc5	approved
417	full day	69	2020-02-11 00:00:00	51	2020-02-11 08:08:17.450898	2020-02-11 08:08:17.450898	2020-02-11	#3a8bc5	approved
418	full day	69	2020-02-13 00:00:00	51	2020-02-11 08:08:32.652575	2020-02-11 08:08:32.652575	2020-02-13	#3a8bc5	approved
419	full day	58	2020-02-12 00:00:00	54	2020-02-12 06:18:24.69072	2020-02-12 06:18:24.69072	2020-02-12	#3a8bc5	approved
420	first half	52	2020-02-13 00:00:00	18	2020-02-12 06:19:01.211275	2020-02-12 06:19:01.211275	2020-02-13	#000000	approved
421	full day	57	2020-02-18 00:00:00	18	2020-02-12 07:26:35.080171	2020-02-12 07:26:35.080171	2020-02-19	#3a8bc5	approved
423	first half	65	2020-02-14 00:00:00	51	2020-02-12 08:36:48.613135	2020-02-12 08:36:48.613135	2020-02-14	#000000	approved
424	second half	15	2020-02-13 00:00:00	16	2020-02-17 09:50:00.940491	2020-02-17 09:50:00.940491	2020-02-13	#000000	approved
425	wfh	51	2020-02-14 00:00:00	18	2020-02-17 09:50:22.317984	2020-02-17 09:50:22.317984	2020-02-14	#008000	approved
426	full day	55	2020-02-17 00:00:00	54	2020-02-17 09:50:40.294052	2020-02-17 09:50:40.294052	2020-02-17	#3a8bc5	approved
427	full day	64	2020-02-17 00:00:00	54	2020-02-19 13:10:22.155007	2020-02-19 13:10:22.155007	2020-02-28	#3a8bc5	approved
429	second half	68	2020-02-24 00:00:00	18	2020-02-19 13:11:15.66898	2020-02-19 13:11:15.66898	2020-02-24	#000000	approved
430	full day	59	2020-02-21 00:00:00	51	2020-02-20 08:44:26.58553	2020-02-20 08:44:26.58553	2020-02-21	#3a8bc5	approved
431	second half	69	2020-02-20 00:00:00	51	2020-02-20 08:52:47.247122	2020-02-20 08:52:47.247122	2020-02-20	#000000	approved
433	first half	55	2020-02-25 00:00:00	54	2020-02-21 09:11:25.159818	2020-02-21 09:11:25.159818	2020-02-25	#000000	approved
434	wfh	66	2020-02-24 00:00:00	51	2020-02-24 08:59:26.34726	2020-02-24 08:59:26.34726	2020-02-24	#008000	approved
435	full day	51	2020-02-25 00:00:00	18	2020-02-26 07:45:45.004817	2020-02-26 07:45:45.004817	2020-02-26	#3a8bc5	approved
436	full day	13	2020-02-25 00:00:00	18	2020-02-26 07:47:27.839588	2020-02-26 07:47:27.839588	2020-02-25	#3a8bc5	approved
437	full day	16	2020-02-26 00:00:00	18	2020-02-26 14:16:20.410474	2020-02-26 14:16:20.410474	2020-02-26	#3a8bc5	approved
438	second half	16	2020-02-24 00:00:00	18	2020-02-27 07:17:36.194553	2020-02-27 07:17:36.194553	2020-02-24	#000000	approved
439	second half	16	2020-02-27 00:00:00	18	2020-02-27 07:18:25.458938	2020-02-27 07:18:25.458938	2020-02-27	#000000	approved
440	full day	52	2020-02-27 00:00:00	18	2020-02-27 07:52:38.873295	2020-02-27 07:52:38.873295	2020-02-27	#3a8bc5	approved
441	full day	57	2020-02-22 00:00:00	18	2020-02-27 07:57:00.758338	2020-02-27 07:57:00.758338	2020-02-29	#3a8bc5	approved
443	full day	62	2020-02-28 00:00:00	18	2020-02-28 07:35:14.992876	2020-02-28 07:35:14.992876	2020-02-28	#3a8bc5	approved
444	full day	60	2020-03-02 00:00:00	54	2020-02-28 07:35:33.830829	2020-02-28 07:35:33.830829	2020-03-02	#3a8bc5	approved
445	full day	65	2020-03-13 00:00:00	51	2020-02-28 07:36:58.035783	2020-02-28 07:36:58.035783	2020-03-13	#3a8bc5	approved
446	full day	69	2020-02-21 00:00:00	51	2020-03-02 08:59:28.141459	2020-03-02 08:59:28.141459	2020-02-21	#3a8bc5	approved
447	full day	58	2020-03-04 00:00:00	54	2020-03-04 07:07:36.09395	2020-03-04 07:07:36.09395	2020-03-04	#3a8bc5	approved
448	wfh	16	2020-03-02 00:00:00	18	2020-03-04 07:08:28.297183	2020-03-04 07:08:28.297183	2020-03-03	#008000	approved
449	full day	62	2020-03-05 00:00:00	18	2020-03-04 14:38:38.215467	2020-03-04 14:38:38.215467	2020-03-09	#3a8bc5	approved
450	wfh	58	2020-03-06 00:00:00	54	2020-03-05 13:31:18.446425	2020-03-05 13:31:18.446425	2020-03-06	#008000	approved
451	full day	60	2020-03-09 00:00:00	54	2020-03-06 15:37:20.170697	2020-03-06 15:37:20.170697	2020-03-13	#3a8bc5	approved
452	wfh	14	2020-03-09 00:00:00	16	2020-03-09 08:33:40.306248	2020-03-09 08:33:40.306248	2020-03-12	#008000	approved
454	wfh	16	2020-03-09 00:00:00	18	2020-03-11 13:55:10.843523	2020-03-11 13:55:10.843523	2020-03-11	#008000	approved
455	wfh	13	2020-03-16 00:00:00	18	2020-03-16 07:26:08.749	2020-03-16 07:26:08.749	2020-03-16	#008000	approved
456	full day	13	2020-03-17 00:00:00	18	2020-03-16 07:26:37.382137	2020-03-16 07:26:37.382137	2020-03-18	#3a8bc5	approved
458	full day	65	2020-03-16 00:00:00	51	2020-03-16 07:27:31.031877	2020-03-16 07:27:31.031877	2020-03-16	#3a8bc5	approved
461	full day	54	2020-03-20 00:00:00	18	2020-03-20 08:41:59.259214	2020-03-20 08:41:59.259214	2020-03-20	#3a8bc5	approved
462	wfh	63	2020-03-23 00:00:00	54	2020-03-20 08:42:47.654604	2020-03-20 08:42:47.654604	2020-03-27	#008000	approved
463	full day	17	2020-02-06 00:00:00	16	2020-03-20 08:46:18.184436	2020-03-20 08:46:18.184436	2020-02-29	#3a8bc5	approved
465	wfh	17	2020-03-23 00:00:00	16	2020-03-20 11:43:20.477639	2020-03-20 11:43:20.477639	2020-03-27	#008000	approved
466	wfh	16	2020-03-16 00:00:00	18	2020-03-20 13:27:51.759593	2020-03-20 13:27:51.759593	2020-03-20	#008000	approved
467	full day	69	2020-03-14 00:00:00	18	2020-03-23 10:59:49.446799	2020-03-23 10:59:49.446799	2020-03-24	#3a8bc5	approved
468	second half	55	2020-03-23 00:00:00	54	2020-03-23 13:26:18.804229	2020-03-23 13:26:18.804229	2020-03-23	#000000	approved
469	first half	16	2020-04-01 00:00:00	18	2020-04-01 07:20:54.568926	2020-04-01 07:20:54.568926	2020-04-01	#000000	approved
471	full day	17	2020-03-01 00:00:00	16	2020-04-07 09:20:31.243264	2020-04-07 09:20:31.243264	2020-03-05	#3a8bc5	approved
472	full day	55	2020-04-08 00:00:00	54	2020-04-08 05:19:22.521074	2020-04-08 05:19:22.521074	2020-04-08	#3a8bc5	approved
473	second half	52	2020-04-15 00:00:00	18	2020-04-15 10:21:28.417061	2020-04-15 10:21:28.417061	2020-04-15	#000000	approved
474	second half	59	2020-04-21 00:00:00	51	2020-04-21 10:45:48.802783	2020-04-21 10:45:48.802783	2020-04-21	#000000	approved
475	full day	55	2020-04-21 00:00:00	54	2020-04-21 10:46:07.702998	2020-04-21 10:46:07.702998	2020-04-21	#3a8bc5	approved
476	full day	14	2020-04-28 00:00:00	16	2020-04-27 10:37:39.868788	2020-04-27 10:37:39.868788	2020-04-28	#3a8bc5	approved
477	full day	15	2020-04-30 00:00:00	16	2020-04-30 10:34:38.419587	2020-04-30 10:34:38.419587	2020-04-30	#3a8bc5	approved
478	full day	53	2020-06-01 00:00:00	52	2020-05-29 08:53:11.207446	2020-05-29 08:53:11.207446	2020-06-01	#3a8bc5	approved
479	second half	67	2020-06-08 00:00:00	51	2020-06-08 11:05:45.187093	2020-06-08 11:05:45.187093	2020-06-08	#000000	approved
480	full day	13	2020-06-09 00:00:00	18	2020-06-08 14:50:10.308617	2020-06-08 14:50:10.308617	2020-06-09	#3a8bc5	approved
481	full day	67	2020-06-09 00:00:00	51	2020-06-10 07:53:57.126937	2020-06-10 07:53:57.126937	2020-06-09	#3a8bc5	approved
483	full day	58	2020-06-09 00:00:00	54	2020-06-10 08:55:40.180751	2020-06-10 08:55:40.180751	2020-06-09	#3a8bc5	approved
484	first half	58	2020-06-10 00:00:00	54	2020-06-10 08:55:54.675193	2020-06-10 08:55:54.675193	2020-06-10	#000000	approved
485	full day	58	2020-06-11 00:00:00	54	2020-06-10 08:56:12.485612	2020-06-10 08:56:12.485612	2020-06-12	#3a8bc5	approved
486	second half	63	2020-06-15 00:00:00	54	2020-06-15 13:45:37.997822	2020-06-15 13:45:37.997822	2020-06-15	#000000	approved
487	second half	65	2020-06-17 00:00:00	51	2020-06-17 13:46:44.799463	2020-06-17 13:46:44.799463	2020-06-17	#000000	approved
488	first half	58	2020-06-19 00:00:00	54	2020-06-22 09:54:42.474239	2020-06-22 09:54:42.474239	2020-06-19	#000000	approved
489	full day	52	2020-06-24 00:00:00	18	2020-06-25 07:44:02.916236	2020-06-25 07:44:02.916236	2020-06-24	#3a8bc5	approved
490	second half	64	2020-06-30 00:00:00	54	2020-06-30 10:53:07.411438	2020-06-30 10:53:07.411438	2020-06-30	#000000	approved
492	second half	69	2020-07-01 00:00:00	51	2020-07-01 08:57:10.074197	2020-07-01 08:57:10.074197	2020-07-01	#000000	approved
493	second half	64	2020-07-02 00:00:00	54	2020-07-01 09:29:01.550262	2020-07-01 09:29:01.550262	2020-07-02	#000000	approved
494	second half	57	2020-07-02 00:00:00	18	2020-07-02 10:13:37.227776	2020-07-02 10:13:37.227776	2020-07-02	#000000	approved
495	full day	51	2020-07-03 00:00:00	18	2020-07-03 07:04:25.664291	2020-07-03 07:04:25.664291	2020-07-03	#3a8bc5	approved
496	first half	54	2020-07-06 00:00:00	18	2020-07-06 07:47:43.844261	2020-07-06 07:47:43.844261	2020-07-06	#000000	approved
497	second half	69	2020-07-07 00:00:00	51	2020-07-06 08:32:31.474765	2020-07-06 08:32:31.474765	2020-07-07	#000000	approved
498	full day	69	2020-07-21 00:00:00	51	2020-07-06 08:32:47.104008	2020-07-06 08:32:47.104008	2020-07-21	#3a8bc5	approved
499	second half	65	2020-07-07 00:00:00	51	2020-07-07 10:27:28.311406	2020-07-07 10:27:28.311406	2020-07-07	#000000	approved
532	full day	55	2020-07-13 00:00:00	54	2020-07-13 14:02:24.248886	2020-07-13 14:02:24.248886	2020-07-13	#3a8bc5	approved
533	first half	15	2020-07-13 00:00:00	16	2020-07-13 14:02:44.322527	2020-07-13 14:02:44.322527	2020-07-13	#000000	approved
534	first half	63	2020-07-13 00:00:00	54	2020-07-13 14:03:05.278142	2020-07-13 14:03:05.278142	2020-07-13	#000000	approved
535	full day	15	2020-07-14 00:00:00	16	2020-07-13 14:03:28.424942	2020-07-13 14:03:28.424942	2020-07-14	#3a8bc5	approved
536	second half	15	2020-07-23 00:00:00	16	2020-07-20 09:08:57.670481	2020-07-20 09:08:57.670481	2020-07-23	#000000	approved
537	full day	67	2020-07-20 00:00:00	51	2020-07-21 12:12:06.13616	2020-07-21 12:12:06.13616	2020-07-24	#3a8bc5	approved
538	second half	52	2020-07-22 00:00:00	18	2020-07-22 11:01:08.114195	2020-07-22 11:01:08.114195	2020-07-22	#000000	approved
539	full day	15	2020-07-31 00:00:00	16	2020-07-27 06:19:27.115865	2020-07-27 06:19:27.115865	2020-07-31	#3a8bc5	approved
540	full day	64	2020-07-27 00:00:00	69	2020-07-27 09:09:48.521948	2020-07-27 09:09:48.521948	2020-07-27	#3a8bc5	approved
541	full day	61	2020-07-28 00:00:00	54	2020-07-28 06:06:33.067721	2020-07-28 06:06:33.067721	2020-07-28	#3a8bc5	approved
542	full day	55	2020-07-29 00:00:00	54	2020-07-29 06:27:32.672968	2020-07-29 06:27:32.672968	2020-07-29	#3a8bc5	approved
543	second half	55	2020-07-30 00:00:00	54	2020-07-31 09:46:12.143107	2020-07-31 09:46:12.143107	2020-07-30	#000000	approved
544	full day	55	2020-07-31 00:00:00	54	2020-07-31 09:46:23.502939	2020-07-31 09:46:23.502939	2020-07-31	#3a8bc5	approved
545	full day	67	2020-08-14 00:00:00	51	2020-08-05 07:35:55.855244	2020-08-05 07:35:55.855244	2020-08-14	#3a8bc5	approved
578	second half	65	2020-08-07 00:00:00	51	2020-08-07 10:19:06.279642	2020-08-07 10:19:06.279642	2020-08-07	#000000	approved
579	second half	15	2020-08-10 00:00:00	16	2020-08-10 11:18:29.973226	2020-08-10 11:18:29.973226	2020-08-10	#000000	approved
580	full day	54	2020-08-12 00:00:00	18	2020-08-13 13:28:09.047891	2020-08-13 13:28:09.047891	2020-08-12	#3a8bc5	approved
581	full day	55	2020-08-13 00:00:00	54	2020-08-13 13:28:25.456085	2020-08-13 13:28:25.456085	2020-08-13	#3a8bc5	approved
582	full day	64	2020-08-14 00:00:00	54	2020-08-14 08:31:40.810329	2020-08-14 08:31:40.810329	2020-08-14	#3a8bc5	approved
585	full day	13	2020-08-25 00:00:00	18	2020-08-26 10:13:02.686325	2020-08-26 10:13:02.686325	2020-08-25	#3a8bc5	approved
586	full day	69	2020-08-26 00:00:00	51	2020-08-26 10:13:32.482668	2020-08-26 10:13:32.482668	2020-08-26	#3a8bc5	approved
587	full day	63	2020-08-26 00:00:00	54	2020-08-26 10:13:47.963865	2020-08-26 10:13:47.963865	2020-08-26	#3a8bc5	approved
588	second half	15	2020-09-01 00:00:00	16	2020-08-27 07:56:33.738538	2020-08-27 07:56:33.738538	2020-09-01	#000000	approved
590	full day	67	2020-09-04 00:00:00	51	2020-08-31 07:21:16.614816	2020-08-31 07:21:16.614816	2020-09-04	#3a8bc5	approved
591	second half	58	2020-09-01 00:00:00	54	2020-09-01 10:20:46.552141	2020-09-01 10:20:46.552141	2020-09-01	#000000	approved
592	full day	13	2020-09-03 00:00:00	18	2020-09-04 10:02:47.304723	2020-09-04 10:02:47.304723	2020-09-03	#3a8bc5	approved
593	full day	65	2020-09-07 00:00:00	51	2020-09-08 09:18:13.9991	2020-09-08 09:18:13.9991	2020-09-07	#3a8bc5	approved
594	first half	65	2020-09-08 00:00:00	51	2020-09-08 09:18:29.844749	2020-09-08 09:18:29.844749	2020-09-08	#000000	approved
627	second half	52	2020-09-10 00:00:00	18	2020-09-10 10:28:11.738474	2020-09-10 10:28:11.738474	2020-09-10	#000000	approved
628	full day	53	2020-09-10 00:00:00	52	2020-09-11 11:29:55.866809	2020-09-11 11:29:55.866809	2020-09-10	#3a8bc5	approved
629	full day	67	2020-09-14 00:00:00	51	2020-09-14 12:31:15.616868	2020-09-14 12:31:15.616868	2020-09-15	#3a8bc5	approved
630	full day	17	2020-09-14 00:00:00	16	2020-09-14 12:31:31.609711	2020-09-14 12:31:31.609711	2020-09-14	#3a8bc5	approved
631	second half	63	2020-09-15 00:00:00	54	2020-09-15 10:21:00.923954	2020-09-15 10:21:00.923954	2020-09-15	#000000	approved
632	first half	57	2020-09-16 00:00:00	18	2020-09-15 10:26:15.078378	2020-09-15 10:26:15.078378	2020-09-16	#000000	approved
633	full day	51	2020-09-21 00:00:00	18	2020-09-22 09:53:23.989534	2020-09-22 09:53:23.989534	2020-09-21	#3a8bc5	approved
635	full day	63	2020-09-28 00:00:00	54	2020-09-29 09:55:28.252243	2020-09-29 09:55:28.252243	2020-09-28	#3a8bc5	approved
636	first half	13	2020-09-29 00:00:00	18	2020-09-29 09:56:14.023975	2020-09-29 09:56:14.023975	2020-09-29	#000000	approved
637	second half	16	2020-10-01 00:00:00	18	2020-10-01 12:56:05.774591	2020-10-01 12:56:05.774591	2020-10-01	#000000	approved
638	second half	13	2020-10-02 00:00:00	18	2020-10-02 10:47:40.764284	2020-10-02 10:47:40.764284	2020-10-02	#000000	approved
639	second half	63	2020-10-07 00:00:00	54	2020-10-06 13:42:01.309879	2020-10-06 13:42:01.309879	2020-10-07	#000000	approved
672	full day	13	2020-10-08 00:00:00	18	2020-10-13 11:00:18.040171	2020-10-13 11:00:18.040171	2020-10-12	#3a8bc5	approved
673	second half	69	2020-10-14 00:00:00	51	2020-10-14 12:45:03.697348	2020-10-14 12:45:03.697348	2020-10-14	#000000	approved
674	full day	51	2020-10-19 00:00:00	18	2020-10-19 09:09:23.429484	2020-10-19 09:09:23.429484	2020-10-19	#3a8bc5	approved
675	second half	57	2020-10-19 00:00:00	18	2020-10-19 09:09:36.415304	2020-10-19 09:09:36.415304	2020-10-19	#000000	approved
676	full day	61	2020-10-26 00:00:00	54	2020-10-22 08:58:57.431485	2020-10-22 08:58:57.431485	2020-10-27	#3a8bc5	approved
677	full day	60	2020-10-27 00:00:00	54	2020-10-22 08:59:11.372371	2020-10-22 08:59:11.372371	2020-10-27	#3a8bc5	approved
678	full day	64	2020-10-27 00:00:00	54	2020-10-22 08:59:31.163005	2020-10-22 08:59:31.163005	2020-10-27	#3a8bc5	approved
679	full day	64	2020-11-02 00:00:00	54	2020-10-22 08:59:48.607238	2020-10-22 08:59:48.607238	2020-11-02	#3a8bc5	approved
680	second half	65	2020-10-22 00:00:00	51	2020-10-22 09:22:49.377672	2020-10-22 09:22:49.377672	2020-10-22	#000000	approved
681	full day	53	2020-10-26 00:00:00	52	2020-10-22 10:31:39.785073	2020-10-22 10:31:39.785073	2020-10-30	#3a8bc5	approved
682	full day	53	2020-11-13 00:00:00	52	2020-10-22 10:32:03.628902	2020-10-22 10:32:03.628902	2020-11-13	#3a8bc5	approved
683	full day	53	2020-11-17 00:00:00	52	2020-10-22 10:32:23.305655	2020-10-22 10:32:23.305655	2020-11-17	#3a8bc5	approved
685	second half	52	2020-10-27 00:00:00	18	2020-10-27 10:07:06.382187	2020-10-27 10:07:06.382187	2020-10-27	#000000	approved
686	full day	55	2020-10-26 00:00:00	54	2020-10-27 14:57:20.36831	2020-10-27 14:57:20.36831	2020-10-27	#3a8bc5	approved
688	full day	58	2020-10-28 00:00:00	54	2020-10-29 09:03:22.378661	2020-10-29 09:03:22.378661	2020-10-28	#3a8bc5	approved
689	full day	15	2020-10-30 00:00:00	16	2020-10-30 10:49:32.901795	2020-10-30 10:49:32.901795	2020-10-30	#3a8bc5	approved
690	full day	69	2020-11-06 00:00:00	51	2020-11-02 13:33:59.985873	2020-11-02 13:33:59.985873	2020-11-06	#3a8bc5	approved
692	full day	67	2020-11-12 00:00:00	51	2020-11-04 13:20:56.556465	2020-11-04 13:20:56.556465	2020-11-12	#3a8bc5	approved
693	first half	67	2020-11-06 00:00:00	51	2020-11-06 13:13:55.256481	2020-11-06 13:13:55.256481	2020-11-06	#000000	approved
694	full day	15	2020-11-17 00:00:00	16	2020-11-06 13:14:21.532898	2020-11-06 13:14:21.532898	2020-11-18	#3a8bc5	approved
695	full day	15	2020-11-20 00:00:00	16	2020-11-06 13:14:33.933343	2020-11-06 13:14:33.933343	2020-11-20	#3a8bc5	approved
696	full day	15	2020-11-23 00:00:00	16	2020-11-06 13:14:56.868428	2020-11-06 13:14:56.868428	2020-11-23	#3a8bc5	approved
697	full day	51	2020-11-09 00:00:00	18	2020-11-09 15:22:17.096309	2020-11-09 15:22:17.096309	2020-11-09	#3a8bc5	approved
730	full day	66	2020-11-09 00:00:00	51	2020-11-10 09:58:32.333337	2020-11-10 09:58:32.333337	2020-11-09	#3a8bc5	approved
731	full day	52	2020-11-10 00:00:00	69	2020-11-11 08:33:50.519447	2020-11-11 08:33:50.519447	2020-11-10	#3a8bc5	approved
733	first half	57	2020-12-08 00:00:00	18	2020-11-12 09:15:16.114208	2020-11-12 09:15:16.114208	2020-12-08	#000000	approved
734	full day	57	2020-12-10 00:00:00	18	2020-11-12 09:15:36.214865	2020-11-12 09:15:36.214865	2020-12-10	#3a8bc5	approved
735	first half	57	2020-12-11 00:00:00	18	2020-11-12 09:15:54.636036	2020-11-12 09:15:54.636036	2020-12-11	#000000	approved
736	full day	16	2020-11-17 00:00:00	18	2020-11-12 12:40:16.986267	2020-11-12 12:40:16.986267	2020-11-18	#3a8bc5	approved
737	full day	17	2020-12-07 00:00:00	16	2020-11-12 12:40:52.126242	2020-11-12 12:40:52.126242	2020-12-11	#3a8bc5	approved
739	full day	17	2020-11-17 00:00:00	16	2020-11-17 07:38:07.34934	2020-11-17 07:38:07.34934	2020-11-17	#3a8bc5	approved
740	full day	54	2020-11-17 00:00:00	18	2020-11-17 07:39:12.593041	2020-11-17 07:39:12.593041	2020-11-18	#3a8bc5	approved
742	full day	68	2020-12-09 00:00:00	18	2020-11-17 07:40:25.657627	2020-11-17 07:40:25.657627	2020-12-10	#3a8bc5	approved
746	second half	63	2020-11-18 00:00:00	54	2020-11-24 14:55:51.356753	2020-11-24 14:55:51.356753	2020-11-18	#000000	approved
747	full day	64	2020-11-26 00:00:00	54	2020-11-26 11:56:24.340824	2020-11-26 11:56:24.340824	2020-11-26	#3a8bc5	approved
748	full day	60	2020-11-30 00:00:00	54	2020-11-26 11:56:39.586511	2020-11-26 11:56:39.586511	2020-11-30	#3a8bc5	approved
749	second half	61	2020-11-30 00:00:00	54	2020-11-26 11:56:54.418125	2020-11-26 11:56:54.418125	2020-11-30	#000000	approved
750	second half	69	2020-12-08 00:00:00	69	2020-11-27 09:24:15.624652	2020-11-27 09:24:15.624652	2020-12-08	#000000	approved
751	full day	69	2020-12-09 00:00:00	69	2020-11-27 09:24:39.688982	2020-11-27 09:24:39.688982	2020-12-11	#3a8bc5	approved
753	full day	66	2020-12-01 00:00:00	51	2020-11-27 09:25:13.116382	2020-11-27 09:25:13.116382	2020-12-01	#3a8bc5	approved
754	full day	65	2020-12-01 00:00:00	51	2020-11-27 09:25:28.323155	2020-11-27 09:25:28.323155	2020-12-01	#3a8bc5	approved
756	full day	15	2020-12-07 00:00:00	16	2020-11-30 11:54:33.663342	2020-11-30 11:54:33.663342	2020-12-07	#3a8bc5	approved
757	full day	16	2020-12-07 00:00:00	18	2020-12-03 12:06:28.395499	2020-12-03 12:06:28.395499	2020-12-08	#3a8bc5	approved
758	full day	13	2020-12-01 00:00:00	18	2020-12-03 12:06:48.126372	2020-12-03 12:06:48.126372	2020-12-03	#3a8bc5	approved
759	full day	55	2020-12-01 00:00:00	54	2020-12-03 12:07:11.240445	2020-12-03 12:07:11.240445	2020-12-01	#3a8bc5	approved
760	first half	68	2020-12-07 00:00:00	18	2020-12-03 12:09:05.190842	2020-12-03 12:09:05.190842	2020-12-07	#000000	approved
761	first half	68	2020-12-11 00:00:00	18	2020-12-03 12:09:21.994487	2020-12-03 12:09:21.994487	2020-12-11	#000000	approved
762	full day	64	2020-11-30 00:00:00	54	2020-12-07 10:12:00.404442	2020-12-07 10:12:00.404442	2020-11-30	#3a8bc5	approved
763	full day	57	2020-11-30 00:00:00	18	2020-12-07 10:20:18.332372	2020-12-07 10:20:18.332372	2020-11-30	#3a8bc5	approved
768	full day	66	2020-12-10 00:00:00	51	2020-12-07 12:33:35.890001	2020-12-07 12:33:35.890001	2020-12-10	#3a8bc5	approved
769	full day	65	2020-12-10 00:00:00	51	2020-12-07 12:33:51.630755	2020-12-07 12:33:51.630755	2020-12-10	#3a8bc5	approved
772	first half	52	2020-12-10 00:00:00	18	2020-12-08 10:18:49.113571	2020-12-08 10:18:49.113571	2020-12-10	#000000	approved
773	second half	57	2020-12-09 00:00:00	18	2020-12-09 09:44:30.378649	2020-12-09 09:44:30.378649	2020-12-09	#000000	approved
774	second half	16	2020-12-09 00:00:00	18	2020-12-09 11:11:12.082451	2020-12-09 11:11:12.082451	2020-12-09	#000000	approved
807	full day	54	2020-12-11 00:00:00	18	2020-12-11 11:59:50.733574	2020-12-11 11:59:50.733574	2020-12-11	#3a8bc5	approved
810	full day	60	2020-12-23 00:00:00	54	2020-12-18 11:27:43.275949	2020-12-18 11:27:43.275949	2020-12-23	#3a8bc5	approved
811	full day	16	2020-12-21 00:00:00	18	2020-12-21 08:58:11.588355	2020-12-21 08:58:11.588355	2020-12-21	#3a8bc5	approved
812	full day	67	2020-11-14 00:00:00	51	2020-12-21 11:23:51.060398	2020-12-21 11:23:51.060398	2020-12-20	#3a8bc5	approved
813	full day	68	2020-12-22 00:00:00	18	2020-12-21 12:57:57.391829	2020-12-21 12:57:57.391829	2020-12-22	#3a8bc5	approved
814	full day	68	2020-12-24 00:00:00	18	2020-12-21 12:58:14.737167	2020-12-21 12:58:14.737167	2020-12-24	#3a8bc5	approved
815	full day	68	2020-12-23 00:00:00	18	2020-12-23 10:19:30.108248	2020-12-23 10:19:30.108248	2020-12-23	#3a8bc5	approved
816	second half	58	2020-12-23 00:00:00	54	2020-12-23 10:19:55.22589	2020-12-23 10:19:55.22589	2020-12-23	#000000	approved
817	full day	64	2020-12-05 00:00:00	54	2020-12-23 10:20:54.810656	2020-12-23 10:20:54.810656	2020-12-27	#3a8bc5	approved
818	full day	63	2020-12-28 00:00:00	54	2020-12-25 09:19:09.276143	2020-12-25 09:19:09.276143	2020-12-28	#3a8bc5	approved
819	second half	65	2020-12-31 00:00:00	51	2020-12-28 11:36:41.251053	2020-12-28 11:36:41.251053	2020-12-31	#000000	approved
820	full day	65	2021-01-01 00:00:00	51	2020-12-28 11:36:59.355865	2020-12-28 11:36:59.355865	2021-01-01	#3a8bc5	approved
821	second half	52	2021-01-01 00:00:00	18	2020-12-28 11:48:35.893403	2020-12-28 11:48:35.893403	2021-01-01	#000000	approved
822	full day	61	2021-01-07 00:00:00	54	2021-01-08 08:37:39.834252	2021-01-08 08:37:39.834252	2021-01-08	#3a8bc5	approved
823	full day	67	2021-01-25 00:00:00	51	2021-01-08 13:02:37.181835	2021-01-08 13:02:37.181835	2021-01-25	#3a8bc5	approved
824	full day	65	2021-01-28 00:00:00	51	2021-01-08 13:02:53.921498	2021-01-08 13:02:53.921498	2021-01-28	#3a8bc5	approved
825	full day	13	2021-01-04 00:00:00	18	2021-01-08 13:03:46.904733	2021-01-08 13:03:46.904733	2021-01-04	#3a8bc5	approved
826	full day	13	2021-01-07 00:00:00	18	2021-01-08 13:04:02.491428	2021-01-08 13:04:02.491428	2021-01-07	#3a8bc5	approved
827	full day	13	2021-01-18 00:00:00	18	2021-01-13 16:26:13.650516	2021-01-13 16:26:13.650516	2021-01-18	#3a8bc5	approved
828	full day	61	2021-01-18 00:00:00	54	2021-01-19 08:07:18.411316	2021-01-19 08:07:18.411316	2021-01-18	#3a8bc5	approved
829	full day	60	2021-01-25 00:00:00	54	2021-01-19 08:07:32.075065	2021-01-19 08:07:32.075065	2021-01-25	#3a8bc5	approved
830	full day	63	2021-01-25 00:00:00	54	2021-01-19 08:07:50.110272	2021-01-19 08:07:50.110272	2021-01-25	#3a8bc5	approved
831	full day	53	2020-12-01 00:00:00	52	2021-01-20 09:58:09.086045	2021-01-20 10:26:37.082093	2021-01-31	#3a8bc5	approved
832	full day	53	2021-02-01 00:00:00	52	2021-01-20 10:27:56.676299	2021-01-20 10:29:56.064129	2021-03-31	#3a8bc5	approved
833	full day	53	2021-04-01 00:00:00	52	2021-01-20 10:30:43.691005	2021-01-20 10:30:43.691005	2021-05-02	#3a8bc5	approved
834	full day	17	2021-01-21 00:00:00	16	2021-01-21 08:19:44.082158	2021-01-21 08:19:44.082158	2021-01-21	#3a8bc5	approved
835	second half	58	2021-01-22 00:00:00	51	2021-01-21 14:34:26.36451	2021-01-21 14:34:26.36451	2021-01-22	#000000	approved
836	full day	65	2021-01-30 00:00:00	51	2021-01-25 07:52:00.764232	2021-01-25 07:52:00.764232	2021-03-07	#3a8bc5	approved
837	full day	67	2021-02-01 00:00:00	51	2021-01-27 13:29:43.207501	2021-01-28 08:34:40.627088	2021-07-09	#3a8bc5	approved
839	full day	53	2021-03-02 00:00:00	52	2021-07-01 10:40:12.915085	2021-07-01 10:40:12.915085	2021-10-31	#3a8bc5	approved
\.


--
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: tps
--

COPY public.permissions (id, subject_class, action, name, created_at, updated_at) FROM stdin;
1	Degree	manage	manage	2020-09-02 12:57:35.877422	2020-09-02 12:57:35.877422
2	Degree	index	Read	2020-09-02 12:57:35.904983	2020-09-02 12:57:35.904983
4	Degree	create	Read-Write	2020-09-02 12:57:35.915032	2020-09-02 12:57:35.915032
5	Degree	update	Read-Write	2020-09-02 12:57:35.920209	2020-09-02 12:57:35.920209
6	Degree	destroy	Manage	2020-09-02 12:57:35.927329	2020-09-02 12:57:35.927329
7	Credential	manage	manage	2020-09-02 12:57:35.933168	2020-09-02 12:57:35.933168
8	Credential	index	Read	2020-09-02 12:57:35.938006	2020-09-02 12:57:35.938006
9	Credential	show	Read	2020-09-02 12:57:35.944589	2020-09-02 12:57:35.944589
10	Credential	create	Read-Write	2020-09-02 12:57:35.950743	2020-09-02 12:57:35.950743
11	Credential	update	Read-Write	2020-09-02 12:57:35.956677	2020-09-02 12:57:35.956677
12	Credential	destroy	Manage	2020-09-02 12:57:35.967823	2020-09-02 12:57:35.967823
13	EmployeeHandbook	manage	manage	2020-09-02 12:57:35.974467	2020-09-02 12:57:35.974467
14	EmployeeHandbook	index	Read	2020-09-02 12:57:35.980323	2020-09-02 12:57:35.980323
16	EmployeeHandbook	create	Read-Write	2020-09-02 12:57:36.005511	2020-09-02 12:57:36.005511
17	EmployeeHandbook	update	Read-Write	2020-09-02 12:57:36.010566	2020-09-02 12:57:36.010566
18	EmployeeHandbook	destroy	Manage	2020-09-02 12:57:36.017854	2020-09-02 12:57:36.017854
19	EventCategory	manage	manage	2020-09-02 12:57:36.031359	2020-09-02 12:57:36.031359
20	EventCategory	index	Read	2020-09-02 12:57:36.036794	2020-09-02 12:57:36.036794
22	EventCategory	create	Read-Write	2020-09-02 12:57:36.048821	2020-09-02 12:57:36.048821
23	EventCategory	update	Read-Write	2020-09-02 12:57:36.054814	2020-09-02 12:57:36.054814
24	EventCategory	destroy	Manage	2020-09-02 12:57:36.06372	2020-09-02 12:57:36.06372
25	ArrangeSession	manage	manage	2020-09-02 12:57:36.082174	2020-09-02 12:57:36.082174
26	ArrangeSession	index	Read	2020-09-02 12:57:36.092961	2020-09-02 12:57:36.092961
27	Designation	manage	manage	2020-09-02 12:57:36.100101	2020-09-02 12:57:36.100101
28	Designation	index	Read	2020-09-02 12:57:36.105708	2020-09-02 12:57:36.105708
30	Designation	create	Read-Write	2020-09-02 12:57:36.116365	2020-09-02 12:57:36.116365
31	Designation	update	Read-Write	2020-09-02 12:57:36.121759	2020-09-02 12:57:36.121759
32	Designation	destroy	Manage	2020-09-02 12:57:36.131083	2020-09-02 12:57:36.131083
33	AssetHistory	manage	manage	2020-09-02 12:57:36.141017	2020-09-02 12:57:36.141017
34	AssetHistory	update	Read-Write	2020-09-02 12:57:36.146645	2020-09-02 12:57:36.146645
35	AssetHistory	create	Read-Write	2020-09-02 12:57:36.152509	2020-09-02 12:57:36.152509
36	AssetHistory	destroy	Manage	2020-09-02 12:57:36.159338	2020-09-02 12:57:36.159338
37	AssetHistory	index	Read	2020-09-02 12:57:36.168267	2020-09-02 12:57:36.168267
39	Leave	manage	manage	2020-09-02 12:57:36.186112	2020-09-02 12:57:36.186112
40	Leave	index	Read	2020-09-02 12:57:36.193912	2020-09-02 12:57:36.193912
41	Leave	create	Read-Write	2020-09-02 12:57:36.203738	2020-09-02 12:57:36.203738
42	Leave	show	Read	2020-09-02 12:57:36.222327	2020-09-02 12:57:36.222327
44	Leave	destroy	Manage	2020-09-02 12:57:36.240099	2020-09-02 12:57:36.240099
45	User	manage	manage	2020-09-02 12:57:36.246582	2020-09-02 12:57:36.246582
46	User	index	Read	2020-09-02 12:57:36.262385	2020-09-02 12:57:36.262385
47	User	show	Read	2020-09-02 12:57:36.268185	2020-09-02 12:57:36.268185
48	User	create	Read-Write	2020-09-02 12:57:36.274649	2020-09-02 12:57:36.274649
49	User	update	Read-Write	2020-09-02 12:57:36.280592	2020-09-02 12:57:36.280592
50	User	destroy	Manage	2020-09-02 12:57:36.286377	2020-09-02 12:57:36.286377
51	Asset	manage	manage	2020-09-02 12:57:36.309852	2020-09-02 12:57:36.309852
52	Asset	index	Read	2020-09-02 12:57:36.314999	2020-09-02 12:57:36.314999
53	Asset	show	Read	2020-09-02 12:57:36.320212	2020-09-02 12:57:36.320212
54	Asset	create	Read-Write	2020-09-02 12:57:36.32594	2020-09-02 12:57:36.32594
55	Asset	update	Read-Write	2020-09-02 12:57:36.332692	2020-09-02 12:57:36.332692
56	Asset	destroy	Manage	2020-09-02 12:57:36.349384	2020-09-02 12:57:36.349384
57	CredentialType	manage	manage	2020-09-02 12:57:36.360546	2020-09-02 12:57:36.360546
58	CredentialType	index	Read	2020-09-02 12:57:36.376832	2020-09-02 12:57:36.376832
60	CredentialType	create	Read-Write	2020-09-02 12:57:36.399893	2020-09-02 12:57:36.399893
61	CredentialType	update	Read-Write	2020-09-02 12:57:36.405447	2020-09-02 12:57:36.405447
62	CredentialType	destroy	Manage	2020-09-02 12:57:36.415033	2020-09-02 12:57:36.415033
63	AssetType	manage	manage	2020-09-02 12:57:36.42112	2020-09-02 12:57:36.42112
64	AssetType	index	Read	2020-09-02 12:57:36.425893	2020-09-02 12:57:36.425893
66	AssetType	create	Read-Write	2020-09-02 12:57:36.44933	2020-09-02 12:57:36.44933
67	AssetType	update	Read-Write	2020-09-02 12:57:36.45483	2020-09-02 12:57:36.45483
68	AssetType	destroy	Manage	2020-09-02 12:57:36.462617	2020-09-02 12:57:36.462617
69	Bill	manage	manage	2020-09-02 12:57:36.470065	2020-09-02 12:57:36.470065
70	Bill	index	Read	2020-09-02 12:57:36.479455	2020-09-02 12:57:36.479455
71	Bill	show	Read	2020-09-02 12:57:36.503612	2020-09-02 12:57:36.503612
72	Bill	create	Read-Write	2020-09-02 12:57:36.510807	2020-09-02 12:57:36.510807
73	Bill	update	Read-Write	2020-09-02 12:57:36.517241	2020-09-02 12:57:36.517241
74	Bill	destroy	Manage	2020-09-02 12:57:36.535028	2020-09-02 12:57:36.535028
75	Vendor	manage	manage	2020-09-02 12:57:36.54441	2020-09-02 12:57:36.54441
76	Vendor	index	Read	2020-09-02 12:57:36.551991	2020-09-02 12:57:36.551991
77	Vendor	show	Read	2020-09-02 12:57:36.557886	2020-09-02 12:57:36.557886
78	Vendor	create	Read-Write	2020-09-02 12:57:36.564891	2020-09-02 12:57:36.564891
79	Vendor	update	Read-Write	2020-09-02 12:57:36.573459	2020-09-02 12:57:36.573459
80	Vendor	destroy	Manage	2020-09-02 12:57:36.582921	2020-09-02 12:57:36.582921
81	Department	manage	manage	2020-09-02 12:57:36.590132	2020-09-02 12:57:36.590132
82	Department	index	Read	2020-09-02 12:57:36.595669	2020-09-02 12:57:36.595669
84	Department	create	Read-Write	2020-09-02 12:57:36.606267	2020-09-02 12:57:36.606267
85	Department	update	Read-Write	2020-09-02 12:57:36.613053	2020-09-02 12:57:36.613053
86	Department	destroy	Manage	2020-09-02 12:57:36.62115	2020-09-02 12:57:36.62115
87	Document	manage	manage	2020-09-02 12:57:36.628323	2020-09-02 12:57:36.628323
88	Document	create	Read-Write	2020-09-02 12:57:36.635209	2020-09-02 12:57:36.635209
89	Document	destroy	Manage	2020-09-02 12:57:36.643565	2020-09-02 12:57:36.643565
91	Document	show	Read	2020-09-02 12:57:36.655019	2020-09-02 12:57:36.655019
99	FreeLeave	manage	manage	2020-09-02 12:57:36.721551	2020-09-02 12:57:36.721551
100	FreeLeave	create	Read-Write	2020-09-02 12:57:36.727322	2020-09-02 12:57:36.727322
101	FreeLeave	destroy	Manage	2020-09-02 12:57:36.732712	2020-09-02 12:57:36.732712
102	FreeLeave	index	Read	2020-09-02 12:57:36.739189	2020-09-02 12:57:36.739189
105	EventLink	manage	manage	2020-09-02 12:57:36.759922	2020-09-02 12:57:36.759922
106	EventLink	index	Read	2020-09-02 12:57:36.766546	2020-09-02 12:57:36.766546
108	EventLink	create	Read-Write	2020-09-02 12:57:36.782718	2020-09-02 12:57:36.782718
109	EventLink	update	Read-Write	2020-09-02 12:57:36.789321	2020-09-02 12:57:36.789321
110	EventLink	destroy	Manage	2020-09-02 12:57:36.809234	2020-09-02 12:57:36.809234
111	Project	manage	manage	2020-09-02 12:57:36.818643	2020-09-02 12:57:36.818643
112	Project	index	Read	2020-09-02 12:57:36.825792	2020-09-02 12:57:36.825792
114	Project	create	Read-Write	2020-09-02 12:57:36.8397	2020-09-02 12:57:36.8397
115	Project	update	Read-Write	2020-09-02 12:57:36.846135	2020-09-02 12:57:36.846135
116	Project	destroy	Manage	2020-09-02 12:57:36.856048	2020-09-02 12:57:36.856048
117	Holiday	manage	manage	2020-09-02 12:57:36.863399	2020-09-02 12:57:36.863399
118	Holiday	index	Read	2020-09-02 12:57:36.86949	2020-09-02 12:57:36.86949
120	Holiday	create	Read-Write	2020-09-02 12:57:36.882671	2020-09-02 12:57:36.882671
121	Holiday	update	Read-Write	2020-09-02 12:57:36.889865	2020-09-02 12:57:36.889865
122	Holiday	destroy	Manage	2020-09-02 12:57:36.900605	2020-09-02 12:57:36.900605
129	ConsultantHandbook	manage	manage	2022-06-06 04:40:02.413203	2022-06-06 04:40:02.413203
130	ConsultantHandbook	index	Read	2022-06-06 04:40:02.429613	2022-06-06 04:40:02.429613
131	ConsultantHandbook	create	Read-Write	2022-06-06 04:40:02.453108	2022-06-06 04:40:02.453108
132	ConsultantHandbook	update	Read-Write	2022-06-06 04:40:02.461095	2022-06-06 04:40:02.461095
133	ConsultantHandbook	destroy	Manage	2022-06-06 04:40:02.47389	2022-06-06 04:40:02.47389
134	Checklist	manage	manage	2022-06-20 06:31:55.327094	2022-06-20 06:31:55.327094
135	Checklist	index	Read	2022-06-20 06:31:55.464466	2022-06-20 06:31:55.464466
136	Checklist	create	Read-Write	2022-06-20 06:31:55.476123	2022-06-20 06:31:55.476123
137	Checklist	update	Read-Write	2022-06-20 06:31:55.488398	2022-06-20 06:31:55.488398
138	Checklist	destroy	Manage	2022-06-20 06:31:55.497889	2022-06-20 06:31:55.497889
\.


--
-- Data for Name: project_members; Type: TABLE DATA; Schema: public; Owner: tps
--

COPY public.project_members (id, project_id, user_id, created_at, updated_at) FROM stdin;
3	2	61	2020-04-16 11:32:29.700843	2020-04-16 11:32:29.700843
4	2	62	2020-04-16 11:32:29.706021	2020-04-16 11:32:29.706021
5	2	68	2020-04-16 11:32:29.713784	2020-04-16 11:32:29.713784
6	3	61	2020-04-16 11:35:14.247966	2020-04-16 11:35:14.247966
7	3	64	2020-04-16 11:35:14.250857	2020-04-16 11:35:14.250857
8	5	61	2020-06-13 09:55:41.438519	2020-06-13 09:55:41.438519
9	5	54	2020-06-13 09:55:41.457452	2020-06-13 09:55:41.457452
10	5	58	2020-06-13 09:55:41.465976	2020-06-13 09:55:41.465976
11	6	15	2020-06-16 05:32:12.474993	2020-06-16 05:32:12.474993
12	6	16	2020-06-16 05:32:12.477758	2020-06-16 05:32:12.477758
13	6	17	2020-06-16 05:32:12.479397	2020-06-16 05:32:12.479397
14	6	14	2020-06-16 05:32:12.481024	2020-06-16 05:32:12.481024
15	4	60	2020-06-23 20:14:01.942442	2020-06-23 20:14:01.942442
16	4	54	2020-06-23 20:14:01.948087	2020-06-23 20:14:01.948087
17	7	54	2020-07-24 05:51:33.72957	2020-07-24 05:51:33.72957
18	7	68	2020-07-24 05:51:33.735518	2020-07-24 05:51:33.735518
19	8	61	2020-07-31 13:28:01.89005	2020-07-31 13:28:01.89005
20	8	54	2020-07-31 13:28:01.900989	2020-07-31 13:28:01.900989
21	8	64	2020-07-31 13:28:01.90334	2020-07-31 13:28:01.90334
22	8	68	2020-07-31 13:28:01.906868	2020-07-31 13:28:01.906868
23	9	16	2020-08-13 17:59:05.439589	2020-08-13 17:59:05.439589
24	9	17	2020-08-13 17:59:05.459633	2020-08-13 17:59:05.459633
25	9	14	2020-08-13 17:59:05.462276	2020-08-13 17:59:05.462276
26	10	18	2020-08-13 18:01:21.127777	2020-08-13 18:01:21.127777
27	11	18	2020-08-19 14:38:13.257448	2020-08-19 14:38:13.257448
28	12	54	2020-08-19 14:39:40.783207	2020-08-19 14:39:40.783207
29	12	58	2020-08-19 14:39:40.78525	2020-08-19 14:39:40.78525
30	12	68	2020-08-19 14:39:40.787345	2020-08-19 14:39:40.787345
31	13	18	2020-09-07 10:49:34.979078	2020-09-07 10:49:34.979078
32	14	55	2020-09-07 10:51:07.937715	2020-09-07 10:51:07.937715
33	15	60	2020-09-10 07:57:27.613003	2020-09-10 07:57:27.613003
34	16	64	2020-09-10 07:58:43.784163	2020-09-10 07:58:43.784163
\.


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: tps
--

COPY public.projects (id, name, description, department_id, manager, client_name, start_date, end_date, status, created_at, updated_at) FROM stdin;
5	Adam Wilkey	Wordpress website and Booking Engine development in Laravel.	3	Bhaumik Gadani	Adam Wilkey	2019-03-18	\N	Active	2020-06-13 09:55:41.421607	2020-06-13 09:56:25.234818
6	Tatvasoft	Tatvasoft RoR Resource Onsite and Offsite	1	Bhaumik Gadani	Tatvasoft	2017-01-09	\N	Active	2020-06-16 05:32:12.470838	2020-06-16 05:32:12.470838
8	Ortho	Ortho Project for the medial industry	3	Bhaumik Gadani	Jignesh Zala	2019-11-18	2020-06-10	Completed	2020-07-31 13:28:01.875979	2020-07-31 13:28:01.875979
11	F2F Event Responsive	F2F Event Responsive	4	Bhaumik Gadani	Fibre2Fashion	2020-08-07	2020-08-17	Completed	2020-08-19 14:38:13.25244	2020-08-19 14:38:13.25244
7	JK Systems	JK Systems website and logo design	3	Jigar Patel	Jignesh Kher	2020-07-20	2020-08-07	Completed	2020-07-24 05:51:33.619528	2020-08-26 12:30:02.647777
13	Janaki Foods SEO + Social Media	Janaki Food Social Media + SEO	4	Bhaumik Gadani	Janaki Foods	2020-09-07	\N	Active	2020-09-07 10:49:34.974711	2020-09-07 10:49:34.974711
14	Silicon Monthly Contract	Silicon IT Monthly Contract	3	Bhaumik Gadani	Silicon IT Hub	2020-09-07	\N	Active	2020-09-07 10:51:07.935013	2020-09-07 10:51:07.935013
12	CMAI - Form Changes	CMAI Form changes modification	3	Jigar Patel	Fibre2Fashion	2020-07-28	2020-08-31	Completed	2020-08-19 14:39:40.779343	2020-09-10 07:55:34.395198
2	GuniGuru	Kachhua Project	3	Bhaumik Gadani	Kachhua	2020-03-01	\N	Active	2020-04-16 11:31:52.348295	2020-09-10 07:57:45.044642
16	Guniguru Maintainance	Guniguru Maintenance Project	3	Bhaumik Gadani	Kachhua	2020-09-10	\N	Active	2020-09-10 07:58:43.779728	2020-09-10 07:58:43.779728
17	Kitchener Immigration Services	Immigration Site Development + Bokking system	3	Bhaumik Gadani	Harsh - Canada	2020-10-10	\N	Active	2020-10-10 13:46:24.674377	2020-10-10 13:46:24.674377
3	CarBooking	Car Booking 	3	Bhaumik Gadani	Techplus Software	2020-02-01	2020-03-31	Completed	2020-04-16 11:35:14.244975	2020-12-04 22:09:35.323385
9	Etyme	Etyme RoR Project Monthly	1	Bhaumik Gadani	Sharath	2020-08-10	2020-09-30	Completed	2020-08-13 17:59:05.431176	2020-12-04 22:09:54.870257
15	Agro Project	Agro project monthly contract	3	Bhaumik Gadani	Kachhua	2020-09-10	2020-12-10	Completed	2020-09-10 07:57:27.604385	2020-12-04 22:10:20.065294
4	Smart Print Solution	Smart Print Solution for Online Print	3	Jigar Patel	Hitesh	2020-06-01	2020-10-31	Completed	2020-06-03 06:06:46.168223	2020-12-04 22:11:12.294005
10	Talent Plus Academy	Talent Plus Academy - Logo Designing	4	Bhaumik Gadani	Sonal Patel	2020-08-12	2020-08-31	Completed	2020-08-13 18:01:21.124647	2020-12-04 22:11:36.212557
\.


--
-- Data for Name: role_permissions; Type: TABLE DATA; Schema: public; Owner: tps
--

COPY public.role_permissions (id, permission_id, role_id, created_at, updated_at) FROM stdin;
136	71	4	2020-09-30 09:57:48.962209	2020-09-30 09:57:48.962209
137	14	4	2020-09-30 09:58:01.425429	2020-09-30 09:58:01.425429
3	39	1	2020-09-04 09:56:13.993864	2020-09-04 09:56:13.993864
4	25	1	2020-09-06 18:41:08.733495	2020-09-06 18:41:08.733495
5	51	1	2020-09-06 18:41:13.043063	2020-09-06 18:41:13.043063
6	33	1	2020-09-06 18:41:13.951393	2020-09-06 18:41:13.951393
7	63	1	2020-09-06 18:41:18.446815	2020-09-06 18:41:18.446815
8	69	1	2020-09-06 18:41:19.985504	2020-09-06 18:41:19.985504
9	7	1	2020-09-06 18:41:22.433496	2020-09-06 18:41:22.433496
10	57	1	2020-09-06 18:41:47.433692	2020-09-06 18:41:47.433692
11	1	1	2020-09-06 18:41:48.275988	2020-09-06 18:41:48.275988
12	81	1	2020-09-06 18:41:50.838436	2020-09-06 18:41:50.838436
13	27	1	2020-09-06 18:41:52.669444	2020-09-06 18:41:52.669444
14	87	1	2020-09-06 18:41:53.480163	2020-09-06 18:41:53.480163
15	13	1	2020-09-06 18:41:54.340205	2020-09-06 18:41:54.340205
16	19	1	2020-09-06 18:41:54.949453	2020-09-06 18:41:54.949453
17	105	1	2020-09-06 18:41:55.785962	2020-09-06 18:41:55.785962
18	99	1	2020-09-06 18:41:56.492813	2020-09-06 18:41:56.492813
19	117	1	2020-09-06 18:41:57.169856	2020-09-06 18:41:57.169856
20	111	1	2020-09-06 18:41:58.17596	2020-09-06 18:41:58.17596
21	45	1	2020-09-06 18:41:58.92539	2020-09-06 18:41:58.92539
138	106	4	2020-09-30 09:58:07.200045	2020-09-30 09:58:07.200045
23	75	1	2020-09-06 18:42:01.577548	2020-09-06 18:42:01.577548
139	118	4	2020-09-30 09:58:12.527913	2020-09-30 09:58:12.527913
25	53	3	2020-09-06 18:42:29.838163	2020-09-06 18:42:29.838163
140	40	4	2020-09-30 09:58:13.413362	2020-09-30 09:58:13.413362
27	9	3	2020-09-06 18:42:41.81336	2020-09-06 18:42:41.81336
141	46	4	2020-09-30 09:58:21.880252	2020-09-30 09:58:21.880252
142	47	4	2020-09-30 09:58:22.673867	2020-09-30 09:58:22.673867
143	49	4	2020-09-30 09:58:23.933055	2020-09-30 09:58:23.933055
32	42	3	2020-09-06 18:43:06.385704	2020-09-06 18:43:06.385704
35	47	3	2020-09-06 18:43:13.267142	2020-09-06 18:43:13.267142
36	26	1	2020-09-06 18:44:01.076255	2020-09-06 18:44:01.076255
37	52	1	2020-09-06 18:44:02.195866	2020-09-06 18:44:02.195866
38	37	1	2020-09-06 18:44:03.420004	2020-09-06 18:44:03.420004
39	64	1	2020-09-06 18:44:04.9642	2020-09-06 18:44:04.9642
40	70	1	2020-09-06 18:44:06.149305	2020-09-06 18:44:06.149305
41	8	1	2020-09-06 18:44:06.816233	2020-09-06 18:44:06.816233
42	58	1	2020-09-06 18:44:07.442849	2020-09-06 18:44:07.442849
43	2	1	2020-09-06 18:44:09.262086	2020-09-06 18:44:09.262086
44	82	1	2020-09-06 18:44:09.901035	2020-09-06 18:44:09.901035
45	28	1	2020-09-06 18:44:10.588958	2020-09-06 18:44:10.588958
47	14	1	2020-09-06 18:44:12.02601	2020-09-06 18:44:12.02601
48	20	1	2020-09-06 18:44:12.676851	2020-09-06 18:44:12.676851
49	106	1	2020-09-06 18:44:13.563403	2020-09-06 18:44:13.563403
50	102	1	2020-09-06 18:44:14.39495	2020-09-06 18:44:14.39495
51	118	1	2020-09-06 18:44:16.241275	2020-09-06 18:44:16.241275
52	40	1	2020-09-06 18:44:17.172681	2020-09-06 18:44:17.172681
53	112	1	2020-09-06 18:44:17.931618	2020-09-06 18:44:17.931618
54	46	1	2020-09-06 18:44:18.683155	2020-09-06 18:44:18.683155
56	76	1	2020-09-06 18:44:21.849326	2020-09-06 18:44:21.849326
57	25	3	2020-09-06 18:44:35.060224	2020-09-06 18:44:35.060224
58	52	3	2020-09-06 18:44:44.88834	2020-09-06 18:44:44.88834
59	8	3	2020-09-06 18:44:48.283335	2020-09-06 18:44:48.283335
60	58	3	2020-09-06 18:44:48.811343	2020-09-06 18:44:48.811343
61	14	3	2020-09-06 18:44:50.428882	2020-09-06 18:44:50.428882
62	106	3	2020-09-06 18:44:52.470349	2020-09-06 18:44:52.470349
63	102	3	2020-09-06 18:44:53.203911	2020-09-06 18:44:53.203911
64	118	3	2020-09-06 18:44:55.361885	2020-09-06 18:44:55.361885
65	40	3	2020-09-06 18:44:56.468115	2020-09-06 18:44:56.468115
66	112	3	2020-09-06 18:44:57.176884	2020-09-06 18:44:57.176884
67	46	3	2020-09-06 18:44:59.232646	2020-09-06 18:44:59.232646
112	46	2	2020-09-14 12:15:39.358786	2020-09-14 12:15:39.358786
114	118	2	2020-09-14 12:15:50.196203	2020-09-14 12:15:50.196203
116	14	2	2020-09-14 12:16:19.798644	2020-09-14 12:16:19.798644
122	47	2	2020-09-14 12:21:24.360567	2020-09-14 12:21:24.360567
123	40	2	2020-09-14 12:29:59.497332	2020-09-14 12:29:59.497332
129	49	2	2020-09-15 05:28:15.326328	2020-09-15 05:28:15.326328
131	106	2	2020-09-30 09:23:59.546362	2020-09-30 09:23:59.546362
132	51	4	2020-09-30 09:56:38.264377	2020-09-30 09:56:38.264377
133	7	4	2020-09-30 09:56:44.84804	2020-09-30 09:56:44.84804
134	37	2	2020-09-30 09:57:00.439144	2020-09-30 09:57:00.439144
135	37	4	2020-09-30 09:57:04.888958	2020-09-30 09:57:04.888958
147	130	1	2022-06-06 04:43:33.283097	2022-06-06 04:43:33.283097
148	129	1	2022-06-06 04:44:02.423176	2022-06-06 04:44:02.423176
149	134	1	2022-06-20 06:35:37.058264	2022-06-20 06:35:37.058264
150	135	1	2022-06-20 06:35:37.888127	2022-06-20 06:35:37.888127
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: tps
--

COPY public.roles (id, name, created_at, updated_at) FROM stdin;
2	user	2019-08-28 10:32:49.492993	2019-08-28 10:32:49.492993
3	project_manager	2019-11-05 11:07:40.273345	2019-11-05 11:07:40.273345
4	team_leader	2019-11-05 11:07:50.951061	2019-11-05 11:07:50.951061
1	admin	2019-08-28 10:32:49.485276	2020-09-07 06:24:46.14859
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: tps
--

COPY public.schema_migrations (version) FROM stdin;
20190805110949
20190805113517
20190806055916
20190806060231
20190812115204
20190814125028
20190816044507
20190827114348
20190829092916
20190903111840
20190909062655
20190909104522
20190916095951
20190925052331
20191002110107
20191002110118
20191002110156
20191002115748
20191219094112
20191225095143
20191224045947
20200110045546
20200110111146
20200113123203
20200116045438
20200123083911
20200123102205
20200127071725
20200127072622
20200127110934
20200131130118
20200203035125
20200413094413
20200415094739
20200415120320
20200526065432
20200609113055
20200609113343
20200611083713
20200611123923
20200619091527
20200619105312
20200619110640
20200619121049
20200622064113
20200624070638
20200626052141
20200626114213
20200709104629
20200729125506
20200811064618
20200811091553
20210527112636
20210727043220
20220606041141
20220614051036
20220614051459
20220622064013
20220624064019
20220704060815
20220722070757
\.


--
-- Data for Name: user_designations; Type: TABLE DATA; Schema: public; Owner: tps
--

COPY public.user_designations (id, designation_id, department_id, mentor, start_date, end_date, user_id, is_current, created_at, updated_at) FROM stdin;
1	5	1	18	2019-01-01 00:00:00	\N	16	t	2020-01-13 13:01:58.364878	2020-01-13 13:01:58.364878
2	12	2	51	\N	\N	69	t	2020-01-29 12:30:53.425647	2020-01-29 12:30:53.425647
3	6	3	54	2017-05-15 00:00:00	2019-03-31 00:00:00	61	\N	2020-01-29 12:40:05.43393	2020-01-29 12:40:05.43393
5	54	11	18	2016-05-09 00:00:00	2019-03-31 00:00:00	57	\N	2020-01-29 12:49:19.47374	2020-01-29 12:49:19.47374
7	55	3	54	2015-05-07 00:00:00	2019-03-31 00:00:00	55	\N	2020-01-29 12:52:53.109221	2020-01-29 12:52:53.109221
8	3	3	54	2019-04-01 00:00:00	\N	55	t	2020-01-29 12:53:39.358237	2020-01-29 12:53:39.358237
9	56	3	54	2017-05-02 00:00:00	2019-03-31 00:00:00	60	\N	2020-01-29 12:55:32.203684	2020-01-29 12:55:32.203684
11	12	2	51	2018-05-21 00:00:00	\N	66	t	2020-01-29 12:57:53.805352	2020-01-29 12:57:53.805352
12	5	3	18	2012-11-26 00:00:00	2019-03-31 00:00:00	54	\N	2020-01-29 12:59:30.036466	2020-01-29 12:59:30.036466
13	20	3	18	2019-04-01 00:00:00	\N	54	t	2020-01-29 12:59:53.171095	2020-01-29 12:59:53.171095
14	12	2	51	2017-03-20 00:00:00	2019-03-31 00:00:00	59	\N	2020-01-29 13:00:47.143338	2020-01-29 13:00:47.143338
15	11	2	51	2019-04-01 00:00:00	\N	59	t	2020-01-29 13:01:10.238273	2020-01-29 13:16:44.103683
16	56	1	16	2016-05-09 00:00:00	2019-03-31 00:00:00	15	\N	2020-01-29 13:21:15.495926	2020-01-29 13:21:15.495926
17	53	1	16	2019-04-01 00:00:00	\N	15	t	2020-01-29 13:21:53.24112	2020-01-29 13:21:53.24112
18	12	2	51	2019-03-25 00:00:00	\N	67	t	2020-01-29 13:33:23.375982	2020-01-29 13:33:23.375982
19	57	5	18	2015-03-09 00:00:00	2019-03-31 00:00:00	13	\N	2020-01-29 13:35:12.995209	2020-01-29 13:35:12.995209
20	13	5	18	2019-04-01 00:00:00	\N	13	t	2020-01-29 13:35:32.958434	2020-01-29 13:35:32.958434
21	56	3	54	2018-01-22 00:00:00	2019-03-31 00:00:00	63	\N	2020-01-29 13:39:05.010743	2020-01-29 13:39:05.010743
23	58	8	18	2012-10-01 00:00:00	2019-03-31 00:00:00	51	\N	2020-01-29 13:56:20.665339	2020-01-29 13:56:20.665339
25	56	1	16	2017-06-05 00:00:00	2019-03-31 00:00:00	17	\N	2020-01-29 14:01:13.54728	2020-01-29 14:01:13.54728
26	3	1	16	2019-04-01 00:00:00	\N	17	t	2020-01-29 14:01:55.493635	2020-01-29 14:01:55.493635
27	54	11	18	2017-05-15 00:00:00	2019-03-31 00:00:00	62	\N	2020-01-29 14:02:53.390313	2020-01-29 14:02:53.390313
28	8	9	18	2019-04-01 00:00:00	\N	62	t	2020-01-29 14:03:18.035773	2020-01-30 03:54:59.61095
29	59	9	18	2019-10-21 00:00:00	\N	68	t	2020-02-03 11:18:03.971023	2020-02-03 11:23:01.466556
30	12	2	51	2018-05-21 00:00:00	\N	65	t	2020-02-04 08:51:51.148252	2020-02-04 08:51:51.148252
31	14	4	18	2011-06-13 00:00:00	\N	18	t	2020-02-05 07:43:34.706064	2020-02-05 07:43:34.706064
32	14	4	1	2011-06-13 00:00:00	\N	1	t	2020-02-05 07:45:51.414628	2020-02-05 07:45:51.414628
33	10	7	52	2019-08-08 00:00:00	\N	53	t	2020-02-21 11:12:56.806849	2020-02-21 11:13:05.127357
34	56	3	54	2017-02-20 00:00:00	2019-03-31 00:00:00	58	\N	2020-02-21 11:16:01.197949	2020-02-21 11:16:01.197949
35	53	3	54	2019-04-01 00:00:00	\N	58	t	2020-02-21 11:18:01.833263	2020-02-21 11:18:01.833263
36	56	1	16	2018-02-26 00:00:00	2019-03-31 00:00:00	14	\N	2020-02-21 11:19:28.465692	2020-02-21 11:19:28.465692
37	53	1	16	2019-04-01 00:00:00	\N	14	t	2020-02-21 11:20:09.399744	2020-02-21 11:20:09.399744
38	56	3	54	2018-05-14 00:00:00	2019-03-31 00:00:00	64	\N	2020-02-21 11:39:20.273014	2020-02-21 11:39:20.273014
39	6	3	54	2019-04-01 00:00:00	\N	64	t	2020-02-21 11:40:37.81162	2020-02-21 11:40:37.81162
40	54	11	18	2016-05-16 00:00:00	2019-03-31 00:00:00	52	\N	2020-02-21 11:42:39.725449	2020-02-21 11:42:39.725449
22	6	3	54	2019-04-01 00:00:00	\N	63	t	2020-01-29 13:39:44.534476	2020-05-17 18:55:36.213361
42	4	8	18	2020-04-01 00:00:00	\N	51	t	2020-06-03 10:15:11.498218	2020-06-03 10:16:20.867463
43	60	8	18	2020-04-01 00:00:00	\N	57	t	2020-06-03 10:21:39.902277	2020-06-03 10:21:39.902277
44	61	7	18	2020-04-01 00:00:00	\N	52	t	2020-06-03 10:23:53.858316	2020-06-03 10:23:53.858316
45	62	3	54	2020-04-01 00:00:00	\N	61	t	2020-06-03 10:30:05.861142	2020-06-03 10:30:05.861142
46	62	3	54	2020-04-01 00:00:00	\N	60	t	2020-06-03 10:31:03.509101	2020-06-03 10:31:03.509101
10	53	3	54	2019-04-01 00:00:00	2020-03-31 00:00:00	60	f	2020-01-29 12:56:21.480852	2020-06-03 11:33:49.045691
4	53	3	54	2019-04-01 00:00:00	2020-03-31 00:00:00	61	f	2020-01-29 12:40:53.087183	2020-06-03 11:35:31.588654
6	7	9	18	2019-04-01 00:00:00	2020-03-31 00:00:00	57	f	2020-01-29 12:50:03.234011	2020-06-03 11:36:06.166359
24	20	8	18	2019-04-01 00:00:00	2020-03-31 00:00:00	51	f	2020-01-29 13:56:48.072607	2020-06-03 11:36:46.948472
41	9	7	18	2019-04-01 00:00:00	2020-03-31 00:00:00	52	f	2020-02-21 11:43:22.599074	2020-06-05 11:21:40.332874
47	53	3	54	2020-07-01 00:00:00	\N	63	t	2020-07-01 18:49:48.71904	2020-07-01 18:49:48.71904
\.


--
-- Data for Name: user_reports; Type: TABLE DATA; Schema: public; Owner: tps
--

COPY public.user_reports (id, start_time, end_time, date, detail, total_hours, project_member_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: tps
--

COPY public.users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, first_name, last_name, personal_email, comp_email, emergency_contact, contact, birthday, marital_status, anniversary_date, join_date, job_status, address, college, mentor, adhar_no, pan_no, user_type, created_at, updated_at, role_id, company_id, leave_bal, leave_added_on, experience, gender, emp_code, degree_id, department_id, designation_id, leave_report_added_on, is_event_manager, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, resign_date, resign_reason) FROM stdin;
14	tanaysharma2627@gmail.com	$2a$11$ousr7oLgkVRl2AvlyH3VseysXuWI.ha.XGacLSxRAQ5MOuxt.Wmse	\N	\N	\N	Tanay	Sharma	\N	tanay@techplusteam.com	9829795432	9509840433	1994-10-26 00:00:00	Single	\N	2018-02-26 00:00:00	Inactive		\N	16		GDHPS8884Q	Employee	2019-10-11 12:11:00.898194	2020-11-12 11:09:47.631817	2	\N	8	2019-12-11 00:00:00	2	male	TPS-52-18	7	1	3	\N	f	24	2020-10-02 06:03:03.513279	2020-09-14 12:23:20.333016	157.47.143.179	157.37.151.214	\N	\N
56	sohampandya37@yahoo.in	$2a$11$GkgnDxjzDvM.EJEYRie4POXUX5wLZ4KUNcacShUnGlAxgYIHFrIhW	\N	\N	\N	Soham	Pandya	\N	soham@techplusteam.com	9375298965	8141910844	1992-03-24 00:00:00	Single	\N	2015-05-15 00:00:00	Inactive	Ahmedabad	\N	18			Employee	2019-12-10 14:20:47.95906	2020-01-21 10:30:48.203363	2	\N	-1.5	2019-12-11 00:00:00	0	male	TPS-32-15	2	9	8	\N	f	0	\N	\N	\N	\N	\N	\N
62	prashant.shah.20000@gmail.com	$2a$11$oYm7hjA5EJkEdl1O0XvoAOauiQiTm5r6Wd6xTb6wIvDzk6ESsHXiG	\N	\N	\N	Prashant	Shah	\N	prashant@techplusteam.com	9924029100	9978858182	1995-08-02 00:00:00	Single	\N	2017-05-15 00:00:00	Inactive	Ahmedabad	\N	18			Employee	2019-12-13 09:43:27.711199	2020-05-11 06:54:55.748344	2	\N	2	\N	0	male	TPS-48-17	10	9	8	\N	f	0	\N	\N	\N	\N	\N	\N
66	shahhoney1996@gmail.com	$2a$11$ukmEVd38aeL5vggHWMrvuuEKB/pzSYp39KFnSIPLHDUYC3wYbWtKm	\N	\N	\N	Honey	Shah	\N	honey@techplusteam.com	8732925586	8732925586	1995-12-12 00:00:00	Single	\N	2018-05-21 00:00:00	Active	Ahmedabad	\N	51	253118124437	KHJPS2968R	Employee	2019-12-13 10:02:11.466266	2022-07-22 05:59:46.709669	2	\N	2	\N	1	female	TPS-57-18	10	2	12	\N	f	19	2021-01-17 18:36:24.302168	2021-01-11 06:44:20.415909	49.34.209.57	157.32.223.235	\N	\N
63	niki.vagadiya07@gmail.com	$2a$11$F.Zx6SHZRv9tytul9MTryeG9jtXAA1R2Hi5h.FeU56NR9YGk31KyK	\N	\N	\N	Nikita	Vagadiya	\N	nikitav.tps@gmail.com	9429021413	8488869250	1997-10-07 00:00:00	Single	\N	2018-01-22 00:00:00	Active	Ahmedabad	\N	54	901941160394	BAMPV9270J	Employee	2019-12-13 09:54:31.076786	2022-07-22 05:59:46.795027	2	\N	2	\N	1	female	TPS-51-18	11	3	6	\N	f	38	2021-01-27 04:33:18.735378	2021-01-06 07:55:30.065443	157.32.225.243	49.34.155.187	\N	\N
59	karan.dave911@gmail.com	$2a$11$mRJLxobntKTSGosIgr8nLOs9XL.xq74mubIRL6lUhr0gQIokzO.yu	\N	\N	2020-10-02 11:19:42.613407	Karan 	Dave	\N	karan@techplusteam.com	7405586516	7405586516	1991-10-27 00:00:00	Married	2019-04-11 00:00:00	2017-03-20 00:00:00	Active	Ahmedabad	\N	51		ATQPD2721C	Employee	2019-12-11 09:16:14.998722	2022-07-22 05:59:46.90291	2	\N	2	2019-12-11 00:00:00	2.20000000000000018	male	TPS-44-17	10	2	11	\N	f	36	2021-01-11 04:52:07.050084	2020-12-23 07:46:40.238531	103.240.169.23	43.250.165.172	\N	\N
53	carpenterrajeshree@gmail.com	$2a$11$W.SXaOhZngzCF.ChRdl2eOjV7EYEmcWRMahVfHf1J.qriGRkWMfMy	\N	\N	\N	Rajeshree	Gajjar	\N	rajeshreetps@outlook.com	8530453855	7574020113	1997-03-27 00:00:00	Married	2019-05-26 00:00:00	2019-08-08 00:00:00	Active	Ahmedabad	\N	52	884899586571	BTPPC2362G	Employee	2019-11-11 11:21:43.605438	2022-07-22 05:59:47.008882	2	\N	2	2019-12-11 00:00:00	2	female	TPS-59-19	6	7	10	\N	f	65	2021-01-20 11:41:19.206295	2021-01-20 10:15:46.216284	223.189.66.87	223.189.66.87	\N	\N
64	vatsal.tps@gmail.com	$2a$11$MTbFei9Ocp7kcHYTFU3e1u2U3lZC371TPRfjnDid2WP/A4Sr6rcF.	\N	\N	\N	Vatsal	Rami	\N	vatsal@techplusteam.com	8905260536	8905260536	1995-09-15 00:00:00	Single	\N	2018-05-14 00:00:00	Active	Ahmedabad	\N	54	583775982586	CBCPR3896Q	Employee	2019-12-13 09:57:26.162591	2022-07-22 05:59:47.127634	2	\N	2	\N	0	male	TPS-54-18	10	3	6	\N	f	42	2021-01-25 04:58:25.122757	2021-01-22 07:40:02.418953	103.226.185.174	103.226.185.174	\N	\N
57	binolimodi@gmail.com	$2a$11$Qn4aFO9w9LEm5jdGh0Np3ujyyEFWrRfwg/A70tZYXJU4OJF2EKfvC	\N	\N	\N	Binoli 	Modi	\N	binoli@techplusteam.com	9327054541	9601260318	1993-11-30 00:00:00	Married	2018-06-02 00:00:00	2016-05-09 00:00:00	Active	Ahmedabad	\N	18		BYBPM1446C	Employee	2019-12-10 14:26:48.336882	2022-07-22 05:59:47.214025	4	\N	2	2019-12-11 00:00:00	0	female	TPS-41-16	10	9	7	\N	f	0	\N	\N	\N	\N	\N	\N
1	hemali.chauhan5@gmail.com	$2a$11$4uxB.1LmWnjIQk6VPwbZ0u2Wjxd1nGS8pIPZxilLnt13R4WBImT8K	\N	\N	\N	Hemali	Bhaumik	\N	hemali.chauhan5@gmail.com	9426413898	9974141958	1987-05-05 00:00:00	Married	2010-08-15 00:00:00	2011-06-13 00:00:00	Active	81, Shaivali society, Near Dena bank, Jivrajpark, Ahmedabad - 380051	\N	1			Director	2019-08-28 10:32:49.71025	2022-07-22 05:59:48.448278	1	\N	0	2019-11-07 00:00:00	10	female	TPS-02-2013	10	4	14	2022-07-01 00:00:00	f	0	\N	\N	\N	\N	\N	\N
52	viral3993@gmail.com	$2a$11$89pl8N7i6hT5bRian1V5/.McoiDYM7fpxOdvErfLT7v9Hq24B6x8e	\N	\N	\N	Viral 	Panchal	\N	viral@techplusteam.com	9427608695	9409602632	1993-09-03 00:00:00	Single	\N	2016-05-16 00:00:00	Active	Ahmedabad	\N	18	397057581033	DEMPP0427P	Employee	2019-11-11 10:56:07.707175	2022-07-22 05:59:47.346519	4	\N	2	2019-12-11 00:00:00	0	male	TPS-36-16	10	7	9	\N	f	7	2020-10-02 05:34:31.870643	2020-10-02 05:32:39.370919	157.32.248.176	203.88.145.144	\N	\N
55	chintan.kulkarni@yahoo.in	$2a$11$CM2.A5QxO.BLMoRY1w8ZhuQLA1/Ss.KemEtSSISsNIbQSZ1ZiWeMq	\N	\N	\N	Chintan	Kulkarni	\N	chintan@techplusteam.com	8980409248	8866362403	1993-01-29 00:00:00	Married	2017-12-03 00:00:00	2015-05-07 00:00:00	Active	Ahmedabad	\N	54		DNDPK2945F	Employee	2019-12-10 14:15:48.987387	2022-07-22 05:59:47.428331	2	\N	2	2019-12-11 00:00:00	0	male	TPS-31-15	10	3	3	\N	f	11	2020-05-21 07:58:46.358175	2020-05-15 04:29:00.310649	106.213.246.160	223.189.67.33	\N	\N
67	labdhi0747@gmail.com	$2a$11$Cj7AfYAyKDAANY/oBQ7Vk.tZxdT2y5bdfkw2cqMh.TbHXxCQ9NqeS	\N	\N	\N	Labdhi	Shah	\N	labdhitps@outlook.com	9825852622	7043140304	1996-10-26 00:00:00	Single	\N	2019-03-25 00:00:00	Active	Ahmedabad	\N	51	339431773394	GFOPS1617L	Employee	2019-12-13 10:09:10.17562	2022-07-22 05:59:47.501893	2	\N	2	\N	0.800000000000000044	female	TPS-58-19	10	2	12	\N	f	59	2021-01-11 09:19:53.864145	2020-12-28 13:16:30.083637	49.34.10.20	157.32.11.17	\N	\N
51	pareshgandhi28@gmail.com	$2a$11$xmmNHv6R1dmXpZGx3LeeyOt31pB713sOt/EcUbgt1asv96zlPGZyG	\N	\N	\N	Paresh	Gandhi	\N	paresh@techplusteam.com	9426030772	9898750088	1982-10-17 00:00:00	Married	2019-05-25 00:00:00	2012-10-01 00:00:00	Active	Ahemedabad	\N	18	898576277385	AMOPG0961C	Employee	2019-11-11 10:01:07.534932	2022-07-22 05:59:47.569442	3	\N	2	2019-12-11 00:00:00	0	male	TPS-08-12	4	2	4	\N	t	52	2021-01-27 13:07:08.930535	2020-12-15 14:52:02.619406	1.22.140.245	103.238.104.247	\N	\N
54	jigar@techplusteam.com	$2a$11$Zgz/HWitvh/mF.yt91AEMe0YxQXo46EjU.es3x9i.1wnrLJuTs3hu	\N	\N	\N	Jigar	Patel	\N	jigar@techplusteam.com	9428113124	9428113124	1982-10-26 00:00:00	Married	2019-01-31 00:00:00	2012-11-26 00:00:00	Active	Ahmedabad	\N	18	606151416436	AOQPP3559K	Employee	2019-12-10 14:12:18.661909	2022-07-22 05:59:47.646235	4	\N	2	2019-12-11 00:00:00	1	male	TPS-09-12	2	3	20	\N	f	0	\N	\N	\N	\N	\N	\N
13	nehapatadiya24@gmail.com	$2a$11$/RPUC0aScK1YMCHqinie3.Qo8tyKDhBvEaXLy1P013lkmNlZ.mjQ2	\N	\N	\N	Neha	Patadiya	\N	neha1.tps@gmail.com	9879094895	8154836290	1991-06-24 00:00:00	Single	\N	2015-03-09 00:00:00	Active	17, Pareshpark society,, Gebanshah pir, isanpur, vatva road	\N	18	947642943106	DEXPP1634B	Employee	2019-10-11 10:31:25.984242	2022-07-22 05:59:48.462281	1	\N	2	2019-12-10 00:00:00	1	female	TPS-23-15	3	5	13	2022-07-01 00:00:00	f	220	2021-01-27 11:37:12.372381	2021-01-25 07:49:50.788694	113.193.202.113	49.34.190.54	\N	\N
65	unnati9896@gmail.com	$2a$11$uYd9xWfr6G0KQy8rWMoKeODwxMwflKyseTEiWqy2BffTEQqtc5JWC	\N	\N	2020-07-16 05:11:09.619779	Unnati	Shah	\N	unnati@techplusteam.com	8460940552	8460940552	1996-08-09 00:00:00	Single	\N	2018-05-21 00:00:00	Active	Ahmedabad	\N	51	253923821404	HWOPS7095Q	Employee	2019-12-13 09:59:44.6481	2022-07-22 05:59:47.702911	2	\N	2	\N	0	female	TPS-56-18	10	2	12	\N	f	14	2021-01-11 06:45:49.318117	2020-12-21 04:54:56.12683	106.77.93.199	106.77.68.158	\N	\N
16	nencywadhvana@gmail.com	$2a$11$vi/k9rUx3C3f8qDwK933eeuNTvddM..7DuuiS7M0ZpVeDDYHYJOem	\N	\N	\N	Nency	Wadhvana	\N	nency@techplusteam.com	9429616132	9426601009	1994-05-24 00:00:00	Married	2019-02-26 00:00:00	2016-05-09 00:00:00	Active	Chandra Nagar, Ahmedabad	\N	18		ACRPW2145D	Employee	2019-10-22 08:27:46.836539	2022-07-22 05:59:47.778096	4	\N	2	2019-12-11 00:00:00	0	female	TPS-42-16	10	1	5	\N	f	29	2020-10-10 13:42:44.441837	2020-10-08 04:35:07.465306	1.23.82.65	219.91.213.109	\N	\N
68	gandhivikesha@gmail.com	$2a$11$HQjMxQtNgtLIZFjL34FbcuL73iHd3Z.k66GY1goKfG5v8IQwtYxqK	c2d3a3f95d882e326d914b598f3613defc8693ed62a20c3842cd4c749302836e	2020-11-11 09:14:07.46256	2020-12-24 13:29:03.379471	Vikesha	Gandhi	\N	vikeshatps@outlook.com	9586244191	8487801917	1996-02-27 00:00:00	Single	\N	2019-10-21 00:00:00	Active	Ahmedabad	\N	68	752821934685	BNRPG4463L	Employee	2019-12-13 10:12:40.25238	2022-07-22 05:59:47.913572	2	\N	2	\N	2	female	TPS-60-19	11	9	8	\N	f	7	2020-12-24 13:29:03.39696	2020-11-11 08:55:11.771818	49.34.176.252	157.32.147.252	\N	\N
61	gajjarbhavin22@gmail.com	$2a$11$IxAUXzFztfCGe1nU8ESvuOlo3bSRgB6AaVQoJb.x1iukDVAwQJLMW	\N	\N	2020-08-25 08:52:10.326163	Bhavin	Gajjar	\N	bhavin@techplusteam.com	9879558718	8530453855	1994-07-22 00:00:00	Married	2019-05-26 00:00:00	2017-05-15 00:00:00	Active	Ahmedabad	\N	54		CEFPG4074R	Employee	2019-12-13 09:30:59.318923	2022-07-22 05:59:48.010819	2	\N	2	\N	0	male	TPS-46-17	10	3	3	\N	f	110	2021-01-27 05:41:14.909065	2021-01-25 13:23:21.06918	27.61.177.194	150.129.164.116	\N	\N
17	parulkanani94@gmail.com	$2a$11$GsdgddaoEAzX1HEtk22iGuiaOyS.T3GCZeHyTMhajFouHgdN1.rpC	d8be87c1d86eac87545d55618182b5b8fbca5d74cd350cba08ddbc09dc5c63a3	2020-11-11 08:58:02.186701	\N	Parul	Kanani	\N	parul@techplusteam.com	7048100749	7048100749	2019-11-29 00:00:00	Married	2020-02-16 00:00:00	2017-06-05 00:00:00	Active	Ahmedabad	\N	16		FJDPK8105F	Consultant	2019-10-22 09:36:14.191697	2022-07-22 05:59:48.422784	2	\N	2	2019-12-11 00:00:00	0	female	TPS-49-17	2	1	3	\N	f	52	2022-06-23 06:02:46.538978	2021-08-02 13:34:34.354266	::1	::1	\N	\N
18	bhaumikgadani@gmail.com	$2a$11$2Qn4XBodYByFdpnsYto9MuRNqKu3B5J1lZIGYZT/SofbkipPjLgOC	\N	\N	\N	Bhaumik	Gadani	\N	info@techplussoftware.com	9426413898	9426413898	1983-12-06 00:00:00	Married	2010-08-15 00:00:00	2011-06-13 00:00:00	Active	81 Shaivali socierty, Near Dena Bank, Vejalpur Road, Ahmedabad	\N	18			Director	2019-10-25 13:33:44.855227	2022-07-22 05:59:48.47418	1	\N	0	2019-12-11 00:00:00	15	male	TPS-01-2013	7	4	14	2022-07-01 00:00:00	f	575	2022-07-22 04:47:38.836508	2022-06-23 05:55:21.25034	::1	::1	\N	\N
15	kinjalthakkar1619@gmail.com	$2a$11$ti.Atu.wQQ8t4X5G0jrTx.mq1/CHSRTLJ6Q4uSWQv1C.XO3UMFg22	29f591c3c7a1329d9e144ebc6909154e6f57f29c87075d682250ba8aee14356e	2019-11-08 12:16:44.037861	\N	Kinjal	Thakkar	\N	kinjal.t@techplusteam.com	8347138820	8460416110	1994-09-01 00:00:00	Single	\N	2016-05-09 00:00:00	Active	A-504 pratham residency, nr. jignasha society, jivrajpark, Ahmedabad	\N	16		AVAPT9517A	Employee	2019-10-16 12:06:44.96691	2022-07-22 05:59:48.090309	2	\N	2	2019-12-11 00:00:00	0	female	TPS-40-16	10	1	3	\N	f	68	2021-01-27 05:18:57.729192	2021-01-25 04:24:55.79689	43.250.165.137	103.240.169.204	\N	\N
60	dipesh.sukhia@gmail.com	$2a$11$3dstdsXC1y9DMtDpwdtD0OIImUfn584qqtBpU8R1F5laq1pQnox3W	\N	\N	2020-05-08 18:36:44.608621	Dipesh	Sukhia	\N	dipesh@techplusteam.com	9924488209	9904311436	1995-02-04 00:00:00	Single	\N	2017-05-02 00:00:00	Active	Ahmedabad	\N	54	458133429838	FKXPS1392K	Employee	2019-12-13 09:26:32.564661	2022-07-22 06:06:20.253106	2	\N	2	\N	2	male	TPS-45-17	10	3	3	\N	f	66	2021-01-27 07:16:10.874445	2021-01-25 12:25:04.497429	49.34.173.179	157.32.134.20	\N	\N
69	pakshaykumar611@gmail.com	$2a$11$jbFDoB2BemCecVA.JoIDxuq2wv8zff.zAWgC.ERM8x5Ayhldnv3mi	\N	\N	\N	Akshay	Patel	\N	akshay.tps@outlook.com	9925680030	9925680030	1987-11-06 00:00:00	Single	\N	2020-01-01 00:00:00	Active	Ahmedabad	\N	51	221867477173	AOXPP6406J	Employee	2020-01-09 13:44:18.443329	2022-07-22 05:59:48.168758	2	\N	2	\N	2.70000000000000018	male	TPS-61-20	10	2	12	\N	f	6	2021-01-08 09:21:34.627152	2020-12-24 06:05:39.792559	49.36.69.103	49.36.75.53	\N	\N
58	richadesai08@gmail.com	$2a$11$zOkdioVkjnwiz7M00Syw.ep4HCJmCRrHJ9lMnORSL3/.YdI2mwmXu	\N	\N	2020-05-21 08:49:31.623975	Richa	Desai	\N	richa@techplusteam.com	9979132343	9979132343	1992-07-08 00:00:00	Single	\N	2017-02-20 00:00:00	Active	Ahemedabad	\N	54		BYKPD8786K	Employee	2019-12-10 14:30:58.546284	2022-07-22 05:59:48.256762	2	\N	2	2019-12-11 00:00:00	2.70000000000000018	female	TPS-43-17	11	3	3	\N	f	27	2021-01-01 11:35:00.33227	2020-12-25 04:28:52.568672	103.92.121.94	103.92.121.94	\N	\N
\.


--
-- Data for Name: vendors; Type: TABLE DATA; Schema: public; Owner: tps
--

COPY public.vendors (id, name, services, contact_person, mobile, email, gst, pan, tan, address, city, state, description, created_at, updated_at, register_date, status) FROM stdin;
1	S.A.Air Conditioner	AC	SA	9687675777	info@saairconditioner.com	123123123	123123132	123123123	Prahladnagar	Ahmedabda	Gujarat	For AC Servicing	2020-06-19 22:10:34.324796	2020-06-19 22:10:34.324796	2019-09-05 00:00:00	0
3	COOL WINGS	WATER COOLER	COOL WINGS	NA	canterwatercooler@yahoo.com	24ADVPA9991L1ZP	DVPA9991L1		161,162, Ramdev Estate Opp, Shahwadi Bus Stand, Narol Aslali Road, Narol Ahmedabad	AHMEDABAD	GUJARAT	WATER COOLER	2020-07-29 07:05:59.037225	2020-07-29 07:06:16.422191	2019-09-25 00:00:00	0
4	CRYSTYL TECHNOLOGIES 	COMPUTER ACCESSORIES 	CRYSTYL TECHNOLOGIES 	9016556306, 9998222086	crystyltechnologies@gmail.com	24AAFCT5446D1ZI	ALFC1315K1		2ND FLOOR TULSI COMPLEX , PANJARAPOLE CROSS ROAD,\r\nOPPOSITE AUDA GARDEN, AZAD SOCIETY, PANJRAPOL\r\nAHMEDABAD : 380015	AHMEDABAD	GUJARAT	4GB DDR4 LAPTOP	2020-07-29 07:12:32.444999	2020-07-29 07:12:32.444999	2020-01-08 00:00:00	0
2	Xiomi Prahladnagar	TV/Phones	Don't know	-	 service.in@xiaomi.com	24AACCV5763A1ZL			VRP Telematics Pvt, Ltd, GF-05,Campus Corner-02, Opp Pralhad nagar garden, pralhad nagar,ahmedabad	Ahmedabad	Gujarat	MI TV 4X 125.7 cm 50 black	2020-06-23 20:46:54.572844	2020-07-29 07:15:32.82095	2020-02-29 00:00:00	0
5	Dell International Services India Pvt. Ltd	COMPUTER/LAPTOP	-	1800-425-4026 (Toll Free)		24AAFCT5446D1ZI	AAACH1925Q		12/1, 12/2A, 13/1A, Divya Sree Greens, Challaghata Village, Varthur Hobli, Domlur Post, Inner Ring Road,Bangalore 560 071, Ship From State : KA	BANGALORE	KA	DELL LAPTOP	2020-07-29 07:20:56.406975	2020-07-29 07:20:56.406975	2019-12-21 00:00:00	0
6	PLAZA ENTERPRISES 	FURNITURE	-	-		27AGQP51021B1ZO	AGQP51021B		401/H, Krishna Vasant Sagar, Thakur Village, Kandivali East, Mumbai, Maharashtra - 400101	Mumbai	GUJARAT	Sophie 2 seater Sofa in Rust Colour  by CasaCraft	2020-07-29 07:26:52.071888	2020-07-29 07:26:52.071888	2019-10-17 00:00:00	0
10	Flipkart - Neha	Flipkart	Flipkart	-	-					AHMEDABAD	GUJARAT	Online Shoping	2020-07-30 08:26:28.540156	2020-07-30 08:26:59.831868	2020-03-11 00:00:00	0
11	Flipkart - Paresh	Flipkart	Flipkart	-						AHMEDABAD	GUJARAT		2020-07-30 08:37:13.661767	2020-07-30 08:37:13.661767	2020-03-16 00:00:00	0
12	S.A Air conditioning 	AC	-	-		24ACKPK8622J1ZE	ACKPK8622J		1, Vraj Avenue, Below SAM's Pizza, Nr. Swastik Cross Road, Navrangpura, Ahmedabad	AHMEDABAD	GUJARAT		2020-07-31 11:49:02.438664	2020-07-31 11:49:02.438664	2019-09-23 00:00:00	0
13	Tikona	Internet	-	-						Ahmedabad	Gujarat	BAN - 136675057 & Service ID - 1124895086	2020-08-19 12:39:35.336596	2020-08-19 12:58:18.201916	2019-09-15 00:00:00	0
14	Ridham Enterprise	COMPUTER/LAPTOP	Ridham Enterprise	9825031616	ridham@ridhamenterprise.com	24AQNPS0458F1ZP	AQNPS0458F		GF 36-37 Ajanta Commercial Center,\r\nOpp.Jitendra Chambers,Income Tax, Ashram Road,\r\nAhmedabad, Gujarat - 380014.	AHMEDABAD	GUJARAT	10.2-inch iPad Wi-Fi 32GB - Silver	2020-09-08 10:57:19.440981	2020-09-08 10:57:19.440981	2020-09-08 00:00:00	0
47	KABBIR CELLULAR	Kabir Cellular a Unir of Phone Wale 	Kabir	8401478619	info@phonewalestore.com	24AAUFP2593H1ZR	AAUFP2593H		14, Siddhi Darshan Complex, Opp. AnandNagar, Ahmedabad	Ahmedabad	Gujarat		2020-12-22 09:21:46.039446	2020-12-22 09:21:46.039446	2020-12-15 00:00:00	0
48	iVenus	Venus Data Products Trading as iVenus	Tusar Trivedi	971200043	sales.vastrapur@ivenus.in	24AANFV6143N2ZK	AANFV6143N		Shop No. 2/B, Shilp Square B-Wing, Drive in Road, Bodakdev, Near Himalaya Mall, Ahmedabad - 380052	Ahmedabad	Gujarat		2020-12-22 09:33:14.358688	2020-12-22 09:33:14.358688	2020-12-22 00:00:00	0
49	HARIOM COOMUNICATION LLP	Mobile	ONE PLUS	07926936750		24AAIFH4427L1Z9			Safal Pegasus, Ground floor, shop no. 6, 100 feet road, Prahlad Nagar, Ahmedabad- 380015	AHMEDABAD	GUJARAT	OnePlus 8T Lunar Silver 12+256GB	2021-01-19 10:23:17.035489	2021-01-19 10:23:17.035489	2021-01-16 00:00:00	0
50	INFINITI RETAIL LIMITED	COMPUTERS	RAMESH 	07207666000		24AACCV1726H1ZK				AHMEDABAD	GUJARAT		2021-01-22 10:57:03.770141	2021-01-22 10:57:03.770141	\N	0
\.


--
-- Data for Name: work_histories; Type: TABLE DATA; Schema: public; Owner: tps
--

COPY public.work_histories (id, year, mentor, peer, team_member, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tps
--

SELECT pg_catalog.setval('public.active_storage_attachments_id_seq', 221, true);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tps
--

SELECT pg_catalog.setval('public.active_storage_blobs_id_seq', 244, true);


--
-- Name: arrange_sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tps
--

SELECT pg_catalog.setval('public.arrange_sessions_id_seq', 1, true);


--
-- Name: asset_histories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tps
--

SELECT pg_catalog.setval('public.asset_histories_id_seq', 9, true);


--
-- Name: asset_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tps
--

SELECT pg_catalog.setval('public.asset_types_id_seq', 17, true);


--
-- Name: assets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tps
--

SELECT pg_catalog.setval('public.assets_id_seq', 57, true);


--
-- Name: audits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tps
--

SELECT pg_catalog.setval('public.audits_id_seq', 4, true);


--
-- Name: bills_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tps
--

SELECT pg_catalog.setval('public.bills_id_seq', 56, true);


--
-- Name: checklist_item_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tps
--

SELECT pg_catalog.setval('public.checklist_item_users_id_seq', 86, true);


--
-- Name: checklist_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tps
--

SELECT pg_catalog.setval('public.checklist_items_id_seq', 46, true);


--
-- Name: checklist_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tps
--

SELECT pg_catalog.setval('public.checklist_users_id_seq', 78, true);


--
-- Name: checklists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tps
--

SELECT pg_catalog.setval('public.checklists_id_seq', 7, true);


--
-- Name: companies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tps
--

SELECT pg_catalog.setval('public.companies_id_seq', 1, false);


--
-- Name: consultant_handbooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tps
--

SELECT pg_catalog.setval('public.consultant_handbooks_id_seq', 2, true);


--
-- Name: credential_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tps
--

SELECT pg_catalog.setval('public.credential_types_id_seq', 51, true);


--
-- Name: credentials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tps
--

SELECT pg_catalog.setval('public.credentials_id_seq', 92, true);


--
-- Name: degrees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tps
--

SELECT pg_catalog.setval('public.degrees_id_seq', 44, true);


--
-- Name: departments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tps
--

SELECT pg_catalog.setval('public.departments_id_seq', 11, true);


--
-- Name: designations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tps
--

SELECT pg_catalog.setval('public.designations_id_seq', 62, true);


--
-- Name: documents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tps
--

SELECT pg_catalog.setval('public.documents_id_seq', 43, true);


--
-- Name: educations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tps
--

SELECT pg_catalog.setval('public.educations_id_seq', 26, true);


--
-- Name: employee_handbooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tps
--

SELECT pg_catalog.setval('public.employee_handbooks_id_seq', 40, true);


--
-- Name: event_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tps
--

SELECT pg_catalog.setval('public.event_categories_id_seq', 5, true);


--
-- Name: event_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tps
--

SELECT pg_catalog.setval('public.event_links_id_seq', 23, true);


--
-- Name: free_leaves_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tps
--

SELECT pg_catalog.setval('public.free_leaves_id_seq', 5, true);


--
-- Name: holidays_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tps
--

SELECT pg_catalog.setval('public.holidays_id_seq', 55, true);


--
-- Name: leave_reports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tps
--

SELECT pg_catalog.setval('public.leave_reports_id_seq', 672, true);


--
-- Name: leaves_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tps
--

SELECT pg_catalog.setval('public.leaves_id_seq', 839, true);


--
-- Name: permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tps
--

SELECT pg_catalog.setval('public.permissions_id_seq', 138, true);


--
-- Name: project_members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tps
--

SELECT pg_catalog.setval('public.project_members_id_seq', 34, true);


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tps
--

SELECT pg_catalog.setval('public.projects_id_seq', 17, true);


--
-- Name: role_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tps
--

SELECT pg_catalog.setval('public.role_permissions_id_seq', 150, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tps
--

SELECT pg_catalog.setval('public.roles_id_seq', 4, true);


--
-- Name: user_designations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tps
--

SELECT pg_catalog.setval('public.user_designations_id_seq', 47, true);


--
-- Name: user_reports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tps
--

SELECT pg_catalog.setval('public.user_reports_id_seq', 1, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tps
--

SELECT pg_catalog.setval('public.users_id_seq', 69, true);


--
-- Name: vendors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tps
--

SELECT pg_catalog.setval('public.vendors_id_seq', 50, true);


--
-- Name: work_histories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tps
--

SELECT pg_catalog.setval('public.work_histories_id_seq', 1, false);


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: arrange_sessions arrange_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.arrange_sessions
    ADD CONSTRAINT arrange_sessions_pkey PRIMARY KEY (id);


--
-- Name: asset_histories asset_histories_pkey; Type: CONSTRAINT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.asset_histories
    ADD CONSTRAINT asset_histories_pkey PRIMARY KEY (id);


--
-- Name: asset_types asset_types_pkey; Type: CONSTRAINT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.asset_types
    ADD CONSTRAINT asset_types_pkey PRIMARY KEY (id);


--
-- Name: assets assets_pkey; Type: CONSTRAINT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.assets
    ADD CONSTRAINT assets_pkey PRIMARY KEY (id);


--
-- Name: audits audits_pkey; Type: CONSTRAINT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.audits
    ADD CONSTRAINT audits_pkey PRIMARY KEY (id);


--
-- Name: bills bills_pkey; Type: CONSTRAINT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.bills
    ADD CONSTRAINT bills_pkey PRIMARY KEY (id);


--
-- Name: checklist_item_users checklist_item_users_pkey; Type: CONSTRAINT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.checklist_item_users
    ADD CONSTRAINT checklist_item_users_pkey PRIMARY KEY (id);


--
-- Name: checklist_items checklist_items_pkey; Type: CONSTRAINT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.checklist_items
    ADD CONSTRAINT checklist_items_pkey PRIMARY KEY (id);


--
-- Name: checklist_users checklist_users_pkey; Type: CONSTRAINT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.checklist_users
    ADD CONSTRAINT checklist_users_pkey PRIMARY KEY (id);


--
-- Name: checklists checklists_pkey; Type: CONSTRAINT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.checklists
    ADD CONSTRAINT checklists_pkey PRIMARY KEY (id);


--
-- Name: companies companies_pkey; Type: CONSTRAINT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (id);


--
-- Name: consultant_handbooks consultant_handbooks_pkey; Type: CONSTRAINT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.consultant_handbooks
    ADD CONSTRAINT consultant_handbooks_pkey PRIMARY KEY (id);


--
-- Name: credential_types credential_types_pkey; Type: CONSTRAINT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.credential_types
    ADD CONSTRAINT credential_types_pkey PRIMARY KEY (id);


--
-- Name: credentials credentials_pkey; Type: CONSTRAINT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.credentials
    ADD CONSTRAINT credentials_pkey PRIMARY KEY (id);


--
-- Name: degrees degrees_pkey; Type: CONSTRAINT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.degrees
    ADD CONSTRAINT degrees_pkey PRIMARY KEY (id);


--
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (id);


--
-- Name: designations designations_pkey; Type: CONSTRAINT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.designations
    ADD CONSTRAINT designations_pkey PRIMARY KEY (id);


--
-- Name: documents documents_pkey; Type: CONSTRAINT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT documents_pkey PRIMARY KEY (id);


--
-- Name: educations educations_pkey; Type: CONSTRAINT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.educations
    ADD CONSTRAINT educations_pkey PRIMARY KEY (id);


--
-- Name: employee_handbooks employee_handbooks_pkey; Type: CONSTRAINT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.employee_handbooks
    ADD CONSTRAINT employee_handbooks_pkey PRIMARY KEY (id);


--
-- Name: event_categories event_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.event_categories
    ADD CONSTRAINT event_categories_pkey PRIMARY KEY (id);


--
-- Name: event_links event_links_pkey; Type: CONSTRAINT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.event_links
    ADD CONSTRAINT event_links_pkey PRIMARY KEY (id);


--
-- Name: free_leaves free_leaves_pkey; Type: CONSTRAINT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.free_leaves
    ADD CONSTRAINT free_leaves_pkey PRIMARY KEY (id);


--
-- Name: holidays holidays_pkey; Type: CONSTRAINT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.holidays
    ADD CONSTRAINT holidays_pkey PRIMARY KEY (id);


--
-- Name: leave_reports leave_reports_pkey; Type: CONSTRAINT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.leave_reports
    ADD CONSTRAINT leave_reports_pkey PRIMARY KEY (id);


--
-- Name: leaves leaves_pkey; Type: CONSTRAINT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.leaves
    ADD CONSTRAINT leaves_pkey PRIMARY KEY (id);


--
-- Name: permissions permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


--
-- Name: project_members project_members_pkey; Type: CONSTRAINT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.project_members
    ADD CONSTRAINT project_members_pkey PRIMARY KEY (id);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: role_permissions role_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.role_permissions
    ADD CONSTRAINT role_permissions_pkey PRIMARY KEY (id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: user_designations user_designations_pkey; Type: CONSTRAINT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.user_designations
    ADD CONSTRAINT user_designations_pkey PRIMARY KEY (id);


--
-- Name: user_reports user_reports_pkey; Type: CONSTRAINT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.user_reports
    ADD CONSTRAINT user_reports_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: vendors vendors_pkey; Type: CONSTRAINT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.vendors
    ADD CONSTRAINT vendors_pkey PRIMARY KEY (id);


--
-- Name: work_histories work_histories_pkey; Type: CONSTRAINT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.work_histories
    ADD CONSTRAINT work_histories_pkey PRIMARY KEY (id);


--
-- Name: associated_index; Type: INDEX; Schema: public; Owner: tps
--

CREATE INDEX associated_index ON public.audits USING btree (associated_type, associated_id);


--
-- Name: auditable_index; Type: INDEX; Schema: public; Owner: tps
--

CREATE INDEX auditable_index ON public.audits USING btree (auditable_type, auditable_id, version);


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: tps
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: tps
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: tps
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- Name: index_arrange_sessions_on_user_id; Type: INDEX; Schema: public; Owner: tps
--

CREATE INDEX index_arrange_sessions_on_user_id ON public.arrange_sessions USING btree (user_id);


--
-- Name: index_asset_histories_on_asset_id; Type: INDEX; Schema: public; Owner: tps
--

CREATE INDEX index_asset_histories_on_asset_id ON public.asset_histories USING btree (asset_id);


--
-- Name: index_asset_histories_on_user_id; Type: INDEX; Schema: public; Owner: tps
--

CREATE INDEX index_asset_histories_on_user_id ON public.asset_histories USING btree (user_id);


--
-- Name: index_assets_on_asset_type_id; Type: INDEX; Schema: public; Owner: tps
--

CREATE INDEX index_assets_on_asset_type_id ON public.assets USING btree (asset_type_id);


--
-- Name: index_assets_on_bill_id; Type: INDEX; Schema: public; Owner: tps
--

CREATE INDEX index_assets_on_bill_id ON public.assets USING btree (bill_id);


--
-- Name: index_audits_on_created_at; Type: INDEX; Schema: public; Owner: tps
--

CREATE INDEX index_audits_on_created_at ON public.audits USING btree (created_at);


--
-- Name: index_audits_on_request_uuid; Type: INDEX; Schema: public; Owner: tps
--

CREATE INDEX index_audits_on_request_uuid ON public.audits USING btree (request_uuid);


--
-- Name: index_bills_on_vendor_id; Type: INDEX; Schema: public; Owner: tps
--

CREATE INDEX index_bills_on_vendor_id ON public.bills USING btree (vendor_id);


--
-- Name: index_checklist_item_users_on_checklist_item_id; Type: INDEX; Schema: public; Owner: tps
--

CREATE INDEX index_checklist_item_users_on_checklist_item_id ON public.checklist_item_users USING btree (checklist_item_id);


--
-- Name: index_checklist_item_users_on_user_id; Type: INDEX; Schema: public; Owner: tps
--

CREATE INDEX index_checklist_item_users_on_user_id ON public.checklist_item_users USING btree (user_id);


--
-- Name: index_checklist_items_on_checklist_id; Type: INDEX; Schema: public; Owner: tps
--

CREATE INDEX index_checklist_items_on_checklist_id ON public.checklist_items USING btree (checklist_id);


--
-- Name: index_checklist_users_on_checklist_id; Type: INDEX; Schema: public; Owner: tps
--

CREATE INDEX index_checklist_users_on_checklist_id ON public.checklist_users USING btree (checklist_id);


--
-- Name: index_checklist_users_on_user_id; Type: INDEX; Schema: public; Owner: tps
--

CREATE INDEX index_checklist_users_on_user_id ON public.checklist_users USING btree (user_id);


--
-- Name: index_credentials_on_credential_type_id; Type: INDEX; Schema: public; Owner: tps
--

CREATE INDEX index_credentials_on_credential_type_id ON public.credentials USING btree (credential_type_id);


--
-- Name: index_degrees_on_user_id; Type: INDEX; Schema: public; Owner: tps
--

CREATE INDEX index_degrees_on_user_id ON public.degrees USING btree (user_id);


--
-- Name: index_departments_on_user_id; Type: INDEX; Schema: public; Owner: tps
--

CREATE INDEX index_departments_on_user_id ON public.departments USING btree (user_id);


--
-- Name: index_designations_on_user_id; Type: INDEX; Schema: public; Owner: tps
--

CREATE INDEX index_designations_on_user_id ON public.designations USING btree (user_id);


--
-- Name: index_documents_on_user_id; Type: INDEX; Schema: public; Owner: tps
--

CREATE INDEX index_documents_on_user_id ON public.documents USING btree (user_id);


--
-- Name: index_educations_on_degree_id; Type: INDEX; Schema: public; Owner: tps
--

CREATE INDEX index_educations_on_degree_id ON public.educations USING btree (degree_id);


--
-- Name: index_educations_on_user_id; Type: INDEX; Schema: public; Owner: tps
--

CREATE INDEX index_educations_on_user_id ON public.educations USING btree (user_id);


--
-- Name: index_event_links_on_event_category_id; Type: INDEX; Schema: public; Owner: tps
--

CREATE INDEX index_event_links_on_event_category_id ON public.event_links USING btree (event_category_id);


--
-- Name: index_event_links_on_user_id; Type: INDEX; Schema: public; Owner: tps
--

CREATE INDEX index_event_links_on_user_id ON public.event_links USING btree (user_id);


--
-- Name: index_free_leaves_on_user_id; Type: INDEX; Schema: public; Owner: tps
--

CREATE INDEX index_free_leaves_on_user_id ON public.free_leaves USING btree (user_id);


--
-- Name: index_leave_reports_on_user_id; Type: INDEX; Schema: public; Owner: tps
--

CREATE INDEX index_leave_reports_on_user_id ON public.leave_reports USING btree (user_id);


--
-- Name: index_leaves_on_approved_by_id; Type: INDEX; Schema: public; Owner: tps
--

CREATE INDEX index_leaves_on_approved_by_id ON public.leaves USING btree (approved_by_id);


--
-- Name: index_leaves_on_user_id; Type: INDEX; Schema: public; Owner: tps
--

CREATE INDEX index_leaves_on_user_id ON public.leaves USING btree (user_id);


--
-- Name: index_project_members_on_project_id; Type: INDEX; Schema: public; Owner: tps
--

CREATE INDEX index_project_members_on_project_id ON public.project_members USING btree (project_id);


--
-- Name: index_project_members_on_user_id; Type: INDEX; Schema: public; Owner: tps
--

CREATE INDEX index_project_members_on_user_id ON public.project_members USING btree (user_id);


--
-- Name: index_projects_on_department_id; Type: INDEX; Schema: public; Owner: tps
--

CREATE INDEX index_projects_on_department_id ON public.projects USING btree (department_id);


--
-- Name: index_role_permissions_on_permission_id; Type: INDEX; Schema: public; Owner: tps
--

CREATE INDEX index_role_permissions_on_permission_id ON public.role_permissions USING btree (permission_id);


--
-- Name: index_role_permissions_on_role_id; Type: INDEX; Schema: public; Owner: tps
--

CREATE INDEX index_role_permissions_on_role_id ON public.role_permissions USING btree (role_id);


--
-- Name: index_user_designations_on_department_id; Type: INDEX; Schema: public; Owner: tps
--

CREATE INDEX index_user_designations_on_department_id ON public.user_designations USING btree (department_id);


--
-- Name: index_user_designations_on_designation_id; Type: INDEX; Schema: public; Owner: tps
--

CREATE INDEX index_user_designations_on_designation_id ON public.user_designations USING btree (designation_id);


--
-- Name: index_user_designations_on_user_id; Type: INDEX; Schema: public; Owner: tps
--

CREATE INDEX index_user_designations_on_user_id ON public.user_designations USING btree (user_id);


--
-- Name: index_user_reports_on_project_member_id; Type: INDEX; Schema: public; Owner: tps
--

CREATE INDEX index_user_reports_on_project_member_id ON public.user_reports USING btree (project_member_id);


--
-- Name: index_users_on_company_id; Type: INDEX; Schema: public; Owner: tps
--

CREATE INDEX index_users_on_company_id ON public.users USING btree (company_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: tps
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: tps
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: index_users_on_role_id; Type: INDEX; Schema: public; Owner: tps
--

CREATE INDEX index_users_on_role_id ON public.users USING btree (role_id);


--
-- Name: index_work_histories_on_user_id; Type: INDEX; Schema: public; Owner: tps
--

CREATE INDEX index_work_histories_on_user_id ON public.work_histories USING btree (user_id);


--
-- Name: user_index; Type: INDEX; Schema: public; Owner: tps
--

CREATE INDEX user_index ON public.audits USING btree (user_id, user_type);


--
-- Name: user_designations fk_rails_0e438e29c6; Type: FK CONSTRAINT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.user_designations
    ADD CONSTRAINT fk_rails_0e438e29c6 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: asset_histories fk_rails_0f555898d6; Type: FK CONSTRAINT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.asset_histories
    ADD CONSTRAINT fk_rails_0f555898d6 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: credentials fk_rails_18b75fe3c6; Type: FK CONSTRAINT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.credentials
    ADD CONSTRAINT fk_rails_18b75fe3c6 FOREIGN KEY (credential_type_id) REFERENCES public.credential_types(id);


--
-- Name: user_reports fk_rails_27829dc8f6; Type: FK CONSTRAINT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.user_reports
    ADD CONSTRAINT fk_rails_27829dc8f6 FOREIGN KEY (project_member_id) REFERENCES public.project_members(id);


--
-- Name: leaves fk_rails_2a88839ced; Type: FK CONSTRAINT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.leaves
    ADD CONSTRAINT fk_rails_2a88839ced FOREIGN KEY (approved_by_id) REFERENCES public.users(id);


--
-- Name: documents fk_rails_2be0318c46; Type: FK CONSTRAINT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT fk_rails_2be0318c46 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: checklist_items fk_rails_3605ca8e4d; Type: FK CONSTRAINT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.checklist_items
    ADD CONSTRAINT fk_rails_3605ca8e4d FOREIGN KEY (checklist_id) REFERENCES public.checklists(id);


--
-- Name: arrange_sessions fk_rails_42ccebab8a; Type: FK CONSTRAINT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.arrange_sessions
    ADD CONSTRAINT fk_rails_42ccebab8a FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: role_permissions fk_rails_439e640a3f; Type: FK CONSTRAINT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.role_permissions
    ADD CONSTRAINT fk_rails_439e640a3f FOREIGN KEY (permission_id) REFERENCES public.permissions(id);


--
-- Name: project_members fk_rails_49ebe01c9d; Type: FK CONSTRAINT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.project_members
    ADD CONSTRAINT fk_rails_49ebe01c9d FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: educations fk_rails_4e6492b9fc; Type: FK CONSTRAINT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.educations
    ADD CONSTRAINT fk_rails_4e6492b9fc FOREIGN KEY (degree_id) REFERENCES public.degrees(id);


--
-- Name: checklist_users fk_rails_54ce8c50da; Type: FK CONSTRAINT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.checklist_users
    ADD CONSTRAINT fk_rails_54ce8c50da FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: leaves fk_rails_5c9d6c22a5; Type: FK CONSTRAINT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.leaves
    ADD CONSTRAINT fk_rails_5c9d6c22a5 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: role_permissions fk_rails_60126080bd; Type: FK CONSTRAINT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.role_permissions
    ADD CONSTRAINT fk_rails_60126080bd FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- Name: users fk_rails_642f17018b; Type: FK CONSTRAINT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_rails_642f17018b FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- Name: work_histories fk_rails_65c0fc12b6; Type: FK CONSTRAINT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.work_histories
    ADD CONSTRAINT fk_rails_65c0fc12b6 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: users fk_rails_7682a3bdfe; Type: FK CONSTRAINT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_rails_7682a3bdfe FOREIGN KEY (company_id) REFERENCES public.companies(id);


--
-- Name: departments fk_rails_8676210a0b; Type: FK CONSTRAINT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT fk_rails_8676210a0b FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: checklist_item_users fk_rails_8bb449f9d5; Type: FK CONSTRAINT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.checklist_item_users
    ADD CONSTRAINT fk_rails_8bb449f9d5 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: degrees fk_rails_91bcdfdfc3; Type: FK CONSTRAINT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.degrees
    ADD CONSTRAINT fk_rails_91bcdfdfc3 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: asset_histories fk_rails_92ae7295f2; Type: FK CONSTRAINT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.asset_histories
    ADD CONSTRAINT fk_rails_92ae7295f2 FOREIGN KEY (asset_id) REFERENCES public.assets(id);


--
-- Name: bills fk_rails_9c56caab65; Type: FK CONSTRAINT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.bills
    ADD CONSTRAINT fk_rails_9c56caab65 FOREIGN KEY (vendor_id) REFERENCES public.vendors(id);


--
-- Name: assets fk_rails_a11d2cd914; Type: FK CONSTRAINT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.assets
    ADD CONSTRAINT fk_rails_a11d2cd914 FOREIGN KEY (asset_type_id) REFERENCES public.asset_types(id);


--
-- Name: checklist_item_users fk_rails_a9dea83104; Type: FK CONSTRAINT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.checklist_item_users
    ADD CONSTRAINT fk_rails_a9dea83104 FOREIGN KEY (checklist_item_id) REFERENCES public.checklist_items(id);


--
-- Name: free_leaves fk_rails_b01b2d0aab; Type: FK CONSTRAINT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.free_leaves
    ADD CONSTRAINT fk_rails_b01b2d0aab FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: projects fk_rails_bca7ec3858; Type: FK CONSTRAINT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT fk_rails_bca7ec3858 FOREIGN KEY (department_id) REFERENCES public.departments(id);


--
-- Name: active_storage_attachments fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: user_designations fk_rails_c7a1b1d6f6; Type: FK CONSTRAINT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.user_designations
    ADD CONSTRAINT fk_rails_c7a1b1d6f6 FOREIGN KEY (designation_id) REFERENCES public.designations(id);


--
-- Name: assets fk_rails_cc199e314c; Type: FK CONSTRAINT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.assets
    ADD CONSTRAINT fk_rails_cc199e314c FOREIGN KEY (bill_id) REFERENCES public.bills(id);


--
-- Name: user_designations fk_rails_d8272535ae; Type: FK CONSTRAINT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.user_designations
    ADD CONSTRAINT fk_rails_d8272535ae FOREIGN KEY (department_id) REFERENCES public.departments(id);


--
-- Name: designations fk_rails_dafe27a32f; Type: FK CONSTRAINT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.designations
    ADD CONSTRAINT fk_rails_dafe27a32f FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: event_links fk_rails_e1a0474884; Type: FK CONSTRAINT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.event_links
    ADD CONSTRAINT fk_rails_e1a0474884 FOREIGN KEY (event_category_id) REFERENCES public.event_categories(id);


--
-- Name: educations fk_rails_f18eeff57c; Type: FK CONSTRAINT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.educations
    ADD CONSTRAINT fk_rails_f18eeff57c FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: project_members fk_rails_f3b43b5269; Type: FK CONSTRAINT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.project_members
    ADD CONSTRAINT fk_rails_f3b43b5269 FOREIGN KEY (project_id) REFERENCES public.projects(id);


--
-- Name: checklist_users fk_rails_f3eed8292f; Type: FK CONSTRAINT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.checklist_users
    ADD CONSTRAINT fk_rails_f3eed8292f FOREIGN KEY (checklist_id) REFERENCES public.checklists(id);


--
-- Name: leave_reports fk_rails_f4760ec3b3; Type: FK CONSTRAINT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.leave_reports
    ADD CONSTRAINT fk_rails_f4760ec3b3 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: event_links fk_rails_f9ed25773d; Type: FK CONSTRAINT; Schema: public; Owner: tps
--

ALTER TABLE ONLY public.event_links
    ADD CONSTRAINT fk_rails_f9ed25773d FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

