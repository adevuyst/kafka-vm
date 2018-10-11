#!/bin/bash
set -e

# Create a kafka topic
kafka-topics --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic test-topic
