import React, { Component, PropTypes } from 'react'
import { connect } from 'react-redux'
import { fetchAccount } from '../actions/account_actions'
import { getAccount } from '../reducers/account_reducers'
import Account from '../components/account'

class AccountContainer extends Component {

  componentWillMount() {
    if(!this.props.account.isFetching) {
      this.props.dispatch(fetchAccount())
    }
  }

  render() {
    const { account } = this.props

    if(!account.data) {
      return false
    }

    return (
      <Account {...account.data.attributes} />
    )
  }
}

AccountContainer.propTypes = {
  account: PropTypes.object
}

const mapStateToProps = (state) => {
  return {
    account: getAccount(state)
  }
}

export default connect(mapStateToProps)(AccountContainer)
