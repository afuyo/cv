// Import the rendercv function and all the refactored components
#import "@preview/rendercv:0.3.0": *

// Apply the rendercv template with custom configuration
#show: rendercv.with(
  name: "Artur Mrozowski",
  title: "Artur Mrozowski - CV",
  footer: context { [#emph[Artur Mrozowski -- #str(here().page())\/#str(counter(page).final().first())]] },
  top-note: [ #emph[Last updated in May 2026] ],
  locale-catalog-language: "en",
  text-direction: ltr,
  page-size: "a4",
  page-top-margin: 0.7in,
  page-bottom-margin: 0.7in,
  page-left-margin: 0.7in,
  page-right-margin: 0.7in,
  page-show-footer: true,
  page-show-top-note: true,
  colors-body: rgb(30, 30, 30),
  colors-name: rgb(74, 158, 255),
  colors-headline: rgb(74, 158, 255),
  colors-connections: rgb(74, 158, 255),
  colors-section-titles: rgb(74, 158, 255),
  colors-links: rgb(74, 158, 255),
  colors-footer: rgb(136, 136, 136),
  colors-top-note: rgb(136, 136, 136),
  typography-line-spacing: 0.6em,
  typography-alignment: "justified",
  typography-date-and-location-column-alignment: right,
  typography-font-family-body: "Merriweather",
  typography-font-family-name: "Merriweather",
  typography-font-family-headline: "Merriweather",
  typography-font-family-connections: "Merriweather",
  typography-font-family-section-titles: "Merriweather",
  typography-font-size-body: 10pt,
  typography-font-size-name: 30pt,
  typography-font-size-headline: 10pt,
  typography-font-size-connections: 10pt,
  typography-font-size-section-titles: 1.4em,
  typography-small-caps-name: false,
  typography-small-caps-headline: false,
  typography-small-caps-connections: false,
  typography-small-caps-section-titles: false,
  typography-bold-name: true,
  typography-bold-headline: false,
  typography-bold-connections: false,
  typography-bold-section-titles: true,
  links-underline: false,
  links-show-external-link-icon: false,
  header-alignment: left,
  header-photo-width: 3.5cm,
  header-space-below-name: 0.7cm,
  header-space-below-headline: 0.7cm,
  header-space-below-connections: 0.7cm,
  header-connections-hyperlink: true,
  header-connections-show-icons: true,
  header-connections-display-urls-instead-of-usernames: false,
  header-connections-separator: "",
  header-connections-space-between-connections: 0.5cm,
  section-titles-type: "with_full_line",
  section-titles-line-thickness: 0.5pt,
  section-titles-space-above: 0.5cm,
  section-titles-space-below: 0.45cm,
  sections-allow-page-break: true,
  sections-space-between-text-based-entries: 0.65em,
  sections-space-between-regular-entries: 1.2em,
  entries-date-and-location-width: 4.15cm,
  entries-side-space: 0.2cm,
  entries-space-between-columns: 0.1cm,
  entries-allow-page-break: false,
  entries-short-second-row: false,
  entries-degree-width: 1cm,
  entries-summary-space-left: 0cm,
  entries-summary-space-above: 0.12cm,
  entries-highlights-bullet:  "•" ,
  entries-highlights-nested-bullet:  "•" ,
  entries-highlights-space-left: 0cm,
  entries-highlights-space-above: 0.12cm,
  entries-highlights-space-between-items: 0.12cm,
  entries-highlights-space-between-bullet-and-text: 0.5em,
  date: datetime(
    year: 2026,
    month: 5,
    day: 10,
  ),
)


#grid(
  columns: (auto, 1fr),
  column-gutter: 0cm,
  align: horizon + left,
  [#pad(left: 0.4cm, right: 0.4cm, image("Artur1.png", width: 3.5cm))
],
  [
= Artur Mrozowski

  #headline([Senior Data Architect \/ Analytics Engineering Lead])

#connections(
  [#connection-with-icon("location-dot")[Vellinge, Sweden]],
  [#link("mailto:artmro@gmail.com", icon: false, if-underline: false, if-color: false)[#connection-with-icon("envelope")[artmro\@gmail.com]]],
  [#link("tel:+46-73-301-77-32", icon: false, if-underline: false, if-color: false)[#connection-with-icon("phone")[073-301 77 32]]],
  [#link("https://github.com/afuyo", icon: false, if-underline: false, if-color: false)[#connection-with-icon("github")[afuyo]]],
)
  ]
)


== Summary

Senior data architect and analytics engineering lead with 15+ years of experience designing source-of-truth data platforms, semantic data models, and operational analytics solutions across insurance, finance, and pharma.

Strong background in analytics strategy, data product platforms, metadata-driven automation, event-driven analytics, and cross-functional collaboration between business and engineering teams.

I specialize in turning complex business processes into governed analytical platforms that improve metric consistency, operational visibility, and decision support.

== Core Competencies

- Analytics strategy and operational intelligence

- Data product platforms and enablement

- Semantic and canonical data modeling

- Unified business metrics and governed definitions

- Source-of-truth data platforms

- Event-driven analytics and operational modeling

- Metadata-driven automation

- Domain-driven design and Event Modeling

- Data governance, lineage, and metadata management

- Snowflake, SQLMesh, dbt, SQLGlot

- Kafka, GraphQL, Neo4j

- AWS and Azure

== Experience

#regular-entry(
  [
    #strong[Senior Analytics Engineer], Tryg

  ],
  [
    Oct 2023 – present

  ],
  main-column-second-row: [
    - #strong[Revenue Intelligence and Operational Analytics:]

    - Developed a revenue intelligence platform enabling standardized business metrics including NDR, GRR, Logo Retention, and funnel analytics across domains.

    - Built an event-driven analytical model enabling drill-down from executive KPIs to individual business events and operational decision points.

    - Established reusable semantic definitions and time-series business events to improve metric consistency, explainability, and cross-functional trust in analytics.

    - Enabled analysts and business stakeholders to trace revenue movements and customer lifecycle changes through sequenced business activities rather than isolated snapshots.

    - Created a foundation for future context-aware analytics and richer operational intelligence capabilities.

    - #strong[Data Product Platform and Strategy:]

    - Helped shape a data product strategy focused on reducing fragmentation, improving interoperability, and enabling scalable analytics delivery.

    - Built a shared data product platform improving consistency, reuse, and delivery speed across analytical domains.

    - Replaced fragmented self-service patterns with reusable governed building blocks and shared semantic concepts aligned with ACORD and domain-driven design principles.

    - Replaced dbt with SQLMesh to improve scalability, maintainability, and developer workflow for analytical data products.

    - Introduced isolated virtual development environments reducing dependency conflicts and improving collaboration across teams.

    - #strong[Metadata-Driven Automation:]

    - Designed a metadata-driven model generation approach turning declarative YAML definitions into governed SQLMesh models.

    - Automated generation of analytical building blocks including hook, bridge, and event models from reusable metadata, reducing manual SQL development and improving structural consistency across domains.

    - Modeled temporal validity, dependency-aware bridge logic, and reusable business keys as metadata instead of hand-coded model patterns.

    - Used dependency graphs and topological ordering to generate analytical structures in the correct sequence, improving repeatability and reducing delivery risk.

  ],
)

#regular-entry(
  [
    #strong[Senior Data Architect], Lundbeck

  ],
  [
    Sept 2021 – Sept 2023

  ],
  main-column-second-row: [
    - Defined a common data layer strategy reducing fragmentation and improving interoperability across analytics and operational domains.

    - Replaced a monolithic data lake approach with a flexible platform inspired by Data Mesh principles.

    - Enabled scalable self-service analytics while maintaining governance and semantic consistency.

    - Collaborated across technical and business domains to align analytical capabilities with organizational needs.

    - #strong[Technologies:] Snowflake, dbt, AWS

  ],
)

#regular-entry(
  [
    #strong[Data Engineer \/ Data Architect], Tryg

  ],
  [
    Aug 2016 – Aug 2021

  ],
  main-column-second-row: [
    - Built an underwriting data platform replacing Excel-based workflows with centralized governed data flows and shared business logic.

    - Introduced Event Modeling to improve collaboration between business and engineering stakeholders.

    - Designed enterprise semantic and canonical models based on ACORD to standardize concepts and improve interoperability across domains.

    - Built event-driven write-back capabilities using GraphQL and Kafka, enabling applications to publish operational outcomes back into the analytical ecosystem.

    - Automated logical and physical model generation using metadata-driven techniques, improving consistency and reducing manual effort.

    - #strong[Enterprise Canonical Data Platform:]

    - Developed a semantic data platform enabling standardized interchange of business information across departments.

    - Implemented graph-based semantic models in Neo4j aligned with the ACORD insurance ontology.

    - Exposed semantic models through GraphQL APIs and integrated event streams using Kafka.

    - Improved consistency and discoverability of enterprise data assets.

    - #strong[Metadata and Data Catalog:]

    - Implemented metadata-driven lineage and business glossary capabilities using semantic technologies and Neo4j.

    - Exposed metadata and lineage through Amundsen data catalog.

    - Improved discoverability, governance, and understanding of analytical assets across teams.

  ],
)

#regular-entry(
  [
    #strong[Data Architect], KMD

  ],
  [
    Nov 2015 – Aug 2016

  ],
  main-column-second-row: [
    - Designed target architecture and business proposal for a large-scale MS SQL Server data warehouse initiative.

    - Participated in Data Governance Board activities defining enterprise data standards, policies, and governance principles.

    - Contributed to improving consistency and strategic use of enterprise information assets.

  ],
)

