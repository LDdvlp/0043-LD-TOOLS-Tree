# Les phases du projet.

## Phase 0 — Fondation

Initialize Tree project
Add project documentation
Define supported tree formats

## Phase 1 — Sauvegarde du patrimoine

Import legacy Tree tools

On a gardé la V1 fonctionnelle.

## Phase 2 — Extraction du moteur

Extract Get-TreeLevel()
Extract Get-TreeNode()
Extract Get-TreeEntry()

Naissance :
Parsing Engine

## Phase 3 — Reconstruction

Add filesystem engine and test runner

Naissance :
Filesystem Engine
LD Test Runner

## Phase 4 — Sécurisation
Add legacy regression tests

La V2 sait refaire la V1.

## Phase 5 — Extension

Add ASCII tree format support  
Add Unicode tree format support

Naissance :
Multi-format Parser

Le moteur accepte plusieurs formats sans modification du Filesystem Engine.

## Testing philosophy

A test can validate an existing behavior without changing production code.

Regression tests transform assumptions into contracts.