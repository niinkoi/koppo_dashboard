import React, {useEffect} from 'react'
import {Outlet} from "@mui/icons-material";

function PersistLogin() {
    const accessToken = false;
    const loading = false;

    useEffect(() => {
        console.log(accessToken)
    }, [accessToken])

    return(
        <>
            {loading ?<p>Loading...</p> : <Outlet/>}
        </>
    )
}

export default PersistLogin