#regular-entry(
  [
    #strong[Senior DW\/BI Developer], Nordea

  ],
  [
    Aug 2014 – Nov 2015

  ],
  main-column-second-row: [
    - Led evaluation and proof of concept for data warehouse automation tooling using WhereScape RED.

    - Improved reliability and reduced time-to-market for BI deliveries through automation and streamlined delivery workflows.

  ],
)

== Earlier Career

- Swedish Agency for Marine and Water Management — BI Consultant (2013 – 2014)

- DR — Business Intelligence Consultant (2012 – 2013)

- Danske Bank — External Consultant (2010 – 2012)

- SimCorp — Software Developer (2008 – 2010)

- Copenhagen Energy — DBA (2004 – 2008)

- Quibus International AB — Software Developer (2002 – 2004)

== Current Learning Professional Development

- Knowledge Graph Academy ongoing

- Claude Academy Claude Certified Architect track (ongoing)

== Certifications

- Certified Scrum Product Owner (2022)

- Data Mesh — Domain Oriented Data (2022)

- Lead Enterprise Architecture Program on Azure — Microsoft (2017)

- Data Modelling Master Class — Steve Hoberman (2016)

- Data Vault Certified Data Modeler (DVCDM) (2014)

- CDMP Preparation (2024)

== Education

  #regular-entry(
  [
    #strong[Lund University]

  ],
  [
  ],
  main-column-second-row: [
    - Faculty of Informatics.

    - Key areas: Database systems, data modeling, software architecture, UML, object-oriented design, Java programming, algorithms, and data structures.

  ],
)

== Additional Education

- Apache Spark Workshop for Developers

- Distributed Computing with Spark

- Data Science Specialization — Johns Hopkins University

- Statistical Analysis with R

- Oracle BI EE

- C++ Programming

- SQL Server Administration

- Oracle Administration

== Speaking and Open Source

- #emph[Democratizing Data] — Tryg and Prisma (2021)

- #emph[Building Semantic Data Hub with LPG, GraphQL and Kafka Streams] (2019)

- GraphQL & Graph Data Modeling in Neo4j

- Azure Functions & Machine Learning

- XML Parser for Danish Motor Register Data
