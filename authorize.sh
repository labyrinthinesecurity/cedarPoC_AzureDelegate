
# LEGITIMATE CASE: should be ALLOW'ed
cargo run authorize \
    --principal 'User::"alice"' \
    --action 'Action::"AssignKeyVaultOperatorRole"' \
    --resource 'User::"bob"' \
    --policies policy.cedar \
    --entities entities.json \
    --schema schema.json

# ATTACK PATH 1: should be a DENY
cargo run authorize \
    --principal 'User::"alice"' \
    --action 'Action::"AssignKeyVaultOperatorRole"' \
    --resource 'User::"alice"' \
    --policies policy.cedar \
    --entities entities.json \
