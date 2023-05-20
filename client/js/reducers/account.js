import { FETCH_ACCOUNT_REQUEST, FETCH_ACCOUNT_SUCCESS, FETCH_ACCOUNT_FAILURE } from 'constants'

export function getAccount(state) {
  return state.account
}

export function account(state = { isFetching: false }, action) {
  switch (action.type) {
    case FETCH_ACCOUNT_REQUEST:
      return Object.assign({}, state, {
        isFetching: true
      })
    case FETCH_ACCOUNT_SUCCESS:
      return Object.assign({}, state, action.account, {
        isFetching: false
      })
    default:
      return state
  }
}
