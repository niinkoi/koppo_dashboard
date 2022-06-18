import React from 'react'

function PrivateRoute({ children }: any) {
    const accessToken = true
    const loading = false

    if (accessToken) {
        return children
    } else if (loading) {
        return <p>Loading...</p>
    } else if (!accessToken && !loading) {
        return <p>You not logged in</p>
    } else {
        return <p>Some thing went wrong</p>
    }
}

export default PrivateRoute
