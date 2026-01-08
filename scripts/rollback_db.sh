#!/bin/bash
REVISION=$1
echo "Rolling back DB schema to revision: $REVISION"
alembic downgrade $REVISION
