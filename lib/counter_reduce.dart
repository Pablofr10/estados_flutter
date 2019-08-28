
// One simple action: Increment
enum Acoes { Increment }

// The reducer, which takes the previous count and increments it in response
// to an Increment action.
int counterReducer(int state, dynamic action) {
  if (action == Acoes.Increment) {
    return state + 1;
  }

  return state;
}