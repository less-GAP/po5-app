require('isomorphic-fetch')

export function checkStatus(response) {
  if (response.ok) {
    return response
  }

  if (response.body || response._bodyBlob) {
    return response.json().then(err => {
      const error = new Error(response.statusText)
      error.error = err
      error.response = response

      return Promise.reject(error)
    })
  }

  return Promise.reject(response)
}

export function parseJSON(response) {
  return response.json()
}
