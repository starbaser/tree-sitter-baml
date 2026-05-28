// Test BAML file
@@ingot({ hidden true })
enum Status {
  Active
  Inactive
  Pending
}

@@ingot({ readonly true, hidden true })
class User {
  name string @ingot({ readonly true })
  age int
  email string?
  status Status
}

@@ingot({ idempotent true, conduit_lambda "get_user" })
function GetUser(id: int) -> User {
  client GPT4

  prompt #"
    Get user information for ID: {{ id }}
  "#
}

type UserID = int | string

let admin = "admin@example.com";
