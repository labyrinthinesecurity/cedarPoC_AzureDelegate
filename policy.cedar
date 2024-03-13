permit (
    principal,
    action == Action::"AssignKeyVaultOperatorRole",
    resource
)
when {
  principal.role == "Deleguate" && resource in [Group::"Marketing", Group::"Sales"]
};

forbid (principal, action == Action::"AssignKeyVaultOperatorRole", resource)
when { principal.role != "Deleguate"};

// PREVENT ATTACK PATH 1: Deleguate self-escalate privileges when she belongs to Marketing department
forbid (principal, action, resource)
when { resource == principal };

// PREVENT ATTACK PATH 2: Deleguate bypasses groups isolation when she manages membership one of the groups
forbid (principal, action, resource)
when { Group::"Marketing".manager == principal && resource in [Group::"Marketing"] };
forbid (principal, action, resource)
when { Group::"Sales".manager == principal && resource in [Group::"Sales"] };
