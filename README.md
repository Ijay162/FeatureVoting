# FeatureVoting

A decentralized platform for prioritizing product features using blockchain technology.

## Overview

FeatureVoting enables development teams to request features and gather prioritization votes in a transparent, immutable way. The system ensures that each developer can only prioritize one feature at a time, maintaining development integrity while providing clear metrics on feature importance for roadmap planning.

## Features

- **Feature Requests**: Any team member can request a new product feature
- **Transparent Prioritization**: All feature priorities are recorded on the blockchain
- **One Priority Per Developer**: Each developer can only prioritize one feature at a time
- **Priority Tracking**: Real-time tracking of priority counts for each feature
- **Roadmap Metrics**: Easy access to feature counts and prioritization statistics

## Functions

### Public Functions

- `request-feature`: Submit a new product feature request
- `prioritize-feature`: Set your priority for an existing feature

### Read-Only Functions

- `get-priority-count`: View the total priority for a specific feature
- `has-prioritized`: Check if a developer has already prioritized a feature
- `get-feature-count`: Get the total number of features requested
- `compare-priority`: Utility function to compare two values

## Getting Started

1. Deploy the contract to your blockchain
2. Team members can begin requesting product features
3. Developers can prioritize features they believe are most important
4. Track feature priorities to determine development roadmap

## Use Cases

- Product roadmap planning and prioritization
- Feature development allocation
- Team consensus building for development priorities
- Decentralized product management

## Security

The system ensures development integrity by limiting each developer to prioritizing only one feature at a time, preventing manipulation of roadmap decisions.