import { combineReducers } from 'redux'
import { reducer as form } from 'redux-form'
import { routeReducer } from 'redux-simple-router'
import { currency } from './currency'
import { cart } from './cart'
import { account } from './account'
import { login } from './login'
import { authenticityToken } from './authenticityToken'
import { products } from './products'

const routing = routeReducer

const rootReducer = combineReducers({
  form,
  routing,
  currency,
  cart,
  account,
  authenticityToken,
  login,
  products
})

export default rootReducer
