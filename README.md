# Using AWS Cedar to showcase IAM violations in Azure RBAC

Small AWS Cedar proof-of-concept to showcase residual IAM violations in #Azure RBAC.

Specifically, it targets a preview called "delegate role assignments" 😁

A cool thing about Cedar is that's it's provably secure. It's been subjected to full formal verification.

The first half of the image shows how the new delegation model is currently implemented. It uses one permit and one forbid statements.
The bottom half shows the two "forbid" statements which are currently missing in the model, in my opinion.

👉 Attack path 1: if this forbid is ignored, a delegate can self-assign extended privileges if she belongs to one of the user groups under her delegation.

👉 Attack path 2: if this forbid is ignored, a delegate can bypass users restrictions and assign roles to arbitrary members if she manages membership of one of the groups.

PLEASE NOTE: we're talking about a Preview Feature, so keep calm and relax. This is not in production yet, so everybody's safe for now!
